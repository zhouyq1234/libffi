#!/bin/bash

if [[ $TRAVIS_OS_NAME != 'linux' ]]; then
  brew update
  # fix an issue with libtool on travis by reinstalling it
  brew uninstall libtool;
  brew install libtool dejagnu;
else
  sudo apt-get update
  sudo apt-get install dejagnu texinfo
  if [ "$HOST" = i386-pc-linux-gnu ] ; then
      sudo apt-get install gcc-multilib g++-multilib;
  fi
  if [ "$HOST" = i686-w64-mingw32 ] ; then
      sudo apt-get install gcc-mingw-w64-i686 binutils-mingw-w64-i686 wine Xvfb;
      # to run wine headlessly, we need a virtual frame buffer
      Xvfb :0 -screen 0 1024x768x16 &;
  fi
fi
