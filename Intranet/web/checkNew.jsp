<%-- 
    Document   : checkNew
    Created on : 5 Δεκ 2013, 1:05:28 μμ
    Author     : NIKOS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

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
                    String name=request.getParameter("name");
                    String surname=request.getParameter("surname");
                    String birthyearS=request.getParameter("birthyear");
                    int birthyear=Integer.parseInt(birthyearS);
                    String bankAccS=request.getParameter("bankAcc");
                    String gender=request.getParameter("gender");
                    String homeAddr=request.getParameter("homeAddr");
                    String workAddr=request.getParameter("workAddr");
                    String familyState=request.getParameter("familyState");
                    String afmS=request.getParameter("afm");
                    String con=request.getParameter("connectionName");
                    String beneficiary1=request.getParameter("beneficiary1");
                    String beneficiary2=request.getParameter("beneficiary2");
                    String activeAccS=request.getParameter("activeAcc");
                    int activeAcc=Integer.parseInt(activeAccS);
                    if(name.isEmpty()||surname.isEmpty()||gender.isEmpty()||homeAddr.isEmpty()||workAddr.isEmpty()||familyState.isEmpty()||name.isEmpty()||beneficiary1.isEmpty()||bankAccS.isEmpty()||afmS.isEmpty())
                    {%>
                        <meta http-equiv="REFRESH" content="2;url=newNumber.jsp#openModal">
                    <%}
                    else {
                    long bankAcc=Long.parseLong(bankAccS); 
                    int afm=Integer.parseInt(afmS);
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    connection = DriverManager.getConnection(connectionURL);
                    statement = connection.createStatement();
                    rs = statement.executeQuery("SELECT * FROM User");
                    long customerCode=0;
                    rs.last();
                    customerCode = System.nanoTime()/10000+rs.getRow();
                    int status=statement.executeUpdate("INSERT into User (name,surname,birthyear,bankAcc,gender,homeAddr,workAddr,familyState,afm,connection,beneficiary1,beneficiary2,activeAcc,customerCode) VALUES ('"  
                            + name  
                            + "','"  
                            + surname  
                            + "','"  
                            + birthyear  
                            + "','" +bankAcc+ "','" 
                            + gender  
                            + "','"  
                            + homeAddr  
                            + "','"  
                            + workAddr  
                            + "','"  
                            + familyState + "','" + afm + "','" + con + "','" + beneficiary1 + "','" + beneficiary2 + "','" + activeAcc+ "','" + customerCode+ "')");
                    if (status == 1) {
                        session.setAttribute("customerCode", customerCode);
                    %>
                    <meta http-equiv="REFRESH" content="2;url=options2screen.jsp"><b>Η καρτέλα πελάτη δημιουργήθηκε.
                        <%} else {
                }
        } }
                catch(Exception ex){%>
                <meta http-equiv="REFRESH" content="2;url=index.jsp"><b>Συνέβη κάποιο λάθος.<br><%=ex%>
                <%}
        } } else {
        %>
        <meta http-equiv="REFRESH" content="2;url=index.jsp"><b>You are not authorised to view this content!
            <%} %>
    </body>
</html>
