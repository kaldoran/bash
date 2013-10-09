#!/bin/sh

# NICOLAS R
# Le 07 Octobre 2013

# Count number of line from a project

total=0
find . -maxdepth 1 -type f | (while read a; 
do
	ligne=$(wc -l "$a" | awk '{print $1}'); 
	echo "Le fichier $a possède $ligne lignes."; 
	total=$((total+ligne));
done
echo "Il y a un total de $total lignes.";)
echo $ligne;


