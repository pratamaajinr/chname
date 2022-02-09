#!/bin/bash

bash creatfiles.sh #Create the files for example

shopt -s expand_aliases
source ~/.bash_aliases

alias chname="bash ./chname.sh "

echo ''
echo 'Example of: chname -l: chname -l file2 filE5 FILE1 dir1'
chname -l FILE1 file2 FIle3 fiLE4 filE5 
echo ''
echo 'Example of: chname --lowecase: chname --lowercase filE5 dir1'
chname --lowercase filE5 dir1
echo ''
echo 'Example of: chname -u: chname -u file2 FIle3 dir5'
chname -u file2 FIle3 dir5
echo ''
echo 'Example of: chname --uppercase: chname --uppercase file2 file5 dir5'
chname --uppercase file2 file5 dir5
echo ''
echo 'Example of: chname -r -l: chname -r -l FILE1 fiLE4 DIR4 dir5'
chname -r -l FILE1 fiLE4 DIR4 dir5
echo ''
echo 'Example of: chname -r --upper: chname -r --upper file1 file3 FILE2 Dir2'
chname -r --uppercase file1 file3 FILE2 Dir2
echo ''
echo 'Example of chname --recursive -s --lowercase :chname --recursive -s --lowercase FILE1 file2 Dir2 dIr3'
chname --recursive -s --lowercase FILE1 file2 Dir2 dIr3
echo ''
echo 'Example of chname --recursive --subdirectories --uppercase chname --recursive --subdirectories --uppercase FILE1 fiLE4 filE5 dir1 dir3'
chname --recursive --subdirectories --uppercase FILE1 fiLE4 filE5 dir1 dir3
echo ''
echo 'Example of chname -h '
chname -h
echo ''
echo 'Example of wrong use chname -w'
chname -w
echo ''
echo 'Example of chname --help'
chname --help
echo ''

