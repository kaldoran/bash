#some function add into my bashrc

function savoir() {
	wget -q -O- http://www.savoir-inutile.com/ | sed -n "s/<h2 id=\"phrase\" style=\"[^\"]*\">\(.*\)<\/h2>/\1/p" | sed -e "s/\t*//g"
}

function couchermoinsbete() { 
    wget -q -O- http://secouchermoinsbete.fr/random | grep -m 1 -e "            <a href=\"\/[0-9]\{5\}\(-[a-z]*\)*\">[A-Z].*" | sed -n "s/      <a [^>]*>\(.*\)/\1/p" | sed -e "s/&#039;/'/g"
}


H=$(date +%H)
if (( 10 <= 10#$H && 10#$H < 17 )); then 
    echo -e "Savoir inutile :\n\t"
    savoir;
else
    echo "Se coucher moins bete :";
    couchermoinsbete;
fi

# get my ip
myip(){ wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//';}

# search file if only one found do into
# else ask 

function cdfind() {
	goto=$@;
	IFS='
'
	lall=( $(find . -iname "$goto*" -type d -readable 2>/dev/null) )
	
	if [[ ${#lall[*]} == 0 ]]; then 
		echo "Aucune valeur trouvée";
	elif [[ ${#lall[*]} == 1 ]]; then 
		cd "${lall[0]}";
	else
		for i in $(seq 1 $((${#lall[*]})) ); do
			echo "[$i] - ${lall[$(( $i - 1 ))]}";
		done
		read -p "#?" i
		cd "${lall[ $(( $i - 1 )) ]}"
	fi
	IFS=' '
}

# goto and up directory
# up 5 
# goto : ../../../../..
function up() { 
	LIMIT=$1
	P="$PWD"
	for ((i=1; i <= LIMIT; i++));do
		P=$P/.. 
	done 
	cd "$P"
}

#usefull commande : try :
cd -
# into you shell
# Exemple : 
# cd Document/test/try/imhere/fun
# then cd 
# and cd -
# you are going to go into "Document/test/try/imhere/fun" 




function bashtips {
    echo -e "
    REPERTOIRES
    ----------------------------------------------------------------------
    ~-          repertoire precedent
    pushd tmp   Push tmp && cd tmp
    popd        Pop && cd
    save foo    bookmark le dossier courant dans foo
    show        voir une liste des bookmarks

    HISTORIQUE
    ----------------------------------------------------------------------
    !!        Derniere commande
    !!:p      Apercu sans execution de la derniere commande
    !?foo     Derniere commande contenant \`foo'
    ^foo^bar^ Derniere commande contenant \`foo', mais substitue avec \`bar'
    !!:0      Derniere commande mot
    !!:^      1er argument de la derniere commande
    !\$        Dernier argument de la derniere commande
    !!:*      Tout les arguments de la derniere commande
    !!:x-y    Arguments x a y de la derniere commande
    [Ctrl]-s  Rechercher en avant dans l'historique
    [Ctrl]-r  Rechercher en arriere dans l'historique

    EDITION DE LIGNE
    ----------------------------------------------------------------------
    [Ctrl]-a     aller au debut de la ligne
    [Ctrl]-e     aller a la fin de la ligne
    [ Alt]-d     efface jusqu'a la fin d'un mot
    [Ctrl]-w     efface jusqu'au debut d'un mot
    [Ctrl]-k     efface jusqu'a la fin de la ligne
    [Ctrl]-u     efface jusqu'au debut de la ligne
    [Ctrl]-y     coller le contenu du buffer
    [Ctrl]-r     revert all modifications to current line
    [Ctrl]-]     chercher en avant dans la ligne
    [Ctrl]-]   chercher en arriere dans la ligne
    [Ctrl]-t     switch lettre
    [ Alt]-t     switch mot
    [ Alt]-u     mot en Majuscule
    [ Alt]-l     Mot en Minuscule
    [ Alt]-c     1ere lettre du mot en Majuscule

    COMPLETION
    ----------------------------------------------------------------------
    [ Alt].      faire defiler les arguments de la derniere commande
    [ Alt]-/     completer le nom de fichier
    [ Alt]-~     completer le nom d'utilisateur
    [ Alt]-@     completer le nom d'host
    [ Alt]-\$     completer le nom de variable
    [ Alt]-!     completer le nom d'une commande
    [ Alt]-^     completer l'historique"

}

