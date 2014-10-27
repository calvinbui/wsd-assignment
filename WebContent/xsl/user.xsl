<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:user="http://www.wsd.com/user">

	<xsl:template match="/">
		<head>
			<title>Drivers</title>
		</head>
		<!-- Vehicle main page content -->
		<div class="container">
			<div class="pageheader">
				<div class="row">

					<div class="col-lg-6">
						<!-- Vehicle title -->
						<h3>Drivers</h3>
					</div>
				</div>
				<!-- End row -->
			</div>

			<div class="bs-docs-section">

				<!-- Vehicle table with striped design -->
				<table class="table table-striped table-hover">
					<xsl:apply-templates />
				</table>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="user:users">
		<thead>
			<th>Type</th>
			<th>Username</th>
			<th>First Name</th>
			<th>Last Name</th>
		</thead>
		<tbody>
			<xsl:apply-templates />
		</tbody>
	</xsl:template>

	<xsl:template match="user">
		<tr>
			<xsl:apply-templates select="type" />
			<xsl:apply-templates select="username" />
			<xsl:apply-templates select="firstname" />
			<xsl:apply-templates select="lastname" />
		</tr>
	</xsl:template>

	<!-- User type -->
	<xsl:template match="type">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>

	<!-- Username -->
	<xsl:template match="username">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>

	<!-- First name -->
	<xsl:template match="firstname">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>

	<!-- Last name -->
	<xsl:template match="lastname">
		<td>
			<xsl:apply-templates />
		</td>
	</xsl:template>

</xsl:stylesheet>