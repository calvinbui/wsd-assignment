<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:functions="http://localhost:8080/wsdassignment/rest/"
  				exclude-result-prefixes="functions">
				<xsl:output omit-xml-declaration="yes" indent="yes"/>
				<xsl:strip-space elements="*"/>
  
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
				<meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
				<title>Index</title>
			</head>
			<body>
			
				<!-- Vehicle page navigation -->
				<div class="navbar navbar-default">
					<!-- Navigation bar content margin -->
					<div class="container">
						<div class="navbar-header">
							<button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
							<!-- Vehicle log book system name -->
							<span class="navbar-brand">Vehicle Log Book</span>
						</div>
						<div class="navbar-collapse collapse" id="navbar-main">
							<ul class="nav navbar-nav">
								<li class="active"><a href="index.jsp">Vehicles</a></li>
								<li><a href="log.jsp">Logs</a></li>
							</ul> 
							
							<!-- Login navbar -->
							<form class="navbar-form navbar-right">
									<input type="text" class="form-control input-sm" placeholder="Email"></input>
									<input type="password" class="form-control input-sm" placeholder="Password"></input>
									<button type="button" class="btn btn-primary btn-success btn-sm">Login</button>
							<!-- End of login navbar -->
							</form>
							
						</div> 
					</div>
				<!-- End of page navigation bar -->
				</div> 
					
				<!-- Vehicle main page content -->
				<div class="container">
					<div class="pageheader">
						<div class="row">
							<div class="col-lg-6">
								<!-- Vehicle title -->
								<h1>Overview of Vehicle Logs</h1>
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
	

	
</xsl:stylesheet>