<?xml version="1.0" encoding="UTF-8"?>

<!-- XML namespaces for vehicle and XSLT -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="username" />
	<xsl:param name="registration" />

	<xsl:template match="/">
		<div class="container">
			<xsl:apply-templates />
		</div>
	</xsl:template>

	<xsl:template match="title">
		<h1>
			<xsl:apply-templates />
		</h1>
	</xsl:template>

	<xsl:template match="addlog">
		<form class="{@class}">
			<xsl:apply-templates />
			<div class="form-group">
				<div class="col-xs-offset-2 col-xs-10">
					<button type="submit" class="btn btn-primary">Add log</button>
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
		<label for="{@for}" class="control-label col-xs-2">
			<xsl:apply-templates />
		</label>
	</xsl:template>

	<xsl:template match="input">
		<div class="col-xs-10">
			<xsl:choose>
				<xsl:when test="@id='vehicle'">
					<input type="{@type}" class="form-control" id="{@id}"
						placeholder="{$registration}" disabled="">
						<xsl:apply-templates />
					</input>
				</xsl:when>
				<xsl:when test="@id='driver'">
					<input type="{@type}" class="form-control" id="{@id}"
						placeholder="{$username}" disabled="">
						<xsl:apply-templates />
					</input>
				</xsl:when>
				<xsl:otherwise>
					<input type="{@type}" class="form-control" id="{@id}"
						placeholder="{@placeholder}">
						<xsl:apply-templates />
					</input>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>

</xsl:stylesheet>