<%@ page language="java" import="wsd.ass.*" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%
request.setAttribute(Constants.TITLE, "Test Page");
%>

<t:default>

	<jsp:body>
		<div class="jumbotron">
			<h1>Hello, world!</h1>
		  	<p>...</p>
		  	<p><a class="btn btn-primary btn-lg" role="button">Learn more</a></p>
		</div>
	</jsp:body>

</t:default>