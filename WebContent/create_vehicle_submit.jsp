<%-- Import wsd.ass java classes --%>
<%@ page import="wsd.ass.*, java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>

<%
String usertype = (String)session.getAttribute("usertype");
// if user is not an admin return error
if (!usertype.equals("admin"))
	response.sendRedirect("error.jsp");
else {
	String[] parameters = {"year", "kilometres"};
	// remove all previous session attributes
	for (String parameter: parameters) {
		request.setAttribute(parameter+"_value", request.getParameter(parameter));
	}

	// get the request parameters
	String[] strings = {"registration", "type", "make", "model", "colour"};
	Map<String, String> checkStrings = new HashMap<String, String>();
	for (String string: strings) {
		checkStrings.put(string, request.getParameter(string));
		request.setAttribute(string+"_value", request.getParameter(string));
	}

	boolean valid = true;
	
	int kilometres = Validator.convertValidInt(request.getParameter("kilometres"), session);
	
	int year = Validator.convertValidInt(request.getParameter("year"), session);
	
	String errors = "<p>There has been an error creating the vehicle<p><ul>";
	
	// test that the string is not empty or null
	for (Map.Entry<String, String> entry : checkStrings.entrySet()) {
	    if (Validator.emptyOrNullCheck(entry.getValue())) {
	    	valid = false;
	    	request.setAttribute(entry.getKey(), entry.getKey());
	    	errors += "<li>" + entry + " is empty</li>";
	    }
	}

	//check that registration is not empty or null and has a length less than 6
	if (checkStrings.get("registration").length() > 6) {
		valid = false;
		errors += "<li>Registration cannot be longer than 6 characters</li>";
		request.setAttribute("registration", "registration");
	}

	//check that kilometres is a positive integer
	if (kilometres <= 0) {
		valid = false;
		errors += "<li>Kilometres must be a number and greater than 0</li>";
		request.setAttribute("kilometres", "kilometres");
	}

	// check that the year is larger than 1900
	if (year < 1900) {
		valid = false;
		errors += "<li>Year must be greater than 1900</li>";
		request.setAttribute("year", "year");
	}
	
	VehicleApplication vehicleApp =  (VehicleApplication) session.getAttribute(Constants.VEHICLE_APP);
	if (vehicleApp == null) {
		vehicleApp = new VehicleApplication(); 
		vehicleApp.setFilePath(application.getRealPath(Constants.VEHICLE_XML));
		vehicleApp.unmarshall();
		session.setAttribute(Constants.VEHICLE_APP, vehicleApp);
	} else {
		vehicleApp.unmarshall();
	}
	
	// if vehicle registration already exists return error
	if (vehicleApp.getRegistration(checkStrings.get("registration")) != null) {
		valid = false;
		errors += "<li>Vehicle with registration already exists</li>";
		request.setAttribute("registration", "registration");
	}
	
	// If all above checks have passed, unmarshal the xml file
	// Then add the vehicle and marshall it back in
	if (valid) {
		Vehicle vehicle = new Vehicle(checkStrings.get("registration"), checkStrings.get("type"), checkStrings.get("make"), checkStrings.get("model"), year, checkStrings.get("colour"), kilometres);
				
		vehicleApp.add(vehicle);
		request.setAttribute("message_notification", "Vehicle created successfully.");
		request.setAttribute("message_type", "success");

		request.getRequestDispatcher("vehicle_logs.jsp?vehicle=" + vehicle.getRegistration()).forward(request, response);
	} else {
		errors += "</ul>";
		errors = errors.replace("=", "");
		request.setAttribute("message_type", "warning");
		request.setAttribute("message_notification", errors);
		request.getRequestDispatcher("create_vehicle.jsp").forward(request, response);
	}	
}
%>