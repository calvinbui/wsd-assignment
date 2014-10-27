<%-- Import wsd.ass java classes --%>
<%@ page language="java" import="wsd.ass.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%--Import JSP Standard Tag Libraries --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%-- Pass through breadcrumb navigation for index page --%>
<%
request.setAttribute(Constants.TITLE, "Home"); 
%>

<t:default>
	<jsp:body>
		<!-- Index page containing welcome message -->
		<c:import var="xml" url="xml/index.xml" />
		<c:import var="xslt" url="xsl/index.xsl" />
		<!-- Style xml using xsl -->
		<x:transform xml="${xml}" xslt="${xslt}"/>
	</jsp:body>
</t:default>