#!/bin/bash
cat > /etc/profile.d/openjdk.sh << "EOF"
# Begin /etc/profile.d/openjdk.sh

# Set JAVA_HOME directory
JAVA_HOME=/opt/jdk

# Adjust PATH
export PATH=$JAVA_HOME/bin:$PATH

# Add to MANPATH
export MANPATH=$JAVA_HOME/man:$MANPATH

# Auto Java CLASSPATH: Copy jar files to, or create symlinks in, the
# /usr/share/java directory.

AUTO_CLASSPATH_DIR=/usr/share/java

export CLASSPATH=.:$CLASSPATH

for dir in $(find ${AUTO_CLASSPATH_DIR} -type d 2>/dev/null); do
    export CLASSPATH=$CLASSPATH:$dir
done

for jar in $(find ${AUTO_CLASSPATH_DIR} -name "*.jar" 2>/dev/null); do
    export CLASSPATH=$CLASSPATH:$jar
done

export JAVA_HOME
unset AUTO_CLASSPATH_DIR dir jar

# End /etc/profile.d/openjdk.sh
EOF

cat > /etc/sudoers.d/java << "EOF"
Defaults env_keep += JAVA_HOME
Defaults env_keep += CLASSPATH
EOF


cat >> /etc/man_db.conf << "EOF" &&
# Begin Java addition
MANDATORY_MANPATH     /opt/jdk/man
MANPATH_MAP           /opt/jdk/bin     /opt/jdk/man
MANDB_MAP             /opt/jdk/man     /var/cache/man/jdk
# End Java addition
EOF

mkdir -p /var/cache/man &&
mandb -c /opt/jdk/man


ln -sfv /etc/pki/tls/java/cacerts /opt/jdk/lib/security/cacerts


/opt/jdk/bin/keytool -list -cacerts



