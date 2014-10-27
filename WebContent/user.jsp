<%-- Import wsd.ass java classes --%>
<%@ page language="java" import="wsd.ass.*" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%-- Import JSP Standard Tag Libraries --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%-- Import default tag template --%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%
	// set page title to Vehicles
	request.setAttribute(Constants.TITLE, "Vehicles"); 
	// set breadcrumb navigation - Users
	request.setAttribute("breadcrumb_item", "Users");
	// link to rest outputted users xml data
	session.setAttribute("all_users", Constants.REST_USERS + "all");
%>

<t:default>
	<jsp:body>
		<!-- Import REST outputted log.xml -->
		<c:import var="data" url="${all_users}" />
		<c:import var="xslt" url="xsl/user.xsl" />
		<!-- Style xml using xsl -->
		<x:transform xml="${data}" xslt="${xslt}" />
	</jsp:body>
</t:default>