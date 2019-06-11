#!/bin/bash
PATH=$PATH:/usr/local/bin
FILE="/usr/share/libre/course/sources/book.asciidoc"
if [ ! -f "${FILE}" ]
then
	echo "${FILE} does not exist" >&2
	echo "Usage: $0" >&2
	exit 2
fi

HTML_FILE=/usr/share/libre/course/book/index.html

rm -f "${HTML_FILE}"

# To HTML
cd /usr/share/libre/course/sources
asciidoctor -a lang=fr -a allow-uri-read -b html5 -d book -o "${HTML_FILE}" "${FILE}"
cd -
echo "HTML: ${HTML_FILE}"