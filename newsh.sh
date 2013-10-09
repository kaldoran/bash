#!/bin/bash

# NICOLAS R
# Le 07 Octobre 2013


if test -z "$1"; then
    echo "Erreur : Il faut 1 argument au minimum."
    echo -e "$0 nom"
    exit 1
else
     if [ -e "$1.sh" ] && ( [ -f "$1.sh" ] || [ -d "$1.sh" ] ); then
          echo "Existe deja";
     else
          touch "$1.sh";
          echo "#!/bin/bash
# NICOLAS R
# $(date)

if test -z \"\$1\"; then
     echo \"Erreur : Il faut 1 argument au minimum.\"
     echo -e \"\$0 [ARG 1]\"
     exit 1
else
     ;
fi" >> "$1.sh";
                chmod +x "$1.sh"; 

          
     fi 

   
   
fi
