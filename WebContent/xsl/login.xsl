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
			</head>
			
			<body>
				<!-- Insert navigation bar from header.xsl -->
				<xsl:call-template name="navbar"/>
				<!-- page container margin -->
				<div class="container">
				<div class="well bs-component">
					<!-- Login form -->
					<form class="form-horizontal col-lg-offset-3">
						<fieldset>
							<!-- Login title -->
							<h1 class="form-signin-heading"><xsl:value-of select="title"/></h1>
					
							<xsl:for-each select="login/*">
								<xsl:choose>
									<xsl:when test="current() = 'Password'">
										<div class="form-group">
											<label class="col-lg-2 control-label"><xsl:value-of select="current()"/></label>
											<div class="col-lg-4">
												<input type="password" class="form-control" value="" placeholder="{current()}" required=""></input>
											</div>
										</div>	
									</xsl:when>
									<xsl:otherwise>
										<div class="form-group">
											<label class="col-lg-2 control-label"><xsl:value-of select="current()"/></label>
											<div class="col-lg-4">
												<input type="text" class="form-control" value="" placeholder="{current()}" required="" autofocus=""></input>
											</div>
										</div>	
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						<!-- Redirect user to index page -->
						<div class="form-group">
							<div class="col-lg-4 col-lg-offset-2">
								<button class="btn btn-primary btn-block" type="submit">Log in</button>
							</div>
						</div>
					</fieldset>
					</form>
					<!-- Redirect user to register page -->
					<div class="form-horizontal col-lg-offset-3">
						<div class="form-group">
							<div class="col-lg-4 col-lg-offset-2">
								<a href="{$context-path}/registerDriver.jsp"><button class="btn btn-primary btn-block" type="submit">Register</button></a>
							</div>
						</div>
					</div>
				</div>
				</div>
			</body>
		</html>
		
	</xsl:template>
	
</xsl:stylesheet>