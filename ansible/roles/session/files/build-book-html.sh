#!/bin/bash
PATH=$PATH:/usr/local/bin
SOURCE_DIR=/usr/share/libre/course/sources
SOURCE_FILE=${SOURCE_DIR}/book.asciidoc
HTML_DIR=/usr/share/libre/course/book
HTML_FILE=${HTML_DIR}/index.html
if [ ! -f "${SOURCE_FILE}" ]
then
	echo "${SOURCE_FILE} does not exist" >&2
	echo "Usage: $0" >&2
	exit 2
fi

rm -f "${HTML_FILE}"
# To HTML
cd ${SOURCE_DIR}
asciidoctor -a lang=fr -a allow-uri-read -b html5 -d book -o "${HTML_FILE}" "${SOURCE_FILE}"
rm -rf ${HTML_DIR}/images
cp -r ${SOURCE_DIR}/images ${HTML_DIR}/images
cd -
echo "HTML: ${HTML_FILE}"