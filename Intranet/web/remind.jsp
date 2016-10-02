<%-- 
    Document   : remind
    Created on : Dec 8, 2013, 3:28:03 PM
    Author     : Linosx3x
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>

<%
    try{
             if(!(session.getAttribute("permLevel")==null))
                        {
                            if((Integer)session.getAttribute("permLevel")==2) {
    String connectionURL = "jdbc:mysql://83.212.105.20:3306/team09?user=team09&password=changeit";
    Connection connection = null;
    Statement statement = null;
    ResultSet rs = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    connection = DriverManager.getConnection(connectionURL);
    statement = connection.createStatement();
    rs = statement.executeQuery("SELECT * FROM User WHERE afm='" + request.getParameter("afm") + "'");
    rs.first();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WinCell</title>
<link rel="icon" 
      href="./options1screen_files/sign.gif">
<link href="styles/options2screen.css" rel="stylesheet" type="text/css" />
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
	</style>
    </head>
    <body>
        <body class="en  webkit" style="">
        <div id="openModal" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
                <h3>Υπενθύμιση κωδικού</h3>
                <br>
                <table>
                    <tr>
                        <td>
                            <%=rs.getString("customerCode")%>
                        </td>
                        <td>
                            <a href="options1screen.htm"><input type="button" value="Εντάξει"></a>
                        </td>
                    </tr>
                </table>
	</div>
</div>
                                                        <%}}
                        else{%>
                        <style>
    html {
        background-image:url('images/403.png');
        background-repeat:no-repeat; 
    }
    </style>
                          <meta http-equiv="REFRESH" content="3;url=index.jsp">
                        <%}
                            }
    catch(Exception ex){%>
                                    <meta http-equiv="REFRESH" content="5;url=options1screen.htm">Άγνωστο λάθος συνέβη.<%=ex%>
                                   <% }
        %>
    </body>
</html>
