#!/bin/bash

pushd builddir
md5sum $(find ./usr/ -type f |
  awk '!/^\.\/usr\/DEBIAN/ { print substr($0, 3) }') > DEBIAN/md5sums
popd

dpkg-deb -b ./builddir ./lat-1.4.4-1_loong64.deb
lintian ./lat-1.4.4-1_loong64.deb
