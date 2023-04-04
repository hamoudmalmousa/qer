

#!/bin/bash

#Hamoud: Create Application Dynamics - Frame Window and Fields

frmdata=$(yad --title "Create Directory" --form --width 300 --height 300 \

          --field="Path" \

          --field="Directory Name" \

          --field="Group Owner" \

          --field="Change Owner" \

          --directory \

          )

#Capture and parse user INPUT from fields

frmPath=$(echo $frmdata | awk 'BEGIN {FS="|"}{ print $1}')

frmDirName=$(echo $frmdata | awk 'BEGIN {FS="|"}{ print $2}')

frmGroup=$(echo $frmdata | awk 'BEGIN {FS="|"}{ print $3}') #If blank, default to root

frmChgOwn=$(echo $frmdata | awk 'BEGIN {FS="|"}{ print $4}') #If blank, default to root

#Execute command with user input as a variable

#Logic to check for empty variable in the Group and Owner fields and add error handling

# -z = if variable is empty

# -n = if variable is not empty

 

set -x

if [ -z "$frmGroup" ]; then

     echo "Group Empty"

elif [ -n "$frmGroup" ]; then

     chgrp $frmGroup $frmPath$frmDirName

fi

if [ -z "$frmChgOwn" ]; then

     echo "Change Owner Empty"

elif [ -n "$frmChgOwn" ]; then

     chown $frmChgOwn $frmPath$frmDirName

fi
