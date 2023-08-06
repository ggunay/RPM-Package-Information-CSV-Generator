#!/bin/bash

# RPM Package Information CSV Generator
# Generates/overwrites out.csv
# Usage: bash generate_csv.sh <inputpackage>
# Author: Gunay Geyik 
# github.com/ggunay

# Check if the inputpackage argument is provided
if [ $# -ne 1 ]; then
  echo "Error: Please provide the 'inputpackage' file as an argument."
  echo "Usage: bash generate_csv.sh <inputpackage>"
  exit 1
fi

inputpackage=$1

# Check if the inputpackage file exists
if [ ! -f "$inputpackage" ]; then
  echo "Error: '$inputpackage' file not found."
  echo "Please create the '$inputpackage' file and add RPM package names, one per line."
  exit 1
fi

echo "Type,Datatable" > out.csv
echo "file,package,name,version,release,license,packager,vendor,summary" >> out.csv

while read f; do
readarray -t lines < <(rpm -qf $f | while read package; do  rpm -qi $package; done)
name='unset'
version='unset'
release='unset'
license='unset'
packager='unset'
vendor='unset'
summary='unset'
for line in "${lines[@]}"; do

        if [[ "$line" == "Name"* ]]; then
         IFS ":" name=${line#*:}
		 continue
        fi
		if [[ "$line" == "Version"* ]]; then
         version=${line#*:}
		 continue
        fi
		if [[ "$line" == "Release"* ]]; then
         release=${line#*:}
		 continue
        fi
		if [[ "$line" == "License"* ]]; then
         license=${line#*:}
		 continue
        fi
		if [[ "$line" == "Packager"* ]]; then
         packager=${line#*:}
		 continue
        fi
		if [[ "$line" == "Vendor"* ]]; then
         vendor=${line#*:}
		 continue
        fi
		if [[ "$line" == "Summary"* ]]; then
         summary=${line#*:}
		 continue
        fi

done

str=$f","$package","$name","$version","$release","$license","$packager","$vendor","$summary
echo "$str"
echo $str >> out.csv
done <$inputpackage