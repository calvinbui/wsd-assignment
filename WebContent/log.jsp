<%@ page language="java" import="java.util.*, wsd.ass.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%
request.setAttribute(Constants.TITLE, "Logs");
String s = Constants.REST_LOGS;

String[] parameters = Constants.REST_PARAMETERS;

for (String parameter : parameters) {
	if (request.getParameter(parameter) != null)
		s += "&" + parameter + "=" + request.getParameter(parameter);
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