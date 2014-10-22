<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="message">
	
		<head>
			<title><xsl:apply-templates /></title>
		</head>
		
		<div class="container">
			<h1>
				<xsl:apply-templates />
			</h1>
		</div>
	</xsl:template>
</xsl:stylesheet>