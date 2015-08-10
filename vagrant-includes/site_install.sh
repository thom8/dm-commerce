#!/bin/bash

dbName="$1"
siteName="$2"
drupalUser="$3"
drupalPass="$4"

if [ ! -f siteinstalled ] ; then

  echo "Starting Drupal installation. This takes a few mins."

  # Tidy up
  drush --root=/drupal sql-drop -y -q >/dev/null
  sudo chmod 775 /drupal/sites/default/ >/dev/null
  sudo rm -rf /drupal/sites/default/settings.php >/dev/null

  # Create files directory
  sudo mkdir /drupal/sites/default/files >/dev/null
  sudo chmod -R 775 /drupal/sites/default/files >/dev/null

  # Install Drupal
  drush --root=/drupal si commerce_kickstart -y -q \
  --db-url="mysql://root:root@localhost:3306/$dbName" \
  --account-name="$drupalUser" \
  --account-pass="$drupalPass" \
  --site-name="$siteName" >/dev/null

  echo "Install complete."

  # Create dbimported file.
  touch siteinstalled

fi