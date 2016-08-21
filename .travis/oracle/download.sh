#!/bin/sh -e

[ -n "$ORACLE_COOKIE" ] || { echo "Missing ORACLE_COOKIE environment variable!"; exit 1; }

cd "$(dirname "$(readlink -f "$0")")"
npm install bluebird node-phantom-simple

export COOKIES='cookies.txt'
export USER_AGENT='Mozilla/5.0'

echo > "$COOKIES"
chmod 600 "$COOKIES"

exec node download.js oracle12c/121020/linuxamd64_12102_database_1of2.zip
exec node download.js oracle12c/121020/linuxamd64_12102_database_2of2.zip
exec node download.js oracle11g/xe/oracle-xe-11.2.0-1.0.x86_64.rpm.zip

mv oracle-xe-11.2.0-1.0.x86_64.rpm.zip $TRAVIS_BUILD_DIR/dockerfiles/11.2.0.2
mv linuxamd64_12102_database_1of2.zip  $TRAVIS_BUILD_DIR/dockerfiles/12.1.0.2
mv linuxamd64_12102_database_2of2.zip  $TRAVIS_BUILD_DIR/dockerfiles/12.1.0.2

ls -l $TRAVIS_BUILD_DIR/dockerfiles/11.2.0.2
ls -l $TRAVIS_BUILD_DIR/dockerfiles/12.1.0.2
