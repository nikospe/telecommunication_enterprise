<%-- 
    Document   : disapprove
    Created on : Dec 8, 2013, 12:41:28 AM
    Author     : Linosx3x
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<%
    try{
             if(!(session.getAttribute("permLevel")==null))//checks if the session variable exist so we wont have nullPointerException
                        {
                            if((Integer)session.getAttribute("permLevel")==3) {//checks if the user has the right level to access this page
    String connectionURL = "jdbc:mysql://83.212.105.20:3306/team09?user=team09&password=changeit";
    Connection connection = null;
    Statement statement = null;
    Statement statement2 = null;
    ResultSet rs = null;
    ResultSet rs2 = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    connection = DriverManager.getConnection(connectionURL);
    statement = connection.createStatement();
    statement2 = connection.createStatement();
    statement.executeUpdate("update User set waitingApp='3' where customerCode='"+Long.parseLong(request.getParameter("customerCode")) +"'");
%>
<html>
        <title>winCell</title>
        <link rel="icon" 
      href="./options1screen_files/sign.gif">
        <style>
    html {
        background-image:url('images/background.jpg');
        background-repeat:no-repeat; 
    }
    </style>
    
    <meta http-equiv="REFRESH" content="0;url=manager.jsp#openModal4"><b>
        <%} }else {
        %>
        <meta http-equiv="REFRESH" content="2;url=index.jsp"><b>
            
            <style>
    html {
        background-image:url('images/403.png');
        background-repeat:no-repeat;
    }
    </style>
    <%} %>
        </head>
            <%}catch(Exception ex){%>
            <meta http-equiv="REFRESH" content="5;url=manager.jsp">Άγνωστο λάθος συνέβη<br> <%=ex%>
        <%}%>    
    <body>
    </body>
</html>