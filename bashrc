#some function add into my bashrc


# search file if only one found do into
# else ask 

function cdfind() {
	goto=$@;
	lall=$(find . -name "$goto" -type d -readable 2>/dev/null );
	if [[ $? == 0 ]]; then 
		cd "$lall";
		return;
	fi
	select config in "$lall"; do  
		cd "$config";   
		return; 
	done
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
