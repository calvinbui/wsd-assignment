<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" omit-xml-declaration="yes" />

	<!-- All parameters required to create a new user -->
	<xsl:param name="username" />
	<xsl:param name="password" />
	<xsl:param name="confirmpassword" />
	<xsl:param name="firstname" />
	<xsl:param name="lastname" />
	<!-- User parameters returned - entered by user -->
	<xsl:param name="username_value" />
	<xsl:param name="password_value" />
	<xsl:param name="confirmpassword_value" />
	<xsl:param name="firstname_value" />
	<xsl:param name="lastname_value" />

	<xsl:template match="/">
		<!-- Bootstrap default container to wrap site contents -->
		<div class="container">
			<xsl:apply-templates />
		</div>
	</xsl:template>
	
	<xsl:template match="title">
		<h3><xsl:apply-templates /></h3>
	</xsl:template>
	
	<xsl:template match="registerform">
		<!-- Bootstrap horizontal form. Insert xml data -->
		<form class="form-horizontal" method="{@method}" action="{@action}" role="form">
			<xsl:apply-templates />
			<!-- Bootstrap default form-group to wrap input elements -->
			<div class="form-group">
				<!-- Bootstrap grid: on small devices set register button to 10 columns and move it 2 columns to the right -->
				<div class="col-sm-offset-2 col-sm-10">
					<!-- Bootstrap button using primary colour and match length to input length -->
					<button type="submit" class="btn btn-block btn-primary">Register</button>
				</div>
			</div>
		<!-- End of registration form -->
		</form>
	</xsl:template>
	
	<xsl:template match="option">
		<!-- Bootstrap form validation. Return if errors exists -->
		<div class="form-group has-feedback">
			<xsl:apply-templates />
		</div>
	</xsl:template>
	
	<xsl:template match="label">
		<!-- Bootstrap grid: on small devices resize label fit 2 columns -->
		<label for="{@for}" class="control-label col-sm-2"><xsl:apply-templates /></label>
	</xsl:template>
	
	<xsl:template match="input">
		<!-- Bootstrap grid: resize input to fit 10 columns -->
		<div class="col-sm-10">
			<!-- Start of username test loop -->
			<xsl:if test="@id = 'username'">
				<!-- If username parameter is empty return input -->
				<xsl:if test="$username = ''">
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$username_value}">
						<xsl:apply-templates />
					</input>
				</xsl:if>
				<!-- If username parameter is not empty return validation error state -->
				<xsl:if test="$username != ''">
					<!-- Bootstrap validation state for input with error -->
					<div class="has-error">
						<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$username_value}">
							<xsl:apply-templates />
						</input>
						<!-- Bootstrap validation for input error -->
						<span class="glyphicon glyphicon-remove form-control-feedback"></span>
					</div>
				</xsl:if>
			<!-- End of username test loop -->
			</xsl:if>
			
			<!-- Start if password test loop -->
			<xsl:if test="@id = 'password'">
				<!-- If password parameter is empty return input -->
				<xsl:if test="$password = ''">
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$password_value}">
						<xsl:apply-templates />
					</input>
				</xsl:if>
				<!-- If password input is not empty return Bootstrap validation error -->
				<xsl:if test="$password != ''">
					<!-- Bootstrap validation state for input with error -->
					<div class="has-error">
						<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$password_value}">
							<xsl:apply-templates />
						</input>
						<!-- Bootstrap validation for input error -->
						<span class="glyphicon glyphicon-remove form-control-feedback"></span>
					</div>
				</xsl:if>
			<!-- End of password test loop -->
			</xsl:if>
			
			<!-- Start of confirm password test loop -->
			<xsl:if test="@id = 'confirmpassword'">
				<!-- If confirmpassword parameter is empty return input -->
				<xsl:if test="$confirmpassword = ''">
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$confirmpassword_value}">
						<xsl:apply-templates />
					</input>
				</xsl:if>
				<!-- If confirmpassword parameter is not empty return input with validation error -->
				<xsl:if test="$confirmpassword != ''">
					<!-- Bootstrap validation state for input with error -->
					<div class="has-error">
						<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$confirmpassword_value}">
							<xsl:apply-templates />
						</input>
						<!-- Bootstrap validation for input error -->
						<span class="glyphicon glyphicon-remove form-control-feedback"></span>
					</div>
				</xsl:if>
			<!-- End of confirm password test loop -->
			</xsl:if>
			
			<!-- Start of first name test loop -->
			<xsl:if test="@id = 'firstname'">
				<!-- If firstname parameter is empty return input -->
				<xsl:if test="$firstname = ''">
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$firstname_value}">
						<xsl:apply-templates />
					</input>
				</xsl:if>
				<!-- If firstname parameter is not empty return input with validation error -->
				<xsl:if test="$firstname != ''">
					<!-- Bootstrap validation state for input with error -->
					<div class="has-error">
						<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$firstname_value}">
							<xsl:apply-templates />
						</input>
						<!-- Bootstrap validation for input error -->
						<span class="glyphicon glyphicon-remove form-control-feedback"></span>
					</div>
				</xsl:if>
			<!-- End of first name test loop -->
			</xsl:if>
			
			<!-- Start of last name test loop -->
			<xsl:if test="@id = 'lastname'">
				<!-- If lastname parameter is empty return input -->
				<xsl:if test="$lastname = ''">
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$lastname_value}">
						<xsl:apply-templates />
					</input>
				</xsl:if>
				<!-- If lastname parameter is not empty return input with validation error -->
				<xsl:if test="$lastname != ''">
					<!-- Bootstrap validation state for input with error -->
					<div class="has-error">
						<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$lastname_value}">
							<xsl:apply-templates />
						</input>
						<!-- Bootstrap validation for input error -->
						<span class="glyphicon glyphicon-remove form-control-feedback"></span>
					</div>
				</xsl:if>
			<!-- End of last name test loop -->
			</xsl:if>
			
		</div>
	</xsl:template>
	
</xsl:stylesheet>