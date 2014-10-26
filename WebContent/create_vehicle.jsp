<%@ page language="java" import="wsd.ass.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%
	request.setAttribute(Constants.TITLE, "Create Vehicle");
	request.setAttribute("breadcrumb_section", "Vehicles");
	request.setAttribute("breadcrumb_link", "vehicle.jsp");
	request.setAttribute("breadcrumb_item", "Create Vehicle");

	if ((String)session.getAttribute("usertype") != "admin")
		response.sendRedirect("error.jsp");
	session.setAttribute("section-link", "index.jsp");
	session.setAttribute("section", "Vehicles");
	session.setAttribute("item", "Create Vehicle");
%>

<t:default>
	<jsp:body>
		<!-- Import REST outputted log.xml -->
		<c:import var="xml" url="xml/create_vehicle.xml" />
		<!-- Import vehicle.xsl -->
		<c:import var="xslt" url="xsl/create_vehicle.xsl" />
		<!-- Style xml using xsl -->
		<x:transform xml="${xml}" xslt="${xslt}">
			<x:param name="registration" value="${registration}" />
			<x:param name="type" value="${type}" />
			<x:param name="make" value="${make}" />
			<x:param name="model" value="${model}" />
			<x:param name="colour" value="${colour}" />
			<x:param name="year" value="${year}" />
			<x:param name="kilometres" value="${kilometres}" />
			
			<x:param name="registration_value" value="${registration_value}" />
			<x:param name="type_value" value="${type_value}" />
			<x:param name="make_value" value="${make_value}" />
			<x:param name="model_value" value="${model_value}" />
			<x:param name="colour_value" value="${colour_value}" />
			<x:param name="year_value" value="${year_value}" />
			<x:param name="kilometres_value" value="${kilometres_value}" />
		</x:transform>
	</jsp:body>
</t:default>