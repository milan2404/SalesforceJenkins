#!/bin/bash
#sh scripts/createPackage.sh -b origin/prod
cd .. 
while getopts b:r:a:u: option; do
    case "${option}" in
    b) BNAME=${OPTARG} ;;
    esac
done

rm -Rf src

mkdir -p temp
rm -Rf temp/modifiedFiles.txt
touch temp/modifiedFiles.txt

#get list of all modified files by comparing to main branch
git diff --minimal --no-renames --no-commit-id --name-only --diff-filter=ACMRTUXB --patch $BNAME ../force-app/main/default >> temp/modifiedFiles.txt
echo "force-app/main/default/classes/SampleTest.cls" >> temp/modifiedFiles.txt

#copy all modified files to src folder to generate manifest(Package.xml)
while read c; do
    ROOT=${c%/*}
    mkdir -p "src/$ROOT" && cp "../$c" "src/$c"
done < temp/modifiedFiles.txt