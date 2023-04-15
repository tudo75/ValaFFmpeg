# project name and programming language
project('valaffmpeg', ['vala', 'c'], version: '0.1.0')

# Include the translations module
i18n = import('i18n')
# define GETTEXT_PACKAGE
add_global_arguments('-DGETTEXT_PACKAGE="@0@"'.format (meson.project_name()), language:'c')
# Set our translation domain
add_global_arguments(['-DG_LOG_DOMAIN="@0@"'.format (meson.project_name())], language:'c')


# Include the gnome module
gnome = import('gnome')

# add resources to the executeable
dependencies = [
	dependency('gtk+-3.0', version: '>= 3.20'),
	dependency('glib-2.0'),
	dependency('gio-2.0'),
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
