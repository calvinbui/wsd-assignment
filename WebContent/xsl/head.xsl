<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- Output of data will be an XML document -->
<xsl:output method="xml" omit-xml-declaration="yes" />

	<!-- Pass through titleaddon parameter -->
	<xsl:param name="titleaddon"/>
	<!-- Root template for head -->
	<xsl:template match="/">
		<!-- Insert all xml data -->
		<xsl:apply-templates/>
	</xsl:template>
	<!-- Match all charset elements -->
	<xsl:template match="charset">
		<!-- Insert all charset data into meta tags-->
		<meta charset="{.}"/>
	</xsl:template>
	<!-- Match all iecompatible elements -->
	<xsl:template match="iecompatible">
		<!-- Insert all iecompatible data into meta tags -->
		<meta http-equiv="{@http-equiv}" content="{.}"/>
	</xsl:template>
	<!-- Match all viewport elements -->
	<xsl:template match="viewport">
		<!-- Insert all viewport data in meta tags -->
		<meta name="{@name}" content="{.}"/>
	</xsl:template>
	<!-- Match all css elements -->
	<xsl:template match="css">
		<!-- Insert all css data into link tags -->
		<link rel="stylesheet" href="/wsdassignment/css/{.}"></link>
	</xsl:template>
	<!-- Match all js elements -->
	<xsl:template match="js">
		<!-- Insert all js data into script tags -->
		<script src="/wsdassignment/js/{.}">//</script>
	</xsl:template>
	<!-- Match all favicon elements -->
	<xsl:template match="favicon">
		<!-- Insert favicon car icon -->
		<link rel="shortcut icon" href="/wsdassignment/img/{.}"></link>
	</xsl:template>
	<!-- Match all title elements -->
	<xsl:template match="title">
		<!-- If titleaddon parameter is empty -->
		<xsl:if test="$titleaddon = '' ">
			<!-- Insert title into title tag -->
			<title><xsl:apply-templates/></title>
		</xsl:if>
		<!-- If user is logged in and titleaddon parameter is not empty -->
		<xsl:if test="$titleaddon != '' ">
			<!-- Insert title into title tag and add username into navbar -->
			<title><xsl:apply-templates/> - <xsl:value-of select="$titleaddon"/></title>
		</xsl:if>	
	</xsl:template>
	
</xsl:stylesheet>