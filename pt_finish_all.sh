#!/bin/bash
pt | grep -v finished | grep -Eo  '[0-9]{9}' | while read id
do
  pt finish $id
done
