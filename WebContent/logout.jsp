<%-- Import wsd.ass java classes --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%-- Log out user --%>
<%
	// remove all session items
	session.invalidate();
	request.setAttribute("message_notification", "You have been logged out.");
	request.setAttribute("message_type", "warning");
	request.getRequestDispatcher("login.jsp").forward(request, response);
%>
