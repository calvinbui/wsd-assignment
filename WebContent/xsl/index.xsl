<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:vehicle="http://www.wsd.com/vehicle">
<xsl:output method="xml" omit-xml-declaration="yes" />

	<xsl:param name="username" />

	<xsl:template match="/">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="vehicle:vehicles">
		<head>
			<title>Vehicles</title>
		</head>

		<div class="container">

			<h1>Vehicles</h1>

			<table class="table table-striped table-hover">
				<thead>
					<th>Registration</th>
					<th>Type</th>
					<th>Kilometres</th>
					<!-- Make table head 10% width -->
					<th style="width: 10%"></th>
				</thead>
				<tbody>
					<!-- Call vehicleTable template -->
					<xsl:apply-templates name="vehicleTable">
						<!-- Sort vehicleTable by vehicle registration -->
						<xsl:sort select="vehicle:registration" />
						<!-- End of vehicleTable template -->
					</xsl:apply-templates>
					<!-- End of table body for vehicle data -->
				</tbody>
			</table>
			<xsl:if test="$username = 'admin@uts.com' ">
				<a href="create_vehicle.jsp" class="btn btn-default">Add vehicle</a>
			</xsl:if>
		</div>
	</xsl:template>

	<!-- For each vehicle in vehicle.xml do the following -->
	<xsl:template name="vehicleTable" match="vehicle:vehicle">
		<tr>
			<td>
				<a href="rest/vehicles/{vehicle:registration}">
					<xsl:apply-templates select="vehicle:registration" />
				</a>
			</td>
			<td>
				<xsl:apply-templates select="vehicle:type" />
			</td>
			<td>
				<xsl:apply-templates select="vehicle:kilometres" />
			</td>

			<!-- If driver is logged in show add new log button -->
			<td>
				<xsl:if test="$username != '' ">
					<a href="create_log.jsp?{vehicle:registration}" value="{vehicle:registration}"
						class="btn btn-default btn-sm">Add log</a>
				</xsl:if>
			</td>
		</tr>
		<!-- End of vehicleTable template -->
	</xsl:template>

</xsl:stylesheet>