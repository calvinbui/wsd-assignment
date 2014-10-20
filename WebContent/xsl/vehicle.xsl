<?xml version="1.0" encoding="UTF-8"?>

<!-- XML namespaces for vehicle and XSLT -->
<xsl:stylesheet version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:vehicle="http://www.wsd.com/vehicle">
				<xsl:include href="xsl/header.xsl"/>

	<xsl:template match="/">
		<html>
			
			<head>
				<title>Index</title>
			</head>
			
			<body class="vehicle">
		
			<xsl:call-template name="navbar"/>
				
				<!-- Vehicle main page content -->
				<div class="container">
					<div class="pageheader">
						<div class="row">
						
						<ol class="breadcrumb">
							<li><a href="index.jsp">Home</a></li>
							<li>Vehicles</li>
						</ol>
						
							<div class="col-lg-6">
								<!-- Vehicle title -->
								<h1>Overview of Vehicles</h1>
							</div>
						</div>
						<!-- End row -->
					</div>
					
					<div class="bs-docs-section">
						
						<!-- Vehicle table with striped design -->
						<form action="create_log.jsp">
						<table class="table table-striped table-hover">
							<xsl:apply-templates />
						</table>
						</form>
					</div>
				</div>
			</body>
			<footer>
			</footer>
		</html>
	</xsl:template>
	
	<xsl:template match="vehicle:vehicles">
		<!-- Table for list of vehicles available -->
		<table class="table table-striped secondTable">
			<!-- Table head for vehicle headings -->
			<thead>
				<!-- Font Awesome barcode icon -->
				<th><i class="fa fa-barcode"></i> Registration</th>
				<!-- Font Awesome car icon -->
				<th><i class="fa fa-car"></i> Type</th>
				<!-- Font Awesome dashboard icon -->
				<th><i class="fa fa-dashboard"></i> Kilometres</th>
				<!-- Make table head 10% width -->
				<th style="width: 10%"></th>
			<!-- End of table head for vehicle headings -->
			</thead>
			<!-- Table body for vehicle data -->
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
	</xsl:template>
		
	<!-- For each vehicle in vehicle.xml do the following -->
	<xsl:template name="vehicleTable" match="vehicle:vehicle">
		<!-- Create new row for every vehicle -->
		<tr>
			<!-- Add new table row data for every vehicle registration -->
			<td><a href="rest/vehicles/{vehicle:registration}"><xsl:value-of select="vehicle:registration"/></a></td>
			<!-- Add new table row data for vehicle type -->
			<td><xsl:value-of select="vehicle:type"/></td>
			<!-- Add new table row data for every vehicle kilometres -->
			<td><xsl:value-of select="vehicle:kilometres"/></td>
			<!-- Only drivers can add new logs -->
			<td><a href="newlog.jsp?{vehicle:registration}" value="{vehicle:registration}" class="btn btn-default btn-sm">Add log</a></td>
		<!-- End of table row -->
		</tr>
	<!-- End of vehicleTable template -->
	</xsl:template>
		
	<!-- createlog?{vehicle:registration} -->

</xsl:stylesheet>