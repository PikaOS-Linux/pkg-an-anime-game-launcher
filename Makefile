export PATH := $(PWD):$(PATH)

all:
	true

install:
	mkdir -p $(DESTDIR)/usr/bin/
	mkdir -p $(DESTDIR)/usr/share/pixmaps
	mkdir -p $(DESTDIR)/usr/share/applications/
	mkdir -p $(DESTDIR)/usr/share/icons/hicolor/scalable/apps
	cargo fetch
	cargo build --release
	cp -vf target/release/anime-game-launcher $(DESTDIR)/usr/bin/
	chmod 755 $(DESTDIR)/usr/bin/anime-game-launcher
	cp -vf assets/images/icon.png $(DESTDIR)/usr/share/pixmaps/an-anime-game-launcher.png
	cp -vf assets/images/icon.png /usr/share/icons/hicolor/scalable/apps/moe.launcher.an-anime-game-launcher.png
	chmod 644 $(DESTDIR)/usr/share/pixmaps/an-anime-game-launcher.png
	chmod 644 $(DESTDIR)/usr/share/icons/hicolor/scalable/apps/moe.launcher.an-anime-game-launcher.png
    	cp -vf an-anime-game-launcher.desktop $(DESTDIR)/usr/share/applications/
    	chmod 644 $(DESTDIR)/usr/share/applications/an-anime-game-launcher.desktop
