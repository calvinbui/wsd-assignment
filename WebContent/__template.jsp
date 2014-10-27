<%-- JSP structure and layout template --%>
<%@ page language="java" import="wsd.ass.*" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%-- Import JSP standard tag libraries --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%-- Import JSP default tag library --%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%-- Pass values using request.setAttribute --%>
<%-- Set breadcrumb path for each jsp page --%>
<% 
request.setAttribute(Constants.TITLE, "PAGE TITLE"); 
request.setAttribute("breadcrumb_section", "");
request.setAttribute("breadcrumb_link", "");
request.setAttribute("breadcrumb_item", "");

%>
<%-- Structure of xml and xsl imports and transformation --%>
<t:default>
	<jsp:body>
		<c:import var="xml" url="xml/.xml" />
		<c:import var="xslt" url="xsl/.xsl" />
		<x:transform xml="${xml}" xslt="${xslt}" >
			<!--<x:param name="result" value="${result}"/>-->
		</x:transform>
	</jsp:body>
</t:default>