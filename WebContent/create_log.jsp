<%@ page language="java" import="wsd.ass.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%
	if (session.getAttribute("username") == null)
		response.sendRedirect("index.jsp");
	session.setAttribute("section", "Logs");
	session.setAttribute("item", "Create log");
%>

<t:default>
	<jsp:body>
		<!-- Import newlog.xml -->
		<c:import var="xml" url="xml/create_log.xml" />
		<!-- Import newlog.xsl -->
		<c:import var="xslt" url="xsl/create_log.xsl" />
		<!-- Style xml using xsl -->
		<x:transform xml="${xml}" xslt="${xslt}">
			<x:param name="username" value="${sessionScope['username']}" />
		</x:transform>
	</jsp:body>
</t:default>