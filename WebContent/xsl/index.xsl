<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
	version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="page">
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
	
</xsl:stylesheet>