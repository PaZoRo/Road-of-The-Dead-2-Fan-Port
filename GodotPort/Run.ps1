param([string]$Godot = "")
$ErrorActionPreference = "Stop"
if (-not $Godot) {
    foreach ($candidate in @("godot", "godot4", "Godot.exe")) {
        $command = Get-Command $candidate -ErrorAction SilentlyContinue
        if ($command) { $Godot = $command.Source; break }
    }
}
if (-not $Godot) { throw 'Run with: .\Run.ps1 -Godot "C:\path\to\Godot_v4.7.2-stable_win64.exe"' }
& $Godot --path $PSScriptRoot
exit $LASTEXITCODE
