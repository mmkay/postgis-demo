#!/usr/bin/bash 

# installing postgis for postgresql-9.1 in Ubuntu 13.04.
# based on http://gingerjoos.com/blog/code/installing-postgis-on-ubuntu-13-04-raring-ringtail

sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable
sudo apt-get install postgresql-9.1-postgis-2.0-scripts
