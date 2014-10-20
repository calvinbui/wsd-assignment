<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/bootstrap/bootstrap.min.css"></link>
<script src="js/jquery/jquery-1.11.1.min.js"></script>
<link href="css/font-awesome/font-awesome.min.css" rel="stylesheet"></link>
<link rel="stylesheet" href="css/jquery-ui/jquery-ui.min.css"></link>
<link rel="stylesheet" href="css/jquery-ui/jquery-ui.structure.min.css"></link>
<link rel="stylesheet" href="css/jquery-ui/jquery-ui.theme.min.css"></link>
<script src="js/jquery-ui/jquery-ui.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"></meta>
<meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!-- Import newlog.xml -->
		<c:import var="xml" url="xml/nb.xml"/>
		<!-- Import newlog.xsl -->
		<c:import var="xslt" url="xsl/nb.xsl" />
		<!-- Style xml using xsl -->
		<x:transform xml="${xml}" xslt="${xslt}" />
</body>
</html>