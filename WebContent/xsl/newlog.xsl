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
			</head>
			<body>
				<xsl:call-template name="navbar"/>
				<div class="container">
					<div class="pageheader">
						<xsl:apply-templates select="title"/>
						<div class="row">
							<div class="input-group">
								<xsl:for-each select="addlog">
									<span class="input-group-addon">
										<xsl:value-of select="current()/*"/>
									</span>
									<input type="text" class="form-control" placeholder="test"></input>
								</xsl:for-each>					
							</div>
						</div>
					</div>
				</div>
			</body>
		</html>		
	</xsl:template>
	
	<xsl:template match="title">
		<h1>
			<xsl:apply-templates/>
		</h1>
	</xsl:template>
	
	<xsl:template name="form">
		<span class="input-group-addon">@</span>
  		<input type="text" class="form-control" placeholder="Username"></input>
	</xsl:template>
	
</xsl:stylesheet>