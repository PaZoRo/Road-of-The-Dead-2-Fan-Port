# Fan Port 0.3.1 rendering correction

Version 0.3 forced a 600x400 framebuffer to be enlarged to a 1200x800 window. Version 0.3.1 uses Godot canvas-items scaling: coordinates remain 600x400, while drawing and text render at the window's actual resolution. The default texture filter is explicitly Linear; its enum value was confirmed against the installed engine's settings metadata.

The Windows x86_64 executable was exported successfully and launched directly with embedded assets and an isolated save directory. Story gameplay advanced, and the captured framebuffer was verified to be 1200x800. The capture was visually inspected. No script/shader errors or gameplay warnings occurred. The machine's unrelated root-certificate-store message remains.

Executable result: `BINARY_GAMEPLAY_COMPLETE position=1.10436160400801 warnings={  }`.

Targeted checks cover the rendering configuration, exported gameplay, framebuffer dimensions, PE architecture, embedded pack, and ZIP integrity. The nine full regression suites passed for 0.3; they were not rerun for this display-setting/title correction. The simulation, asset pixels, and gameplay implementation are unchanged. Performance was not rebenchmarked; historical 0.3 numbers are labeled in PERFORMANCE.md. Drawing more pixels may cost GPU time, and 60 FPS is not promised.

The normal save location and previous executables remain unchanged.
