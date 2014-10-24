<%@ page language="java" import="wsd.ass.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%
request.setAttribute(Constants.TITLE, "Home"); 
%>

<t:default>
	<jsp:body>
		<!-- Import REST outputted index.xml -->
		<c:import var="xml" url="xml/index.xml" />
		<!-- Import index.xsl -->
		<c:import var="xslt" url="xsl/index.xsl" />
		<!-- Style xml using xsl -->
		<x:transform xml="${xml}" xslt="${xslt}"/>
	</jsp:body>
</t:default>