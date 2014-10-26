<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:param name="registration" />
	<xsl:param name="type" />
	<xsl:param name="make" />
	<xsl:param name="model" />
	<xsl:param name="colour" />
	<xsl:param name="year" />
	<xsl:param name="kilometres" />
	
	<xsl:param name="registration_value" />
	<xsl:param name="type_value"  />
	<xsl:param name="make_value"  />
	<xsl:param name="model_value"  />
	<xsl:param name="colour_value" />
	<xsl:param name="year_value" />
	<xsl:param name="kilometres_value" />
	
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
					<button type="submit" class="btn btn-block btn-primary">Create Vehicle</button>
				</div>
			</div>
		</form>
	</xsl:template>

	<xsl:template match="option">
		<div class="form-group has-feedback">
			<xsl:apply-templates />
		</div>
	</xsl:template>

	<xsl:template match="label">
		<label for="{@for}" class="control-label col-sm-2"><xsl:apply-templates /></label>
	</xsl:template>

	<xsl:template match="input">
		<div class="col-sm-10">
		
			<xsl:if test="@id = 'registration'">
				<xsl:if test="$registration = ''">
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$registration_value}">
						<xsl:apply-templates />
					</input>
				</xsl:if>
				<xsl:if test="$registration != ''">
				<div class="has-error">
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$registration_value}">
						<xsl:apply-templates />
					</input>
					<span class="glyphicon glyphicon-remove form-control-feedback"></span>
					</div>
				</xsl:if>
			</xsl:if>
			
			<xsl:if test="@id = 'type'">
				<xsl:if test="$type = ''">
					<select type="{@type}" name="{@id}" class="form-control placeholder" id="{@id}" placeholder="{@placeholder}">
						<xsl:for-each select="select">
							<option value="{$type_value}"><xsl:apply-templates /></option>
							<xsl:if test="select = 'Vehicle type'">
								<option value="{$type_value}" selected="" disabled="" style="display:none;"><xsl:apply-templates /></option>
							</xsl:if>
						</xsl:for-each>
					</select>
				</xsl:if>
				<xsl:if test="$type != ''">
				<div class="has-error">
					<select type="{@type}" name="{@id}" class="form-control placeholder" id="{@id}" placeholder="{@placeholder}" value="{$type_value}">
						<xsl:for-each select="select">
							<option><xsl:apply-templates /></option>
						</xsl:for-each>
					</select>
					<span class="glyphicon glyphicon-remove form-control-feedback"></span>
					</div>
				</xsl:if>
			</xsl:if>
			
			<xsl:if test="@id = 'make'">
				<xsl:if test="$make = ''">
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$make_value}">
						<xsl:apply-templates />
					</input>
				</xsl:if>
				<xsl:if test="$make != ''">
				<div class="has-error">
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$make_value}">
						<xsl:apply-templates />
					</input>
					<span class="glyphicon glyphicon-remove form-control-feedback"></span>
					</div>
				</xsl:if>
			</xsl:if>
			
			<xsl:if test="@id = 'model'">
				<xsl:if test="$model = ''">
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$model_value}">
						<xsl:apply-templates />
					</input>
				</xsl:if>
				<xsl:if test="$model != ''">
				<div class="has-error">
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$model_value}">
						<xsl:apply-templates />
					</input>
					<span class="glyphicon glyphicon-remove form-control-feedback"></span>
					</div>
				</xsl:if>
			</xsl:if>
			
			<xsl:if test="@id = 'year'">
				<xsl:if test="$year = ''">
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$year_value}">
						<xsl:apply-templates />
					</input>
				</xsl:if>
				<xsl:if test="$year != ''">
				<div class="has-error">
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$year_value}">
						<xsl:apply-templates />
					</input>
					<span class="glyphicon glyphicon-remove form-control-feedback"></span>
					</div>
				</xsl:if>
			</xsl:if>
			
			<xsl:if test="@id = 'colour'">
				<xsl:if test="$colour = ''">
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$colour_value}">
						<xsl:apply-templates />
					</input>
				</xsl:if>
				<xsl:if test="$colour != ''">
				<div class="has-error">
					<input type="{@type}" name="{@id}" class="form-control has-error" id="{@id}" placeholder="{@placeholder}" value="{$colour_value}">
						<xsl:apply-templates />
					</input>
					<span class="glyphicon glyphicon-remove form-control-feedback"></span>	
				</div>
				</xsl:if>
			</xsl:if>
			
			<xsl:if test="@id = 'kilometres'">
				<xsl:if test="$kilometres = ''">
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$kilometres_value}">
						<xsl:apply-templates />
					</input>
				</xsl:if>
				<xsl:if test="$kilometres != ''">
				<div class="has-error">
					<input type="{@type}" name="{@id}" class="form-control has-error" id="{@id}" placeholder="{@placeholder}" value="{$kilometres_value}">
						<xsl:apply-templates />
					</input>
					<span class="glyphicon glyphicon-remove form-control-feedback"></span>
				</div>
				</xsl:if>
			</xsl:if>
			
		</div>
	</xsl:template>

</xsl:stylesheet>