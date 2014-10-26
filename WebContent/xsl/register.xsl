<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="username" />
	<xsl:param name="password" />
	<xsl:param name="confirmpassword" />
	<xsl:param name="firstname" />
	<xsl:param name="lastname" />
	
	<xsl:param name="username_value" />
	<xsl:param name="password_value" />
	<xsl:param name="confirmpassword_value" />
	<xsl:param name="firstname_value" />
	<xsl:param name="lastname_value" />

	<xsl:template match="/">
		<div class="container">
			<xsl:apply-templates />
		</div>
	</xsl:template>
	
	<xsl:template match="title">
		<h3><xsl:apply-templates /></h3>
	</xsl:template>
	
	<xsl:template match="registerform">
		<form class="form-horizontal" method="{@method}" action="{@action}" role="form">
			<xsl:apply-templates />
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-block btn-primary">Register</button>
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
		
			<xsl:if test="@id = 'username'">
				<xsl:if test="$username = ''">
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$username_value}">
						<xsl:apply-templates />
					</input>
				</xsl:if>
				<xsl:if test="$username != ''">
					<div class="has-error">
						<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$username_value}">
							<xsl:apply-templates />
						</input>
						<span class="glyphicon glyphicon-remove form-control-feedback"></span>
					</div>
				</xsl:if>
			</xsl:if>
			
			<xsl:if test="@id = 'password'">
				<xsl:if test="$password = ''">
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$password_value}">
						<xsl:apply-templates />
					</input>
				</xsl:if>
				<xsl:if test="$password != ''">
					<div class="has-error">
						<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$password_value}">
							<xsl:apply-templates />
						</input>
						<span class="glyphicon glyphicon-remove form-control-feedback"></span>
					</div>
				</xsl:if>
			</xsl:if>
			
			<xsl:if test="@id = 'confirmpassword'">
				<xsl:if test="$confirmpassword = ''">
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$confirmpassword_value}">
						<xsl:apply-templates />
					</input>
				</xsl:if>
				<xsl:if test="$confirmpassword != ''">
					<div class="has-error">
						<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$confirmpassword_value}">
							<xsl:apply-templates />
						</input>
						<span class="glyphicon glyphicon-remove form-control-feedback"></span>
					</div>
				</xsl:if>
				<xsl:if test="$confirmpassword != @password">
					<div class="has-error">
						<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$confirmpassword_value}">
							<xsl:apply-templates />
						</input>
						<span class="glyphicon glyphicon-remove form-control-feedback"></span>
					</div>
				</xsl:if>
			</xsl:if>
			
			<xsl:if test="@id = 'firstname'">
				<xsl:if test="$firstname = ''">
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$firstname_value}">
						<xsl:apply-templates />
					</input>
				</xsl:if>
				<xsl:if test="$firstname != ''">
					<div class="has-error">
						<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$firstname_value}">
							<xsl:apply-templates />
						</input>
						<span class="glyphicon glyphicon-remove form-control-feedback"></span>
					</div>
				</xsl:if>
			</xsl:if>
			
			<xsl:if test="@id = 'lastname'">
				<xsl:if test="$lastname = ''">
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$lastname_value}">
						<xsl:apply-templates />
					</input>
				</xsl:if>
				<xsl:if test="$lastname != ''">
					<div class="has-error">
						<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$lastname_value}">
							<xsl:apply-templates />
						</input>
						<span class="glyphicon glyphicon-remove form-control-feedback"></span>
					</div>
				</xsl:if>
			</xsl:if>
			
		</div>
	</xsl:template>
	
</xsl:stylesheet>