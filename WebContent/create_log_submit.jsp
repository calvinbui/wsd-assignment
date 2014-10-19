<%@ page import="wsd.ass.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>



<%

session.removeAttribute("startdate");
session.removeAttribute("enddate");
session.removeAttribute("starttime");
session.removeAttribute("endtime");
session.removeAttribute("invalidDates");
session.removeAttribute("description");


String vehicle = request.getParameter("vehicle"); //session.getAttribute("registration");
String driver = request.getParameter("driver"); // session.getAttribute("username")
String startdate = request.getParameter("startdate");
String enddate = request.getParameter("enddate");
String starttime = request.getParameter("starttime");
String endtime = request.getParameter("endtime");
String description = request.getParameter("description");


int kilometres = 0;

// test if String is a valid integer
try {
	kilometres = Integer.parseInt(request.getParameter("kilometres"));
} catch (Exception e) {
	session.setAttribute("kilometres", "kilometres");
}

boolean valid = true;



if (Validator.dateCheck(startdate)) {
	session.setAttribute("startdate", "startdate");
	valid = false;
} 

if (Validator.dateCheck(enddate)) {
	session.setAttribute("enddate", "enddate");
	valid = false;
}

if (Validator.timeCheck(starttime)) {
	session.setAttribute("starttime", "starttime");
	valid = false;
}

if (Validator.timeCheck(endtime)) {
	session.setAttribute("endtime", "endtime");
	valid = false;
}

if (Validator.emptyOrNullCheck(description)) {
	valid = false;
	session.setAttribute("description", "description");
}

if (kilometres <= 0) {
	session.setAttribute("kilometres", "kilometres");
	valid = false;
}

if (Validator.startDateTimeBeforeEndDateTimeCheck(startdate + " " + starttime, enddate + " " + endtime)) {
	session.setAttribute("invalidDates", "invalidDates");
}

if (valid) {
	Log log = new Log(vehicle, driver, startdate, enddate, starttime, endtime, description, kilometres);
	LogApplication logApp = new LogApplication();
	logApp.setFilePath(application.getRealPath(Constants.LOG_XML));
	logApp.unmarshall();
	logApp.add(log);

	VehicleApplication vehicleApp = new VehicleApplication();
	vehicleApp.setFilePath(application.getRealPath(Constants.VEHICLE_XML));
	vehicleApp.unmarshall();
	vehicleApp.updateKilometres(kilometres, vehicle);	
}
%>