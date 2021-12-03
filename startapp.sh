#!/bin/sh
exec /usr/bin/xterm
# exec java -jar /defaults/JDownloader.jar
start_jd() {
    /usr/bin/java \
    -jar /config/nsloader.jar
}


start_jd