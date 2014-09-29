<?xml version="1.0" encoding="UTF-8"?>

<!-- XML namespaces for vehicle and XSLT -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:vehicle="http://www.wsd.com/vehicle">

	<xsl:template match="/">
		<html>
			<head>
				<link rel="stylesheet" href="css/bootstrap/bootstrap.min.css"></link>
				<script src="js/bootstrap/bootstrap.min.js"></script>
				<script src="js/jquery/jquery-1.11.1.min.js"></script>
				<link href="css/font-awesome/font-awesome.min.css" rel="stylesheet"></link>
				<link rel="stylesheet" href="css/jquery-ui/jquery-ui.min.css"></link>
				<link rel="stylesheet" href="css/jquery-ui/jquery-ui.structure.min.css"></link>
				<link rel="stylesheet" href="css/jquery-ui/jquery-ui.theme.min.css"></link>
				<script src="js/jquery-ui/jquery-ui.min.js"></script>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"></meta>
				<title>Index</title>
			</head>
			<body>
				<div class="container">
					<table class="table table-striped">
						<xsl:apply-templates />
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="vehicle:vehicles">
		<thead>
			<th><i class="fa fa-barcode"></i> Registration</th>
			<th><i class="fa fa-car"></i> Type</th>
			<th><i class="fa fa-dashboard"></i> Kilometres</th>
		</thead>
		<tbody>
			<xsl:apply-templates />
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