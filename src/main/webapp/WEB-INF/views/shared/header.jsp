<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="SITE_URL" value="${pageContext.request.contextPath}"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HRM-Project</title>
        <link href="${SITE_URL}/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="${SITE_URL}/assets/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <script src="${SITE_URL}/assets/js/jquery.min.js" type="text/javascript"></script>
        <script src="${SITE_URL}/assets/js/bootstrap.min.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container">
            <%@include file="menu.jsp" %>