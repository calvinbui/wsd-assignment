<?xml version="1.0" encoding="UTF-8"?>
<!-- XML namespaces for vehicle -->
<xsl:stylesheet version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:vehicle="http://www.wsd.com/vehicle">
	<!-- Output as xml document -->
	<xsl:output method="xml" omit-xml-declaration="yes" />
	<!-- Pass through username and usertype from logged in user -->
	<xsl:param name="username" />
	<xsl:param name="usertype" />
	
	<xsl:template match="/">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="vehicle:vehicles">
		<!-- Bootstrap default container wrapping site contents -->
		<div class="container">
			<h3>Vehicles</h3>
			<!-- Bootstrap responsive table design to respond to any device size -->
			<div class="table-responsive">
				<!-- Bootstrap striped table with hover -->
				<table class="table table-striped table-hover">
					<thead>
						<th>Registration</th>
						<th>Type</th>
						<th>Kilometres</th>
						<xsl:if test="$username != '' ">
							<th>Add Log</th>
						</xsl:if>
					</thead>
					<tbody>
						<xsl:apply-templates>
							<!-- Sort by vehicle registration -->
							<xsl:sort select="registration" />
						</xsl:apply-templates>
					</tbody>
				</table>
			</div>
			<!-- If logged in user is an admin return create vehicle functionality -->
			<xsl:if test="$usertype = 'admin' ">
				<!-- Link to create new vehicle. Bootstrap default button -->
				<a href="create_vehicle.jsp" class="btn btn-primary btn-sm">Create Vehicle</a>
			</xsl:if>
		<!-- End of Bootstrap container -->
		</div>
	</xsl:template>
	
	<xsl:template match="vehicle">
		<tr>
			<td>
				<!-- Link to vehicle registration - show more vehicle details -->
				<a href="vehicle_logs.jsp?vehicle={registration}"><xsl:apply-templates select="registration" /></a>
			</td>
			<td>
				<xsl:apply-templates select="type" />
			</td>
			<td>
				<!-- Total kilometres travelled with this vehicle -->
				<xsl:apply-templates select="kilometres" />
			</td>
			<!-- If user is logged in return create log functionality -->
			<xsl:if test="$username != '' ">
				<td>
					<!-- Link to create new log for the selected vehicle. Bootstrap default button -->
					<a href="create_log.jsp?vehicle={registration}" class="btn btn-success btn-xs">Create Log</a>
				</td>
			</xsl:if>
		</tr>
	</xsl:template>

</xsl:stylesheet>