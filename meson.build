project('vala-console', ['vala', 'c'])
vala_console_SOURCES = files('console.vala', 'spinner.vala',
      'charsets/charset.vala',
      'charsets/useful/dots.vala',
      'charsets/fun/moon.vala'
)

vala_console_lib = static_library('vala_console', vala_console_SOURCES, dependencies: [dependency('glib-2.0'), dependency('gobject-2.0')])
vala_console_dep = declare_dependency(link_with: vala_console_lib)
