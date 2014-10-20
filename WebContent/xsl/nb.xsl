<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<div class="navbar navbar-default navbar-static-top" role="navigation">
			<xsl:apply-templates />
		</div>
	</xsl:template>

	<xsl:template match="content">
		<div class="{@class}">
			<xsl:apply-templates />
		</div>
	</xsl:template>

	<xsl:template match="header">
		<div class="{@class}">
			<xsl:apply-templates />
		</div>
	</xsl:template>

	<xsl:template match="button">
		<button class="{@class}" type="{@type}" data-toggle="collapse"
			data-target="{@data-target}">
			<xsl:apply-templates />
		</button>
	</xsl:template>

	<xsl:template match="line">
		<span class="{.}">.</span>
	</xsl:template>

	<xsl:template match="heading">
		<span class="{@class}">
			<xsl:apply-templates />
		</span>
	</xsl:template>

	<xsl:template match="main">
		<div class="{@class}" id="{@id}">
			<xsl:apply-templates />
		</div>
	</xsl:template>

	<xsl:template match="menu">
		<ul class="{@class}">
			<xsl:apply-templates />
		</ul>
	</xsl:template>

	<xsl:template match="item">
		<li>
			<xsl:apply-templates select="path" />
		</li>
	</xsl:template>

	<xsl:template match="path">
		<a href="{.}">
			<xsl:value-of select="../title" />
		</a>
	</xsl:template>

</xsl:stylesheet>