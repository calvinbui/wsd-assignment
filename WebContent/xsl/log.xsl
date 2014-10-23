<?xml version="1.0" encoding="UTF-8"?>

<!-- XML namespaces for log and XSLT -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:log="http://www.wsd.com/log">

	<xsl:param name="username" />

	<!-- Vehicle logs main page -->
	<xsl:template match="/">
		<!-- Logs main page content -->
		<div class="container">
			<div class="pageheader">
				<div class="row">

					<ol class="breadcrumb">
						<li>
							<a href="index.jsp">Home</a>
						</li>
						<li>Logs</li>
					</ol>

					<div class="col-lg-6">
						<!-- Log title -->
						<h1>Logs</h1>
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
			<th></th>
		</thead>
		<tbody>
			<xsl:apply-templates />
		</tbody>
	</xsl:template>

	<xsl:template match="log:log">
		<xsl:if test="not(contains(log:hidden, 'com'))">
			<tr>
				<td>
					<xsl:value-of select="log:id" />
				</td>
				<td>
					<a href="rest/vehicles/{log:vehicle}">
						<xsl:value-of select="log:vehicle" />
					</a>
				</td>
				<td>
					<xsl:value-of select="log:driver" />
				</td>
				<td>
					<a href="rest/logs?startDate={log:startdate}">
						<xsl:value-of select="log:startdate" />
					</a>
				</td>
				<td>
					<a href="rest/logs?startDate={log:enddate}">
						<xsl:value-of select="log:enddate" />
					</a>
				</td>
				<td>
					<xsl:value-of select="log:starttime" />
				</td>
				<td>
					<xsl:value-of select="log:endtime" />
				</td>
				<td>
					<xsl:value-of select="log:description" />
				</td>
				<td>
					<xsl:value-of select="log:kilometres" />
				</td>
				<!-- Only drivers can delete logs -->
				<td>
					<xsl:if test="$username != '' ">
						<a href="#delete" value="{log:id}" class="btn btn-default btn-sm">
							<i class="fa fa-remove"></i>
						</a>
					</xsl:if>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>