#!/bin/bash

#Path to the query file
QUERY="./SOquery.xq"

XSLT="./create_page.xsl"

#Ask for the user ID
printf "Input user ID: "

read userID

#Ask for the number of comments until is valid
#---------------------------------------------
printf "Input number of comments: "

read NComments

#Use regexp to make sure its an integer 
while ! [[ "$NComments" =~ ^[0-9]+$ ]] ; do
	printf "Please input a valid number of comments (an integer greater than or equal to 0): "

	read NComments
done
#---------------------------------------------

printf "\nRunning Query...\n\n"
java net.sf.saxon.Query userID=$userID n=$NComments $QUERY -o:intermediate.xml
if [ $? -eq 0 ]; then
	printf "Query completed successfuly!\n\n"
	sleep 2s
	printf "Running Transformation...\n\n"
	java net.sf.saxon.Transform -s:intermediate.xml -xsl:$XSLT -o:output.html
	if [ $? -eq 0 ]; then
		printf "Transformation completed successfuly!\n\n"
		sleep 2s
		printf "HTML file successfuly created!\n\n"
		sleep 2s
	else
		printf "Error while producing Transformation, exiting now."
	fi
else
	printf "Error while producing Query, exiting now."
fi

