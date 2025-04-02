Set-StrictMode -Version Latest

Set-PSReadlineOption -HistorySaveStyle SaveNothing
Set-PSReadlineOption -HistoryNoDuplicates
Set-PSReadlineOption -BellStyle None -ShowToolTips

Set-PSReadLineOption -AddToHistoryHandler {
    param($command)
    if ($command -like ' *') {
        return $false
    }
    return $true
}

Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadlineKeyHandler -Key Ctrl+D -Function ViExit

# Extra keybindings and options for PowerShell Core on Linux
#Set-PSReadlineKeyHandler -Key 'Ctrl+LeftArrow' -Function ShellBackwardWord
#Set-PSReadlineKeyHandler -Key 'Ctrl+RightArrow' -Function ShellForwardWord
#Set-PSReadlineOption -HistorySavePath ~/.pwsh_history

function idle { pyw.exe -m idlelib $args }
function pydoc { py.exe -m pydoc $args }

function prompt { "`nPS [$($executionContext.SessionState.Path.CurrentLocation)]`n$> " }
