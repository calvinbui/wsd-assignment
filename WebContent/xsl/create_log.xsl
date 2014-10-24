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
		<script>
		$(document).ready(function() {
			$("#start_date").datepicker({
				altField: "#end_date",
    			altFormat: "yy-mm-dd"
			});
		});

		</script>
	</xsl:template>

	<xsl:template match="title">
		<h1>
			<xsl:apply-templates />
		</h1>
	</xsl:template>

	<xsl:template match="addlog">
		<form class="form-horizontal" method="{@method}" action="{@action}">
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
		<label for="{.}" class="control-label col-xs-2">
			<xsl:apply-templates />
		</label>
	</xsl:template>

	<xsl:template match="input">
		<div class="col-xs-10">
			<xsl:choose>
				<xsl:when test="../label='Vehicle'">
					<input type="{@type}" class="form-control" id="{.}"
						placeholder="{.}" disabled="" />
				</xsl:when>
				<xsl:when test="../label='Driver'">
					<input type="{@type}" class="form-control" id="{.}"
						placeholder="{$username}" disabled="" />
				</xsl:when>
				<xsl:when test="@type='date'">
					<input type="text" class="form-control datepicker" id="{@id}"
						placeholder="{.}" />
				</xsl:when>
				<xsl:otherwise>
					<input type="{@type}" class="form-control" id="{.}"
						placeholder="{.}" />
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>

</xsl:stylesheet>