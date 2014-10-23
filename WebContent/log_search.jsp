<%@ page language="java" import="java.util.*, wsd.ass.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%
request.setAttribute(Constants.TITLE, "REST Query");
String s = "http://localhost:8080/wsdassignment/rest/logs?";

if (request.getParameter("vehicleRego") != null || request.getParameter("startDate") != null || request.getParameter("keyword") != null) {
	s += "vehicleRego=";
	if (request.getParameter("vehicleRego") != null)
		s += request.getParameter("vehicleRego");
	else
		s += "null";

	s += "&startDate=";
	if (request.getParameter("startDate") != null)
		s += request.getParameter("startDate");
	else
		s += "null";

	s += "&keyword=";
	if (request.getParameter("keyword") != null)
		s += request.getParameter("keyword");
	else
		s += "null";
}

session.setAttribute("REST", s);
%>

<t:default>
	<jsp:body>
		<!-- Import rest xml -->
		<c:import var="xml" url="${REST}" />
		<!-- Import log.xsl -->
		<c:import var="xslt" url="xsl/log.xsl" />
		<!-- Style xml using xsl -->
		<x:transform xml="${xml}" xslt="${xslt}">
			<x:param name="username" value="${sessionScope['username']}" />
		</x:transform>
	</jsp:body>
</t:default>