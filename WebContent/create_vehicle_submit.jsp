<%@ page import="wsd.ass.*, java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>



<%
String[] parameters = {"year", "kilometres"};
// remove all previous session attributes
for (String parameter: parameters) {
	session.removeAttribute(parameter);
}

// get the request parameters
String[] strings = {"registration", "type", "make", "model", "colour"};
Map<String, String> checkStrings = new HashMap<String, String>();
for (String string: strings) {
	checkStrings.put(string, request.getParameter(string));
	session.removeAttribute(string);
}

boolean valid = true;

int kilometres = Validator.convertValidInt(request.getParameter("kilometres"), session);

int year = Validator.convertValidInt(request.getParameter("year"), session);

// test that the string is not empty or null
for (Map.Entry<String, String> entry : checkStrings.entrySet()) {
    if (Validator.emptyOrNullCheck(entry.getValue())) {
    	valid = false;
    	session.setAttribute(entry.getKey(), entry.getKey());
    }
}

//check that registration is not empty or null and has a length less than 6
if (checkStrings.get("registration").length() > 6) {
	valid = false;
	session.setAttribute("registration", "registration");
}

//check that kilometres is a positive integer
if (kilometres < 0) {
	valid = false;
	session.setAttribute("kilometres", "kilometres");
}

// check that the year is larger than 1900
if (year <1900) {
	valid = false;
	session.setAttribute("year", "year");
}

// If all above checks have passed, unmarshal the xml file
// Then add the vehicle and marshall it back in
if (valid) {
	Vehicle vehicle = new Vehicle(checkStrings.get("registration"), checkStrings.get("type"), checkStrings.get("make"), checkStrings.get("model"), year, checkStrings.get("colour"), kilometres);
	VehicleApplication vehicleApp = new VehicleApplication(); 
	vehicleApp.setFilePath(application.getRealPath(Constants.VEHICLE_XML));
	vehicleApp.unmarshall();
	vehicleApp.add(vehicle);
}
%>