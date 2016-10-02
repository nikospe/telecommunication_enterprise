<%-- 
    Document   : deleting
    Created on : 6 Δεκ 2013, 12:59:23 μμ
    Author     : NIKOS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
<%
    String connectionURL = "jdbc:mysql://83.212.105.20:3306/team09?user=team09&password=changeit";
    Connection connection = null;
    Statement statement = null;
    ResultSet rs = null;
    
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    connection = DriverManager.getConnection(connectionURL);
    statement = connection.createStatement();
    if(!(session.getAttribute("permLevel")==null))
                        {
                            if((Integer)session.getAttribute("permLevel")==2) {
    try{
    int status2=statement.executeUpdate("DELETE FROM Acount WHERE customerCode = '"+session.getAttribute("customerCode")+"'");
    }
            catch (com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException ex)
            {
int status=statement.executeUpdate("DELETE FROM User WHERE customerCode = '"+session.getAttribute("customerCode")+"'");
}
            catch (Exception ex){%>
                <meta http-equiv="REFRESH" content="2;url=options2screen.jsp">Άγνωστο λάθος συνέβη.<%=ex%>
<%}%>
    <meta http-equiv="REFRESH" content="0;url=options1screen.htm#openModal">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WinCell</title>
<link rel="icon" 
      href="./options1screen_files/sign.gif">
<style>
    html {
        background-image:url('images/background.jpg');
        background-repeat:no-repeat;
        color: #ffffff;  
    }
    </style>

<% }}else {%>
<style>
    html {
        background-image:url('images/403.png');
        background-repeat:no-repeat;
        color: #ffffff;  
    }
    </style><%}%>
            </head>
    <body>                   
        <meta http-equiv="REFRESH" content="2;url=index.jsp">
    
    </body>
</html>