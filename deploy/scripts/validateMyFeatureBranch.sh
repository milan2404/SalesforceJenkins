#!/bin/bash
#sh deploy/scripts/validateMyFeatureBranch.sh
rm -Rf "deploy/temp"
cd deploy
cd scripts
#sh install_Plugins.sh
sh createPackage.sh -b origin/main
sh buildProfiles.sh
sh createManifest.sh
sh fetchTestClasses.sh
cd ..
cd ..

sfdx force:source:deploy --wait 9999 --manifest deploy/temp/package.xml --predestructivechanges force-app/main/default/destructiveChangesPre.xml --postdestructivechanges force-app/main/default/destructiveChangesPost.xml --checkonly --testlevel RunSpecifiedTests --runtests $(<deploy/temp/testsToRun.txt)

#validate
#sfdx force:source:deploy --wait 9999 --manifest deploy/temp/package.xml --targetusername SANDBOXName --predestructivechanges force-app/main/default/destructiveChangesPre.xml --postdestructivechanges force-app/main/default/destructiveChangesPost.xml --checkonly --testlevel RunSpecifiedTests --runtests $(<deploy/temp/testsToRun.txt)

#rm -Rf "deploy/temp"
