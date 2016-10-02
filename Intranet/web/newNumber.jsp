<%-- 
    Document   : newNumber
    Created on : 5 Δεκ 2013, 4:10:14 μμ
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
        <title>Δημιουργία νέου Αριθμού</title>
        <link rel="icon" 
      href="./options1screen_files/sign.gif">
        <style>
    html {
        background-image:url('images/background.jpg');
        background-repeat:no-repeat; 
    }
	.modalDialog {
		position: fixed;
		font-family: Arial, Helvetica, sans-serif;
		top: 0;
		right: 0;
		bottom: 0;
		left: 0;
		background: rgba(0,0,0,0.8);
		z-index: 99999;
		opacity:0;
		-webkit-transition: opacity 400ms ease-in;
		-moz-transition: opacity 400ms ease-in;
		transition: opacity 400ms ease-in;
		pointer-events: none;
	}

	.modalDialog:target {
		opacity:1;
		pointer-events: auto;
	}

	.modalDialog > div {
		width: 400px;
		position: relative;
		margin: 10% auto;
		padding: 5px 20px 13px 20px;
		border-radius: 10px;
		background: #fff;
		background: -moz-linear-gradient(#fff, #999);
		background: -webkit-linear-gradient(#fff, #999);
		background: -o-linear-gradient(#fff, #999);
	}

	.close {
		background: #606061;
		color: #FFFFFF;
		line-height: 25px;
		position: absolute;
		right: -12px;
		text-align: center;
		top: -10px;
		width: 24px;
		text-decoration: none;
		font-weight: bold;
		-webkit-border-radius: 12px;
		-moz-border-radius: 12px;
		border-radius: 12px;
		-moz-box-shadow: 1px 1px 3px #000;
		-webkit-box-shadow: 1px 1px 3px #000;
		box-shadow: 1px 1px 3px #000;
	}

	.close:hover { background: #00d9ff; }

        .modalDialog4 {
		position: fixed;
		font-family: Arial, Helvetica, sans-serif;
		top: 0;
		right: 0;
		bottom: 0;
		left: 0;
		background: rgba(0,0,0,0.8);
		z-index: 99999;
		opacity:0;
		-webkit-transition: opacity 400ms ease-in;
		-moz-transition: opacity 400ms ease-in;
		transition: opacity 400ms ease-in;
		pointer-events: none;
	}

	.modalDialog4:target {
		opacity:1;
		pointer-events: auto;
	}

	.modalDialog4 > div {
		width: 400px;
		position: relative;
		margin: 10% auto;
		padding: 5px 20px 13px 20px;
		border-radius: 10px;
		background: #fff;
		background: -moz-linear-gradient(#fff, #999);
		background: -webkit-linear-gradient(#fff, #999);
		background: -o-linear-gradient(#fff, #999);
	}

	.close4 {
		background: #606061;
		color: #FFFFFF;
		line-height: 25px;
		position: absolute;
		right: -12px;
		text-align: center;
		top: -10px;
		width: 24px;
		text-decoration: none;
		font-weight: bold;
		-webkit-border-radius: 12px;
		-moz-border-radius: 12px;
		border-radius: 12px;
		-moz-box-shadow: 1px 1px 3px #000;
		-webkit-box-shadow: 1px 1px 3px #000;
		box-shadow: 1px 1px 3px #000;
	}

	.close4:hover { background: #00d9ff; }
	</style>
    </head>
    <body>
        <%
    try{
                        if(!(session.getAttribute("permLevel")==null))
                        {
                            if((Integer)session.getAttribute("permLevel")==2) {
                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                connection = DriverManager.getConnection(connectionURL);
                                statement = connection.createStatement();
                                rs = statement.executeQuery("SELECT * FROM User WHERE customerCode='" + session.getAttribute("customerCode") + "'");
                                rs.first();
                                
        %>
        <a href='options1screen.htm'>Αρχική</a></br>
        <a href='options2screen.jsp'>Μενού λογαριασμού</a>
        <h1>Δημιουργία νέου Αριθμού</h1>
        <form method="post" action="checkNewNumber.jsp">
            <table border="0">
                <tr>
                    <td>
                    Αρ. τραπεζικού λογαριασμού:
                    </td>
                    <td>
                        <input type='text' name='bankAcc' value='<%=rs.getString("bankAcc")%>' readonly>
                    </td>
                </tr>
                <tr>
                    <td>
                    Κωδικός πελάτη:
                    </td>
                    <td>
                        <input type="text" name="customerCode" maxlength="15" readonly value="<%=session.getAttribute("customerCode")%>">
                    </td>
                </tr>
                <tr>
                    <td>
                    Αριθμός λογαριασμού:
                    </td>
                    <td>
                        <%rs.first();%>
                        <input type="text" name="activeAcc" value="<%=rs.getInt("activeAcc")+1%>" readonly>
                    </td>
                </tr>
                <tr>
                    <td>
                    Αριθμός κινητού:
                    </td>
                    <td>
                        <%long phoneNum=System.nanoTime()/1000000;%>
                        <input type="text" name="accPhoneNum" value='692<%=phoneNum%>' readonly>
                    </td>
                </tr>
            </table>
            <input type="submit" value="Δημιουργία" class="imgClass" />
            <input type="button" value="Ακύρωση" id="cancel" onclick="window.location='options2screen.jsp'">
        </form>
        <% 
        
                            }
        } else {
        %>
        <meta http-equiv="REFRESH" content="2;url=index.jsp"><b>You are not authorised to view this content!
            <%} }
            catch(Exception ex){%>
            <meta http-equiv="REFRESH" content="5;url=options1screen.htm">Άγνωστο λάθος συνέβη<br> <%=ex%>
        <%}%>
        <div id="openModal" class="modalDialog">
	<div>
		<a href="management.jsp" title="Close" class="close">X</a>
                <h3>Χρειάζεται έγκριση από τον διευθυντή</h3>
                <a href='management.jsp'><input type='button' value="Εντάξει"></a>
	</div>
        </div>
        
        <div id="openModal4" class="modalDialog4">
	<div>
		<a href="newNumber.jsp#openModal" title="Close" class="close4">X</a>
                <h3>Ο διευθυντής απέρριψε την αίτηση για επιπλέον αριθμό</h3>
                <a href="newNumber.jsp#openModal"><input type="button" value="Εντάξει"></a>
	</div>
        </div>
        
        
    </body>
</html>
