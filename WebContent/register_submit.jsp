<%@ page import="wsd.ass.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>



<%
//remove all previous session attributes
session.removeAttribute("username");
session.removeAttribute("password");
session.removeAttribute("confirmpassword");
session.removeAttribute("firstname");
session.removeAttribute("lastname");

//get the request parameters
String username = request.getParameter("username");
String password = request.getParameter("password");
String password2 = request.getParameter("confirmpassword");
String firstname = request.getParameter("firstname");
String lastname = request.getParameter("lastname");

boolean valid = true;

// test that the username is in email format
if(Validator.emailCheck(username)) {
	session.setAttribute("username", "username");
	valid = false;
}

// test that the firstname is in a valid name format
if(Validator.nameCheck(firstname)) {
	session.setAttribute("firstname", "firstname");
	valid = false;
} 

//test that the lasttname is in a valid name format
if(Validator.nameCheck(lastname)) {
	session.setAttribute("lastname", "lastname");
	valid = false;
}

// test that both passwords match
if(!password2.equals(password)){
	session.setAttribute("password", "password");
	session.setAttribute("confirmpassword", "confirmpassword");
	valid = false;
}

// test that the password field is not empty
if(Validator.emptyOrNullCheck(password)) {
	session.setAttribute("password", "password");
	valid = false;
}

//If all above checks have passed, unmarshal the xml file
//Then add the user and marshall it back in
if (valid) {
	User user = new User("driver", username, password, firstname, lastname); // only drivers can register, not admins
	UserApplication userApp = new UserApplication(); 
	userApp.setFilePath(application.getRealPath(Constants.USER_XML));
	userApp.unmarshall();
	userApp.add(user);
	
	response.sendRedirect("index.jsp");
}
%>