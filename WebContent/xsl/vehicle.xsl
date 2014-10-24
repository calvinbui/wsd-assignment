<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:vehicle="http://www.wsd.com/vehicle">
<xsl:output method="xml" omit-xml-declaration="yes" />

	<xsl:param name="username" />
	<xsl:param name="usertype" />
	
	<xsl:template match="/">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="vehicle:vehicles">
		<div class="container">
			<h3>Vehicles</h3>
			<xsl:if test="$usertype = 'admin' ">
				<a href="create_vehicle.jsp" class="btn btn-primary btn-sm">Create Vehicle</a>
			</xsl:if>
			<div class="table-responsive">
				<table class="table table-striped table-hover">
					<thead>
						<th>Registration</th>
						<th>Type</th>
						<th>Kilometres</th>
						<xsl:if test="$username != '' ">
							<th>Add Log</th>
						</xsl:if>
					</thead>
					<tbody>
						<!-- Call vehicleTable template -->
						<xsl:apply-templates>
							<!-- Sort by vehicle registration -->
							<xsl:sort select="registration" />
							<!-- End of vehicleTable template -->
						</xsl:apply-templates>
						<!-- End of table body for vehicle data -->
					</tbody>
				</table>
			</div>
		</div>
	</xsl:template>
	

	<xsl:template match="vehicle">
		<tr>
			<td>
				<xsl:apply-templates select="registration" />
			</td>
			<td>
				<xsl:apply-templates select="type" />
			</td>
			<td>
				<xsl:apply-templates select="kilometres" />
			</td>
			<xsl:if test="$username != '' ">
				<td>
					<a href="create_log.jsp?{registration}" class="btn btn-success btn-xs">Create Log</a>
				</td>
			</xsl:if>
		</tr>
	</xsl:template>

</xsl:stylesheet>