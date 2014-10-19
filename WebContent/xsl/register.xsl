<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- Call header.xsl to include navbar -->
<xsl:include href="xsl/header.xsl"/>

	<xsl:template match="register">
		<!-- TODO: Auto-generated template -->
		<html>
		
			<head>
				<title>
					<xsl:value-of select="title" />
				</title>
				
				<style>
				
				.input-group-addon {
				    min-width: 190px;// if you want width please write here //
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
					<div class="col-lg-6 col-md-offset-3">
						<form>
							<!-- Login title -->
							<h1 class="form-signin-heading">
								<xsl:value-of select="title"/>
							</h1>
							
							<xsl:for-each select="form/*">
							<xsl:choose>
								<xsl:when test="contains(current(),'Password')">
									<div style="margin-bottom: 10px;" class="input-group">
										<span style="" class="input-group-addon"><xsl:value-of select="current()"/></span>
										<input type="password" class="input-block-level form-control {current()}" value="" placeholder="enter {current()}" required=""></input>
									</div>	
								</xsl:when>
								<xsl:otherwise>
									<div style="margin-bottom: 10px;" class="input-group">
										<span style="" class="input-group-addon"><xsl:value-of select="current()"/></span>
										<input type="text" class="input-block-level form-control {current()}" value="" placeholder="enter {current()}" required="" autofocus=""></input>
									</div>	
								</xsl:otherwise>
							</xsl:choose>
							</xsl:for-each>
							<!-- Redirect user to index page -->
							<a href="{$context-path}/index.jsp"><button class="btn btn-primary btn-block" type="submit">Register</button></a>
							
						</form>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>
	
</xsl:stylesheet>