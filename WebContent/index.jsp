<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<html>
<head>
  <title>Index</title>
</head>
<body>

<!-- Import vehicle.xml -->
<c:import var="xml" url="vehicle.xml"/>
<!-- Import vehicle.xsl -->
<c:import var="xslt" url="xsl/vehicle.xsl" />
<!-- Style xml using xsl -->
<x:transform xml="${xml}" xslt="${xslt}" />


</body>
</html>