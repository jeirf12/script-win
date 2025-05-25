@echo off

git fetch --all
git submodule sync
git submodule update --init
git submodule init
git submodule update --init --force --remote
