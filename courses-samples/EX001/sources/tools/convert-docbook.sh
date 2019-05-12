#!/bin/bash
# Required packages:
#   apt-get install  docbook-xsl-ns xsltproc fop xmlto libxml2-utils xmlstarlet asciidoctor


if [ $# -ne 1 ]
then
	echo "Usage: $0 <file>.asciidoc" >&2
	exit 1
fi

FILE="${1}"

if [ ! -f "${FILE}" ]
then
	echo "${FILE} does not exist" >&2
	echo "Usage: $0 <file>.asciidoc" >&2
	exit 2
fi

DOCBOOK_FILE=$(tempfile)
FOP_FILE=$(tempfile)
PDF_FILE=$(basename ${FILE} .asciidoc).pdf
HTML_FILE=$(basename ${FILE} .asciidoc).html

rm -f "${PDF_FILE}" "${HTML_FILE}"

# asciidoc to docbook
asciidoctor -a lang=fr -b docbook5 -d book -o "${DOCBOOK_FILE}" "${FILE}"

# docbook to PDF
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
CFG_TEMP=$(tempfile)
cat <<EOF > "${CFG_TEMP}"
<?xml version="1.0"?>
<fop version="1.0">
  <base>${PWD}</base>
</fop>
EOF
mkdir -p images/callouts &> /dev/null
cp /usr/share/xml/docbook/stylesheet/docbook-xsl-ns/images/callouts/[1-9].svg images/callouts/ &> /dev/null
fop -xml "${DOCBOOK_FILE}" -xsl /usr/share/xml/docbook/stylesheet/docbook-xsl-ns/fo/docbook.xsl -param paper.type A4 -c "${CFG_TEMP}" -pdf "${PDF_FILE}"
rm -f "${CFG_TEMP}" images/callouts

# docbook to HTML
#xsltproc -xinclude -o book.html /usr/share/xml/docbook/stylesheet/docbook-xsl-ns/xhtml-1_1/docbook.xsl chapitre.xml
xsltproc /usr/share/xml/docbook/stylesheet/docbook-xsl-ns/xhtml-1_1/docbook.xsl "${DOCBOOK_FILE}" > ${HTML_FILE}

rm -f "${DOCBOOK_FILE}" "${FOP_FILE}"

echo "HTML: ${HTML_FILE}"
echo " PDF: ${PDF_FILE}"
