<%-- Import wsd.ass java classes --%>
<%@ page language="java" import="wsd.ass.*, java.util.*" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<% 
	if (session.getAttribute("username") == null)
		response.sendRedirect("error.jsp");
	// get log element
	int i = Integer.parseInt(request.getParameter("log"));
	// link to LogApplication java
	LogApplication logApp = (LogApplication)session.getAttribute(Constants.LOG_APP);
	
	if (logApp == null) {
		logApp = new LogApplication();
		// link to xml/log.xml
		String filePath = application.getRealPath(Constants.LOG_XML);
		logApp.setFilePath(filePath);
		logApp.unmarshall();
		session.setAttribute(Constants.LOG_APP, logApp);
	} else {
		logApp.unmarshall();
	}
	
	logApp.hideLog(i, (String) session.getAttribute("username"));
	// set notification message and message type
	request.setAttribute("message_notification", "Log has been flagged for deletion.");
	request.setAttribute("message_type", "success");
	request.getRequestDispatcher("log.jsp").forward(request, response);

%>