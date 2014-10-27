<%-- Import wsd.ass java classes --%>
<%@ page language="java" import="wsd.ass.*" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%-- Import JSP Standard Tag Libraries --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%-- Import default tag template --%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%-- set page title --%>
<% request.setAttribute(Constants.TITLE, "Page Not Found"); %>


<t:default>
	<jsp:body>
		<!-- Error message -->
		<c:import var="xml" url="xml/error.xml" />
		<c:import var="xslt" url="xsl/error.xsl" />
		<x:transform xml="${xml}" xslt="${xslt}" />
	</jsp:body>
</t:default>