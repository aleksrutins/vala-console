# ValaConsole
## Installation
Add it as a subproject:
```sh
git submodule add https://github.com/aleksrutins/vala-console subprojects/vala-console
```
```meson
subproject('vala-console')
```
And add the dependency:
```meson
dependency('vala-console', ['vala-console', 'vala_console_dep'])
```
I will try to keep the list up to date.

## Usage
See `test.vala`. It should be adequately commented.
