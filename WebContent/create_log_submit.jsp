<%@ page import="wsd.ass.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>



<%
//remove all previous session attributes
session.removeAttribute("startdate");
session.removeAttribute("enddate");
session.removeAttribute("starttime");
session.removeAttribute("endtime");
session.removeAttribute("invalidDates");
session.removeAttribute("description");

//get the request parameters
String vehicle = request.getParameter("vehicle"); //session.getAttribute("registration");
String driver = request.getParameter("driver"); // session.getAttribute("username")
//String startdate = request.getParameter("startdate");
String startdate = "2014-10-22";
String enddate = "2014-10-25";
String starttime = "00:00:00";
String endtime = "20:00:00";
//String enddate = request.getParameter("enddate");
//String starttime = request.getParameter("starttime");
//String endtime = request.getParameter("endtime");
String description = request.getParameter("description");


int kilometres = 0;

// test if String is a valid integer
try {
	kilometres = Integer.parseInt(request.getParameter("kilometres"));
} catch (Exception e) {
	session.setAttribute("kilometres", "kilometres");
}

boolean valid = true;


// test if the startdate is in a standard date format
if (Validator.dateCheck(startdate)) {
	session.setAttribute("startdate", "startdate");
	valid = false;
} 

//test if the enddate is in a standard date format
if (Validator.dateCheck(enddate)) {
	session.setAttribute("enddate", "enddate");
	valid = false;
}

//test if the starttime is in a standard time format
if (Validator.timeCheck(starttime)) {
	session.setAttribute("starttime", "starttime");
	valid = false;
	System.out.println("startime");
}

//test if the endtime is in a standard time format
if (Validator.timeCheck(endtime)) {
	session.setAttribute("endtime", "endtime");
	valid = false;
}

//check that the description string is not empty or null
if (Validator.emptyOrNullCheck(description)) {
	valid = false;
	session.setAttribute("description", "description");
}

//check that kilometres is a positive integer
if (kilometres <= 0) {
	session.setAttribute("kilometres", "kilometres");
	valid = false;
}

// check that the given starttime is before the endtime
if (Validator.startDateTimeBeforeEndDateTimeCheck(startdate + " " + starttime, enddate + " " + endtime)) {
	session.setAttribute("invalidDates", "invalidDates");
}

//If all above checks have passed, unmarshal the xml file
//Then add the log and marshall it back in
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