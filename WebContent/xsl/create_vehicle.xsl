<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<div class="container">
			<xsl:apply-templates />
		</div>
	</xsl:template>

	<xsl:template match="title">
		<h3><xsl:apply-templates /></h3>
	</xsl:template>

	<xsl:template match="addvehicle">
		<form class="form-horizontal" method="{@method}" action="{@action}" role="form">
			<xsl:apply-templates />
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-block btn-primary">Add vehicle</button>
				</div>
			</div>
		</form>
	</xsl:template>

	<xsl:template match="option">
		<div class="form-group">
			<xsl:apply-templates />
		</div>
	</xsl:template>

	<xsl:template match="label">
		<label for="{@for}" class="control-label col-sm-2"><xsl:apply-templates /></label>
	</xsl:template>

	<xsl:template match="input">
		<div class="col-sm-10">
			<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}">
				<xsl:apply-templates />
			</input>
		</div>
	</xsl:template>

</xsl:stylesheet>