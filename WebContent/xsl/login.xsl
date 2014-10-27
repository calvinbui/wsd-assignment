<?xml version="1.0" encoding="UTF-8"?>
<!-- XML namespaces for login -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<!-- Pass through result parameter from user login form -->
	<xsl:param name="result" />
	
	<xsl:template match="/">
		<!-- Bootstrap default container to wrap site contents -->
		<div class="container">
			<!-- Bootstrap grid system: on medium desktops create 6 columns and moving it 3 columns to the right -->
			<div class="col-md-6 col-md-offset-3">
				<div class="text-center">
					<xsl:apply-templates />
				</div>
			</div>
		</div>
	</xsl:template>
	
	<!-- Login form -->
	<xsl:template match="form">
		<form method="{@method}" action="{@action}">
			<xsl:apply-templates />
		</form>
	</xsl:template>
	<!-- Login form input -->
	<xsl:template match="input">
		<!-- Bootstap default to wrap input elements -->
		<div class="form-group">
			<input placeholder="{.}" type="{@type}" name="{.}" class="form-control" />
		</div>
	</xsl:template>
	<!-- Login submit button -->
	<xsl:template match="button">
		<!-- Bootstrap button using primary colour and match length to input length -->
		<button type="submit" class="btn btn-block btn-primary">
			<xsl:apply-templates />
		</button>
	</xsl:template>

</xsl:stylesheet>