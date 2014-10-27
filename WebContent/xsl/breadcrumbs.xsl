<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- Output of data will be an XML document -->
	<xsl:output method="xml" omit-xml-declaration="yes" />
	<!-- Pass through breadcrumb parameters -->
	<xsl:param name="bc-section" />
	<xsl:param name="bc-item" />
	<xsl:param name="bc-link" />


	<xsl:template match="/">
		<!-- Bootstrap default container to wrap site content -->
		<div class="container">
			<!-- Bootstrap default breadcrumb -->
			<ol class="breadcrumb">
				<xsl:apply-templates />
			</ol>
		</div>
	</xsl:template>
	<!-- Link to index page is set by default -->
	<xsl:template match="home">
		<li>
			<a href="/wsdassignment/">
				<xsl:apply-templates />
			</a>
		</li>
	</xsl:template>
	<!-- Link to section page is set in each jsp file -->
	<xsl:template match="section">
		<xsl:if test="$bc-section != '' ">
			<li>
				<a href="{$bc-link}">
					<xsl:value-of select="$bc-section" />
				</a>
			</li>
		</xsl:if>
	</xsl:template>
	<!-- Link to each item page is set in each jsp file -->
	<!-- Last breadcrumb link is always active - link is disabled -->
	<xsl:template match="item">
		<xsl:if test="$bc-item != '' ">
			<li class="active">
				<xsl:value-of select="$bc-item" />
			</li>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>