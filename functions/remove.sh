function remove_all() {
	for prog in `pkg info | grep -v "bash\|pkg" | awk '{ print $1 }'`
		do pkg remove -y $prog 
	done
}