#!/usr/bin/env bash

echo "Download base phpList code and recaptcha edits from GitHub."
git clone --branch release-3.5.3      https://github.com/phpList/phplist3.git $TMP_DIR/base
git clone --branch 3.5.3-recaptcha-v3 https://github.com/bberst/phplist3.git  $TMP_DIR/edits

echo "Remove existing phpList root directory."
\rm --recursive --force $PHPLIST_ROOT

echo "Copy edits and original config.php over phpList base in phpList root directory."
\cp --recursive $TMP_DIR/base/public_html/lists/                     $PHPLIST_ROOT/
\cp --force $TMP_DIR/edits/public_html/lists/admin/subscribelib2.php $PHPLIST_ROOT/admin/
\cp --force $TMP_DIR/edits/public_html/lists/admin/init.php          $PHPLIST_ROOT/admin/
\cp --force $TMP_DIR/edits/public_html/lists/index.php               $PHPLIST_ROOT/
\cp --force $TMP_DIR/original/config/config.php                      $PHPLIST_ROOT/config/

echo "Add Google reCAPTCHA v3 settings to config.php."
echo ""                                                           >> $PHPLIST_ROOT/config/config.php
echo "# Google reCAPTCHA v3 settings"                             >> $PHPLIST_ROOT/config/config.php
echo "define('RECAPTCHA_SITE_KEY', '"$RECAPTCHA_SITE_KEY"');"     >> $PHPLIST_ROOT/config/config.php
echo "define('RECAPTCHA_SECRET_KEY', '"$RECAPTCHA_SECRET_KEY"');" >> $PHPLIST_ROOT/config/config.php
echo "define('RECAPTCHA_THRESHOLD', 0.5);"                        >> $PHPLIST_ROOT/config/config.php
echo "define('RECAPTCHA_LOG', 0);"                                >> $PHPLIST_ROOT/config/config.php
echo ""                                                           >> $PHPLIST_ROOT/config/config.php

echo "Make apache user owner of phpList root directory."
chown --recursive $APACHE_USER:$APACHE_USER $PHPLIST_ROOT

echo "Done"
