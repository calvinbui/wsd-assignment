<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:default>
    <jsp:body>
		<!-- Import vehicle.xsl <c:import var="xml" url="log.xml" />-->
		<c:import var="xml" url="header.xml" />
		<c:import var="xslt" url="xsl/header.xsl" />
		<!-- Style xml using xsl -->
		<x:transform xslt="${xslt}" />
    </jsp:body>
</t:default>