<%-- Import wsd.ass java classes --%>
<%@ page language="java" import="wsd.ass.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%-- Import JSP Standard Tag Libraries --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%-- Import default tag template --%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%
	// test that user is logged in
	if (session.getAttribute("username") != null)
		response.sendRedirect("index.jsp");
	// set breadcrumb navigation - Login
	request.setAttribute("breadcrumb_item", "Login");
	// set page title to Login
	request.setAttribute(Constants.TITLE, "Login");
%>

<t:default>
	<jsp:body>
		<!-- Import login form -->
		<c:import var="xml" url="xml/login.xml" />
		<c:import var="xslt" url="xsl/login.xsl" />
		<x:transform xml="${xml}" xslt="${xslt}"/>
	</jsp:body>
</t:default>