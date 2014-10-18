<?xml version="1.0" encoding="UTF-8"?>

<!-- XML namespaces for vehicle and XSLT -->
<xsl:stylesheet version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:vehicle="http://www.wsd.com/vehicle">
				
	<xsl:include href="xsl/header.xsl"/>	
	<xsl:param name="logs" select="document('vehicle.xml')"/>
	
	<xsl:template match="/">
		<html>
			<head>
				<title>Index</title>
			</head>
			
			<body>
				<h1>Add new log</h1>
				
				
				
	</xsl:template>
</xsl:stylesheet>