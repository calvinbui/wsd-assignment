<%@ page language="java" import="wsd.ass.*" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%
	request.setAttribute(Constants.TITLE, "PAGE TITLE");
%>

<t:default>
	<jsp:body>
		<c:import var="xml" url="xml/.xml" />
		<c:import var="xslt" url="xsl/.xsl" />
		<x:transform xml="${xml}" xslt="${xslt}" >
			<!--<x:param name="result" value="${result}"/>-->
		</x:transform>
	</jsp:body>
</t:default>