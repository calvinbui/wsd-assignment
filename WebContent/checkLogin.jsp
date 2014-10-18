<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="wsd.ass.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Action</title>
</head>
<body>

<% String filePath = application.getRealPath("user.xml"); 

%> <jsp:useBean id="userApp" class="wsd.ass.UserApplication" scope="application"> 
<jsp:setProperty name="userApp" property="filePath" value="<%=filePath%>"/> </jsp:useBean> 

<% User user = userApp.getUsers().login(request.getParameter("username"), request.getParameter("password")); %> 

</body>
</html>