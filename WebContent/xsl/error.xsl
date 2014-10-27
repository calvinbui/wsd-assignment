<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<!-- Root template for error message -->
	<xsl:template match="/">
		<xsl:apply-templates />
	</xsl:template>
	
	<!-- If element message exists create the following -->
	<xsl:template match="message">
		<!-- Bootstrp default container to wrap site contents -->
		<div class="container">
			<!-- Insert message xml data into h1 tag -->
			<h1>
				<xsl:apply-templates />
			</h1>
		</div>
	</xsl:template>
	
</xsl:stylesheet>