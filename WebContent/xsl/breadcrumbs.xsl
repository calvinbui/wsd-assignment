<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" omit-xml-declaration="yes" />

	<xsl:param name="section" />
	<xsl:param name="section-link" />
	<xsl:param name="item" />


	<xsl:template match="/">
		<ol class="breadcrumbs">
			<xsl:apply-templates />
		</ol>
	</xsl:template>

	<xsl:template match="home">
		<li>
			<a href="/">
				<xsl:apply-templates />
			</a>
		</li>
	</xsl:template>

	<xsl:template match="section">
		<xsl:if test="section != '' ">
			<li>
				<a href="$section-link">
					<xsl:value-of select="$section" />
				</a>
			</li>
		</xsl:if>
	</xsl:template>

	<xsl:template match="item">
		<xsl:if test="item != '' ">
			<li class="active">
				<xsl:value-of select="$section" />
			</li>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>