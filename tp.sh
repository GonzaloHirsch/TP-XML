#!/bin/bash

#FOLDER=ACA VA EL PATH A LA CARPETA QUE ENTREGUEMOS

#Path to the query file
QUERY="./test.xq"

#XSLT = PATH AL XSLT

echo "Input user ID:"

read userID

echo "Input number of comments:"

read NComments

while [ $NComments -lt 0 ]; do
	echo "Please input a valid number of comments (a number greater than or equal 0):"

	read NComments
done

function verifyUserID() {
	#Upon inspecting the users.xml, the ID for the community is -1, so it can be chosen
	if [ $userID -lt -1 ]; then
		echo "ERROR: Invalid user ID received."
		return 1	# 1 == false
	else 
		return 0	# 0 == true
	fi
}

function verifyNumberOfComments(){
	if [ $NComments -lt 0 ]; then
		echo "ERROR: Invalid number of comments received."
		return 1
	else 
		return 0
	fi 
}

if verifyUserID && verifyNumberOfComments; then
	java net.sf.saxon.Query id=10 $QUERY 
else
	echo "bad"
fi
