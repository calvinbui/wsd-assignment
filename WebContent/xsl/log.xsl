<?xml version="1.0" encoding="UTF-8"?>

<!-- XML namespaces for log-->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:log="http://www.wsd.com/log">
	<!-- Set output of logs as an xml document -->
	<xsl:output method="xml" omit-xml-declaration="yes" />
	
	<!-- Apply parameter username if user logged in -->
	<xsl:param name="username" />
	
	<xsl:template match="/">
		<!-- Bootstrap default container to wrap site contents -->
		<div class="container">
			<h3>Logs</h3>
			<!-- Declare variable for logs set as hidden -->
			<xsl:variable name="showFalse" select="//hidden[@show='false']" />
			<!-- Declare variable for total number of logs set as hidden -->
			<xsl:variable name="hiddenLogs" select="count($showFalse)" /> 
			<!-- Declare variable for total number of logs -->
			<xsl:variable name="totalLogs" select="count(//log)" />
			<!-- Start of logs display loop -->
			<xsl:choose>
				<!-- When the number of hidden logs equals the total number of logs return the following statement -->
				<xsl:when test="$hiddenLogs = $totalLogs">
					<p>There are no recorded logs.</p>
				</xsl:when>
				<!-- When logs entries contain log elements return the following table -->
				<xsl:when test="logs != '' ">
					<!-- Bootstrap responsive table design to respond to any device size -->
					<div class="table-responsive">
						<!-- Bootstrap striped table with hover -->
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
								<!-- If user is logged in return delete functionality -->
								<xsl:if test="$username != '' ">
									<th>Delete</th>
								</xsl:if>
							</thead>
							<tbody>
								<!-- Insert log details into table body if logs contain log data -->
								<xsl:apply-templates />
							</tbody>
						</table>
					</div>
				</xsl:when>
				<!-- When no log entries exist return the following statement -->
				<xsl:otherwise>
					<p>There are no recorded logs.</p>
				</xsl:otherwise>
			<!-- End of logs display loop -->
			</xsl:choose>
		<!-- End of Bootstrap container -->
		</div>
		
	<!-- Include jQuery - see http://jquery.com -->
	<script type="text/javascript">
		<!-- If user clicks on delete return the confirm message -->
	    $('.confirmation').on('click', function () {
	        return confirm('Are you sure you want to delete this log?');
	    });
	</script>
	</xsl:template>
	
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
							<!-- Font Awesome remove icon -->
							<i class="fa fa-remove"></i>
						</a>
					</td>
				</xsl:if>
			</tr>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="id">
		<td>
			<!-- Insert unique log ID -->
			<xsl:apply-templates />
		</td>
	</xsl:template>
	
	<xsl:template match="driver">
		<td>
			<!-- Insert driver username (email) -->
			<xsl:apply-templates />
		</td>
	</xsl:template>
	
	<xsl:template match="vehicle">
		<td>
			<!-- Insert vehicle registration data as a link -->
			<a href="vehicle_logs.jsp?vehicle={.}">
				<xsl:apply-templates />
			</a>
		</td>
	</xsl:template>
	
	<xsl:template match="startdate">
		<td>
			<!-- Insert startdate value into log search link for start date -->
			<a href="log.jsp?startDate={.}">
				<xsl:apply-templates />
			</a>
		</td>
	</xsl:template>
	
	<xsl:template match="enddate">
		<td>
			<!-- Insert enddate value into log search link for start date -->
			<a href="log.jsp?startDate={.}">
				<xsl:apply-templates />
			</a>
		</td>
	</xsl:template>
	
	<xsl:template match="starttime">
		<td>
			<!-- Insert log start time -->
			<xsl:apply-templates />
		</td>
	</xsl:template>
	
	<xsl:template match="endtime">
		<td>
			<!-- Insert log end time -->
			<xsl:apply-templates />
		</td>
	</xsl:template>
	
	<xsl:template match="description">
		<td>
			<!-- Insert log description -->
			<xsl:apply-templates />
		</td>
	</xsl:template>

	<xsl:template match="kilometres">
		<td>
			<!-- Insert kilometres travelled -->
			<xsl:apply-templates />
		</td>
	</xsl:template>

</xsl:stylesheet>