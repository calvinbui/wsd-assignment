<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<!-- Import vehicle.xml -->
<c:import var="xml" url="xml/log.xml"/>
<!-- Import vehicle.xsl -->
<c:import var="xslt" url="xsl/log.xsl" />
<!-- Style xml using xsl -->
<x:transform xml="${xml}" xslt="${xslt}" />