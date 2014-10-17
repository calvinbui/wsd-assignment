<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="create_log_submit.jsp" method="post">
<select name="vehicle">
	<option value="HOLSS1">Holden SS Ute</option>
</select>
<input name="startdate" type="text" placeholder="startdate"/>
<input name="enddate" type="text" placeholder="endate"/>
<input name="starttime" type="text" placeholder="starttime"/>
<input name="endtime" type="text" placeholder="endtime"/>
<input name="description" type="text" placeholder="description"/>
<input name="kilometres" type="text" placeholder="kilometres"/>
<input name="driver" type="text" placeholder="driver - should be automatic"/>
<input type="submit"/>
</form>
</body>
</html>