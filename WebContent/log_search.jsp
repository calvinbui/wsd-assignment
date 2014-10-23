<%@ page language="java" import="java.util.*, wsd.ass.*" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:default>
	<jsp:body>
		<!-- Import vehicle.xml -->
		<c:import var="xml" url="http://localhost:8080/wsdassignment/rest/logs?vehicleRego=HOLSS1"/>
		<!-- Import vehicle.xsl -->
		<c:import var="xslt" url="xsl/log.xsl" />
		<!-- Style xml using xsl -->
		<x:transform xml="${xml}" xslt="${xslt}" >
			<x:param name="username" value="${sessionScope['username']}"/>
		</x:transform>
	</jsp:body>
</t:default>