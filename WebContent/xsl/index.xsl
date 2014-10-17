<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
	version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:import href="footer.xsl"/>
	
	<xsl:template match="/">
	<html>
	<body>
	<table width="100%" height="100%" align="center"
	cellspacing="0" cellpadding="0">
	<tr>
	<td width="25%" align="center">Main page</td>
	<td width="50%" align="center">Main page</td>
	<td width="25%" align="center">Main page</td>
	</tr>
	</table>
	</body>
	
	<xsl:call-template name="foot"/>
	</html>
	</xsl:template>
</xsl:stylesheet>