#!/bin/bash


cat xml-parts_a.txt > app.xml
cat xml-parts_b.txt >> app.xml
cat app.js >> app.xml
cat xml-parts_c.txt >> app.xml
cat test.html >> app.xml
cat xml-parts_d.txt >> app.xml

echo "concat app.xml finished"


cat xml-parts_b.txt > concat-test.html
cat app.js >> concat-test.html
cat xml-parts_c.txt >> concat-test.html
cat test.html >> concat-test.html

echo "concat concat-test.html finished"
