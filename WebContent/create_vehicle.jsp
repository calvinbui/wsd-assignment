<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Vehicle</title>
</head>
<body>
	<form action="create_vehicle_submit.jsp" method="post">
	<input name="registration" type="text" placeholder="registration"/>  <% if ((String) session.getAttribute("registration") != null) {  %> Please enter a valid registration number <% } %>
	<input name="type" type="text" placeholder="type"/>  <% if ((String) session.getAttribute("type") != null) {  %> Please enter a type <% } %>
	<input name="make" type="text" placeholder="make"/>  <% if ((String) session.getAttribute("make") != null) {  %> Please enter a make <% } %>
	<input name="model" type="text" placeholder="model"/>  <% if ((String) session.getAttribute("model") != null) {  %> Please enter a model <% } %>
	<input name="year" type="text" placeholder="year"/>  <% if ((String) session.getAttribute("year") != null) {  %> Please enter a year <% } %>
	<input name="colour" type="text" placeholder="colour"/>  <% if ((String) session.getAttribute("colour") != null) {  %> Please enter a colour <% } %>
	<input name="kilometres" type="text" placeholder="kilometres"/>  <% if ((String) session.getAttribute("kilometres") != null) {  %> Please enter kilometres <% } %>
	<input type="submit">
	</form>
</body>
</html>