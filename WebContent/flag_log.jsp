<%@ page language="java" import="wsd.ass.*" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<% 

int i = (int)request.getAttribute("log");

LogApplication logApp = (LogApplication)application.getAttribute(Constants.LOG_APP);
if (logApp == null) {
	logApp = new LogApplication();
	String filePath = application.getRealPath(Constants.LOG_XML);
	logApp.setFilePath(filePath);
	logApp.unmarshall();
	session.setAttribute(Constants.LOG_APP, logApp);
}

logApp.hideLog(i, (String) session.getAttribute("username"));

request.setAttribute("message_notification", "Log has been flagged for deletion.");
request.setAttribute("message_type", "success");
request.getRequestDispatcher("log.jsp").forward(request, response);

%>