<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
	version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:vehicle="http://www.wsd.com/vehicle">
	
<xsl:output method="html"/>
	
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="vehicle:vehicles">
		<head>
			<title>Vehicles</title>
		</head>
		<div class="container">
		
		<ol class="breadcrumb">
			<li><a href="index.jsp">Home</a></li>
			<li>Vehicles</li>
		</ol>
		
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
					<xsl:sort select="vehicle:registration"/>
				<!-- End of vehicleTable template -->
				</xsl:apply-templates>
			<!-- End of table body for vehicle data -->
			</tbody>
			</table>
		</div>
	</xsl:template>
	
	<!-- For each vehicle in vehicle.xml do the following -->
	<xsl:template name="vehicleTable" match="vehicle:vehicle">
		<!-- Create new row for every vehicle -->
		<tr>
			<!-- Add new table row data for every vehicle registration -->
			<td><a href="rest/vehicles/{vehicle:registration}"><xsl:apply-templates select="vehicle:registration"/></a></td>
			<!-- Add new table row data for vehicle type -->
			<td><xsl:apply-templates select="vehicle:type"/></td>
			<!-- Add new table row data for every vehicle kilometres -->
			<td><xsl:apply-templates select="vehicle:kilometres"/></td>
			<!-- Only drivers can add new logs -->
			<td><a href="newlog.jsp?{vehicle:registration}" value="{vehicle:registration}" class="btn btn-default btn-sm">Add log</a></td>
		<!-- End of table row -->
		</tr>
	<!-- End of vehicleTable template -->
	</xsl:template>
	
</xsl:stylesheet>