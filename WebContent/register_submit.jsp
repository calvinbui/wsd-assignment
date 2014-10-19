<%@ page import="wsd.ass.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>



<%

session.removeAttribute("username");
session.removeAttribute("password");
session.removeAttribute("confirmpassword");
session.removeAttribute("firstname");
session.removeAttribute("lastname");

String username = request.getParameter("username");
String password = request.getParameter("password");
String password2 = request.getParameter("confirmpassword");
String firstname = request.getParameter("firstname");
String lastname = request.getParameter("lastname");

boolean valid = true;

if(Validator.emailCheck(username)) {
	session.setAttribute("username", "username");
	valid = false;
}

if(Validator.nameCheck(firstname)) {
	session.setAttribute("firstname", "firstname");
	valid = false;
} 

if(Validator.nameCheck(lastname)) {
	session.setAttribute("lastname", "lastname");
	valid = false;
}

if(!password2.equals(password)){
	session.setAttribute("password", "password");
	session.setAttribute("confirmpassword", "confirmpassword");
	valid = false;
}

if(Validator.emptyOrNullCheck(password)) {
	session.setAttribute("password", "password");
	valid = false;
}

if (valid) {
	User user = new User("driver", username, password, firstname, lastname); // only drivers can register, not admins
	UserApplication userApp = new UserApplication(); 
	userApp.setFilePath(application.getRealPath(Constants.USER_XML));
	userApp.unmarshall();
	userApp.addUser(user);
	
	response.sendRedirect("index.jsp");
}
%>