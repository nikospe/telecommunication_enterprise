<%-- 
   Document   : newjsp
   Created on : Dec 11, 2012, 2:04:15 PM
   Author     : it21025
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
        <title>WinCell</title>
            <style>
    html {
        background-image:url('images/background.jpg');
        background-repeat:no-repeat; 
    }
    </style>

        <%
            try {
                String name =request.getParameter("username");
                String password = request.getParameter("password");
                int perm;
                boolean find = false;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                connection = DriverManager.getConnection(connectionURL);
                statement = connection.createStatement();
                rs = statement.executeQuery("SELECT * FROM employee WHERE username='" + name + "'");
                if (rs.next()) {
                    if (password.equals(rs.getString("pass"))) {
                        find = true;
                        perm = rs.getInt("permissions");
                        session.setMaxInactiveInterval(600);
                        session.setAttribute("permLevel", perm);
                        if (perm == 2) {
        %>
        <meta http-equiv="REFRESH" content="0;url=options1screen.htm">
        <%                    } else if (perm == 3) {
        %>
        <meta http-equiv="REFRESH" content="0;url=manager.jsp">
        <%
        } else {
        %>
        <style>
    html {
        background-image:url('images/403.png');
        background-repeat:no-repeat;  
    }
    </style>
        <meta http-equiv="REFRESH" content="2;url=index.jsp"><b>
            <%                }
                }
                if (!find) {
            %>
            <meta http-equiv="REFRESH" content="2;url=index.jsp"><b>Wrong username or password! Please try again!<br />
                <%}
                    rs.close();
                }
                } catch (Exception ex) {%>
                <meta http-equiv="REFRESH" content="2;url=index.jsp"><b>An error occurred, please try again!<%=ex%>
                    <%                }
                    %>    
                </head>
                <body>
                    </body>
                    </html>
