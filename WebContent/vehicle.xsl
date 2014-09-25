<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


	<!-- Vehicle template -->
	<xsl:template match="/">
		<html>
			<head>

				<link rel="stylesheet" href="css/bootstrap/bootstrap.min.css"></link>
					<script src="js/bootstrap/bootstrap.min.js"></script>
					<script src="js/jquery/jquery-1.11.1.min.js"></script>
					<link href="css/font-awesome/font-awesome.min.css" rel="stylesheet"></link>

					<link rel="stylesheet" href="css/jquery-ui/jquery-ui.min.css"></link>
					<link rel="stylesheet" href="css/jquery-ui/jquery-ui.structure.min.css"></link>
					<link rel="stylesheet" href="css/jquery-ui/jquery-ui.theme.min.css"></link>
					<script src="js/jquery-ui/jquery-ui.min.js"></script>
					<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"></meta>
					<title>Index</title>
			</head>

			<body>
		<table class="table">
			<thead>
				<th>Registration</th>
				<th>Type</th>
				<th>Kilometres</th>
			</thead>
			<tbody>
				<xsl:apply-templates />
				</tbody>
				</table>
			</body>

		</html>
	</xsl:template>


	<xsl:template match="vehicle">
	<tr>
		<xsl:apply-templates />
	</tr>
	</xsl:template>

	<!-- Registration -->
	<xsl:template match="registration">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>

	<!-- Vehicle Type -->
	<xsl:template match="type">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>

	<!-- Kilometres -->
	<xsl:template match="kilometres">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>

</xsl:stylesheet>