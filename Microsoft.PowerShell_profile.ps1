using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Set-StrictMode -Version Latest

#Set-PSReadlineOption -HistorySaveStyle SaveNothing
Set-PSReadlineOption -HistoryNoDuplicates
Set-PSReadlineOption -BellStyle None -ShowToolTips
# Options for PowerShell Core on Linux
#Set-PSReadlineOption -HistorySavePath ~/.pwsh_history

Set-PSReadLineOption -AddToHistoryHandler {
    param($command)
    # incognito: don't save commands starting with a space
    if ($command -like ' *') { return $false }
    return $true
}

Set-PSReadlineKeyHandler -Key Tab -Function Complete
#Set-PSReadlineKeyHandler -Key Ctrl+D -Function ViExit
Set-PSReadlineKeyHandler -Key Ctrl+D -Function DeleteCharOrExit
Set-PSReadlineKeyHandler -Key Ctrl+u -Function BackwardDeleteLine
# Extra keybindings for PowerShell Core on Linux
#Set-PSReadlineKeyHandler -Key 'Ctrl+LeftArrow' -Function ShellBackwardWord
#Set-PSReadlineKeyHandler -Key 'Ctrl+RightArrow' -Function ShellForwardWord

function idle { pyw.exe -m idlelib $args }
function pydoc { py.exe -m pydoc $args }

#function prompt { "`nPS [$($executionContext.SessionState.Path.CurrentLocation)]`n$> " }
oh-my-posh.exe init pwsh --config "$HOME/.oh-my-posh.yml" | Invoke-Expression

function TabExpansion2 {
    <# Options include:
         RelativeFilePaths - [bool]
             Always resolve file paths using Resolve-Path -Relative.
             The default is to use some heuristics to guess if relative or absolute is better.

       To customize your own custom options, pass a hashtable to CompleteInput, e.g.
             return [CommandCompletion]::CompleteInput($inputScript, $cursorColumn, @{ RelativeFilePaths=$false })
    #>

    [CmdletBinding(DefaultParameterSetName = 'ScriptInputSet')]
    [OutputType([CommandCompletion])]
    param(
        [Parameter(ParameterSetName = 'ScriptInputSet', Mandatory = $true, Position = 0)]
        [AllowEmptyString()]
        [string] $inputScript,

        [Parameter(ParameterSetName = 'ScriptInputSet', Position = 1)]
        [int] $cursorColumn = $inputScript.Length,

        [Parameter(ParameterSetName = 'AstInputSet', Mandatory = $true, Position = 0)]
        [Ast] $ast,

        [Parameter(ParameterSetName = 'AstInputSet', Mandatory = $true, Position = 1)]
        [Token[]] $tokens,

        [Parameter(ParameterSetName = 'AstInputSet', Mandatory = $true, Position = 2)]
        [IScriptPosition] $positionOfCursor,

        [Parameter(ParameterSetName = 'ScriptInputSet', Position = 2)]
        [Parameter(ParameterSetName = 'AstInputSet', Position = 3)]
        [Hashtable] $options = $null
    )

    End {
        $CompletionOutput = if ($psCmdlet.ParameterSetName -eq 'ScriptInputSet') {
            [CommandCompletion]::CompleteInput($inputScript, $cursorColumn, $options)
        } else {
            [CommandCompletion]::CompleteInput($ast, $tokens, $positionOfCursor, $options)
        }
        $shouldTrim = (
                $inputScript -and
                !$inputScript.Contains('.\') -and
                $CompletionOutput.CompletionMatches.Count -gt 0 -and
                $CompletionOutput.CompletionMatches[0].ResultType -eq [CompletionResultType]::ProviderContainer -or
                $CompletionOutput.CompletionMatches[0].ResultType -eq [CompletionResultType]::ProviderItem)
        if ($shouldTrim) {
            [Object[]]$NewCompletionList = foreach ($Item in $CompletionOutput.CompletionMatches) {
                $ItemText = $Item.CompletionText.Replace('\', '/')
                if ($ItemText.Contains('./')) {
                    $ItemText = $ItemText.Replace('./', '')
                }
                [CompletionResult]::new(
                    $ItemText, $Item.ListItemText, $Item.ResultType, $Item.ToolTip)
            }
            $CompletionOutput.CompletionMatches = $NewCompletionList
        }

        return $CompletionOutput
    }
}

