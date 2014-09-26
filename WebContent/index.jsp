<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/jquery/jquery-1.11.1.min.js"></script>
<link href="css/font-awesome/font-awesome.min.css" rel="stylesheet">

<link rel="stylesheet" href="css/jquery-ui/jquery-ui.min.css">
<link rel="stylesheet" href="css/jquery-ui/jquery-ui.structure.min.css">
<link rel="stylesheet" href="css/jquery-ui/jquery-ui.theme.min.css">
<script src="js/jquery-ui/jquery-ui.min.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Index</title>
</head>
<body>
	<div class="container">
	<h1 class="text-center">Hello World!</h1>
	<div class="form-group">
	<i class="fa fa-car"></i>
	<p>Date: <input class="form-control" type="text" id="datepicker"></p>
	</div>
	</div>
	
<t:page>

    <jsp:attribute name="header">
    	<h1>Welcome Chau</h1>
    </jsp:attribute>
    
    <jsp:attribute name="footer">
    	<p id="copyright">Copyright Test</p>
    </jsp:attribute>
    
    <jsp:body>
    	<p>Yay, welcome!</p>
    </jsp:body>
    
</t:page>
	
</body>


 <script>
  $(function() {
    $( "#datepicker" ).datepicker();
  });
  </script>

</html>
