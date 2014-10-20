<%@ page import="wsd.ass.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>



<%

session.removeAttribute("registration");
session.removeAttribute("type");
session.removeAttribute("make");
session.removeAttribute("model");
session.removeAttribute("year");
session.removeAttribute("colour");
session.removeAttribute("kilometres");

String registration = request.getParameter("registration");
String type = request.getParameter("type");
String make = request.getParameter("make");
String model = request.getParameter("model");
String colour = request.getParameter("colour");

boolean valid = true;

int kilometres = 0;
//test if String is a valid integer
try {
	kilometres = Integer.parseInt(request.getParameter("kilometres"));
} catch (Exception e) {
	session.setAttribute("kilometres", "kilometres");
}

int year = 0;
//test if String is a valid integer
try {
	year = Integer.parseInt(request.getParameter("year"));
} catch (Exception e) {
	session.setAttribute("year", "year");
}

if (Validator.emptyOrNullCheck(registration) || registration.length() > 6) {
	valid = false;
	session.setAttribute("registration", "registration");
}
if (Validator.emptyOrNullCheck(type)) {
	valid = false;
	session.setAttribute("type", "type");
	
}
if (Validator.emptyOrNullCheck(make)) {
	valid = false;
	session.setAttribute("make", "make");	
}
if (Validator.emptyOrNullCheck(model)) {
	valid = false;
	session.setAttribute("model", "model");	
}

if (Validator.emptyOrNullCheck(colour)) {
	session.setAttribute("colour", "colour");
	valid = false;
	
}
if (kilometres < 0) {
	valid = false;
	session.setAttribute("kilometres", "kilometres");
}

if (year <1900) {
	valid = false;
	session.setAttribute("year", "year");
}

if (valid) {
	Vehicle vehicle = new Vehicle(registration, type, make, model, year, colour, kilometres);
	VehicleApplication vehicleApp = new VehicleApplication(); 
	vehicleApp.setFilePath(application.getRealPath(Constants.VEHICLE_XML));
	vehicleApp.unmarshall();
	vehicleApp.addVehicle(vehicle);
	
}
%>