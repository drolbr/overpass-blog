#!/usr/bin/env bash

pushd `dirname $0`

for i in *.html; do
  { basename $i; cat $i; } | awk -f make_link.awk
done | sort -r

for i in *.html; do
  { basename $i; cat $i; } | awk -f eval_blog.awk
done | sort -r | awk -f make_rss.awk >rss.xml

popd

