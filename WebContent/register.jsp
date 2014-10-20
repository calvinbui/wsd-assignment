<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
</head>
<body>
	<form action="register_submit.jsp" method="post">
	<input name="username" type="text" placeholder="username"/>  <% if ((String) session.getAttribute("username") != null) {  %> Please enter a valid email address <% } %>
	<input name="password" type="text" placeholder="password"/>  <% if ((String) session.getAttribute("password") != null) {  %> Please enter a valid password <% } %>
	<input name="confirmpassword" type="text" placeholder="confirmpassword"/>  <% if ((String) session.getAttribute("confirmpassword") != null) {  %> Please enter a valid password that matches the above password <% } %>
	<input name="firstname" type="text" placeholder="firstname"/>  <% if ((String) session.getAttribute("firstname") != null) {  %> Please enter your first name <% } %>
	<input name="lastname" type="text" placeholder="lastname"/>  <% if ((String) session.getAttribute("lastname") != null) {  %> Please enter your last name <% } %>
	<input type="submit">
	</form>
</body>
</html>