<%@ tag import="wsd.ass.User" %>
<%@ tag description="page template" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<html>
	<head>
		<c:import var="xml" url="xml/head.xml"/>
		<c:import var="xslt" url="xsl/head.xsl" />
		<x:transform xml="${xml}" xslt="${xslt}"/>
	</head>
	<body>
		<c:import var="xml" url="xml/navbar.xml"/>
		<c:import var="xslt" url="xsl/navbar.xsl" />
		<x:transform xml="${xml}" xslt="${xslt}" >
			<x:param name="username" value="${sessionScope['username']}"/>
		</x:transform>
		
		<jsp:doBody />
		
	</body>
</html>