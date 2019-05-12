#!/bin/bash
# Required packages: asciidoctor v1.5.6 or above
#
# gem install asciidoctor
# gem install asciidoctor-pdf --pre
# gem install coderay
#
# For epub3:
# dnf install ruby-devel pkg-config libxml2-devel libxslt-devel redhat-rpm-config
# dnf groupinstall "C Development Tools and Libraries"
#  (OU apt-get install gcc ruby-dev pkg-config libxml2-dev libxslt-dev)
# gem install pkg-config -v "~> 1.1.7"
# gem install kindlegen
# NOKOGIRI_USE_SYSTEM_LIBRARIES=1 gem install asciidoctor-epub3 --pre
#

PATH=$PATH:/usr/local/bin

if [ $# -ne 1 ]
then
	echo "Usage: $0 <file>.asciidoc" >&2
	exit 1
fi

FILE="${1}"
BUILD_DIR="books"
if [ ! -f "${FILE}" ]
then
	echo "${FILE} does not exist" >&2
	echo "Usage: $0 <file>.asciidoc" >&2
	exit 2
fi

PDF_FILE=$BUILD_DIR/$(basename ${FILE} .asciidoc).pdf
HTML_FILE=../book/index.html
EPUB_FILE=$BUILD_DIR/$(basename ${FILE} .asciidoc).epub
MOBI_FILE=$BUILD_DIR/$(basename ${FILE} .asciidoc).mobi
KF8_FILE=$BUILD_DIR/$(basename ${FILE} .asciidoc)-kf8.epub

rm -f "${PDF_FILE}" "${HTML_FILE}" "${EPUB_FILE}" "${MOBI_FILE}" "${KF8_FILE}"

# To PDF
asciidoctor -r asciidoctor-pdf -a pdf-stylesdir="${PWD}" -a pdf-style=sample -a allow-uri-read -a media=print -a lang=fr -b pdf -d book -o "${PDF_FILE}" "${FILE}"
echo " PDF: ${PDF_FILE}"

# To HTML
asciidoctor -a lang=fr -a allow-uri-read -b html5 -d book -o "${HTML_FILE}" "${FILE}"
echo "HTML: ${HTML_FILE}"

# To epub3
#asciidoctor-epub3 -a lang=fr -a allow-uri-read -d book -o "${EPUB_FILE}" "${FILE}"
#echo "EPUB: ${EPUB_FILE}"

# To mobi
#asciidoctor-epub3 -a lang=fr -a allow-uri-read -d book -a ebook-format=kf8 -o "${MOBI_FILE}" "${FILE}" &> /dev/null
#echo "MOBI: ${MOBI_FILE}"
#echo " KF8: ${KF8_FILE}"

