<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:default>
	<jsp:body>
		<!-- Import vehicle.xml -->
		<c:import var="xml" url="xml/log.xml"/>
		<!-- Import vehicle.xsl -->
		<c:import var="xslt" url="xsl/log.xsl" />
		<!-- Style xml using xsl -->
		<x:transform xml="${xml}" xslt="${xslt}" />
	</jsp:body>
</t:default>