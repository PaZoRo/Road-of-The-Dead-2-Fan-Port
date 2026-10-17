param([Parameter(Mandatory=$true)][string]$Godot, [string[]]$Suites=@("hood_combat_suite", "firing_pacing_suite", "section_publication_suite", "catalog_suite", "leaf_hotpaths_suite", "compile_all", "source_bundle_suite", "source_prefetch_suite", "semantics_suite", "stream_lifecycle_suite", "stream_integration_suite", "stream_patterns_suite", "stream_controls_suite", "animation_scheduling_suite", "animation_controls_suite", "native_performance_suite", "world_update_suite", "road_renderer_suite", "road_surface_suite", "spatial_audio_suite", "runtime_regression_suite", "batch_suite", "initializers_suite", "value_construction_suite", "text_suite", "collections_suite", "sound_construction_suite", "basic_construction_suite", "entity_construction_suite", "builtin_construction_suite", "snapshot_suite", "interface_suite", "persistence_suite", "modes_suite", "weapons_suite", "gameplay_suite", "depth_suite", "placement_suite", "collision_suite", "pattern_data_suite", "spawning_suite", "pattern_suite"))
$ErrorActionPreference = "Stop"
$logs = Join-Path $PSScriptRoot "validation"
New-Item -ItemType Directory -Force -Path $logs | Out-Null
$env:APPDATA = Join-Path ([IO.Path]::GetTempPath()) ("rotd2-validation-" + [guid]::NewGuid().ToString("N"))
$env:LOCALAPPDATA = Join-Path $env:APPDATA "local"
function Invoke-Suite([string]$suite, [string]$log, [string[]]$arguments = @()) {
    $runtimeFlags = if ($suite -in @("stream_controls_suite","section_publication_suite")) { @() } else { @("--no-section-streaming") }
    & $Godot --headless --path $PSScriptRoot --script "res://tests/$suite.gd" -- @runtimeFlags @arguments *> $log
    $failedExit = $LASTEXITCODE -ne 0
    $errors = Get-Content -LiteralPath $log | Where-Object { $_ -match "^(SCRIPT ERROR|SHADER ERROR|ERROR):" -and $_ -notmatch "Failed to read the root certificate store" }
    $failedReport = Get-Content -LiteralPath $log | Where-Object { $_ -match 'failures=\[[^\]]|passed=false|COMPILE_RESULT.*failures=[1-9]' }
    if ($failedExit -or $errors -or $failedReport) { throw "Validation failed: $log" }
}
foreach ($suite in $Suites) {
    $log = Join-Path $logs ($suite + ".log")
    if ($suite -eq "stream_patterns_suite") {
        $canonical = Join-Path $logs "stream-canonical.json"
        $streamed = Join-Path $logs "stream-async.json"
        Invoke-Suite $suite $log @("--pattern-output=$canonical")
        Invoke-Suite $suite (Join-Path $logs "stream-patterns-async.log") @("--stream-load-test", "--pattern-output=$streamed")
        if ((Get-FileHash -LiteralPath $canonical).Hash -ne (Get-FileHash -LiteralPath $streamed).Hash) { throw "Canonical and streamed full pattern snapshots differ" }
        Write-Output "24 canonical and streamed full pattern snapshots are identical"
    } elseif ($suite -eq "pattern_suite") {
        $native = Join-Path $logs "pattern-native.json"
        $reference = Join-Path $logs "pattern-reference.json"
        Invoke-Suite $suite $log @("--pattern-output=$native")
        $env:APPDATA = Join-Path ([IO.Path]::GetTempPath()) ("rotd2-reference-" + [guid]::NewGuid().ToString("N"))
        $env:LOCALAPPDATA = Join-Path $env:APPDATA "local"
        Invoke-Suite $suite (Join-Path $logs "pattern-reference.log") @("--reference-patterns", "--no-native-spawning", "--no-compiled-initializers", "--no-native-values", "--no-cached-text", "--no-native-collections", "--no-native-sound-construction", "--no-native-basic-construction", "--no-native-entity-construction", "--no-native-builtin-construction", "--no-native-world-loops", "--no-cached-road-renderer", "--no-gpu-pause-snapshot", "--pattern-output=$reference")
        if ((Get-FileHash -LiteralPath $native).Hash -ne (Get-FileHash -LiteralPath $reference).Hash) { throw "Native and reference pattern snapshots differ" }
        Write-Output "24 native and original pattern snapshots are identical"
    } else {
        Invoke-Suite $suite $log
    }
    Write-Output "$suite passed"
}



