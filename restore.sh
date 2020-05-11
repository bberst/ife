#!/usr/bin/env bash

echo "Reload variables from VARIABLES."
. VARIABLES

echo "Restore database from backup."
mysql --user $MYSQL_USER --password --verbose $PHPLIST_DB < $TMP_DIR/$PHPLIST_DB.sql

echo "Restore phpList root from backup."
rm --recursive --force $PHPLIST_ROOT
cp --recursive $TMP_DIR/original $PHPLIST_ROOT

echo "Done"
