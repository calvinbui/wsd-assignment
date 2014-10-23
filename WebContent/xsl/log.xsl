<?xml version="1.0" encoding="UTF-8"?>

<!-- XML namespaces for log and XSLT -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:log="http://www.wsd.com/log">
<xsl:output method="xml" omit-xml-declaration="yes" />

	<xsl:param name="username" />

	<xsl:template match="/">
		<div class="container">
			<table class="table table-striped table-hover">
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
					<xsl:if test="$username != '' ">
					<th>Delete</th>
					</xsl:if>
				</thead>
				<tbody>
					<xsl:apply-templates />
				</tbody>
			</table>
		</div>
	</xsl:template>

	<xsl:template match="log | log:log">
		<xsl:if test="hidden = '' or log:hidden = '' ">
			<tr>
				<xsl:apply-templates />
				<xsl:if test="$username != '' ">
					<td>
						<button class="btn btn-danger btn-xs"><i class="fa fa-remove"></i></button>
					</td>
				</xsl:if>
			</tr>
		</xsl:if>
	</xsl:template>

	<xsl:template match="id | log:id">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>

	<xsl:template match="driver | log:driver">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>

	<xsl:template match="vehicle | log:vehicle">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>

	<xsl:template match="startdate | log:startdate">
		<td>
			<a href="log_search.jsp?startDate={.}">
				<xsl:apply-templates />
			</a>
		</td>
	</xsl:template>

	<xsl:template match="enddate | log:enddate">
		<td>
			<a href="log_search.jsp?startDate={.}">
				<xsl:apply-templates />
			</a>
		</td>
	</xsl:template>

	<xsl:template match="starttime | log:starttime">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>

	<xsl:template match="endtime | log:endtime">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>

	<xsl:template match="description | log:description">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>

	<xsl:template match="kilometres | log:kilometres">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>

</xsl:stylesheet>