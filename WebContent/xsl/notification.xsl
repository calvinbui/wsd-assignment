<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" omit-xml-declaration="yes" />

	<xsl:param name="type" />
	<xsl:param name="message" />

	<xsl:template match="/">
		<xsl:if test="$type != ''">
			<div class="container">
				<div class="col-md-8 col-md-offset-2">
					<xsl:apply-templates />
				</div>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:template match="type">
		<div class="alert alert-{$type} alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert">
				<span aria-hidden="true">&#xd7;</span>
				<span class="sr-only">Close</span>
			</button>
			<xsl:value-of select="$message" />
		</div>
	</xsl:template>

</xsl:stylesheet>