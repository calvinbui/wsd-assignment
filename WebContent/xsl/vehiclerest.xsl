<?xml version="1.0" encoding="UTF-8"?>

<!-- XML namespaces for vehicle and XSLT -->
<xsl:stylesheet version="1.0" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:functions="http://localhost:8080/wsdassignment/rest/"
  				exclude-result-prefixes="functions">
  				
<xsl:output omit-xml-declaration="yes" indent="yes"/>
<xsl:strip-space elements="*"/>

<!-- Call header.xsl -->
<xsl:include href="header.xsl"/>

	<!-- Main page template -->
	<xsl:template match="/">
	
		<html>
			<head>
				<!-- Insert vehicle registration as web page title -->
				<title><xsl:value-of select="vehicle/registration"/></title>
			</head>
			
			<body>
				<!-- Call header.xsl for navigation bar -->
				<xsl:call-template name="navbar"/>
					
				<!-- Vehicle main page content -->
				<div class="container">
					<!-- Insert page header for breadcrumb navigation -->
					<div class="pageheader">
						<!-- Web page breadcrumb navigation for userability -->
						<ol class="breadcrumb">
							<!-- Link to index page -->
							<li><a href="{$context-path}/index.jsp">Home</a></li>
							<li><a href="{$context-path}/index.jsp">Vehicles</a></li>
							<!-- Insert vehicle registration -->
							<li><xsl:value-of select="vehicle/registration"/></li>
						<!-- End of breadcrumb navigation -->
						</ol>
					<!-- End of pageheader -->
					</div>
					<!-- Vehicle registration main content section -->
					<div class="bs-docs-section">
						
						<!-- Insert Vehicle registration as page title -->
						<h1><xsl:value-of select="vehicle/registration"/></h1>
						<!-- Add subtitle for vehicle registration -->
						<h3>Vehicle Details</h3>

						<!-- Insert Vehicle details table with boostrap striped design -->
						<table class="table table-striped">
							<!-- Apply template: vehicles -->
							<xsl:call-template name="vehicleTable" />
						<!-- End of vehicle details table -->
						</table>
						
						<!-- Button for drivers to add new vehicle logs specific to the vehicle registration -->
						<a href="{$context-path}/newlog.jsp?{vehicle/registration}" value="{vehicle/registration}" class="btn btn-default">Add new log</a>
						
						<!-- Add subtitle logs for vehicle registration page -->
						<h3>Logs</h3>
							
						<xsl:call-template name="restLog">
							<xsl:with-param name="car" select="vehicle/registration"/>
						</xsl:call-template>
					</div>
				</div>
				
			</body>
		</html>
	<!-- End of main template -->
	</xsl:template>
	
	<!-- Filter by vehicle element -->
	<xsl:template name="vehicleTable">
		<!-- Table headings for vehicle details -->
		<thead>
			<th>Registration</th>
			<th>Type</th>
			<th>Make</th>
			<th>Model</th>
			<th>Year</th>
			<th>Colour</th>
			<th>Kilometres</th>
		<!-- End of vehicle details headings -->
		</thead>
		<!-- Vehicle table body for vehicle details content -->
		<tbody>
			<!-- Table row for vehicle details content -->
			<tr>
				<!-- Separate vehicle details into table data -->
				<td><xsl:apply-templates select="vehicle/registration" /></td>
				<td><xsl:apply-templates select="vehicle/type" /></td>
				<td><xsl:apply-templates select="vehicle/make" /></td>
				<td><xsl:apply-templates select="vehicle/model" /></td>
				<td><xsl:apply-templates select="vehicle/year" /></td>
				<td><xsl:apply-templates select="vehicle/colour" /></td>
				<td><xsl:apply-templates select="vehicle/kilometres" /></td>
			<!-- End of table row for vehicle details content -->
			</tr>
		<!-- End of Vehicle table body -->
		</tbody>
	<!-- End of vehicle element template -->
	</xsl:template>
	
	<xsl:template name="restLog">
		<xsl:param name="car"/>
		<xsl:variable name="url" select="document(concat('http://localhost:8080/wsdassignment/rest/logs?vehicleRego=', $car))"/>
	
		<xsl:choose>
			<xsl:when test="$url != '' ">
				<table  class="table table-striped secondTable">
					<thead>
						<th>Log ID</th>
						<th>Registration</th>
						<th>Driver</th>
						<th>Start Date</th>
						<th>End Date</th>
						<th>Start Time</th>
						<th>End Time</th>
						<th>Description</th>
						<th>Kilometres</th>
					</thead>
					<tbody>
					<xsl:for-each select="$url/logs/log">
						<tr>
							<td><xsl:apply-templates select="id"/></td>
							<td><xsl:apply-templates select="vehicle"/></td>
							<td><xsl:apply-templates select="driver"/></td>
							<td><a href="{$context-path}/rest/logs?startDate={startdate}"><xsl:apply-templates select="startdate"/></a></td>
							<td><a href="{$context-path}/rest/logs?startDate={enddate}"><xsl:apply-templates select="enddate"/></a></td>
							<td><xsl:apply-templates select="starttime"/></td>
							<td><xsl:apply-templates select="endtime"/></td>
							<td><xsl:apply-templates select="description"/></td>
							<td><xsl:apply-templates select="kilometres"/></td>
						</tr>
					</xsl:for-each>
					</tbody>
				</table>
			</xsl:when>
			<!-- If {rego} contains no logs return the following -->
			<xsl:otherwise>
				<!-- Since {rego} has no logs, the following statement will appear -->
				<p>No log entries found for <xsl:value-of select="vehicle/registration"/>.</p>
			</xsl:otherwise>
		</xsl:choose>					
	</xsl:template>

	
</xsl:stylesheet>