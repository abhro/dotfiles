Set-StrictMode -Version Latest

Set-PSReadlineOption -HistorySaveStyle SaveNothing -BellStyle None -HistoryNoDuplicates -ShowToolTips

Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadlineKeyHandler -Key Ctrl+D -Function ViExit

# Extra keybindings and options for PowerShell Core on Linux
#Set-PSReadlineKeyHandler -Key 'Ctrl+LeftArrow' -Function ShellBackwardWord
#Set-PSReadlineKeyHandler -Key 'Ctrl+RightArrow' -Function ShellForwardWord
#Set-PSReadlineOption -HistorySavePath ~/.powershell_history

function idle { pyw.exe -m idlelib $args }
function pydoc { py.exe -m pydoc $args }
