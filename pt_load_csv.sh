#!/bin/bash
INPUT=tasks.csv
TAG=$1

if [ "$1" == "" ]; then
  echo "missing parameter TAG"
  exit 1
fi

[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }

count=0
while read Tasks
do
  ((count++))
  size=${#Tasks} 
  if [ $size -eq 1 ]; then
    exit 1 #skip end of file
  fi
  ticket="[$1]$Tasks"
  printf '%03d ' "$count"
  echo "creating==>$ticket"
  #pt create "$ticket"
done < $INPUT
