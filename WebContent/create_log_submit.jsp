<%@ page import="wsd.ass.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>

<%
    
String vehicle = request.getParameter("vehicle");
String driver = request.getParameter("driver");
String startdate = request.getParameter("startdate");
String enddate = request.getParameter("enddate");
String starttime = request.getParameter("starttime");
String endtime = request.getParameter("endtime");
String description = request.getParameter("description");
String kilometres = request.getParameter("kilometres");

LogApplication logApp = new LogApplication();
logApp.setFilePath("/log.xml");
logApp.unmarshall();
logApp.createLog(vehicle, driver, startdate, enddate, starttime, endtime, description, Integer.parseInt(kilometres));

%>