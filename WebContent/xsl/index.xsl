<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:vehicle="http://www.wsd.com/vehicle">
	<xsl:output method="xml" omit-xml-declaration="yes" />

	<xsl:template match="/">
		<div class="container">
			<div class="jumbotron">
				<xsl:apply-templates />
			</div>
		</div>
	</xsl:template>

	<xsl:template match="heading">
		<h2>
			<xsl:apply-templates />
		</h2>
	</xsl:template>

</xsl:stylesheet>