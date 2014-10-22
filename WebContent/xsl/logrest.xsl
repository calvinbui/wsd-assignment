<?xml version="1.0" encoding="UTF-8"?>

<!-- XML namespaces for vehicle and XSLT -->
<xsl:stylesheet version="1.0" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:functions="http://localhost:8080/wsdassignment/rest/"
  				exclude-result-prefixes="functions">

<xsl:output omit-xml-declaration="yes" indent="yes"/>
<xsl:strip-space elements="*"/>

<xsl:variable name="logrest" select="document('{$context-path}/logrest.xml')"/>
<xsl:param name="url-param" />
<!-- Call header.xsl -->
<xsl:include href="header.xsl"/>

	<xsl:template match="/">
		<html>
		
			<head>
				<xsl:choose>
					<xsl:when test="1 = 1">
						<title><xsl:value-of select="logs/log/startdate"/></title>
					</xsl:when>
					<xsl:otherwise>
						
					</xsl:otherwise>
				</xsl:choose>
				
			</head>
			
			<body>
				<!-- Vehicle page navigation -->
				<xsl:call-template name="navbar"/>
				
			<div class="container">
			<xsl:value-of select="$url-param"/>
				<div class="pageheader">
					<div class="row">
						
						<ol class="breadcrumb">
							<li><a href="{$context-path}/index.jsp">Home</a></li>
							<li><a href="{$context-path}/log.jsp">Logs</a></li>
							<li><xsl:value-of select="logs/log/startdate"/></li>
						</ol>
					</div>
				</div>
				
				<div class="bs-docs-section">
				
					<h1>
						Logs from 
						<xsl:value-of select="logs/log/startdate"/>
					</h1>
					
					<table class="table table-striped">
						<xsl:apply-templates select="logs"/>
					</table>
				</div>
				
			</div>
			</body>
			
		</html>
		
		<script>
		
		</script>
		
	</xsl:template>
	
	<xsl:template match="logs">
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
	
	<xsl:template match="log">
		<xsl:if test="not(contains(hidden, 'com'))">
			<tr>
				<td><xsl:apply-templates select="id"/></td>
				<td><a href="vehicles/{vehicle}"><xsl:apply-templates select="vehicle"/></a></td>
				<td><xsl:apply-templates select="driver"/></td>
				<td><xsl:apply-templates select="startdate"/></td>
				<td><xsl:apply-templates select="enddate"/></td>
				<td><xsl:apply-templates select="starttime"/></td>
				<td><xsl:apply-templates select="endtime"/></td>
				<td><xsl:apply-templates select="description"/></td>
				<td><xsl:apply-templates select="kilometres"/></td>
			</tr>
		</xsl:if>
	</xsl:template>
	
</xsl:stylesheet>