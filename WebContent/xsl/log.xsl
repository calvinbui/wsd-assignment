<?xml version="1.0" encoding="UTF-8"?>

<!-- XML namespaces for log and XSLT -->
<xsl:stylesheet version="1.0" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:log="http://www.wsd.com/log">
				
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
			
				<!-- Log page navigation -->
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
								<li><a href="index.jsp">Vehicles</a></li>
								<li class="active"><a href="log.jsp">Logs</a></li>
								<li><a href="user.jsp">Drivers</a></li>
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
					
				<!-- Logs main page content -->
				<div class="container">
					<div class="pageheader">
						<div class="row">
							<div class="col-lg-6">
								<!-- Log title -->
								<h1>Overview of Logs</h1>
							</div>
						</div>
						<!-- End row -->
					</div>
					
					<div class="bs-docs-section">
						<!-- Log table with striped design -->
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
	
	<xsl:template match="log:logs">
		<thead>
			<th>ID</th>
			<th>Vehicle</th>
			<th>Driver</th>
			<th>Start Date</th>
			<th>Start Time</th>
			<th>End Date</th>
			<th>End Time</th>
			<th>Description</th>
			<th>Kilometres</th>
		</thead>
		<tbody>
			<xsl:apply-templates />
		</tbody>
	</xsl:template>
	
	<xsl:template match="log:log">
		<tr>
			<xsl:apply-templates select="log:id" />
			<xsl:apply-templates select="log:vehicle" />
			<xsl:apply-templates select="log:driver" />
			<xsl:apply-templates select="log:startdate" />
			<xsl:apply-templates select="log:starttime" />
			<xsl:apply-templates select="log:enddate" />
			<xsl:apply-templates select="log:endtime" />
			<xsl:apply-templates select="log:description" />
			<xsl:apply-templates select="log:kilometres" />
		</tr>
	</xsl:template>
	
	<!-- Vehicle log ID -->
	<xsl:template match="log:id">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>
	
	<!-- Vehicle -->
	<xsl:template match="log:vehicle">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>
	
	<!-- Driver -->
	<xsl:template match="log:driver">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>
	
	<!-- Driver -->
	<xsl:template match="log:startdate">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>
	
	<!-- Driver -->
	<xsl:template match="log:starttime">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>
	
	<!-- Driver -->
	<xsl:template match="log:enddate">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>
	
	<!-- Driver -->
	<xsl:template match="log:endtime">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>
	
	<!-- Driver -->
	<xsl:template match="log:description">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>
	
	<!-- Driver -->
	<xsl:template match="log:kilometres">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>
	
</xsl:stylesheet>