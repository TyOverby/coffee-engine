cat html/template.html > html/index.html

find bin/ | grep .js | grep -v compiled | tac | sed 's|^\(^.*$\)|<script src="../\1"></script>|' >> html/index.html

echo "</body></html>" >> html/index.html

vim html/index.html
