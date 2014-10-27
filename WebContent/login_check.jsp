<%-- Import wsd.ass java classes --%>
<%@ page import="wsd.ass.*" language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	// link to UserApplication java
	UserApplication userApp =  (UserApplication) session.getAttribute(Constants.USER_APP);
	if (userApp == null) {
		userApp = new UserApplication();
		userApp.setFilePath(application.getRealPath(Constants.USER_XML));
		userApp.unmarshall();
		session.setAttribute(Constants.USER_APP, userApp);
	} else {
		userApp.unmarshall();
	}
	// get username and password parameters
	User user = userApp.login(request.getParameter("Username"), request.getParameter("Password"));
	// test that user is valid
	if (user == null) {
		request.setAttribute("message_notification", "Login Incorrect. Please try again.");
		request.setAttribute("message_type", "danger");
		request.getRequestDispatcher("login.jsp").forward(request, response);
	} else {
		session.setAttribute("username", user.getUsername());
		session.setAttribute("usertype", user.getType());
		request.setAttribute("message_notification", "You are now logged in.");
		request.setAttribute("message_type", "success");
		request.getRequestDispatcher("vehicle.jsp").forward(request, response);
	}
%>
