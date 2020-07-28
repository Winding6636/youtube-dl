#!/bin/bash
#   pip package Youtube-DL patch script
#   patch : niconico URL sm|nm|so support
#

set -Ce

echo :-: niconico short_sm patch... :-:
#Download
wget -q -O ./niconico_sm.patch https://raw.githubusercontent.com/Winding6636/youtube-dl/nico_short/niconico_sm.patch
#Patched
cat ./niconico_sm.patch
_ytdlpath_=`pip show youtube-dl | grep Location | awk '{print $2}'`
patch -p1 -d $_ytdlpath_ < ./niconico_sm.patch
sed -i -e '$a __version__ = __version__ + " _nicosm-patch"\n' $_ytdlpath_/youtube_dl/version.py
#pip metadata update 多分要らない
_version_=`youtube-dl --version`
sed -i -e 's/"version": ".*"/"version": "'$_version_'"/g' ''$_ytdlpath_'/youtube_dl-2020.6.16.1.dist-info/metadata.json'
pip list | grep youtube-dl
echo $_version_
#clean
rm ./niconico_sm.patch
echo :-: niconico short_sm patch END:-:
