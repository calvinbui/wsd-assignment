<%@ page import="wsd.ass.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>



<%

String username = request.getParameter("enddate");
String password = request.getParameter("starttime");
String firstname = request.getParameter("endtime");
String lastname = request.getParameter("description");

Validator validator = new Validator();

boolean valid = true;

if (valid) {
	User user = new User("driver", username, password, firstname, lastname); // only drivers can register, not admins
	UserApplication userApp = new UserApplication(); 
	userApp.setFilePath(application.getRealPath(Constants.USER_XML));
	userApp.unmarshall();
	userApp.addUser(user);
	
	response.sendRedirect("index.jsp");
}
%>