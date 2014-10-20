<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<!-- Import newlog.xml -->
<c:import var="xml" url="xml/login.xml"/>
<!-- Import newlog.xsl -->
<c:import var="xslt" url="xsl/login.xsl" />
<!-- Style xml using xsl -->
<x:transform xml="${xml}" xslt="${xslt}" />