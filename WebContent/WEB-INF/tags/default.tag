<%@ tag description="page template" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<!DOCTYPE html> 
<html lang=en>
	<head>
		<!-- stylesheets, javascript, favicon and title -->	
		<c:import var="xml" url="xml/head.xml"/>
		<c:import var="xslt" url="xsl/head.xsl" />
		<x:transform xml="${xml}" xslt="${xslt}">
			<x:param name="titleaddon" value="${titleaddon}"/>
		</x:transform>
	</head>
	<body>
		<!-- Top navigation bar -->	
		<c:import var="xml" url="xml/navbar.xml"/>
		<c:import var="xslt" url="xsl/navbar.xsl" />
		<!-- Pass the username into the navbar to show if they are logged in -->
		<x:transform xml="${xml}" xslt="${xslt}" >
			<x:param name="username" value="${sessionScope['username']}"/>
		</x:transform>
		
		<c:import var="xml" url="xml/breadcrumbs.xml"/>
		<c:import var="xslt" url="xsl/breadcrumbs.xsl" />
		<x:transform xml="${xml}" xslt="${xslt}" >
			<x:param name="bc-section" value="${breadcrumb_section}"/>
			<x:param name="bc-link" value="${breadcrumb_link}"/>
			<x:param name="bc-item" value="${breadcrumb_item}"/>			
		</x:transform>
		
		<!-- The body and main content of the page -->
		<jsp:doBody />
		
	</body>
</html>