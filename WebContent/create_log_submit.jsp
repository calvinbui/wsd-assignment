<%@ page import="wsd.ass.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>



<%

session.removeAttribute("starttime");
session.removeAttribute("endtime");

String vehicle = request.getParameter("vehicle"); //session.getAttribute("registration");
String driver = request.getParameter("driver"); // session.getAttribute("username")
String startdate = request.getParameter("startdate");
String enddate = request.getParameter("enddate");
String starttime = request.getParameter("starttime");
String endtime = request.getParameter("endtime");
String description = request.getParameter("description");

Validator validator = new Validator();

int kilometres = 0;

// test if String is a valid integer
try {
	kilometres = Integer.parseInt(request.getParameter("kilometres"));
} catch (Exception e) {
	session.setAttribute("kilometres", "kilometres");
}

boolean valid = true;



if (validator.emptyOrNullCheck(startdate)) {
	session.setAttribute("startdate", "startdate");
	valid = false;
} 

if (validator.emptyOrNullCheck(enddate)) {
	session.setAttribute("enddate", "enddate");
	valid = false;
}

if (validator.timeCheck(starttime)) {
	session.setAttribute("starttime", "starttime");
	valid = false;
}

if (validator.timeCheck(endtime)) {
	session.setAttribute("endtime", "endtime");
	valid = false;
}

if (validator.emptyOrNullCheck(description)) {
	valid = false;
	session.setAttribute("description", "description");
}

if (kilometres <= 0) {
	session.setAttribute("kilometres", "kilometres");
	valid = false;
}

if (valid) {
	Log log = new Log(vehicle, driver, startdate, enddate, starttime, endtime, description, kilometres);
	LogApplication logApp = new LogApplication();
	logApp.setFilePath(application.getRealPath("/log.xml"));
	logApp.unmarshall();
	logApp.createLog(log);

	VehicleApplication vehicleApp = new VehicleApplication();
	vehicleApp.setFilePath(application.getRealPath("/vehicle.xml"));
	vehicleApp.unmarshall();
	vehicleApp.updateKilometres(kilometres, vehicle);	
}
%>