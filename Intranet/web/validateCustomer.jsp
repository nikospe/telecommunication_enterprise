<%-- 
    Document   : validateCustomer
    Created on : 5 Δεκ 2013, 4:19:05 μμ
    Author     : NIKOS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String connectionURL = "jdbc:mysql://83.212.105.20:3306/team09?user=team09&password=changeit";
    Connection connection = null;
    Statement statement = null;
    ResultSet rs = null;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>winCell</title>
        <link rel="icon" 
      href="./options1screen_files/sign.gif">
        <style>
    html {
        background-image:url('images/background.jpg');
        background-repeat:no-repeat;
        color: #ffffff;  
    }
    </style>

        <%
    try{
                        if(!(session.getAttribute("permLevel")==null))
                        {
                            if((Integer)session.getAttribute("permLevel")==2) {
                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                connection = DriverManager.getConnection(connectionURL);
                                statement = connection.createStatement();
                                String code=request.getParameter("customerCode");
                                rs = statement.executeQuery("SELECT * FROM User WHERE customerCode='" + code + "'");
                                if(rs.next())
                                {
                                    session.setAttribute("customerCode", code);%>
                                    <meta http-equiv="REFRESH" content="0;url=options2screen.jsp">
                               <% }
                                else{%>
                                    <meta http-equiv="REFRESH" content="5;url=options1screen.htm">Ο κωδικός χρήστη δεν βρέθηκε.
                                <%}}}
                        else{%>
                        <style>
    html {
        background-image:url('images/403.png');
        background-repeat:no-repeat;
        color: #ffffff;  
    }
    </style>
                          <meta http-equiv="REFRESH" content="3;url=index.jsp">
                        <%}
                            }
    catch(Exception ex){%>
                                    <meta http-equiv="REFRESH" content="5;url=options1screen.htm">Άγνωστο λάθος συνέβη.
                                   <% }
        %>
            </head>
    <body>
    </body>
</html>
