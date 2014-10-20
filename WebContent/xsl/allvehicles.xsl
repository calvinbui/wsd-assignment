<?xml version="1.0" encoding="UTF-8"?>

<!-- XML namespaces for vehicle and XSLT -->
<xsl:stylesheet version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:ns2="http://www.wsd.com/vehicle">
				
<xsl:include href="xsl/header.xsl"/>

	<xsl:template match="node() | @*">
		<xsl:value-of select="."/>
	</xsl:template>
</xsl:stylesheet>