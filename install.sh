#!/bin/bash

echo "备份vim旧配置.."
bak=vim_bak
mkdir vim_bak
mv ~/.vimrc $bak 2>> log
mv ~/.vim $bak 2>> log
echo "备份完成"

echo "开始安装vim新配置.."
cp -rf vim ~/.vim 2>> log
cp vimrc ~/.vimrc 2>> log
echo "安装完成"
