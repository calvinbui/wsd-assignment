<%@ page language="java" import="wsd.ass.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%
	request.setAttribute(Constants.TITLE,
			"Logs for " + request.getParameter("vehicle"));
	session.setAttribute("section", "Vehicles");
	session.setAttribute("section-link", "index.jsp");
	session.setAttribute("item", request.getParameter("vehicle"));

	session.setAttribute("vehiclerego", Constants.REST_VEHICLES
			+ request.getParameter("vehicle"));

	session.setAttribute("vehiclelog", Constants.REST_LOGS
			+ "vehicleRego=" + request.getParameter("vehicle"));
%>

<t:default>
	<jsp:body>
		<c:import var="vehiclexml" url="${vehiclerego} " />
		<c:import var="vehiclexslt" url="xsl/vehiclerego.xsl" />
		<x:transform xml="${vehiclexml}" xslt="${vehiclexslt}" />
	
		<c:import var="logxml" url="${vehiclelog}" />
		<c:import var="logxslt" url="xsl/log.xsl" />
		<x:transform xml="${logxml}" xslt="${logxslt}">
		</x:transform>
	</jsp:body>
</t:default>