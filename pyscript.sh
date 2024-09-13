#!/bin/bash

#=====================================================#
#  Bash script to make Python scripts with predefined #
#  functions and comments.                            #
#=====================================================#


# Prompt the user to enter the filename

echo "Enter the program name: "
read FILE

# Prompt the user about the author

echo "Enter the name of the author: "
read AUTHOR

# Prompt user for any additional comments
echo "Enter any additional comments to be added in the beginning: "
read INITIAL_COMMENT

FILENAME="$FILE".py

# Check if filename already exists

if [ -e $FILENAME ];
then
    echo "Error creating file. ${FILENAME} already exists!"
    exit 1
fi

touch ${FILENAME}

CURRENT_DATE=$(date +"%d %B %Y")

echo //-----------------------------------------------------  > $FILENAME
echo // ${INITIAL_COMMENT}                                   >> $FILENAME
echo // Original Author: ${AUTHOR}                           >> $FILENAME
echo // Date Created: ${CURRENT_DATE}                        >> $FILENAME
echo // Python Source Code                                   >> $FILENAME
echo //----------------------------------------------------- >> $FILENAME


cat <<EOF >> $FILENAME

//---------------------------------
// system include files
//---------------------------------

//---------------------------------
// user include files
//---------------------------------

//---------------------------------
// Class Declaration
//---------------------------------

//---------------------------------
// user defined functions
//---------------------------------


EOF

chmod +x "$FILENAME"

# Moving the file to the required directory

echo "Enter the path of the directory: "
read PATH_DIRECTORY

# Checking if the directory exists

if [ -e $PATH_DIRECTORY ];
then
    echo "Error making directory. ${PATH_DIRECTORY} directory already exists!"
    exit 2
fi

mkdir "$PATH_DIRECTORY"

mv "$FILENAME" "$PATH_DIRECTORY"

# Closing Log / Messages

echo "$FILENAME has been successfully created and moved to $PATH_DIRECTORY !"


