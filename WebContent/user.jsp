<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%
	session.setAttribute("section", "");
	session.setAttribute("item", "Drivers");
%>

<t:default>
	<jsp:body>
		<!-- Import REST outputted log.xml -->
		<c:import var="data" url="xml/user.xml" />
		<!-- Import vehicle.xsl -->
		<c:import var="xslt" url="xsl/user.xsl" />
		<!-- Style xml using xsl -->
		<x:transform xml="${data}" xslt="${xslt}" />
	</jsp:body>
</t:default>