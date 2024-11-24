Set-StrictMode -Version Latest
Set-PSReadlineOption -HistorySaveStyle SaveNothing -BellStyle None -HistoryNoDuplicates -ShowToolTips
Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit
# Extra keybindings and options for PowerShell Core on Linux
#Set-PSReadlineKeyHandler -Key 'Ctrl+LeftArrow' -Function ShellBackwardWord
#Set-PSReadlineKeyHandler -Key 'Ctrl+RightArrow' -Function ShellForwardWord
#Set-PSReadlineOption -HistorySavePath ~/.powershell_history

function Get-Types   # doesn't provide any real value. just to play around with.
{
    [System.AppDomain]::CurrentDomain.GetAssemblies() | Foreach-Object GetTypes
}

function Invoke-Speech
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [string] $Say
    )

    Add-Type -AssemblyName System.Speech
    $voice = New-Object System.Speech.Synthesis.SpeechSynthesizer

    process { $voice.Speak($Say) > $null }
}


function idle
{
    pyw.exe -m idlelib $args
}

function pydoc
{
    py.exe -m pydoc $args
}

New-Alias -Name Out-Voice -Value Invoke-Speech
