<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% String rego = request.getParameter("registration"); //session.getAttribute("registration"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body>
	
	<%
	if (rego != null) {
	%>
	
		<form action="create_log_submit.jsp" method="post">
		<select name="vehicle">
			<option value="HOLSS1">Holden SS Ute</option>
		</select>
		<input name="startdate" type="text" placeholder="startdate"/> <% if ((String) session.getAttribute("startdate") != null) {  %> Start date must be in the format YYYY-MM-DD <% } %>
		<input name="enddate" type="text" placeholder="endate"/> <% if ((String) session.getAttribute("enddate") != null) {  %> End date must be in the format YYYY-MM-DD <% } %>
		<input name="starttime" type="text" placeholder="starttime"/> <% if ((String) session.getAttribute("starttime") != null) {  %> Start time must be in the format HH:MM:SS <% } %>
		<input name="endtime" type="text" placeholder="endtime"/> <% if ((String) session.getAttribute("endtime") != null) {  %> End time must be in the format HH:MM:SS <% } %>
		<input name="description" type="text" placeholder="description"/> <% if ((String) session.getAttribute("description") != null) {  %> Please enter a valid description <% } %>
		<input name="kilometres" type="text" placeholder="kilometres"/> <% if ((String) session.getAttribute("kilometres") != null) {  %> Please enter a valid number <% } %>
		<input name="driver" type="text" placeholder="driver - should be automatic"/>
		<input type="submit"/>
		</form>
	</body>


</html>

