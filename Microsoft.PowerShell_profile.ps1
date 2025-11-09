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
