<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" omit-xml-declaration="yes" />

	<xsl:param name="bc-section" />
	<xsl:param name="bc-item" />
	<xsl:param name="bc-link" />


	<xsl:template match="/">
		<div class="container">
			<ol class="breadcrumb">
				<xsl:apply-templates />
			</ol>
		</div>
	</xsl:template>

	<xsl:template match="home">
		<li>
			<a href="/wsdassignment/">
				<xsl:apply-templates />
			</a>
		</li>
	</xsl:template>

	<xsl:template match="section">
		<xsl:if test="$bc-section != '' ">
			<li>
				<a href="{$bc-link}">
					<xsl:value-of select="$bc-section" />
				</a>
			</li>
		</xsl:if>
	</xsl:template>

	<xsl:template match="item">
		<xsl:if test="$bc-item != '' ">
			<li class="active">
				<xsl:value-of select="$bc-item" />
			</li>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>