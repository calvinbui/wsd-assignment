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
							<li><a href="index.jsp">Vehicles</a></li>
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
	
		<table class="table table-striped secondTable">
			<thead>
				<th><i class="fa fa-barcode"></i> Registration</th>
				<th><i class="fa fa-car"></i> Type</th>
				<th><i class="fa fa-dashboard"></i> Kilometres</th>
				<th style="width: 10%"><i class="fa fa-dashboard"></i> New Log</th>
			</thead>
				<tbody>
					<xsl:apply-templates name="vehicleTable">
						<xsl:sort select="vehicle:registration"/>
					</xsl:apply-templates>
				</tbody>
			</table>
		</xsl:template>
		
		<xsl:template name="vehicleTable" match="vehicle:vehicle">
			<tr>
				<td><a href="rest/vehicles/{vehicle:registration}"><xsl:value-of select="vehicle:registration"/></a></td>
				<td><xsl:value-of select="vehicle:type"/></td>
				<td><xsl:value-of select="vehicle:kilometres"/></td>
				<td><a href="create_log.jsp?{vehicle:registration}" value="{vehicle:registration}" class="btn btn-default">Add</a></td>
			</tr>
		</xsl:template>
		
<!-- createlog?{vehicle:registration} -->

</xsl:stylesheet>