#some function add into my bashrc


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
