<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html xmlns="http://www.w3.org/1999/xhtml">
    <%
    session.setMaxInactiveInterval(600);
    if(session.getAttribute("permLevel")!=null)
    {
        if(session.getAttribute("permLevel").toString().equals("2"))
                       {%>
                                  <meta http-equiv="REFRESH" content="0;url=options1screen.htm">
        <%}
                    if(session.getAttribute("permLevel").toString().equals("3"))
                               {%>
                      <meta http-equiv="REFRESH" content="0;url=manager.jsp">
                      <% } }
               else {
        String connectionURL = "jdbc:mysql://83.212.105.20:3306/team09?user=team09&password=changeit";
    Connection connection = null;
    Statement statement = null;
    ResultSet rs = null;
    
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    connection = DriverManager.getConnection(connectionURL);
    statement = connection.createStatement();
    rs = statement.executeQuery("SELECT * FROM User WHERE customerCode='" + session.getAttribute("customerCode") + "'");
    
    
        
    %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>WinCell</title>
<link rel="icon" 
      href="./options1screen_files/sign.gif">
<link href="styles/login-box.css" rel="stylesheet" type="text/css" />
<style>
    .modalDialog{
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
        
        .modalDialog2{
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
        
	.modalDialog2:target {
		opacity:1;
		pointer-events: auto;
	}
        
        
	.modalDialog2 > div {
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

	.close2 {
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

	.close2:hover { background: #00d9ff; }
        
        .modalDialog3{
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
        
	.modalDialog3:target {
		opacity:1;
		pointer-events: auto;
	}
        
        
	.modalDialog3 > div {
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

	.close3 {
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

	.close3:hover { background: #00d9ff; }
</style>
</head>

<body>


<div style="padding: 100px 0 0 250px;">


<div id="login-box">

<H2>Login</H2>
<br />
<form method=post" action="checklogin.jsp">
    <div id="login-box-name" style="margin-top:20px;">Username:</div><div id="login-box-field" style="margin-top:20px;"><input type="text"  class="form-login" name="username" title="Username" value="" size="30" maxlength="2048" /></div>
<div id="login-box-name">Password:</div><div id="login-box-field"><input name="password" type="password" class="form-login" title="Password" value="" name="password" size="30" maxlength="2048" /></div>
<br />
<span class="login-box-options"><a href="index.jsp#openModal" style="margin-left:30px;">Forgot password?</a></span>
<br />
<br />
<input type="submit" value="" class="imgClass" />
</form>
</div>
</div>

     <div id="openModal" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
                <h3>Επαναφορά κωδικού πρόσβασης</h3>
                <form action='forgot.jsp' method='post'>
                <table>
                <tr>
                    <td>
                        Email:
                    </td>
                    <td>
                         <input type='text' name='email'>
                    </td>
                </tr>
                    
        </table>
                        <input type='submit' value='Επαναφορά κωδικού'>
                </form>
                <a href='#close'><input type='button' value="Άκυρο" ></a>
	</div>
        </div>
    
     <div id="openModal2" class="modalDialog2">
	<div>
		<a href="#close2" title="Close" class="close2">X</a>
                
                <%
                if(request.getParameter("password1")!=null&&request.getParameter("password2")!=null){
                String password1=request.getParameter("password1");
                String password2=request.getParameter("password2");
                if(!(password1.equals(password2))){%>
                <h3>Οι κωδικοί δεν ταιριάζουν</h3>
                <br>
                <a href='forgot.jsp#openModal'><input type='button' value='Εντάξει'></a>
                <% 
                }
                else{
                %>
                <form action='forgot.jsp' method='post'>
                <table>
                <tr>
                    <td>
                        Email:
                    </td>
                    <td>
                         <input type='text' name='email'>
                    </td>
                </tr>
                    
                </table>
                        <input type='submit' value='Επαναφορά κωδικού'>
                </form>
                <%} }%>
                <a href='#close2'><input type='button' value="Άκυρο" ></a>
	</div>
        </div>
                
        <div id="openModal3" class="modalDialog3">
	<div>
		<a href="#close3" title="Close" class="close3">X</a>
                <h3>Δεν εισάγατε email</h3>
	</div>
</div>
</body>
<% }%>
</html>
