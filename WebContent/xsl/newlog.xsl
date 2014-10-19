<?xml version="1.0" encoding="UTF-8"?>

<!-- XML namespaces for vehicle and XSLT -->
<xsl:stylesheet version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="xsl/header.xsl"/>

	<xsl:template match="logform">
		<html>
			<head>
				<title>
					<xsl:value-of select="title"/>
				</title>
				<style>
				
				.input-group-addon {
				    min-width: 150px;// if you want width please write here //
				    text-align:left;
				}
				
				.input-group { width: 100%; }
				
				.vehicle {
				  cursor: not-allowed;
				    background-color: #EEE;
				    color: #9E9999;
				}
				</style>
				
			</head>
			<body>
				<!-- Insert navigation bar from header.xsl -->
				<xsl:call-template name="navbar"/>
				<div class="container">
					<div class="pageheader">
					
						<!-- Insert page title -->
						<xsl:apply-templates select="title"/>
						
						
						<!-- Add new log form -->
						<form>
								<xsl:for-each select="addlog/*">
								
									<xsl:choose>
										<xsl:when test="current() = 'Vehicle'">
											<div style="margin-bottom: 10px;" class="input-group">
												<span style="" class="input-group-addon"><xsl:value-of select="current()"/></span>
												<input type="text" class="form-control {current()}" value="" placeholder="add {current()}" disabled=""></input>
											</div>	
										</xsl:when>
										<xsl:when test="contains(current(),'Date')">
										<div style="margin-bottom: 10px;" class="input-group">
												<span style="" class="input-group-addon"><xsl:value-of select="current()"/></span>
												<input type="date" class="form-control {current()}" value="" placeholder="add {current()}"></input>
											</div>
										</xsl:when>
										<xsl:when test="contains(current(),'Time')">
										<div style="margin-bottom: 10px;" class="input-group">
												<span style="" class="input-group-addon"><xsl:value-of select="current()"/></span>
												<input type="time" class="form-control {current()}" value="" placeholder="add {current()}"></input>
											</div>
										</xsl:when>
										<xsl:when test="contains(current(),'Kilometres')">
										<div style="margin-bottom: 10px;" class="input-group">
												<span style="" class="input-group-addon"><xsl:value-of select="current()"/></span>
												<input type="number" class="form-control {current()}" value="" placeholder="add {current()}"></input>
											</div>
										</xsl:when>
										<xsl:otherwise>
											<div style="margin-bottom: 10px;" class="input-group">
												<span style="" class="input-group-addon"><xsl:value-of select="current()"/></span>
												<input type="text" class="form-control {current()}" placeholder="add {current()}"></input>
											</div>
										</xsl:otherwise>
									</xsl:choose>
									
									
									
								</xsl:for-each>
								<!-- Submit new log -->
								<input action="#" type="submit" class="btn btn-default" value="Add new log"/>
								<!-- Get rego from Window location href -->
								<script>$('.vehicle').val($('.vehicle').val() + window.location.search.substr(1));</script>
								<script>$('#title').append(' for Registration: ' + window.location.search.substr(1));</script>
						</form>
					</div>
				</div>
			</body>
		</html>		
	</xsl:template>
	
	<xsl:template match="title">
		<h1 id="title">
			<xsl:apply-templates/>
		</h1>
	</xsl:template>
	
</xsl:stylesheet>