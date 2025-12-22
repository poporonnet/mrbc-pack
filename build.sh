#!/bin/bash
set -x

apt-get update -y
apt-get install -y build-essential git bison

ruby build.rb

tar -czf build.tar.gz built/
