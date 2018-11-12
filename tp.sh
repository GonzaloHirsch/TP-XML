#!/bin/bash

#Path to the query file
QUERY="./SOquery.xq"

XSLT="./create_page.xsl"

#Ask for the user ID
echo "Input user ID:"

read userID

#Ask for the number of comments until is valid
#---------------------------------------------
echo "Input number of comments:"

read NComments

while [ $NComments -lt 0 ]; do
	echo "Please input a valid number of comments (a number greater than or equal to 0):"

	read NComments
done
#---------------------------------------------

echo "Running Query..."
java net.sf.saxon.Query userID=$userID n=$NComments $QUERY -o:intermediate.xml
echo "Running Transformation..."
java net.sf.saxon.Transform -s:intermediate.xml -xsl:$XSLT -o:output.html
echo "Running HTML file..."
open output.html

