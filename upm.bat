@echo off

git submodule sync
git submodule update --init
git submodule init
git submodule update --init --force --remote
