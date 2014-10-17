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
						<table class="table table-striped table-hover">
							<xsl:apply-templates />
						</table>
					</div>
				</div>
			</body>
			<footer>
			</footer>
		</html>
	</xsl:template>
	
	<xsl:template match="vehicle:vehicles">
		<thead>
			<!-- Font Awesome barcode icon -->
			<th><i class="fa fa-barcode"></i> Registration</th>
			<!-- Font Awesome car icon -->
			<th><i class="fa fa-car"></i> Type</th>
			<!-- Font Awesome kilometre dashboard icon -->
			<th><i class="fa fa-dashboard"></i> Kilometres</th>
		</thead>
		<tbody>
			<xsl:apply-templates>
				<xsl:sort select="vehicle:registration" />
			</xsl:apply-templates>
		</tbody>
	</xsl:template>
	
	<xsl:template match="vehicle:vehicle">
		<tr>
			<xsl:apply-templates select="vehicle:registration" />
			<xsl:apply-templates select="vehicle:type" />
			<xsl:apply-templates select="vehicle:kilometres" />
		</tr>
	</xsl:template>

	<!-- Registration -->
	<xsl:template match="vehicle:registration">
		<td>
			<a href="rest/vehicles/{.}"><xsl:apply-templates /></a>
		</td>
	</xsl:template>

	<!-- Vehicle Type -->
	<xsl:template match="vehicle:type">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>

	<!-- Kilometres -->
	<xsl:template match="vehicle:kilometres">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>
	


</xsl:stylesheet>