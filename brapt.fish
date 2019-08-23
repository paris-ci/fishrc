function _debug
	# echo $argv
end

function brapt --argument-names action package_name --description "Useful compatibility module to install packages on mac and linux"
	if test (uname) = "Darwin"
		set package_manager brew
		_debug Package manager set to brew
	else
		set package_manager apt
		_debug Package manager set to apt
	end

	if test $action = "install"
		_debug Installing $package_name
		eval $package_manager install $package_name
	else if test $action = "ensure"
		_debug Ensuring $package_name
		which -s $package_name
		if test $status -ne 0
			_debug Need installing $package_name
			brapt install $package_name
		end
	else
		echo Invalid action $action :\(
		return 1
	end

end

