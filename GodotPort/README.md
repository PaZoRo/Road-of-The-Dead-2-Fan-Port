# Road of the Dead 2 — Fan Port 0.4.19

Open `project.godot` with Godot 4.7.2 Stable and press F5. The separate Windows executable needs no Godot installation. The wired `scenes/boot.tscn` opens the branded progress screen and loads the game. Use the normal boot scene when profiling startup.

This project retains 2,774 translated GDScript source files, all 3,928 timeline definitions and the original asset library. Native GDScript paths handle common construction, world/vehicle loops, projections, road drawing, audio, collections and HUD operations. Remaining systems use the GDScript compatibility layer. The project does not use Flash Player or an AS3 VM. Full native migration and complete playthrough parity remain unfinished.

Version 0.4.19 adds sharper cutscene and driver-selection vector art, native interpolation of animated presentation transforms, scoped presentation textures, and reduced reticle/static-prop update work. The previous release added geometric hood-head hitboxes, rebuilt double-resolution menu-vector parts with solid interiors, a green CS-style reticle, a longer hood response window and 25% slower weapon animation firing. Local boot bypasses the obsolete Flash storage/API notice. Ordinary game script groups finish before the menu accepts play input. Streamed Story scenery becomes visible together when a complete section finishes. Intentional fog, glass and UI transparency remain.

Default window: 1200×800, linear filtering, 600×400 logical game coordinates. Driving renders uncapped; menus/loading cap at 120 FPS. Original world simulation is 30 Hz with verified entity and GPU road interpolation. A 60 FPS cap is available with `-- --render-fps=60`; steady 60 FPS is not achieved. See PERFORMANCE.md for measurements and limitations.

| Action | Default |
|---|---|
| Accelerate / brake | W / S |
| Steer | A / D |
| Handbrake / horn | Space / F |
| Aim / fire | Mouse / left button |
| Reload | R |
| Previous / next weapon | Q / E |
| Weapon slots | 1–5 |
| Switch driver / pause | Shift / P |
| Fullscreen | F11 |

Controls can be changed in Options. Story retains its introduction, driver selection, upgrades and tutorial. Local progress/settings/campaigns/scores use the unchanged `user://` application name. Remote leaderboards, advertisements and browser navigation are offline. Original source ownership and Godot notices remain applicable.

`scripts/` contains the complete reference translations. `runtime/` contains the Godot implementation and optimized paths. `scenes/` wires display/audio roots. `data/` contains registries, source hashes, timelines and lossless binary caches. `assets/` retains original SVGs, raster copies, fonts and audio. `render_assets/` contains GPU-imported atlases. `presentation_assets/` contains the imported high-density cutscene/selection atlases. `ui/` holds the loading art, rebuilt menu parts and transparent collision geometry masks. `tests/` and `validation/` hold regression suites and evidence.

Keep the complete project folders together. `assets/.gdignore` and `ui/.gdignore` deliberately avoid unnecessary editor imports. Keep the `addons/raw_assets_export` plugin enabled: it includes raw assets and regenerates all caches from JSON on every export. Editable projects hash-check caches and fall back to JSON when stale.

Run `Validate.ps1 -Godot "C:\path\to\Godot_v4.7.2-stable_win64_console.exe"` for functional checks. Actual-renderer suites (`road_batch_suite`, `road_motion_suite`, `road_live_suite`, `pause_interface_suite`, `snapshot_suite`, `visual_fixes_suite`) require a graphical Godot run with `--script res://tests/NAME.gd`.

The input contains decompiled sources, embedded assets and exported outer frames; outer timeline labels were reconstructed from frame exports/source callbacks. Two malformed source decrement expressions were normalized to surrounding vector calculations in earlier releases. Rich-text layout, filter-stack edge cases and some exceptional ActionScript control flow retain compatibility limits. This is a playable fan port with measured remaining work.
