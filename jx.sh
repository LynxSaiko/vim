export JT_JAVA=$(echo $PWD/build/*/jdk) &&
jtreg/bin/jtreg -jdk:$JT_JAVA -automatic -ignore:quiet -v1 \
    test/jdk:tier1 test/langtools:tier1 &&
unset JT_JAVA
install -vdm755 /opt/jdk-18.0.2+8             &&
cp -Rv build/*/images/jdk/* /opt/jdk-18.0.2+8 &&
chown -R root:root /opt/jdk-18.0.2+8          &&
for s in 16 24 32 48; do
  install -vDm644 src/java.desktop/unix/classes/sun/awt/X11/java-icon${s}.png \
                  /usr/share/icons/hicolor/${s}x${s}/apps/java.png
done

ln -v -nsf jdk-18.0.2+8 /opt/jdk
cat > /usr/share/applications/openjdk-java.desktop << "EOF" &&
[Desktop Entry]
Name=OpenJDK Java 18.0.2 Runtime
Comment=OpenJDK Java 18.0.2 Runtime
Exec=/opt/jdk/bin/java -jar
Terminal=false
Type=Application
Icon=java
MimeType=application/x-java-archive;application/java-archive;application/x-jar;
NoDisplay=true
EOF
cat > /usr/share/applications/openjdk-jconsole.desktop << "EOF"
[Desktop Entry]
Name=OpenJDK Java 18.0.2 Console
Comment=OpenJDK Java 18.0.2 Console
Keywords=java;console;monitoring
Exec=/opt/jdk/bin/jconsole
Terminal=false
Type=Application
Icon=java
Categories=Application;System;
EOF
ln -sfv /etc/pki/tls/java/cacerts /opt/jdk/lib/security/cacerts
cd /opt/jdk
bin/keytool -list -cacerts
