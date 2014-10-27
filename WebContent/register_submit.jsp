<%-- Import wsd.ass java classes --%>
<%@ page import="wsd.ass.*, java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>

<%

// get the request parameters
String[] parameters = {"username", "password", "confirmpassword", "firstname", "lastname"};

for (String parameter: parameters) {
	request.setAttribute(parameter+"_value", request.getParameter(parameter));
}

boolean valid = true;
String errors = "<p>There has been an error registering<p><ul>";

// test that the username is in email format
if(Validator.emailCheck(request.getParameter("username"))) {
	request.setAttribute("username", "username");
	valid = false;
	errors += "<li>EMail must be in format <i>username@[subdomain.]*.domain.gtld</i></li>";
}

// test that the firstname is in a valid name format
if(Validator.nameCheck(request.getParameter("firstname"))) {
	request.setAttribute("firstname", "firstname");
	valid = false;
	errors += "<li>First Name is invalid</li>";
} 

//test that the lasttname is in a valid name format
if(Validator.nameCheck(request.getParameter("lastname"))) {
	request.setAttribute("lastname", "lastname");
	valid = false;
	errors += "<li>Last name is invalid</li>";
}

// test that both passwords match
if(!request.getParameter("confirmpassword").equals(request.getParameter("password"))){
	request.setAttribute("confirmpassword", "confirmpassword");
	valid = false;
	errors += "<li>Passwords do not match</li>";
}

// test that the password field is not empty
if(Validator.emptyOrNullCheck(request.getParameter("password"))) {
	request.setAttribute("password", "password");
	valid = false;
	errors += "<li>Password is empty</li>";
}

// create a new user application dao or grab from session
UserApplication userApp =  (UserApplication) session.getAttribute(Constants.USER_APP);
if (userApp == null) {
	userApp = new UserApplication();
	userApp.setFilePath(application.getRealPath(Constants.USER_XML));
	userApp.unmarshall();
	session.setAttribute(Constants.USER_APP, userApp);
} else {
	userApp.unmarshall();
}

// if user already exists
if (userApp.userExists(request.getParameter("username"))) {
	valid = false;
	request.setAttribute("username", "username");
	errors += "<li>Email already registered</li>";
}

//If all above checks have passed, unmarshal the xml file
//Then add the user and marshall it back in
if (valid) {
	// only drivers can register, not admins
	User user = new User("driver", request.getParameter("username"), request.getParameter("password"), request.getParameter("firstname"), request.getParameter("lastname"));
	
	userApp.add(user);
	// store user into the session
	session.setAttribute("username", user.getUsername());
	session.setAttribute("usertype", user.getType());
	// notification
	request.setAttribute("message_notification", "Registration successful. You have been logged in.");
	request.setAttribute("message_type", "success");

	request.getRequestDispatcher("index.jsp").forward(request, response);
} else {
	errors += "</ul>";
	// notification
	request.setAttribute("message_type", "warning");
	request.setAttribute("message_notification", errors);
	request.getRequestDispatcher("register.jsp").forward(request, response);
}
%>