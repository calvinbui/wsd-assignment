<?xml version="1.0" encoding="UTF-8"?>

<!-- XML namespaces for log and XSLT -->
<xsl:stylesheet version="1.0" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:log="http://www.wsd.com/log">
				<xsl:include href="xsl/header.xsl"/>
				
	<xsl:template match="/">
		<html>
			<head>
				<title>Logs</title>
			</head>
		
			<body>
			
				<!-- Log page navigation -->
				<xsl:call-template name="navbar"/>
				<!-- End of page navigation bar -->
					
				<!-- Logs main page content -->
				<div class="container">
					<div class="pageheader">
						<div class="row">
						
							<ol class="breadcrumb">
								<li><a href="index.jsp">Home</a></li>
								<li><a href="log.jsp">Logs</a></li>
							</ol>
						
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
			<th>End Date</th>
			<th>Start Time</th>
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
			<td><xsl:value-of select="log:id" /></td>
			<td><a href="rest/vehicles/{log:vehicle}"><xsl:value-of select="log:vehicle" /></a></td>
			<td><xsl:value-of select="log:driver" /></td>
			<td><xsl:value-of select="log:startdate" /></td>
			<td><xsl:value-of select="log:enddate" /></td>
			<td><xsl:value-of select="log:starttime" /></td>
			<td><xsl:value-of select="log:endtime" /></td>
			<td><xsl:value-of select="log:description" /></td>
			<td><xsl:value-of select="log:kilometres" /></td>
		</tr>
	</xsl:template>
	
</xsl:stylesheet>