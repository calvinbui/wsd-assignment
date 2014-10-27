<?xml version="1.0" encoding="UTF-8"?>
<!-- XML namespaces for vehicle details page -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- Pass through username parameter for logged in user -->
	<xsl:param name="username" />
	<xsl:output method="xml" omit-xml-declaration="yes" />
	
	<xsl:template match="/">
		<!-- Bootstrap default container wrapping site contents -->
		<div class="container">
			<xsl:apply-templates />
			<!-- If user is logged in return create log functionality -->
			<xsl:if test="$username != '' ">
			<br/><div>
				<!-- Link to create new vehicle. Bootstrap default button -->
				<a href="create_log.jsp?vehicle={vehicle/registration}" class="btn btn-primary btn-sm">Create Log</a>
			</div>
			</xsl:if>
		</div><br/>
	</xsl:template>

	<xsl:template match="vehicle">
		<!-- Insert vehicle registration as page title -->
		<h1><xsl:apply-templates select="registration" /></h1>
		<!-- Bootstrap row to create horizontal groups of columns -->
		<div class="row">
			<!-- Bootstrap grid: fit content in 7 columns -->
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