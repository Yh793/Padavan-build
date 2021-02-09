#!/bin/bash
GO_DIR="/opt/hostedtoolcache/go"
GO_VER="/opt/go_ver.txt"
: >$GO_VER

dir=$(ls -l "$GO_DIR" | sed '{1!G;h;$!d}' | awk '/^d/ {print $NF}')
for i in $dir; do
  echo $i
  echo $i >>$GO_VER
done
new_ver=$(sed -n '1p' $GO_VER)
old_ver=$(sed -n '2p' $GO_VER)
echo "rm -rf $GO_DIR/$old_ver"
rm -rf $GO_DIR/$old_ver
echo "mv $GO_DIR/$new_ver $GO_DIR/$old_ver"
mv $GO_DIR/$new_ver $GO_DIR/$old_ver
