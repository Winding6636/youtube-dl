#!/bin/bash
#   pip package Youtube-DL patch script
#   patch : niconico URL sm|nm|so support
#

set -Ce

#Download
wget -O ./niconico_sm.patch https://raw.githubusercontent.com/Winding6636/youtube-dl/nico_short/niconico_sm.patch
#Patched
_ytdlpath_=`pip show youtube-dl | grep Location | awk '{print $2}'`
patch -p1 -d $_ytdlpath_ < ./niconico_sm.patch
#pip metadata update 多分要らない
_version_=`youtube-dl --version`
sed -i -e 's/"version": ".*"/"version": "'$_version_'"/g' ''$_ytdlpath_'/youtube_dl-2020.6.16.1.dist-info/metadata.json'
pip list | grep youtube-dl
echo $_version_
#clean
rm ./niconico_sm.patch
echo :-:END:-:
