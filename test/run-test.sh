#!/bin/sh

basedir=`dirname $0`

for test in $basedir/../test/test*.scm
do
  echo "Running test $test"
  gosh -I. -I../lib -I./lib -I./src -I../src -I$basedir/../ -I$basedir/../lib $test -vp
done
