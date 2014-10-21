<%@ page import="wsd.ass.*" language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	UserApplication userApp =  (UserApplication) session.getAttribute(Constants.USER_APP);
	if (userApp == null) {
		userApp = new UserApplication();
		userApp.setFilePath(application.getRealPath(Constants.USER_XML));
		userApp.unmarshall();
		session.setAttribute(Constants.USER_APP, userApp);
	}
	
	User user = userApp.login(request.getParameter("Username"), request.getParameter("Password"));
	
	if (user == null) {
		request.setAttribute("result", "Login Incorrect. Please try again.");
		request.getRequestDispatcher("login.jsp").forward(request, response);
	} else {
		session.setAttribute("username", user.getUsername());
		response.sendRedirect("index.jsp");
	}
%>
