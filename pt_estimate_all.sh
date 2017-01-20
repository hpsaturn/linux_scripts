#!/bin/bash
count=0
pt todo | grep -Eo  '[0-9]{9}' | while read id
do
  ((count++))
  printf '%03d ' "$count"
  echo "process id: $id"
  pt estimate $id 3
  pt start $id
  pt finish $id
done 
