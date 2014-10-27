<%-- Import wsd.ass java classes --%>
<%@ page language="java" import="wsd.ass.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%-- Import JSP Standard Tag Libraries --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%-- Import default tag template --%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%
	// set page title as Logs for {registration}
	request.setAttribute(Constants.TITLE, "Logs for " + request.getParameter("vehicle"));
	// set breadcrumb navigation
	request.setAttribute("breadcrumb_section", "Vehicles");
	request.setAttribute("breadcrumb_link", "vehicle.jsp");
	request.setAttribute("breadcrumb_item", request.getParameter("vehicle"));
	// link to rest outputted vehicle xml data
	session.setAttribute("vehiclerego", Constants.REST_VEHICLES + request.getParameter("vehicle"));
	// link to rest outputted log xml data
	session.setAttribute("vehiclelog", Constants.REST_LOGS + "vehicleRego=" + request.getParameter("vehicle"));
%>

<t:default>
	<jsp:body>
		<!-- Import rest outputted vehicle registration xml data -->
		<c:import var="vehiclexml" url="${vehiclerego} " />
		<c:import var="vehiclexslt" url="xsl/vehiclerego.xsl" />
		<!-- Pass through username -->
		<x:transform xml="${vehiclexml}" xslt="${vehiclexslt}">
			<x:param name="username" value="${sessionScope['username']}" />
		</x:transform>
		<!-- Import rest outputted log xml data -->
		<c:import var="logxml" url="${vehiclelog}" />
		<c:import var="logxslt" url="xsl/log.xsl" />
		<!-- Pass through username -->
		<x:transform xml="${logxml}" xslt="${logxslt}">
			<x:param name="username" value="${sessionScope['username']}" />
		</x:transform>
	</jsp:body>
</t:default>