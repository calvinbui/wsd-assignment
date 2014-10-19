<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<html>
<head>
  <title>Drivers</title>
</head>
<body>

<!-- Import vehicle.xml -->
<c:import var="xml" url="xml/user.xml"/>
<!-- Import vehicle.xsl -->
<c:import var="xslt" url="xsl/user.xsl" />
<!-- Style xml using xsl -->
<x:transform xml="${xml}" xslt="${xslt}" />


</body>
</html>