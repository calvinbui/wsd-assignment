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
			<xsl:apply-templates select="log:id" />
			<xsl:apply-templates select="log:vehicle" />
			<xsl:apply-templates select="log:driver" />
			<xsl:apply-templates select="log:startdate" />
			<xsl:apply-templates select="log:enddate" />
			<xsl:apply-templates select="log:starttime" />
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