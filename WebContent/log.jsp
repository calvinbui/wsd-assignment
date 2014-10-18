<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<html>
<head>
  <title>Logs</title>
</head>
<body>

<!-- Import vehicle.xml -->
<c:import var="xml" url="log.xml"/>
<!-- Import vehicle.xsl -->
<c:import var="xslt" url="xsl/log.xsl" />
<!-- Style xml using xsl -->
<x:transform xml="${xml}" xslt="${xslt}" />


</body>
</html>