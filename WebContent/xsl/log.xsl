<?xml version="1.0" encoding="UTF-8"?>

<!-- XML namespaces for log and XSLT -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:log="http://www.wsd.com/log">
	<xsl:output method="xml" omit-xml-declaration="yes" />
	
	<!-- Apply parameter username if user logged in -->
	<xsl:param name="username" />
	
	<!-- Root template for log page -->
	<xsl:template match="/">
		<!-- Bootstrap default container to wrap site contents -->
		<div class="container">
			<h3>Logs</h3>
			
			<xsl:variable name="showFalse" select="//hidden[@show='false']" />
			<xsl:variable name="hiddenLogs" select="count($showFalse)" /> 
			<xsl:variable name="totalLogs" select="count(//log)" />
			
			<!-- Hidden <xsl:value-of select="$hiddenLogs"/><br/>
			Total logs <xsl:value-of select="$totalLogs"/> -->
			
			<xsl:choose>
				<xsl:when test="$hiddenLogs = $totalLogs">
					<p>There are no recorded logs.</p>
				</xsl:when>
				<!-- When log entries exist return the following table -->
				<xsl:when test="logs != '' ">
					<!-- Bootstrap default responsive table -->
					<div class="table-responsive">
						<!-- Bootstrap striped table with hover -->
						<table class="table table-striped table-hover">
							<!-- Table headings for log details -->
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
								<!-- If user is logged in return delete functionality -->
								<xsl:if test="$username != '' ">
									<th>Delete</th>
								</xsl:if>
							</thead>
							<tbody>
								<!-- Insert log details into table body -->
								<xsl:apply-templates />
							</tbody>
						</table>
						<xsl:value-of select="showFalse"/>
					</div>
				</xsl:when>
				<!-- If no log entries exist return the following statement -->
				<xsl:otherwise>
					<p>There are no recorded logs.</p>
				</xsl:otherwise>
			</xsl:choose>
		</div>
		
	<!-- Include jQuery - see http://jquery.com -->
	<script type="text/javascript">
		<!-- If user clicks on delete return the confirm message -->
	    $('.confirmation').on('click', function () {
	        return confirm('Are you sure you want to delete this log?');
	    });
	</script>
	</xsl:template>
	
	<!-- Match all log child elements -->
	<xsl:template match="log">
		<!-- If log has not been flagged as deleted return log details -->
		<xsl:if test="hidden = ''">
			<tr>
				<!-- Insert log details -->
				<xsl:apply-templates />
				<!-- If user is logged in show delete functionality -->
				<xsl:if test="$username != '' ">
					<td>
						<!-- Link to delete logs. Bootstrap validation message for confirmations -->
						<a href="flag_log.jsp?log={id}"  class="confirmation btn btn-danger btn-xs">
							<!-- Font Awesome icon for remove (X) -->
							<i class="fa fa-remove"></i>
						</a>
					</td>
				</xsl:if>
			</tr>
		</xsl:if>
	</xsl:template>
	<!-- Match all id child elements -->
	<xsl:template match="id">
		<td>
			<!-- Insert log unique ID -->
			<xsl:apply-templates />
		</td>
	</xsl:template>
	<!-- Match all driver child elements -->
	<xsl:template match="driver">
		<td>
			<!-- Insert username of driver -->
			<xsl:apply-templates />
		</td>
	</xsl:template>
	<!-- Match all vehicle child elements -->
	<xsl:template match="vehicle">
		<td>
			<!-- Insert vehicle registration data as a link -->
			<a href="vehicle_logs.jsp?vehicle={.}">
				<xsl:apply-templates />
			</a>
		</td>
	</xsl:template>
	<!-- Match all startdate child elements -->
	<xsl:template match="startdate">
		<td>
			<!-- Insert startdate value into log search link for start date -->
			<a href="log.jsp?startDate={.}">
				<xsl:apply-templates />
			</a>
		</td>
	</xsl:template>
	<!-- Match all enddate child elements -->
	<xsl:template match="enddate">
		<td>
			<!-- Insert enddate value into log search link for start date -->
			<a href="log.jsp?startDate={.}">
				<xsl:apply-templates />
			</a>
		</td>
	</xsl:template>
	<!-- Match all starttime child elements -->
	<xsl:template match="starttime">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>
	<!-- Match all endtime child elements -->
	<xsl:template match="endtime">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>
	<!-- Match all description child elements -->
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