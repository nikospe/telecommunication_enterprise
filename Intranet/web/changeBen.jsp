<%-- 
    Document   : changeBen
    Created on : 6 Δεκ 2013, 5:27:03 μμ
    Author     : NIKOS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    String connectionURL = "jdbc:mysql://83.212.105.20:3306/team09?user=team09&password=changeit";
    Connection connection = null;
    Statement statement2 = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    connection = DriverManager.getConnection(connectionURL);
    statement2=connection.createStatement();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WinCell</title>
<link rel="icon" 
      href="./options1screen_files/sign.gif">
<style>
    html {
        background-image:url('images/background.jpg');
        background-repeat:no-repeat;  
    }
    </style>
    </head>
    <body>
        <%
                        if(!(session.getAttribute("permLevel")==null))
                        {
                            if((Integer)session.getAttribute("permLevel")==2) {
                try {
                    if(request.getParameter("beneficiary1").isEmpty()&&request.getParameter("beneficiary2").isEmpty())
                    {%>
                        <meta http-equiv="REFRESH" content="3;url=management.jsp#openModal3"><b>Δεν γίνεται να μην υπάρχει κανένας δικαιούχος
                    <%}
                    else
                    {
                    statement2.executeUpdate("Update User set beneficiary1='"+request.getParameter("beneficiary1")+"', beneficiary2='"+request.getParameter("beneficiary2")+"' WHERE customerCode='"+session.getAttribute("customerCode")+"'");%>
                    <meta http-equiv="REFRESH" content="5;url=options2screen.jsp"><b>Η αλλαγή έγινε επιτυχώς
                    <%}
        }
                catch(Exception ex){%>
                <meta http-equiv="REFRESH" content="2;url=index.jsp"><b>Συνέβη κάποιο λάθος.<br><%=ex%><br>
                <%}
        } } else {
        %>
        <meta http-equiv="REFRESH" content="2;url=index.jsp"><b>You are not authorised to view this content!
            <%} %>
            
    </body>
</html>
