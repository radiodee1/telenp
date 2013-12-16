#!/bin/bash


cat xml-parts_a.txt > app.xml
cat xml-parts_b.txt >> app.xml
cat app.js >> app.xml
cat xml-parts_c.txt >> app.xml
cat test.html >> app.xml
cat xml-parts_d.txt >> app.xml

echo "concat finished"
