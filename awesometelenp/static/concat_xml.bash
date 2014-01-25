#!/bin/bash


cat xml-parts_a.txt > app.xml
cat xml-parts_b.txt >> app.xml
cat app.js >> app.xml
cat app-map.js >> app.xml
cat xml-parts_c.txt >> app.xml
cat app.html >> app.xml
cat app-map.html >> app.xml
cat xml-parts_d.txt >> app.xml

echo "concat app.xml finished"


cat xml-parts_b.txt > test.html
cat app.js >> test.html
cat app-map.js >> test.html
cat xml-parts_c.txt >> test.html
cat app.html >> test.html
cat app-map.html >> test.html

echo "concat test.html finished"
