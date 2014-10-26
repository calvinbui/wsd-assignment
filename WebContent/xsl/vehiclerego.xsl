<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:param name="username" />
	
	<xsl:template match="/">
		
		<div class="container">
			<xsl:apply-templates />
			<xsl:if test="$username != '' ">
			<br/><div>
				<a href="create_log.jsp?vehicle={vehicle/registration}" class="btn btn-success">Create Log</a>
			</div>
			</xsl:if>
		</div><br/>
	</xsl:template>

	<xsl:template match="vehicle">
		<h1><xsl:apply-templates select="registration" /></h1>
		
		<div class="row">
			<div class="col-lg-7">
				<h3>Vehicle Details</h3>
				<!-- Column 1 -->
				<div class="col-lg-6"><b>Type: </b><xsl:apply-templates select="type"/></div>
				<!-- Column 2 -->
				<div class="col-lg-6"><b>Year: </b><xsl:apply-templates select="year"/></div>
				<!-- Column 1 -->
				<div class="col-lg-6"><b>Make: </b><xsl:apply-templates select="make"/></div>
				<!-- Column 2 -->
				<div class="col-lg-6"><b>Colour: </b><xsl:apply-templates select="colour"/></div>
				<!-- Column 1 -->
				<div class="col-lg-6"><b>Model: </b><xsl:apply-templates select="model"/></div>
				<!-- Column 2 -->
				<div class="col-lg-6"><b>Kilometres: </b><xsl:apply-templates select="kilometres"/></div>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>