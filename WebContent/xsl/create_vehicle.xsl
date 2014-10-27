<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<!-- All parameters required to create a new vehicle -->
	<xsl:param name="registration" />
	<xsl:param name="type" />
	<xsl:param name="make" />
	<xsl:param name="model" />
	<xsl:param name="colour" />
	<xsl:param name="year" />
	<xsl:param name="kilometres" />
	<!-- Vehicle parameters returned - selected from user -->
	<xsl:param name="registration_value" />
	<xsl:param name="type_value"  />
	<xsl:param name="make_value"  />
	<xsl:param name="model_value"  />
	<xsl:param name="colour_value" />
	<xsl:param name="year_value" />
	<xsl:param name="kilometres_value" />
	
	<xsl:template match="/">
		<!-- Bootstrap default container wrapping site contents -->
		<div class="container">
			<xsl:apply-templates />
		</div>
	</xsl:template>
	<!-- Create Vehicle title -->
	<xsl:template match="title">
		<h3><xsl:apply-templates /></h3>
	</xsl:template>
	
	<!-- Create vehicle form -->
	<xsl:template match="addvehicle">
		<!-- Bootstrap default form. On submit send the form-data to create_vehicle_submit.jsp -->
		<form class="form-horizontal" method="{@method}" action="{@action}" role="form">
			<xsl:apply-templates />
			<!-- Bootstrap default form grouping labels and inputs. -->
			<div class="form-group">
				<!-- Bootstrap grid system - on small devices offset by 2 columns with 10 columns containing data -->
				<div class="col-sm-offset-2 col-sm-10">
					<!-- Bootstrap default submit button. On Click submit create vehicle form -->
					<button type="submit" class="btn btn-block btn-primary">Create Vehicle</button>
				</div>
			</div>
		<!-- End of create vehicle form -->
		</form>
	</xsl:template>
	
	<xsl:template match="option">
		<!-- Bootstrap default validation state for feedback notifications -->
		<div class="form-group has-feedback">
			<!-- Insert all label and input data -->
			<xsl:apply-templates />
		</div>
	</xsl:template>
	
	<xsl:template match="label">
		<!-- Insert for from xml data. Bootstrap default label controller -->
		<label for="{@for}" class="control-label col-sm-2">
			<xsl:apply-templates />
		</label>
	</xsl:template>
	
	<xsl:template match="input">
		<!-- Bootstrap grid system covers 10 columns for small devices -->
		<div class="col-sm-10">
			<!-- Start of registration test loop -->
			<xsl:if test="@id = 'registration'">
				<!-- If registration parameter equals null return input -->
				<xsl:if test="$registration = ''">
					<!-- Insert xml data for type, name, id and placeholder. Insert parameter for registration -->
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$registration_value}">
						<xsl:apply-templates />
					</input>
				</xsl:if>
				<!-- If registration parameter is not empty return input -->
				<xsl:if test="$registration != ''">
					<!-- Bootstrap validation state for input with error -->
					<div class="has-error">
						<!-- Insert xml data for type, name, id and placeholder. Insert parameter for registration -->
						<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$registration_value}">
							<xsl:apply-templates />
						</input>
						<!-- Bootstrap validation for input error -->
						<span class="glyphicon glyphicon-remove form-control-feedback"></span>
					</div>
				</xsl:if>
			<!-- End of registration test loop -->
			</xsl:if>
			
			<!-- Start of type test loop -->
			<xsl:if test="@id = 'type'">
				<!-- If type parameter equals null return select option -->
				<xsl:if test="$type = ''">
					<!-- Style xml data. Insert type and id from xml. Bootstrap default form control style -->
					<select type="{@type}" name="{@id}" class="form-control">
						<!-- Value equals null for vehicle type option -->
						<option value="">Vehicle type</option>
						<!-- Loop for each select element -->
						<xsl:for-each select="select">
							<!-- Start of select loop -->
							<xsl:choose>
								<!-- When type_value parameter is empty return option with $type_value -->
								<xsl:when test="$type_value = ''">
									<!-- Insert $type_value into value attribute -->
									<option value="{.}" ><xsl:apply-templates /></option>
								</xsl:when>
								<!-- Else choose one of the following cases -->
								<xsl:otherwise>
									<!-- Start of type_value loop for returned user input -->
									<xsl:choose>
										<!-- When type_value equals the current option return option as selected -->
										<xsl:when test="$type_value = current()">
											<!-- Insert selected type as option value and set as selected -->
											<option value="{.}"  selected="selected"><xsl:apply-templates /></option>
										</xsl:when>
										<xsl:otherwise>
											<!-- Else return type_value with no selection -->
											<option value="{.}" ><xsl:apply-templates /></option>
										</xsl:otherwise>
									<!-- End of type_value loop -->
									</xsl:choose>
								</xsl:otherwise>
							<!-- End of select loop -->
							</xsl:choose>
						<!-- End of select element loop -->
						</xsl:for-each>
					<!-- End of type drop-down list -->
					</select>
				<!-- End of empty type parameter test -->
				</xsl:if>
				<!-- If type is not empty return Bootstrap validation state for error message -->
				<xsl:if test="$type != ''">
				<!-- Bootstrap error validation -->
				<div class="has-error">
					<select type="{@type}" name="{@id}" class="form-control">
						<option value="">Vehicle type</option>
						<!-- Start of select loop -->
						<xsl:for-each select="select">
							<!-- Start of type_value loop for returned user input -->
							<xsl:choose>
								<!-- When type_value parameter is empty return option with $type_value -->
								<xsl:when test="$type_value = ''">
									<option value="{.}" ><xsl:apply-templates /></option>
								</xsl:when>
								<!-- Else choose one of the following cases -->
								<xsl:otherwise>
									<!-- Start of type_value loop for returned user input -->
									<xsl:choose>
										<!-- When type_value equals the current option return option as selected -->
										<xsl:when test="$type_value = current()">
											<option value="{.}"  selected="selected"><xsl:apply-templates /></option>
										</xsl:when>
										<xsl:otherwise>
											<!-- Else return type_value with no selection -->->
											<option value="{.}" ><xsl:apply-templates /></option>
										</xsl:otherwise>
									<!-- End of type_value loop -->
									</xsl:choose>
								</xsl:otherwise>
							<!-- End of select loop -->
							</xsl:choose>
						<!-- End of select element loop -->
						</xsl:for-each>
					<!-- End of type drop-down list -->
					</select>
					<!-- Bootstrap validation for input error -->
					<span class="glyphicon glyphicon-remove form-control-feedback"></span>
					<!-- End of Bootstrap error validation -->
					</div>
				<!-- type is not empty test loop -->
				</xsl:if>
			<!-- End of type test loop -->
			</xsl:if>
			
			<!-- Start of make test loop -->
			<xsl:if test="@id = 'make'">
				<!-- If make parameter is empty return input with xml data -->
				<xsl:if test="$make = ''">
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$make_value}">
						<xsl:apply-templates />
					</input>
				</xsl:if>
				<!-- If make is not empty return input with validation error state -->
				<xsl:if test="$make != ''">
				<!-- Bootstrap validation state for error -->
				<div class="has-error">
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$make_value}">
						<xsl:apply-templates />
					</input>
					<!-- Bootstrap validation for input error -->
					<span class="glyphicon glyphicon-remove form-control-feedback"></span>
					</div>
				</xsl:if>
			<!-- End of make test loop -->
			</xsl:if>
			
			<!-- Start of model test loop -->
			<xsl:if test="@id = 'model'">
				<xsl:if test="$model = ''">
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$model_value}">
						<xsl:apply-templates />
					</input>
				</xsl:if>
				<xsl:if test="$model != ''">
				<!-- Bootstrap validation state for error -->
				<div class="has-error">
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$model_value}">
						<xsl:apply-templates />
					</input>
					<!-- Bootstrap validation for input error -->
					<span class="glyphicon glyphicon-remove form-control-feedback"></span>
					</div>
				</xsl:if>
			<!-- End of model test loop -->
			</xsl:if>
			
			<!-- Start of year test loop -->
			<xsl:if test="@id = 'year'">
				<!-- If year parameter is empty return input -->
				<xsl:if test="$year = ''">
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$year_value}">
						<xsl:apply-templates />
					</input>
				</xsl:if>
				<!-- If year parameter is not empty return input with validation error state -->
				<xsl:if test="$year != ''">
				<!-- Bootstrap validation state for error -->
				<div class="has-error">
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$year_value}">
						<xsl:apply-templates />
					</input>
					<!-- Bootstrap validation for input error -->
					<span class="glyphicon glyphicon-remove form-control-feedback"></span>
					</div>
				</xsl:if>
			</xsl:if>
			
			<xsl:if test="@id = 'colour'">
				<!-- If colour parameter is empty return input -->
				<xsl:if test="$colour = ''">
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$colour_value}">
						<xsl:apply-templates />
					</input>
				</xsl:if>
				<!-- If colour parameter is not empty return input with validation error state -->
				<xsl:if test="$colour != ''">
				<!-- Bootstrap validation state for error -->
				<div class="has-error">
					<input type="{@type}" name="{@id}" class="form-control has-error" id="{@id}" placeholder="{@placeholder}" value="{$colour_value}">
						<xsl:apply-templates />
					</input>
					<!-- Bootstrap validation for input error -->
					<span class="glyphicon glyphicon-remove form-control-feedback"></span>	
				</div>
				</xsl:if>
			</xsl:if>
			
			<xsl:if test="@id = 'kilometres'">
				<!-- If kilometres parameter is empty return input -->
				<xsl:if test="$kilometres = ''">
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$kilometres_value}">
						<xsl:apply-templates />
					</input>
				</xsl:if>
				<!-- If kilometres parameter is not empty return input with validation error state -->
				<xsl:if test="$kilometres != ''">
				<!-- Bootstrap validation state for error -->
				<div class="has-error">
					<input type="{@type}" name="{@id}" class="form-control has-error" id="{@id}" placeholder="{@placeholder}" value="{$kilometres_value}">
						<xsl:apply-templates />
					</input>
					<!-- Bootstrap validation for input error -->
					<span class="glyphicon glyphicon-remove form-control-feedback"></span>
				</div>
				</xsl:if>
			</xsl:if>
		</div>
	</xsl:template>

</xsl:stylesheet>