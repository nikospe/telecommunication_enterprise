<%-- 
    Document   : checkNewNumber
    Created on : 6 Δεκ 2013, 11:38:11 πμ
    Author     : NIKOS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
    try{
             if(!(session.getAttribute("permLevel")==null))
                        {
                            if((Integer)session.getAttribute("permLevel")==2) {
    String connectionURL = "jdbc:mysql://83.212.105.20:3306/team09?user=team09&password=changeit";
    Connection connection = null;
    Statement statement = null;
    ResultSet rs = null;%>
   <% Class.forName("com.mysql.jdbc.Driver").newInstance();
    connection = DriverManager.getConnection(connectionURL);
    statement = connection.createStatement();
    String customerCode=request.getParameter("customerCode");
    int activeAcc=Integer.parseInt(request.getParameter("activeAcc"));
    long accPhoneNum=Long.parseLong(request.getParameter("accPhoneNum"));
    long bankAcc=Long.parseLong(request.getParameter("bankAcc"));
    int status=statement.executeUpdate("INSERT INTO Acount(remainder,customerCode,bankAcc,accNumber,accPhoneNum) VALUES('0','"+customerCode+"','"+bankAcc+"','" + activeAcc + "','"+accPhoneNum+"')");
if (status == 1) {
    status=statement.executeUpdate("Update User set activeAcc='"+activeAcc+"' WHERE customerCode='"+session.getAttribute("customerCode")+"'");
                    %>
                    <meta http-equiv="REFRESH" content="2;url=options2screen.jsp"><b>Ο αριθμός πελάτη δημιουργήθηκε.
                        <%} else {
                }
        } } else {
        %>
        <meta http-equiv="REFRESH" content="2;url=index.jsp"><b>You are not authorised to view this content!
            <%} %>
            <% }catch(Exception ex){%>
                <meta http-equiv="REFRESH" content="2;url=index.jsp"><b>Συνέβη κάποιο λάθος.<br><%=ex%>
                <%}%>
    </body>
</html>
