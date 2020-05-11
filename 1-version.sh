#!/usr/bin/env bash

echo "Read Apache user."
ps aux|grep --color=auto -E '(apache|www-data)'

echo "Read Apache DocumentRoot."
find /etc/{apache2,httpd} -iname "*.conf" -type f -exec grep --color=auto -He "^\s*DocumentRoot" {} \; 2>/dev/null

echo "List presumed phpList root."
ls -hal /var/www/html/lists

echo "Is mysqldump installed?"
mysqldump --version

echo "Done"
