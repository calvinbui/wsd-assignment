<?xml version="1.0" encoding="UTF-8"?>

<!-- XML namespaces for vehicle and XSLT -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="vehicle" />
	<xsl:param name="startdate" />
	<xsl:param name="starttime" />
	<xsl:param name="endtime" />
	<xsl:param name="enddate"/>
	<xsl:param name="description" />
	<xsl:param name="kilometres"/>
	
	<xsl:param name="startdate_value" />
	<xsl:param name="starttime_value" />
	<xsl:param name="endtime_value" />
	<xsl:param name="enddate_value" />
	<xsl:param name="description_value" />
	<xsl:param name="kilometres_value" />

	<xsl:template match="/">

		<div class="container">
			<xsl:apply-templates />
		</div>
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
		});
		
		$('#startime').timepicker({ 'timeFormat': 'H:i:s' });
		$('#endtime').timepicker({ 'timeFormat': 'H:i:s' });

		</script>
	</xsl:template>

	<xsl:template match="title">
		<h3><xsl:apply-templates /></h3>
	</xsl:template>

	<xsl:template match="addlog">
		<form class="form-horizontal" method="{@method}" action="{@action}" role="form">
			<xsl:apply-templates />
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-block btn-primary">Create Log</button>
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
		<label for="{.}" class="control-label col-sm-2">
			<xsl:apply-templates />
		</label>
	</xsl:template>

	<xsl:template match="input">
		<div class="col-sm-10">
			<xsl:choose>
				<xsl:when test="../label='Vehicle'">
					<input type="{@type}" class="form-control" id="{.}" placeholder="{$vehicle}" disabled="" />
					<input type="{@type}" class="hidden" id="{@id}" name="{@name}" value="{$vehicle}" />
				</xsl:when>
				
				<xsl:when test="@type='date'">
					
					<xsl:if test="@id = 'start_date_display'">
						<xsl:if test="$startdate = ''">
							<input type="text" class="form-control datepicker" id="{@id}" placeholder="{.}"  value="{$startdate_value}"/>
						</xsl:if>
						<xsl:if test="$startdate != ''">
							<div class="has-error">
								<input type="text" class="form-control datepicker" id="{@id}" placeholder="{.}"  value="{$startdate_value}"/>
								<span class="glyphicon glyphicon-remove form-control-feedback"></span>	
							</div>
						</xsl:if>
						<input type="text" name="{@name}" class="hidden" id="{@altid}" placeholder="{.}"  value="{$startdate_value}"/>
					</xsl:if>
					
					<xsl:if test="@id = 'end_date_display'">
						<xsl:if test="$enddate = ''">
							<input type="text" class="form-control datepicker" id="{@id}" placeholder="{.}" value="{$enddate_value}" />
						</xsl:if>
						<xsl:if test="$enddate != ''">
							<div class="has-error">
								<input type="text" class="form-control datepicker" id="{@id}" placeholder="{.}"  value="{$enddate_value}"/>
								<span class="glyphicon glyphicon-remove form-control-feedback"></span>	
							</div>
						</xsl:if>
						<input type="text" name="{@name}" class="hidden" id="{@altid}" placeholder="{.}"  value="{$enddate_value}"/>
					</xsl:if>
				</xsl:when>
				
				<xsl:otherwise>
				
					<xsl:if test="@id = 'description'">
						<xsl:if test="$description = ''"><input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{.}" value="{$description_value}"/></xsl:if>
						<xsl:if test="$description != ''">
						<div class="has-error">
							<input type="{@type}" name="{@id}" class="form-control has-error" id="{@id}" placeholder="{@placeholder}" value="{$description_value}"/>
							<span class="glyphicon glyphicon-remove form-control-feedback"></span>	
						</div>
						</xsl:if>
					</xsl:if>
					
					<xsl:if test="@id = 'kilometres'">
						<xsl:if test="$kilometres = ''"><input type="{@type}" name="{@id}" class="form-control" id="{@id}" placeholder="{.}" value="{$kilometres_value}"/></xsl:if>
						<xsl:if test="$kilometres != ''">
						<div class="has-error">
							<input type="{@type}" name="{@id}" class="form-control has-error" id="{@id}" placeholder="{@placeholder}" value="{$kilometres_value}"/>
							<span class="glyphicon glyphicon-remove form-control-feedback"></span>
						</div>
						</xsl:if>
					</xsl:if>
					
					<xsl:if test="@id = 'starttime'">
						<xsl:if test="$starttime = ''">
							<input type="{@type}" name="{@id}" class="form-control timepicker" id="{@id}" placeholder="{@placeholder}" value="{$starttime_value}"/>
						</xsl:if>
						<xsl:if test="$starttime != ''">
						<div class="has-error">
							<input type="{@type}" name="{@id}" class="form-control has-error" id="{@id}" placeholder="{@placeholder}" value="{$starttime_value}"/>
							<span class="glyphicon glyphicon-remove form-control-feedback"></span>
						</div>
						</xsl:if>
					</xsl:if>
					
					<xsl:if test="@id = 'endtime'">
						<xsl:if test="$endtime = ''">
							<input type="{@type}" name="{@id}" class="form-control timepicker" id="{@id}" placeholder="{@placeholder}" value="{$endtime_value}"/>
						</xsl:if>
						<xsl:if test="$endtime != ''">
						<div class="has-error">
							<input type="{@type}" name="{@id}" class="form-control has-error" id="{@id}" placeholder="{@placeholder}" value="{$endtime_value}"/>
							<span class="glyphicon glyphicon-remove form-control-feedback"></span>
						</div>
						</xsl:if>
					</xsl:if>
					
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>

</xsl:stylesheet>
