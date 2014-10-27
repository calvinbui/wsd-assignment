<%-- Import wsd.ass java classes --%>
<%@ page language="java" import="wsd.ass.*" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%-- Import JSP Standard Tag Libraries --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%-- Import default tag template --%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<% 
if (session.getAttribute("username") != null)
	response.sendRedirect("index.jsp");

request.setAttribute(Constants.TITLE, "Register"); 
request.setAttribute("breadcrumb_section", "");
request.setAttribute("breadcrumb_link", "");
request.setAttribute("breadcrumb_item", "Register");

%>

<t:default>
	<jsp:body>
		<c:import var="xml" url="xml/register.xml" />
		<c:import var="xslt" url="xsl/register.xsl" />
		<x:transform xml="${xml}" xslt="${xslt}" >
			<x:param name="username" value="${username}" />
			<x:param name="password" value="${password}" />
			<x:param name="confirmpassword" value="${confirmpassword}" />
			<x:param name="firstname" value="${firstname}" />
			<x:param name="lastname" value="${lastname}" />
			
			<x:param name="username_value" value="${username_value}" />
			<x:param name="password_value" value="${password_value}" />
			<x:param name="confirmpassword_value" value="${confirmpassword_value}" />
			<x:param name="firstname_value" value="${firstname_value}" />
			<x:param name="lastname_value" value="${lastname_value}" />
		</x:transform>
	</jsp:body>
</t:default>