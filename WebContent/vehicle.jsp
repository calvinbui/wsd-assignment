<%@ page language="java" import="wsd.ass.*" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<% 
request.setAttribute(Constants.TITLE, "Vehicles"); 
request.setAttribute("breadcrumb_item", "Vehicles");

session.setAttribute("all_vehicles", Constants.REST_VEHICLES + "all");
%>

<t:default>
	<jsp:body>
		<c:import var="xml" url="${all_vehicles}" />
		<c:import var="xslt" url="xsl/vehicle.xsl" />
		<x:transform xml="${xml}" xslt="${xslt}" >
			<x:param name="username" value="${sessionScope['username']}" />
			<x:param name="usertype" value="${sessionScope['usertype']}" />
		</x:transform>
	</jsp:body>
</t:default>