<%@ page import="wsd.ass.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
 <%@ page import="java.util.*" %>



<%
// remove all previous session attributes
session.removeAttribute("registration");
session.removeAttribute("type");
session.removeAttribute("make");
session.removeAttribute("model");
session.removeAttribute("year");
session.removeAttribute("colour");
session.removeAttribute("kilometres");

// get the request parameters
Map<String, String> checkStrings = new HashMap<String, String>();
checkStrings.put("registration", request.getParameter("registration"));
checkStrings.put("type", request.getParameter("type"));
checkStrings.put("make", request.getParameter("make"));
checkStrings.put("model", request.getParameter("model"));
checkStrings.put("colour", request.getParameter("colour"));

boolean valid = true;

int kilometres = 0;
//test if kilometres is a valid integer
try {
	kilometres = Integer.parseInt(request.getParameter("kilometres"));
} catch (Exception e) {
	session.setAttribute("kilometres", "kilometres");
}

int year = 0;
//test if year is a valid integer
try {
	year = Integer.parseInt(request.getParameter("year"));
} catch (Exception e) {
	session.setAttribute("year", "year");
}

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