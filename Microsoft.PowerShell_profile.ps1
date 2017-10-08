Set-StrictMode -Version Latest
Set-PSReadlineOption -HistorySaveStyle SaveNothing -BellStyle None -HistoryNoDuplicates

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
    pythonw.exe -m idlelib $args
}

function pydoc
{
    python.exe -m pydoc $args
}

New-Alias -Name Out-Voice -Value Invoke-Speech
