<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<!-- TODO: Auto-generated template -->
		
		<html>
		
			<head>
				<style>
				</style>
			</head>
			
			<body>
				<xsl:apply-templates select="vehicle/vehicles"/>
				<xsl:apply-templates select="vehicle/vehicle"/>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="vehicles">
		<table>
			<thead>
				<tr>
					<th>Registration</th>
					<th>Type</th>
					<th>kilometres</th>
				</tr>
			</thead>
			<tbody>
				<xsl:apply-templates />
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template match="vehicle">
		<tr>
			<xsl:apply-templates select="registration"/>
			<xsl:apply-templates select="type"/>
			<xsl:apply-templates select="kilometres"/>
		</tr>
	</xsl:template>
	
	<xsl:template match="regristration">
		<td>
			<xsl:value-of select="." />
		</td>
	</xsl:template>
	
	<xsl:template match="type">
		<td>
			<xsl:value-of select="." />
		</td>
	</xsl:template>
	
	<xsl:template match="kilometres">
		<td>
			<xsl:value-of select="." />
		</td>
	</xsl:template>
	
</xsl:stylesheet>