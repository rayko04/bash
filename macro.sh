macro(){
      export dir="$(pwd)" 
}

polo(){
	if [[ -n "$dir" ]]; then
		cd "$dir" || echo "Directory does'nt exist."
	else
		echo "No directory saved. Run Macro"
	fi
}
	

