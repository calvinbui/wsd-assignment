<%@tag description="page template" pageEncoding="UTF-8"%>
<%@attribute name="navbar" fragment="true"%>
<%@attribute name="footer" fragment="true"%>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap/bootstrap.min.css"></link>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/jquery/jquery-1.11.1.min.js"></script>
<link href="css/font-awesome/font-awesome.min.css" rel="stylesheet"></link>
<link rel="stylesheet" href="css/jquery-ui/jquery-ui.min.css"></link>
<link rel="stylesheet" href="css/jquery-ui/jquery-ui.structure.min.css"></link>
<link rel="stylesheet" href="css/jquery-ui/jquery-ui.theme.min.css"></link>
<script src="js/jquery-ui/jquery-ui.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"></meta>
<meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
</head>
<body>
	<jsp:invoke fragment="navbar" />
	<jsp:doBody />
	<jsp:invoke fragment="footer" />
</body>
</html>