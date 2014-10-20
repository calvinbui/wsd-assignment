<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<!-- Import vehicle.xml -->
<c:import var="xml" url="xml/index.xml"/>

<!-- Import REST outputted log.xml -->
<c:import var="data" url="http://localhost:8080/wsdassignment/rest/logs"/>

<!-- Import vehicle.xsl -->
<c:import var="xslt" url="xsl/index.xsl" />

<!-- Style xml using xsl -->
<x:transform xml="${xml}" xslt="${xslt}" />

<x:transform xml="${data}" xslt="${xslt}" />