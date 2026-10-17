# Fan Port 0.3 Windows verification

The release executable was launched directly with its embedded assets and an isolated save directory. Its built-in fixture entered story gameplay, accelerated the vehicle, captured the rendered scene, and exited successfully.

Executable result: `BINARY_GAMEPLAY_COMPLETE position=1.09520943231515 warnings={  }`.

The PE header identifies Windows x86_64; the embedded Godot pack footer was checked. No script/shader errors or gameplay warnings occurred. This machine reports a root-certificate-store error unrelated to this offline game.

All 2,774 generated scripts compiled. Semantics, native performance, runtime regression, interface, persistence, mode startup, weapon, and gameplay suites passed. Native code was compared with the translated reference in 224 road projection, 56 surface/lava, 30 vehicle, 16 obstacle-car, and 18 building cases. Transparency, hidden animation phase, retained artwork identity, negative HUD counters, image readback, callbacks, and node lifetime have checks. Inkscape checked 67 SVGs; two missing raster strokes were restored. Atlas construction verified all 4,355 regions against their PNG pixels.

Cinematic and gameplay captures were visually inspected. Full-clock live playback advanced the vehicle with finite transforms and no gameplay warnings. These checks do not prove a complete campaign playthrough or complete Flash filter fidelity.

60 FPS is not achieved. The manual rendered fixture measured 19.56 FPS; the actual fixed-clock heavy gameplay test averaged 12.30 FPS. See PERFORMANCE.md for the scheduling and resolution differences. Existing normal saves and previous Windows builds were preserved.
