#!/bin/bash
# Backup dla plików binarnych z /usr/bin
# Lab 1 

echo "Tworzenie katalogu backup"
mkdir ~/backup 2> copy.err

echo "Kopiowanie plików..."
cp -rp /usr/bin/* ~/backup > copy.log 2>&1 
