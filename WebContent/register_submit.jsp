<%@ page import="wsd.ass.*, java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>



<%

//get the request parameters
String[] parameters = {"username", "password", "confirmpassword", "firstname", "lastname"};

for (String parameter: parameters) {
	request.setAttribute(parameter+"_value", request.getParameter(parameter));
}

boolean valid = true;

// test that the username is in email format
if(Validator.emailCheck(request.getParameter("username"))) {
	request.setAttribute("username", "username");
	valid = false;
}

// test that the firstname is in a valid name format
if(Validator.nameCheck(request.getParameter("firstname"))) {
	request.setAttribute("firstname", "firstname");
	valid = false;
} 

//test that the lasttname is in a valid name format
if(Validator.nameCheck(request.getParameter("lastname"))) {
	request.setAttribute("lastname", "lastname");
	valid = false;
}

// test that both passwords match
if(!request.getParameter("confirmpassword").equals(request.getParameter("password"))){
	request.setAttribute("confirmpassword", "confirmpassword");
	valid = false;
}

// test that the password field is not empty
if(Validator.emptyOrNullCheck(request.getParameter("password"))) {
	request.setAttribute("password", "password");
	valid = false;
}

//If all above checks have passed, unmarshal the xml file
//Then add the user and marshall it back in
if (valid) {
	// only drivers can register, not admins
	User user = new User("driver", request.getParameter("username"), request.getParameter("password"), request.getParameter("firstname"), request.getParameter("lastname"));
	
	UserApplication userApp =  (UserApplication) session.getAttribute(Constants.USER_APP);
	if (userApp == null) {
		userApp = new UserApplication();
		userApp.setFilePath(application.getRealPath(Constants.USER_XML));
		userApp.unmarshall();
		session.setAttribute(Constants.USER_APP, userApp);
	} else {
		userApp.unmarshall();
	}
	
	userApp.add(user);
	
	session.setAttribute("username", user.getUsername());
	session.setAttribute("usertype", user.getType());
	request.setAttribute("message_notification", "Registration successful. You have been logged in.");
	request.setAttribute("message_type", "success");

	request.getRequestDispatcher("index.jsp").forward(request, response);
} else {
	request.getRequestDispatcher("register.jsp").forward(request, response);
}
%>