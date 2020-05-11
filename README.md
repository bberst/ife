# Upgrade phpList to v3.5.3 with Google reCAPTCHA v3

## Upgrade to v3.5.3
* Login to host as root.
* Clone the repo locally and change directory to ~/ife:
```
git clone https://github.com/bberst/ife.git ~/ife
cd ~/ife
```
* Add local users, paths, db and Google reCAPTCHA v3 keys to the VARIABLES file.
```
vi VARIABLES
```
* Run numbered scripts sequentially (#3 will require you to enter the MySQL root password).
```
. ./1-version.sh
. ./2-variables.sh
. ./3-backup.sh
. ./4-release.sh
```

## Restore to prior version
* To restore from backup, run restore.sh (this will require the MySQL root password).
```
cd ~/ife
. ./restore.sh
```
