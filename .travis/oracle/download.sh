#!/bin/sh -e

[ -n "$ORACLE_COOKIE" ] || { echo "Missing ORACLE_COOKIE environment variable!"; exit 1; }
[ -n "$ORACLE_FILE" ] || { echo "Missing ORACLE_FILE environment variable!"; exit 1; }

pwd
cd "$(dirname "$(readlink -f "$0")")"
echo $HOME
pwd
npm install bluebird node-phantom-simple

export COOKIES='cookies.txt'
export USER_AGENT='Mozilla/5.0'

echo > "$COOKIES"
chmod 600 "$COOKIES"

exec node download.js
