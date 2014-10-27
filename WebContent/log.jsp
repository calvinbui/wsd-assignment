<%-- Import wsd.ass java classes --%>
<%@ page language="java" import="java.util.*, wsd.ass.Constants"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%-- Import JSP Standard Tag Libraries --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%-- Import default tag template --%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%
	// set page title as Logs
	request.setAttribute(Constants.TITLE, "Logs");
	// set breadcrumb nagivation - Logs
	request.setAttribute("breadcrumb_item", "Logs");
	// link to rest outputted logs xml data link
	String s = Constants.REST_LOGS;
	// link to rest parameters - vehicle registration, start date and keyword
	String[] parameters = Constants.REST_PARAMETERS;
	// if 2 parameters entered combine using "&parameter="
	for (String parameter : parameters) {
		if (request.getParameter(parameter) != null)
			s += "&" + parameter + "="
					+ request.getParameter(parameter);
	}
	// set rest parameter
	session.setAttribute("REST", s);
	
%>

<t:default>
	<jsp:body>
		<!-- Import rest xml -->
		<c:import var="xml" url="${REST}" />
		<c:import var="xslt" url="xsl/log.xsl" />
		<!-- Pass through username -->
		<x:transform xml="${xml}" xslt="${xslt}">
			<x:param name="username" value="${sessionScope['username']}" />
		</x:transform>
	</jsp:body>
</t:default>