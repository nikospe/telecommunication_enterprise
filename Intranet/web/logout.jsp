<%-- 
    Document   : logout
    Created on : 5 Δεκ 2013, 2:39:34 μμ
    Author     : NIKOS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
    html {
        background-image:url('images/background.jpg');
        background-repeat:no-repeat;
        color: #ffffff;  
    }
    </style>
    </head>
    <body>
        <%session.invalidate();%>
        <meta http-equiv="REFRESH" content="0;url=index.jsp">
    </body>
</html>
