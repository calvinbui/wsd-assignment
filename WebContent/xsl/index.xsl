<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:vehicle="http://www.wsd.com/vehicle">
	<!-- Produce xml document -->
	<xsl:output method="xml" omit-xml-declaration="yes" />

	<xsl:template match="/">
		<!-- Bootstrap default container to wrap site content -->
		<div class="container">
			<!-- Bootstrap large callout to wrap xml data -->
			<div class="jumbotron">
				<xsl:apply-templates />
			</div>
		</div>
	</xsl:template>
	<!-- Index page title -->
	<xsl:template match="heading">
		<h2>
			<xsl:apply-templates />
		</h2>
	</xsl:template>
	<!-- Project authors -->
	<xsl:template match="createdby">
		<h5>
			<xsl:apply-templates />
		</h5>
	</xsl:template>
	<!-- Button to vehicles page -->
	<xsl:template match="button">
		<p>
			<!-- Link to go to vehicles page. Insert xml data for href, class and role -->
			<a href="{@href}" class="{@class}" role="{@role}">
				<xsl:apply-templates />
			</a>
		</p>
	</xsl:template>
	<!-- MIT license -->
	<xsl:template match="mit">
		<h6 style="text-align:center;color:grey;">
			<xsl:apply-templates />
		</h6>
	</xsl:template>

</xsl:stylesheet>