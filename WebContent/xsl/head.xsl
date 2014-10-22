<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" omit-xml-declaration="yes" />
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="css">
		<link rel="stylesheet" href="/wsdassignment/{.}"></link>
	</xsl:template>
	
	<xsl:template match="js">
		<script src="/wsdassignment/{.}">//</script>
	</xsl:template>
	
</xsl:stylesheet>