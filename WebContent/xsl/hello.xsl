<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:functions="http://localhost:8080/wsdassignment/rest/"
	exclude-result-prefixes="functions">

	<xsl:param name="username" />

	<xsl:template match="/">
		<!-- TODO: Auto-generated template -->
		<div class="container">
			<div class="pageheader">
				<div class="row">
					<ol class="breadcrumb">
						<li>
							<a href="index.jsp">Home</a>
						</li>
						<li>Logs</li>
					</ol>
				</div>
			</div>
			<div class="bs-docs-section">
				<!-- Log table with striped design -->
				<table class="table table-striped table-hover">
					<xsl:apply-templates/>
				</table>
			</div>
		</div>
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
			<th></th>
		</thead>
		<tbody>
			<xsl:apply-templates/>
		</tbody>
	</xsl:template>
	
	<xsl:template match="log">
			<tr>
				<td><xsl:apply-templates select="id"/></td>
				<td><a href="vehicles/{vehicle}"><xsl:apply-templates select="vehicle"/></a></td>
				<td><xsl:apply-templates select="driver"/></td>
				<td><xsl:apply-templates select="startdate"/></td>
				<td><a href="rest/logs?startDate={enddate}"><xsl:apply-templates select="enddate"/></a></td>
				<td><xsl:apply-templates select="starttime"/></td>
				<td><xsl:apply-templates select="endtime"/></td>
				<td><xsl:apply-templates select="description"/></td>
				<td><xsl:value-of select="sum(kilometres)"/></td>
			</tr>
	</xsl:template>
	
</xsl:stylesheet>