<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="navbar">
	
		<!-- Page navigation bar -->
		<xsl:for-each select="page">
			<tr>
				<td>
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="@link"/>
						</xsl:attribute>
						<xsl:value-of select="@name"/>
					</a>
				</td>
			</tr>
		</xsl:for-each>
		
	</xsl:template>
	
</xsl:stylesheet>