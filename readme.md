# ValaConsole
## Installation
This is for use in [`valapkg`](https://github.com/aleksrutins/valapkg) projects (use `valapkg add aleksrutins/vala-console`), although it can also be used in Meson projects by adding it as a submodule, using `subdir`, and concatenating `vala_console_SOURCES` to your sources list, like so:
```meson
subdir('vala-console')
...
sources += vala_console_SOURCES
```
I will try to keep the list up to date.

## Usage
See `test.vala`. It should be adequately commented.