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
  
	<xsl:template match="/">
	
		<html>
			
			<body class="VehicleRego">
			
				<!-- Vehicle page navigation -->
				<xsl:call-template name="navbar"/>
					
				<!-- Vehicle main page content -->
				<div class="container">
					<div class="pageheader">
						<div class="row">
						
						<ol class="breadcrumb">
							<li><a href="../../index.jsp">Home</a></li>
							<li><a href="../../index.jsp">Vehicles</a></li>
							<li><a href="{rego}"><xsl:value-of select="vehicle/registration"/></a></li>
						</ol>
						
							<div class="col-lg-6">
								<!-- Vehicle title -->
								<h1><xsl:value-of select="vehicle/registration"/></h1>
								<h3>Vehicle Details</h3>
							</div>
						</div>
						<!-- End row -->
					</div>
					
					<div class="bs-docs-section">
					
						<!-- Vehicle table with striped design -->
						<table class="table table-striped">
							<xsl:apply-templates select="vehicle" />
						</table>
						
						<h3>Logs</h3>
						
						<xsl:call-template name="restLog">
		<xsl:with-param name="car" select="vehicle/registration"/>
		</xsl:call-template>
						
					</div>
				</div>
			</body>
			<footer>
			</footer>
		</html>
		
		
		
	</xsl:template>
	
	<xsl:template match="vehicle">
		<thead>
			<!-- Font Awesome barcode icon -->
			<th><i class="fa fa-barcode"></i> Registration</th>
			<!-- Font Awesome car icon -->
			<th><i class="fa fa-car"></i> Type</th>
			<th>Make</th>
			<th>Model</th>
			<th>Year</th>
			<th>Colour</th>
			<!-- Font Awesome kilometre dashboard icon -->
			<th><i class="fa fa-dashboard"></i> Kilometres</th>
		</thead>
		<tbody>
			<xsl:apply-templates />
		</tbody>
	</xsl:template>
	
	<!-- Vehicle Registration -->
	<xsl:template match="registration">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>
	
	<!-- Vehicle Type -->
	<xsl:template match="type">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>
	
	<!-- Vehicle make -->
	<xsl:template match="make">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>
	
	<!-- Vehicle model -->
	<xsl:template match="model">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>
	
	<!-- Vehicle year -->
	<xsl:template match="year">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>
	
	<!-- Vehicle colour -->
	<xsl:template match="colour">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>
	
	<!-- Vehicle kilometres -->
	<xsl:template match="kilometres">
		<td>
			<xsl:apply-templates />
		</td>
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
						<xsl:for-each select="current()/*">
							<td>
								<xsl:value-of select="current()"/>
							</td>
						</xsl:for-each>
					</tr>
				</xsl:for-each>
				</tbody>
			</table>
		</xsl:when>
		<xsl:otherwise>
			<p>No log entries found for <xsl:value-of select="vehicle/registration"/>.</p>
			
			<h3>All Logs</h3>
			<xsl:variable name="alllogs" select="document('http://localhost:8080/wsdassignment/rest/logs/')"/>
			<xsl:message><xsl:copy-of select="alllogs"/></xsl:message>
		</xsl:otherwise>
	</xsl:choose>
	
				<!-- look up cross filter dataTables -->
				<!--  <script>		
					$(document).ready(function() {
				    $('#testicles').dataTable();
				} ); 
				
				</script> -->

	</xsl:template>

	
</xsl:stylesheet>