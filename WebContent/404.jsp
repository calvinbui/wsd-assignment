<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:default>
	<jsp:body>
		<c:import var="xml" url="xml/404.xml" />
		<c:import var="xslt" url="xsl/404.xsl" />
		<x:transform xml="${xml}" xslt="${xslt}" />
	</jsp:body>
</t:default>