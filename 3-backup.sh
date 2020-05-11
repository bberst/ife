#!/usr/bin/env bash

echo "Create backup directory."
mkdir --parent $TMP_DIR

echo "Backup current phpList root directory."
\rm --recursive --force --verbose $TMP_DIR/original
\cp --recursive --verbose $PHPLIST_ROOT $TMP_DIR/original

echo "Backing up current MySQL database, "$PHPLIST_DB"."
mysqldump --user $MYSQL_USER --password $PHPLIST_DB --verbose > $TMP_DIR/$PHPLIST_DB.sql

echo "Done"
