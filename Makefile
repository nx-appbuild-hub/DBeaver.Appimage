SOURCE="https://dbeaver.io/files/dbeaver-ce-latest-linux.gtk.x86_64.tar.gz"
DESTINATION="build.tar.gz"
OUTPUT="DBeaver.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget --no-check-certificate --output-document=$(DESTINATION) --continue $(SOURCE)
	
	tar -zxvf $(DESTINATION)
	rm -rf AppDir/opt
	
	mkdir --parents AppDir/opt/application
	mv dbeaver/* AppDir/opt/application

	chmod +x AppDir/AppRun

	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)
	
	chmod +x $(OUTPUT)

	rm -f $(DESTINATION)
	rm -rf AppDir/opt
	rm -rf dbeaver
