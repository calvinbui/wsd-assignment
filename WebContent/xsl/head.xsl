<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" omit-xml-declaration="yes" />
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="css">
		<link rel="stylesheet" href="/wsdassignment/css/{.}"></link>
	</xsl:template>
	
	<xsl:template match="js">
		<script src="/wsdassignment/js/{.}">//</script>
	</xsl:template>
	
	<xsl:template match="favicon">
		<link rel="shortcut icon" href="/wsdassignment/img/{.}"></link>
	</xsl:template>
	
</xsl:stylesheet>