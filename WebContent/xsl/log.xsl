<?xml version="1.0" encoding="UTF-8"?>

<!-- XML namespaces for log and XSLT -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:log="http://www.wsd.com/log">
	<xsl:output method="xml" omit-xml-declaration="yes" />

	<xsl:param name="username" />

	<xsl:template match="/">
		<div class="container">
			<h3>Logs</h3>
			<div class="table-responsive">
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
		</div>
		
	<!-- Include jQuery - see http://jquery.com -->
	<script type="text/javascript">
	    $('.confirmation').on('click', function () {
	        return confirm('Are you sure you want to delete this log?');
	    });
	</script>
	</xsl:template>

	<xsl:template match="log">
		<xsl:if test="hidden = ''">
			<tr>
				<xsl:apply-templates />
				<xsl:if test="$username != '' ">
					<td>
						<a href="flag_log.jsp?log={id}"  class="confirmation btn btn-danger btn-xs">
							<i class="fa fa-remove"></i>
						</a>
					</td>
				</xsl:if>
			</tr>
		</xsl:if>
	</xsl:template>

	<xsl:template match="id">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>

	<xsl:template match="driver">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>

	<xsl:template match="vehicle">
		<td>
			<a href="vehicle_logs.jsp?vehicle={.}">
				<xsl:apply-templates />
			</a>
		</td>
	</xsl:template>

	<xsl:template match="startdate">
		<td>
			<a href="log.jsp?startDate={.}">
				<xsl:apply-templates />
			</a>
		</td>
	</xsl:template>

	<xsl:template match="enddate">
		<td>
			<a href="log.jsp?startDate={.}">
				<xsl:apply-templates />
			</a>
		</td>
	</xsl:template>

	<xsl:template match="starttime">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>

	<xsl:template match="endtime">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>

	<xsl:template match="description">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>

	<xsl:template match="kilometres">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>

</xsl:stylesheet>