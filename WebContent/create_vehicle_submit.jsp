<%@ page import="wsd.ass.*, java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>

<%
if ((String)session.getAttribute("usertype") != "admin")
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

	// test that the string is not empty or null
	for (Map.Entry<String, String> entry : checkStrings.entrySet()) {
	    if (Validator.emptyOrNullCheck(entry.getValue())) {
	    	valid = false;
	    	request.setAttribute(entry.getKey(), entry.getKey());
	    }
	}

	//check that registration is not empty or null and has a length less than 6
	if (checkStrings.get("registration").length() > 6) {
		valid = false;
		request.setAttribute("registration", "registration");
	}

	//check that kilometres is a positive integer
	if (kilometres <= 0) {
		valid = false;
		request.setAttribute("kilometres", "kilometres");
	}

	// check that the year is larger than 1900
	if (year < 1900) {
		valid = false;
		request.setAttribute("year", "year");
	}

	// If all above checks have passed, unmarshal the xml file
	// Then add the vehicle and marshall it back in
	if (valid) {
		Vehicle vehicle = new Vehicle(checkStrings.get("registration"), checkStrings.get("type"), checkStrings.get("make"), checkStrings.get("model"), year, checkStrings.get("colour"), kilometres);
		
		
		VehicleApplication vehicleApp =  (VehicleApplication) session.getAttribute(Constants.VEHICLE_APP);
		if (vehicleApp == null) {
			vehicleApp = new VehicleApplication(); 
			vehicleApp.setFilePath(application.getRealPath(Constants.VEHICLE_XML));
			vehicleApp.unmarshall();
			session.setAttribute(Constants.VEHICLE_APP, vehicleApp);
		} else {
			vehicleApp.unmarshall();
		}
		
		vehicleApp.add(vehicle);
		request.setAttribute("message_notification", "Vehicle created successfully.");
		request.setAttribute("message_type", "success");

		request.getRequestDispatcher("vehicle_logs.jsp?vehicle=" + vehicle.getRegistration()).forward(request, response);
	} else {
		request.getRequestDispatcher("create_vehicle.jsp").forward(request, response);
	}	
}
%>