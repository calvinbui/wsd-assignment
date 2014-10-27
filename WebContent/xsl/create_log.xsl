<?xml version="1.0" encoding="UTF-8"?>

<!-- XML namespaces for vehicle and XSLT -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- All parameters required to create a new vehicle -->
	<xsl:param name="vehicle" />
	<xsl:param name="startdate" />
	<xsl:param name="starttime" />
	<xsl:param name="endtime" />
	<xsl:param name="enddate"/>
	<xsl:param name="description" />
	<xsl:param name="kilometres"/>
	<!-- Vehicle parameters returned -->
	<xsl:param name="startdate_value" />
	<xsl:param name="starttime_value" />
	<xsl:param name="end_date_display" />
	<xsl:param name="start_date_display" />
	<xsl:param name="endtime_value" />
	<xsl:param name="enddate_value" />
	<xsl:param name="description_value" />
	<xsl:param name="kilometres_value" />
	
	<xsl:template match="/">
		<!-- Bootstrap default container to wrap site contents -->
		<div class="container">
			<xsl:apply-templates />
		</div>
		<!-- Script to convert date from DD/MM/YY to YY-MM-DD -->
		<script>
		$(document).ready(function() {
			$("#start_date_display").datepicker({
				altField: "#start_date",
				maxDate: "+0D",
    			altFormat: "yy-mm-dd"
			});
			$("#end_date_display").datepicker({
				altField: "#end_date",
				maxDate: "+0D",
    			altFormat: "yy-mm-dd"
			});
			$('.timepicker').timepicker({ 'timeFormat': 'H:i:s' });
			
		});

		</script>
	</xsl:template>
	
	<xsl:template match="title">
		<h3><xsl:apply-templates /></h3>
	</xsl:template>
	
	<xsl:template match="addlog">
		<!-- Bootstrap default form. Insert form method and action from xml -->
		<form class="form-horizontal" method="{@method}" action="{@action}" role="form">
			<xsl:apply-templates />
			<!-- Bootstrap default form group -->
			<div class="form-group">
				<!-- Bootstrap grid system - on small devices offset by 2 columns with 10 columns containing data -->
				<div class="col-sm-offset-2 col-sm-10">
				<!-- Bootstrap default submit button. Submit create log button -->
					<button type="submit" class="btn btn-block btn-primary">Create Log</button>
				</div>
			</div>
		</form>
	</xsl:template>
	
	<xsl:template match="option">
		<!-- Bootstrap default form group and default validation for feedback message -->
		<div class="form-group has-feedback">
			<xsl:apply-templates />
		</div>
	</xsl:template>
	
	<xsl:template match="label">
		<label for="{.}" class="control-label col-sm-2">
			<xsl:apply-templates />
		</label>
	</xsl:template>
	
	<xsl:template match="input">
		<!-- Bootstrap grid system of 10 columns for small devices -->
		<div class="col-sm-10">
			<!-- Input loop starts here -->
			<xsl:choose>
				<!-- When the value of label contains 'Vehicle' create the following form inputs -->
				<xsl:when test="../label='Vehicle'">
					<!-- Bootstrap default form control. Insert Vehicle parameter passed though from vehicle registration -->
					<input type="{@type}" class="form-control" id="{.}" placeholder="{$vehicle}" disabled="" />
					<!-- Hide vehicle parameter from user -->
					<input type="{@type}" class="hidden" id="{@id}" name="{@name}" value="{$vehicle}" />
				</xsl:when>
				<!-- When input type is date return the following -->
				<xsl:when test="@type='date'">
					<!-- If input id is start_date_display return the following -->
					<xsl:if test="@id = 'start_date_display'">
						<!-- If startdate parameter is empty return input -->
						<xsl:if test="$startdate = ''">
							<!-- Insert id, placeholder and name from xml data -->
							<input type="text" class="form-control datepicker" id="{@id}" placeholder="{.}" name="{@display}" value="{$start_date_display}"/>
						</xsl:if>
						<!-- If startdate parameter is not empty return input with validation -->
						<xsl:if test="$startdate != ''">
							<!-- Bootstrap default validation state message for errors -->
							<div class="has-error">
								<!-- Return input. Insert type, name, id and placeholder from xml data. Insert kilometres value parameter saved from user input -->
								<!-- Bootstrap validation state for error to format error message -->
								<input type="text" class="form-control datepicker" id="{@id}" placeholder="{.}"  name="{@display}"  value="{$start_date_display}"/>
								<!-- Bootstrap error notification -->
								<span class="glyphicon glyphicon-remove form-control-feedback"></span>	
							</div>
						</xsl:if>
						<!-- Default start_date_display -->
						<input type="text" name="{@name}" class="hidden" id="{@altid}" placeholder="{.}"  value="{$startdate_value}"/>
					</xsl:if>
					<!-- If input id is end_date_display return the following -->
					<xsl:if test="@id = 'end_date_display'">
						<!-- If enddate parameter is empty return input -->
						<xsl:if test="$enddate = ''">
							<input type="text" class="form-control datepicker" id="{@id}" placeholder="{.}"  name="{@display}" value="{$end_date_display}" />
						</xsl:if>
						<!-- If enddate parameter is not empty return input with validation -->
						<xsl:if test="$enddate != ''">
							<div class="has-error">
								<!-- Return input. Insert type, name, id and placeholder from xml data. Insert kilometres value parameter saved from user input -->
								<!-- Bootstrap validation state for error to format error message -->
								<input type="text" class="form-control datepicker" id="{@id}" placeholder="{.}" name="{@display}" value="{$end_date_display}"/>
								<span class="glyphicon glyphicon-remove form-control-feedback"></span>	
							</div>
						</xsl:if>
						<!-- Default end_date_display -->
						<input type="text" name="{@name}" class="hidden" id="{@altid}" placeholder="{.}"  value="{$enddate_value}"/>
					</xsl:if>
				</xsl:when>
				<!-- When input type is not date -->
				<xsl:otherwise>
					<!-- Start of description loop -->
					<xsl:if test="@id = 'description'">
						<!-- If description parameter is empty -->
						<xsl:if test="$description = ''">
							<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{.}" value="{$description_value}"/>
						</xsl:if>
						<!-- If description parameter is not empty -->
						<xsl:if test="$description != ''">
						<div class="has-error">
							<!-- Return input. Insert type, name, id and placeholder from xml data. Insert kilometres value parameter saved from user input -->
							<!-- Bootstrap validation state for error to format error message -->
							<input type="{@type}" name="{@id}" class="form-control has-error" id="{@id}" placeholder="{@placeholder}" value="{$description_value}"/>
							<span class="glyphicon glyphicon-remove form-control-feedback"></span>	
						</div>
						</xsl:if>
					<!-- End of description loop -->
					</xsl:if>
					<!-- Start of kilometres loop-->
					<xsl:if test="@id = 'kilometres'">
						<!-- If kilometres parameter is empty -->
						<xsl:if test="$kilometres = ''">
							<!-- Return input. Insert type, name, id and placeholder from xml data. Insert kilometres value parameter saved from user input -->
							<input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{.}" value="{$kilometres_value}"/>
						</xsl:if>
						<!-- If kiloemtres parameter is not empty -->
						<xsl:if test="$kilometres != ''">
						<!-- Return Bootstrap validation state for error -->
						<div class="has-error">
							<!-- Return input. Insert type, name, id and placeholder from xml data. Insert kilometres value parameter saved from user input -->
							<!-- Bootstrap validation state for error to format error message -->
							<input type="{@type}" name="{@id}" class="form-control has-error" id="{@id}" placeholder="{@placeholder}" value="{$kilometres_value}"/>
							<!-- Bootstrap validation state for error icon -->
							<span class="glyphicon glyphicon-remove form-control-feedback"></span>
						</div>
						</xsl:if>
					<!-- End of kilometres loop -->
					</xsl:if>
					<!-- Start of start time loop -->
					<xsl:if test="@id = 'starttime'">
						<!-- If starttime parameter is empty -->
						<xsl:if test="$starttime = ''">
							<!-- Return input. Insert type, name, id and placeholder from xml data. Insert kilometres value parameter saved from user input -->
							<input type="{@type}" name="{@id}" class="form-control timepicker" id="{@id}" placeholder="{@placeholder}" value="{$starttime_value}"/>
						</xsl:if>
						<!-- If start time parameter is not empty -->
						<xsl:if test="$starttime != ''">
						<!-- Return Bootstrap validation state for errors -->
						<div class="has-error">
						<!-- Return input. Insert type, name, id and placeholder from xml data. Insert kilometres value parameter saved from user input -->
						<!-- Bootstrap validation state for error to format error message -->
							<input type="{@type}" name="{@id}" class="form-control timepicker has-error" id="{@id}" placeholder="{@placeholder}" value="{$starttime_value}"/>
							<span class="glyphicon glyphicon-remove form-control-feedback"></span>
						</div>
						</xsl:if>
					<!-- End of start time loop -->
					</xsl:if>
					<!-- Start of end time loop -->
					<xsl:if test="@id = 'endtime'">
						<!-- If end time parameter is empty -->
						<xsl:if test="$endtime = ''">
							<input type="{@type}" name="{@id}" class="form-control timepicker" id="{@id}" placeholder="{@placeholder}" value="{$endtime_value}"/>
						</xsl:if>
						<!-- If end time parameter is not empty -->
						<xsl:if test="$endtime != ''">
						<!-- Return Bootstrap validation state for errors -->
						<div class="has-error">
							<!-- Return input. Insert type, name, id and placeholder from xml data. Insert kilometres value parameter saved from user input -->
							<!-- Bootstrap validation state for error to format error message -->
							<input type="{@type}" name="{@id}" class="form-control timepicker has-error" id="{@id}" placeholder="{@placeholder}" value="{$endtime_value}"/>
							<span class="glyphicon glyphicon-remove form-control-feedback"></span>
						</div>
						</xsl:if>
					<!-- End of end time loop -->
					</xsl:if>
				</xsl:otherwise>
			<!-- Input loop ends here -->
			</xsl:choose>
		</div>
	</xsl:template>

</xsl:stylesheet>
