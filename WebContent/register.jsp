<%@ page language="java" import="wsd.ass.*" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<% 
if (session.getAttribute("username") != null)
	response.sendRedirect("index.jsp");

request.setAttribute(Constants.TITLE, "Register"); 
request.setAttribute("breadcrumb_section", "");
request.setAttribute("breadcrumb_link", "");
request.setAttribute("breadcrumb_item", "");

%>

<t:default>
	<jsp:body>
		<c:import var="xml" url="xml/register.xml" />
		<c:import var="xslt" url="xsl/register.xsl" />
		<x:transform xml="${xml}" xslt="${xslt}" >
		
		</x:transform>
	</jsp:body>
</t:default>