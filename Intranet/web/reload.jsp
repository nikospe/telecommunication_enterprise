<%-- 
    Document   : reload
    Created on : 6 Δεκ 2013, 3:28:59 μμ
    Author     : NIKOS
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    String connectionURL = "jdbc:mysql://83.212.105.20:3306/team09?user=team09&password=changeit";
    Connection connection = null;
    Statement statement = null;
    ResultSet rs = null;
    Statement statement2 = null;
    ResultSet rs2 = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    connection = DriverManager.getConnection(connectionURL);
    statement2=connection.createStatement();
    statement=connection.createStatement();
%>
<!DOCTYPE html>
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

        <%
                        if(!(session.getAttribute("permLevel")==null))
                        {
                            if((Integer)session.getAttribute("permLevel")==2) {
                try {
                    long accPhoneNum=123;
                    accPhoneNum=Long.parseLong(request.getParameter("accPhoneNum"));

                    int sum=0;
                        sum=Integer.parseInt(request.getParameter("sum"));
                    rs = statement.executeQuery("SELECT * FROM Acount WHERE accPhoneNum='" + accPhoneNum + "'");
                    rs.first();
                    int totalsum=0;
                         totalsum=sum+Integer.parseInt(rs.getString("remainder"));
                    statement2.executeUpdate("Update Acount set remainder='"+totalsum+"' WHERE accPhoneNum='"+accPhoneNum+"'");
                    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
                    Date date = new Date();
                    String dateS=null;
                    rs.first();
                    dateS=date.toString();
                    int status=0;
                    status=statement2.executeUpdate("insert into usage_stats (date,phoneNum,sum) values ('"+dateS+"','"+accPhoneNum+"','"+sum+"')");

                    if (status == 1) {
                    %>
                    <meta http-equiv="REFRESH" content="2;url=options2screen.jsp"><b>Η ανανέωση έγινε επιτυχώς
                        <%} else {
                }
        }
                catch(Exception ex){%>
                <meta http-equiv="REFRESH" content="2;url=index.jsp"><b>Συνέβη κάποιο λάθος.<br><%=ex%><br><%Date time=new Date();%><%=time.toString()%>
                <%}
        } } else {
        %>
        <style>
    html {
        background-image:url('images/403.png');
        background-repeat:no-repeat;
        color: #ffffff;  
    }
    </style>
        <meta http-equiv="REFRESH" content="2;url=index.jsp"><b>
            <%} %>   
        </head>
    <body>
    </body>
</html>
