<%-- Import wsd.ass java classes --%>
<%@ page language="java" import="wsd.ass.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%-- Import JSP Standard Tag Libraries --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%--Import default tag template --%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%-- If username is invalid return error --%>
<%
	if (session.getAttribute("username") == null)
		response.sendRedirect("error.jsp");
	// set breadcrumb navigation - vehicle > create log
	request.setAttribute(Constants.TITLE, "Create Log");
	request.setAttribute("breadcrumb_section", "Vehicles");
	request.setAttribute("breadcrumb_link", "vehicle.jsp");
	request.setAttribute("breadcrumb_item", "Create Log");
	// pass through vehicle registration
	request.setAttribute("vehicle", request.getParameter("vehicle"));
%>

<t:default>
	<jsp:body>
		<!-- Create new log form -->
		<c:import var="xml" url="xml/create_log.xml" />
		<c:import var="xslt" url="xsl/create_log.xsl" />
		<!-- Pass through log details and log details entered by user -->
		<x:transform xml="${xml}" xslt="${xslt}">
			<x:param name="vehicle" value="${vehicle}" />
			
			<x:param name="startdate" value="${startdate}" />
			<x:param name="starttime" value="${starttime}" />
			<x:param name="endtime" value="${endtime}" />
			<x:param name="enddate" value="${enddate}" />
			<x:param name="description" value="${description}" />
			<x:param name="kilometres" value="${kilometres}" />
			
			<x:param name="start_date_display" value="${start_date_display_value}" />
			<x:param name="end_date_display" value="${end_date_display_value}" />
			<x:param name="startdate_value" value="${startdate_value}" />
			<x:param name="starttime_value" value="${starttime_value}" />
			<x:param name="endtime_value" value="${endtime_value}" />
			<x:param name="enddate_value" value="${enddate_value}" />
			<x:param name="description_value" value="${description_value}" />
			<x:param name="kilometres_value" value="${kilometres_value}" />
		</x:transform>
	</jsp:body>
</t:default>