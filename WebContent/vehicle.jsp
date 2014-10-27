<%-- Import wsd.ass java classes --%>
<%@ page language="java" import="wsd.ass.*" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%-- Import JSP Standard Tag Libraries --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%--Import default tag template --%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<% 
	// set page title as Vehicles
	request.setAttribute(Constants.TITLE, "Vehicles"); 
	// set breadcrumb section to Vehicles
	request.setAttribute("breadcrumb_item", "Vehicles");
	// add rest outputted vehicles xml data link
	session.setAttribute("all_vehicles", Constants.REST_VEHICLES + "all");
%>

<t:default>
	<jsp:body>
		<!-- Vehicle details in table layout -->
		<c:import var="xml" url="${all_vehicles}" />
		<c:import var="xslt" url="xsl/vehicle.xsl" />
		<!-- Pass through username and usertype -->
		<x:transform xml="${xml}" xslt="${xslt}" >
			<x:param name="username" value="${sessionScope['username']}" />
			<x:param name="usertype" value="${sessionScope['usertype']}" />
		</x:transform>
	</jsp:body>
</t:default>