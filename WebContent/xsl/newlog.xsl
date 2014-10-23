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

		<!-- Get rego from Window location href -->
		<script>$('.vehicle').val($('.vehicle').val() +
			window.location.search.substr(1));</script>
		<script>$('#title').append(' for Registration: ' +
			window.location.search.substr(1));</script>
		<script>$('#regoLink').append(window.location.search.substr(1));</script>
		<script>
			var string2 = window.location.search.substr(1);
			$('#regoLink').each(function(){
			this.href += string2;
			})
		</script>

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
		<div class="{@class}">
			<xsl:apply-templates />
		</div>
	</xsl:template>

	<xsl:template match="label">
		<label for="{@for}" class="{@class}">
			<xsl:apply-templates />
		</label>
	</xsl:template>

	<xsl:template match="input">
		<div class="col-xs-10">
			<xsl:choose>
				<xsl:when test="@id='vehicle'">
					<input type="{@type}" class="{@class}" id="{@id}"
						placeholder="{$registration}" disabled="">
						<xsl:apply-templates />
					</input>
				</xsl:when>
				<xsl:when test="@id='driver'">
					<input type="{@type}" class="{@class}" id="{@id}"
						placeholder="{$username}" disabled="">
						<xsl:apply-templates />
					</input>
				</xsl:when>
				<xsl:otherwise>
					<input type="{@type}" class="{@class}" id="{@id}"
						placeholder="{@placeholder}">
						<xsl:apply-templates />
					</input>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>

</xsl:stylesheet>