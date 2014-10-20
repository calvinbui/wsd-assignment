<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
	version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	
	
	<xsl:template match="index/page">
		<html>
			<head>
				<title>
					<xsl:value-of select="title"/>
				</title>
			</head>
			<body>
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>
		
	<xsl:template match="title">
		<h1>
			<xsl:apply-templates/>
		</h1>
	</xsl:template>
		
	<xsl:template match="paragraph">
		<p>
			<i>
				<xsl:apply-templates/>
			</i>
		</p>
	</xsl:template>
	
	<xsl:template match="logs">
		<table>
			<xsl:for-each select="log">
				<tr>
					<td><xsl:apply-templates /></td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	
</xsl:stylesheet>