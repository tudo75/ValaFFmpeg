# ValaFFmpeg

## Requirements
First of all the system must support threads.

To compile some libraries are needed:

* meson
* ninja-build
* valac
* libgtk-3-dev
* libglib2.0-dev
* libgee-0.8-dev

To install on Ubuntu based distros:

    sudo apt install meson ninja-build build-essential valac cmake libgtk-3-dev libglib2.0-dev

## Install
Clone the repository:
	
	git clone https://github.com/tudo75/valaffmpeg.git
	cd valaffmpeg

And from inside the cloned folder:
	
	meson setup build --prefix=/usr
	ninja -v -C build
	ninja -v -C build install

## Uninstall
To uninstall and remove all added files, go inside the cloned folder and:

	sudo ninja -v -C build uninstall
