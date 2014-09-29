<?xml version="1.0" encoding="UTF-8"?>

<!-- XML namespaces for vehicle and XSLT -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:vehicle="http://www.wsd.com/vehicle">

	<xsl:template match="/">
		<html>
			<head>
				<!-- Import bootstrap flatly theme -->
				<link rel="stylesheet" href="css/bootstrap/bootstrap.min.css"></link>
				<script src="js/bootstrap/bootstrap.min.js"></script>
				<script src="js/jquery/jquery-1.11.1.min.js"></script>
				<!-- Link Font Awesome stylsheet -->
				<link href="css/font-awesome/font-awesome.min.css" rel="stylesheet"></link>
				<link rel="stylesheet" href="css/jquery-ui/jquery-ui.min.css"></link>
				<link rel="stylesheet" href="css/jquery-ui/jquery-ui.structure.min.css"></link>
				<link rel="stylesheet" href="css/jquery-ui/jquery-ui.theme.min.css"></link>
				<script src="js/jquery-ui/jquery-ui.min.js"></script>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"></meta>
				<title>Index</title>
			</head>
			<body>
			
				<!-- Vehicle page navigation -->
				<div class="navbar navbar-default">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#">J Vehicles</a>
					</div>
					<div class="navbar-collapse collapse navbar-responsive-collapse">
						<ul class="nav navbar-nav">
							<li><a href="#">Logs</a></li>
							<li><a href="#">Vehicles</a></li>
						</ul> 
						
						<!-- Login navbar -->
						<form class="navbar-form navbar-right">
							<div class="form-group">
								<input type="text" class="form-control input-sm" placeholder="Email"></input>
							</div>
							<div class="form-group">
								<input type="password" class="form-control input-sm" placeholder="Password"></input>
							</div>
							<div class="form-group">
								<button type="button" class="btn btn-primary btn-success btn-sm">Login</button>
							</div>
						<!-- End of login navbar -->
						</form>
						
					</div> 
				<!-- End of page navigation bar -->
				</div> 
					
				<!-- Vehicle log overview -->
				<div class="container">
					<div class="pageheader">
						<div class="row">
							<!-- Vehicle title -->
							<h1>Overview of Vehicle Logs</h1>
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