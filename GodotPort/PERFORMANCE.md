# Performance — Fan Port 0.4.19

This build rebuilds 589 cutscene/selection vector parts with Inkscape and packs them into ten GPU-compressed atlases. Presentation scope selects the sharp textures and gives animated display-list transforms native Godot interpolation. Shared gameplay placements retain their driving atlases; presentation-only caches release when leaving a cutscene or selection. Original frame scripts, pose timing, audio and button callbacks remain.

The fan reticle avoids rebuilding the hidden original 2,002-frame spread artwork. Inert static props skip empty update branches only while live sound, damage, guide and editor conditions permit it. Pure road projection writes its scratch vector once after the loop. Original helper bodies and full source bundles remain available.

Actual Windows executables on Radeon RX550/OpenGL, 1200×800, VSync disabled. The old controls use immutable 0.4.18. Default driving is uncapped. Seeded Story diagnostics warm up for 180 simulation ticks.

| Run | Mean rendered FPS | Draw p95 ms | Draw p99 ms | Worst draw ms | CPU ms / simulation step | Texture MB |
|---|---:|---:|---:|---:|---:|---:|
| release059b | 179.11 | 19.111 | 21.356 | 34.684 | 19.994 | 287.3 |
| release059b-old | 117.93 | 27.147 | 54.422 | 74.089 | 23.300 | 287.0 |
| release059b-60 | 59.61 | 30.629 | 32.666 | 57.476 | 19.119 | 287.1 |
| release059b-old-60 | 59.50 | 29.963 | 32.847 | 38.003 | 19.721 | 284.6 |
| release059b-long | 99.98 | 31.548 | 42.533 | 89.350 | 24.383 | 336.9 |
| release059b-old-long | 127.29 | 24.783 | 31.405 | 55.907 | 22.846 | 318.7 |
| release059b-repeat | 189.93 | 18.516 | 20.860 | 42.927 | 19.547 | 284.6 |

These are diagnostic runs, not a complete playthrough. Average FPS does not mean steady 60 FPS: the capped runs still have long draw intervals. Constructor stalls and simulation bursts remain. A preliminary build applying presentation textures globally worsened the 40-second run to 116.82 mean FPS and 26.908 ms draw p95; that implementation was rejected.

Final boot: 4599 ms asynchronous preparation, approximately 5903 ms from the engine timer to readiness. The branded UI first appears at engine 1018 ms. These timers exclude OS process launch. All five ordinary script groups finish before play input is accepted.

Validation: 25 functional suites, seven targeted GPU suites, actual intro/selection captures and a 35-second real-time cinematic lifecycle check. All 2,774 original/reference file hashes and 4,674 full bundle functions were verified. 24 native/reference full pattern snapshots match. GPU checks retain exact road pixels and verify intermediate entity/road/presentation positions, snapshots, pause, effects, crosshair and art dimensions.

Known limits:
- Steady 60 FPS is not achieved; the 60 FPS cap still has uneven draw intervals. Default driving remains uncapped.
- Mean rendered FPS and engine post-draw intervals do not establish monitor presentation smoothness.
- World simulation and original frame callbacks remain 30 Hz. Native entity, road and presentation transforms interpolate between updates; hand-drawn poses remain authored frames.
- Complete playthrough and every cinematic are not validated. The intro was exercised in real time for 35 seconds, with stream synchronization and transitions checked.
- Presentation artwork uses 10 GPU-compressed atlases at up to four times source density. Logical layout and intentional transparency remain. Shared gameplay artwork retains its driving atlases; presentation caches release on exit.
- Some atomic constructors exceed the scenery scheduler budget; native migration of remaining compatibility code is unfinished.
- Original remote leaderboards, ads and browser navigation remain offline; local campaigns, saves and scores are retained.
- GPU tests and executable diagnostics ran on Radeon RX550/OpenGL at 1200 by 800. Other hardware and fullscreen resolutions are not benchmarked.
