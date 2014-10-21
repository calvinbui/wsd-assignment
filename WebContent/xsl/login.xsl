<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<div class="container">
			<div class="col-md-6 col-md-offset-3">
			<div class="text-center">
				<xsl:apply-templates />
			</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="form">
		<form method="{@method}" action="{@action}">
			<xsl:apply-templates />
		</form>
	</xsl:template>

	<xsl:template match="input">
		<div class="form-group">
			<input placeholder="{.}" type="{@type}" name="{.}" class="form-control" />
		</div>
	</xsl:template>
	
	<xsl:template match="button">
	  <button type="submit" class="btn btn-block btn-primary"><xsl:apply-templates/></button>
	</xsl:template>

</xsl:stylesheet>