<?xml version="1.0" encoding="UTF-8"?>
<!-- XML namespaces for notification -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- Output as xml document -->
	<xsl:output method="xml" omit-xml-declaration="yes" />
	<!-- Pass through type and message parameter form user error -->
	<xsl:param name="type" />
	<xsl:param name="message" />

	<xsl:template match="/">
		<!-- If type parameter is not empty return notification type and notification message -->
		<xsl:if test="$type != ''">
			<!-- Bootstrap default container to wrap site contents -->
			<div class="container">
				<!-- Bootstrap grid: show 8 columns for medium desktops and move 2 columns to the right -->
				<div class="col-md-8 col-md-offset-2">
					<xsl:apply-templates />
				</div>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:template match="type">
		<!-- Bootstrap warning alert -->
		<div class="alert alert-{$type} alert-dismissible" role="alert">
			<!-- Option for user to close notification -->
			<button type="button" class="close" data-dismiss="alert">
				<!-- Element is not visible to the user -->
				<span aria-hidden="true">&#xd7;</span>
				<!-- Hide close text from users -->
				<span class="sr-only">Close</span>
			</button>
			<!-- Insert message parameter. Output special characters (e.g. <) as is -->
			<xsl:value-of disable-output-escaping="yes" select="$message" />
		</div>
	</xsl:template>

</xsl:stylesheet>