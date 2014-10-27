<?xml version="1.0" encoding="UTF-8"?>
<!-- XML namespaces for navbar -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<!-- Output as xml document -->
	<xsl:output method="xml" omit-xml-declaration="yes" />
	<!-- Pass through username parameter form user login -->
	<xsl:param name="username" />

	<xsl:template match="/">
		<!-- Bootstrap navbar stylesheet. Make navbar fixed to the top of the device screen -->
		<div class="navbar navbar-default navbar-static-top" role="navigation">
			<xsl:apply-templates />
		</div>
	</xsl:template>
	
	<!-- Bootstrap default container to wrap site contents -->
	<xsl:template match="content">
		<div class="{@class}">
			<xsl:apply-templates />
		</div>
	</xsl:template>
	<!-- Bootstrap default navbar header -->
	<xsl:template match="header">
		<div class="{@class}">
			<xsl:apply-templates />
		</div>
	</xsl:template>
	
	<!-- Bootstrap default responsive navbar which collapses the navbar-main id -->
	<xsl:template match="button">
		<button class="{@class}" type="{@type}" data-toggle="collapse"
			data-target="{@data-target}">
			<xsl:apply-templates />
		</button>
	</xsl:template>
	
	<!-- Bootstrap default responsive navbar icon on small devices -->
	<xsl:template match="line">
		<span class="{.}">.</span>
	</xsl:template>
	
	<!-- Bootstrap default navbar heading. Link to index page -->
	<xsl:template match="heading">
		<a class="{@class}" href="{@href}"><xsl:apply-templates /></a>
	</xsl:template>
	
	<!-- Bootstrap default collapsing navbar -->
	<xsl:template match="main">
		<div class="{@class}" id="{@id}">
			<xsl:apply-templates />
		</div>
	</xsl:template>
	
	<!-- Bootstrap default navbar for menu items -->
	<xsl:template match="menu">
		<ul class="{@class}">
			<xsl:apply-templates />
		</ul>
	</xsl:template>
	
	<!-- List of menu items -->
	<xsl:template match="item">
		<li>
			<xsl:apply-templates select="path" />
		</li>
	</xsl:template>
	
	<!-- Insert menu item page links -->
	<xsl:template match="path">
		<a href="/wsdassignment/{.}">
			<!-- Menu item icons -->
			<span class="{../title/@icon}">&#160;</span>&#160;<xsl:value-of select="../title" />
		</a>
	</xsl:template>
	
	<xsl:template match="auth">
		<!-- User is not logged in reutrn register and login buttons -->
		<xsl:if test="$username = '' ">
			<li>
				<a href="register.jsp"><span class="fa fa-pencil-square-o">&#160;</span>&#160;Register</a>
			</li>
			<li>
				<a href="login.jsp"><span class="fa fa-sign-in">&#160;</span>&#160;Login</a>
			</li>
		</xsl:if>
		<!-- User is logged in return username and logout button -->
		<xsl:if test="$username != '' ">
			<li class="nav navbar-text" style="padding-left:15px;">
				<!-- Font Awesome user icon -->
				<span class="fa fa-user">&#160;</span>&#160;<xsl:value-of select="$username" />
			</li>
			<li>
				<!-- Font Awesome logout icon -->
				<a href="logout.jsp"><span class="fa fa-sign-out">&#160;</span>&#160;Logout</a>
			</li>
		</xsl:if>
	</xsl:template>
	
</xsl:stylesheet>