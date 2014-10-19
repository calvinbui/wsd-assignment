<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- Call header.xsl to include navbar -->
<xsl:include href="xsl/header.xsl"/>

	<xsl:template match="loginform">
		<!-- TODO: Auto-generated template -->
		<html>
			<head>
				<title>
					<xsl:value-of select="title"/>
				</title>
				
				<style>
				
				.input-group-addon {
				    min-width: 80px;// if you want width please write here //
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
				<!-- page container margin -->
				<div class="container">
					<div class="col-sm-6 col-md-4 col-md-offset-4">
						<!-- Login form -->
						<form class="form-signin" role="form">
							<!-- Login title -->
							<h1 class="form-signin-heading">
								<xsl:value-of select="title"/>
							</h1>
						
							<xsl:for-each select="login/*">
							<xsl:choose>
								<xsl:when test="current() = 'Password'">
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
							<a href="{$context-path}/index.jsp"><button class="btn btn-primary btn-block" type="submit">Log in</button></a>
						</form>
					</div>
					
				</div>
			</body>
		</html>
		
	</xsl:template>
	
</xsl:stylesheet>