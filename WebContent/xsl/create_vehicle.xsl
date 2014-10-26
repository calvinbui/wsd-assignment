<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<!-- All parameters required to create a new vehicle -->
	<xsl:param name="registration" />
	<xsl:param name="type" />
	<xsl:param name="make" />
	<xsl:param name="model" />
	<xsl:param name="colour" />
	<xsl:param name="year" />
	<xsl:param name="kilometres" />
	<!-- Vehicle parameters returned -->
	<xsl:param name="registration_value" />
	<xsl:param name="type_value"  />
	<xsl:param name="make_value"  />
	<xsl:param name="model_value"  />
	<xsl:param name="colour_value" />
	<xsl:param name="year_value" />
	<xsl:param name="kilometres_value" />
	
	<!-- Create vehicle root template -->
	<xsl:template match="/">
		<!-- Bootstrap deafult container wrapping site contents -->
		<div class="container">
			<!-- Apply all templates under root -->
			<xsl:apply-templates />
		</div>
	</xsl:template>
	
	<!-- Template matching element: title -->
	<xsl:template match="title">
		<!-- Insert title element in h3 tag -->
		<h3><xsl:apply-templates /></h3>
	</xsl:template>
	
	<!-- Template matching element:addvehicle -->
	<xsl:template match="addvehicle">
		<!-- Bootstrap default form. Create vehicle post form. On submit send the form-data to create_vehicle_submit.jsp -->
		<form class="form-horizontal" method="{@method}" action="{@action}" role="form">
			<!-- Insert all elements within addvehicle element -->
			<xsl:apply-templates />
			<!-- Bootstrap default form grouping labels and inputs. Create vehicle submit button -->
			<div class="form-group">
				<!-- Bootstrap grid system - on small devices offset by 2 columns with 10 columns containing data -->
				<div class="col-sm-offset-2 col-sm-10">
					<!-- Bootstrap default submit button. Submit create vehicle button -->
					<button type="submit" class="btn btn-block btn-primary">Create Vehicle</button>
				</div>
			</div>
		</form>
	</xsl:template>
	
	<!-- Template matching element: option -->
	<xsl:template match="option">
		<!-- Bootstrap default validation state for feedback notifications -->
		<div class="form-group has-feedback">
			<!-- Insert all label and input data -->
			<xsl:apply-templates />
		</div>
	</xsl:template>
	
	<!-- Template matching element: label (within option) -->
	<xsl:template match="label">
		<!-- Insert for from xml data. Bootstrap default label controller -->
		<label for="{@for}" class="control-label col-sm-2">
			<!-- Apply label to element: label -->
			<xsl:apply-templates />
		</label>
	</xsl:template>
	
	<!-- Template matching element: input (within option) -->
	<xsl:template match="input">
		<!-- Bootstrap grid system covers 10 columns for small devices -->
		<div class="col-sm-10">
			<!-- If input id equals registration return the following -->
			<xsl:if test="@id = 'registration'">
				<!-- If registration parameter equals null return input -->
				<xsl:if test="$registration = ''">
					<!-- Insert xml data for type, name, id and placeholder. Insert parameter for registration -->
					<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$registration_value}">
						<!-- Apply style to input data -->
						<xsl:apply-templates />
					</input>
				</xsl:if>
				<!-- If registration parameter does not equal null return input -->
				<xsl:if test="$registration != ''">
					<!-- Bootstrap default validation state for input with error -->
					<div class="has-error">
						<!-- Insert xml data for type, name, id and placeholder. Insert parameter for registration -->
						<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{@placeholder}" value="{$registration_value}">
							<!-- Apply style to input data -->
							<xsl:apply-templates />
						</input>
						<!-- Bootstrap default icons for validation states -->
						<span class="glyphicon glyphicon-remove form-control-feedback"></span>
					</div>
				</xsl:if>
			</xsl:if>
			
			<!-- If input id equals type return the following-->
			<xsl:if test="@id = 'type'">
				<!-- If type parameter equals null return select option -->
				<xsl:if test="$type = ''">
					<!-- Style xml data. Insert type and id from xml. Bootstrap default form control style -->
					<select type="{@type}" name="{@id}" class="form-control">
						<!-- Value equals null for vehicle type option -->
						<option value="">Vehicle type</option>
						<!-- For each element: select return the following -->
						<xsl:for-each select="select">
							<!-- Choose one of the following cases -->
							<xsl:choose>
								<!-- When type_value parameter equals null return option with $type_value -->
								<xsl:when test="$type_value = ''">
									<option value="{.}" ><xsl:apply-templates /></option>
								</xsl:when>
								<!-- Else choose one of the following cases -->
								<xsl:otherwise>
									<xsl:choose>
										<!-- When type value equals the current option return option as selected -->
										<xsl:when test="$type_value = current()">
											<option value="{.}"  selected="selected"><xsl:apply-templates /></option>
										</xsl:when>
										<!-- Else return type value with no selection -->
										<xsl:otherwise>
											<option value="{.}" ><xsl:apply-templates /></option>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</select>
				</xsl:if>
				<xsl:if test="$type != ''">
				<div class="has-error">
					<select type="{@type}" name="{@id}" class="form-control">
						<option value="">Vehicle type</option>
						<xsl:for-each select="select">
							<xsl:choose>
								<xsl:when test="$type_value = ''">
									<option value="{.}" ><xsl:apply-templates /></option>
								</xsl:when>
								<xsl:otherwise>
									<xsl:choose>
										<xsl:when test="$type_value = current()">
											<option value="{.}"  selected="selected"><xsl:apply-templates /></option>
										</xsl:when>
										<xsl:otherwise>
											<option value="{.}" ><xsl:apply-templates /></option>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:otherwise>
							</xsl:choose>
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