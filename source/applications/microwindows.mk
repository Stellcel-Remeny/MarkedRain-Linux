define main_compile
	$(S) clone https://github.com/ghaerr/microwindows.git "$(app_dir_microwindows)"
	$(call sub, Preparing Microwindows)
	$(Q)if [ ! -f "$(app_dir_microwindows)/src/config" ]; then \
	    cp "$(app_dir_microwindows)/src/Configs/config.linux-fb" "$(app_dir_microwindows)/src/config"; \
	fi
	$(call sub, Compiling Microwindows)
	$(MAKE) -C "$(app_dir_microwindows)/src" CFLAGS="-I/usr/include/freetype2" $(OUT)
endef

define main_install
	$(call sub, Installing Microwindows)
	$(Q)cp -r "$(app_dir_microwindows)"/src/bin/* "$(bin_dir_tmp_squashfs)/bin"
endef