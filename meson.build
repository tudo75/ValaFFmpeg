# project name and programming language
project('valaffmpeg', ['vala', 'c'], version: '0.1.0')

# Include the gnome module
gnome = import('gnome')

vapi_dir = join_paths(meson.current_source_dir(), 'vapi')
add_project_arguments(['--vapidir', vapi_dir], language: 'vala')
add_project_arguments(['--enable-experimental'], language: 'vala')

# add resources to the executeable
dependencies = [
	dependency('gtk+-3.0', version: '>= 3.20'),
	dependency('glib-2.0'),
	dependency('gio-2.0'),
	dependency('libavutil'),
#	dependency('libswresample'),
#	dependency('libavformat'),
#	dependency('libavcodec'),
    meson.get_compiler('c').find_library('m', required: false),
    meson.get_compiler('vala').find_library('posix'),
]

conf_data = configuration_data()
conf_data.set('PROJECT_NAME', meson.project_name())
conf_data.set('GETTEXT_PACKAGE', meson.project_name())
conf_data.set('VERSION', meson.project_version())
conf_data.set('PREFIX', get_option('prefix'))

config_header = configure_file(
    input: 'src/config.vala.in',
    output: 'config.vala',
    configuration: conf_data
)

sources = files(
    'src/application.vala',
)

executable(
    meson.project_name(),
    sources,
    config_header,
    dependencies: dependencies,
    install: true,
)
