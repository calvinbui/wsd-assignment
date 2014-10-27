<%-- Import wsd.ass java classes --%>
<%@ page import="wsd.ass.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>

<%
// if user is invalid return error message
if (session.getAttribute("username") == null)
	response.sendRedirect("error.jsp");
// if user is valid return log parameters
else {
	String[] parameters = { "startdate", "enddate", "starttime", "start_date_display", "end_date_display" , "endtime", "description", "kilometres" };
	for (String parameter: parameters)
		request.setAttribute(parameter+"_value", request.getParameter(parameter));

	// get the request parameters
	String startdate = request.getParameter("startdate");
	String enddate = request.getParameter("enddate");
	String starttime = request.getParameter("starttime");
	String endtime = request.getParameter("endtime");
	String description = request.getParameter("description");
	int kilometres = Validator.convertValidInt(request.getParameter("kilometres"), session);

	boolean valid = true;
	
	String errors = "<p>There has been an error creating the log entry<p><ul>";

	// test if the startdate is in a standard date format
	if (Validator.dateCheck(startdate)) {
		request.setAttribute("startdate", "startdate");
		valid = false;
		errors += "<li>Start Date has to be in DD/MM/YYYY format</li>";
	} 

	// test if the enddate is in a standard date format
	if (Validator.dateCheck(enddate)) {
		request.setAttribute("enddate", "enddate");
		errors += "<li>End Date has to be in DD/MM/YYYY format</li>";
		valid = false;
	}

	// test if the starttime is in a standard time format
	if (Validator.timeCheck(starttime)) {
		request.setAttribute("starttime", "starttime");
		valid = false;
		errors += "<li>Start Time must be in HH:MM:SS format</li>";
	}

	// test if the endtime is in a standard time format
	if (Validator.timeCheck(endtime)) {
		request.setAttribute("endtime", "endtime");
		valid = false;
		errors += "<li>End Time must be in HH:MM:SS format</li>";
	}

	// check that the description string is not empty or null
	if (Validator.emptyOrNullCheck(description)) {
		valid = false;
		request.setAttribute("description", "description");
		errors += "<li>Description is empty</li>";
	}

	// check that kilometres is a positive integer
	if (kilometres <= 0) {
		valid = false;
		request.setAttribute("kilometres", "kilometres");
		errors += "<li>Kilometres must be a number and greater than 0</li>";
	}

	// check that the given starttime is before the endtime
	if (Validator.startDateTimeBeforeEndDateTimeCheck(startdate + " " + starttime, enddate + " " + endtime)) {
		request.setAttribute("invalidDates", "invalidDates");
		errors += "<li>Start Date/Time must be before End Date/Time </li>";
		valid = false;
	}

	// If all above checks have passed, unmarshal the xml file
	// Then add the log and marshall it back in
	if (valid) {
		Log log = new Log(request.getParameter("vehicle"), (String)session.getAttribute("username"), startdate, enddate, starttime, endtime, description, kilometres);	
		
		LogApplication logApp = (LogApplication)session.getAttribute(Constants.LOG_APP);
		if (logApp == null) {
			logApp = new LogApplication();
			String filePath = application.getRealPath(Constants.LOG_XML);
			logApp.setFilePath(filePath);
			logApp.unmarshall();
			session.setAttribute(Constants.LOG_APP, logApp);
		} else {
			logApp.unmarshall();
		}
		
		VehicleApplication vehicleApp = (VehicleApplication)session.getAttribute(Constants.VEHICLE_XML);
		if (vehicleApp == null) {
			vehicleApp = new VehicleApplication();
			String filePath = application.getRealPath(Constants.VEHICLE_XML);
			vehicleApp.setFilePath(filePath);
			vehicleApp.unmarshall();
			session.setAttribute(Constants.VEHICLE_APP, vehicleApp);
		} else {
			vehicleApp.unmarshall();
		}

		logApp.add(log);
		vehicleApp.updateKilometres(kilometres, request.getParameter("vehicle"));
		response.sendRedirect("vehicle_logs.jsp?vehicle=" + request.getParameter("vehicle"));
		
	// log is not valid return validation error notification
	} else {
		errors += "</ul>";
		request.setAttribute("message_type", "warning");
		request.setAttribute("message_notification", errors);
		request.getRequestDispatcher("create_log.jsp").forward(request, response);
	}	
}
%>