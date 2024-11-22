#!/bin/bash

output_file=Smaws_Clients.ml
module_file=modules_list.txt

files=$(find . -mindepth 2 -name dune | sort)
echo > $output_file
echo > $module_file
for dune_file in $files
do
	library_name=$(cat $dune_file | grep -E Smaws_Client_\\w+$)
	if [ -z "$library_name" ]
	then
		echo "Could not find service name in $dune_file"
		exit 1
	fi
	module_name=$(echo $library_name | sed s/Smaws_Client_//g)
	echo "module $module_name = $library_name" >> $output_file
	echo $library_name >> $module_file
done
