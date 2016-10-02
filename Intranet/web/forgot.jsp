<%-- 
    Document   : forgot
    Created on : Dec 8, 2013, 1:37:52 PM
    Author     : Linosx3x
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.activation.*" %>
<%
    if(request.getParameter("email")!=null){
    try{
             
String host = "yourmailhost";
String to = request.getParameter("email");
String from = "katanemhmena2013@gmail.com";
String subject = "Password recovery";
boolean sessionDebug = false;
// Create some properties and get the default Session.
Properties props = System.getProperties();
props.put("mail.host", "smtp.gmail.com");
props.put("mail.transport.protocol", "smtp");
props.setProperty("mail.user", "katanemhmena2013@gmail.com");
props.setProperty("mail.password", "katanemHm3nA20!3");
Session mailSession = Session.getDefaultInstance(props, null);
 
// Set debug on the Session
// Passing false will not echo debug info, and passing True will.
 
mailSession.setDebug(sessionDebug);
 
// Instantiate a new MimeMessage and fill it with the
// required information.
 
Message msg = new MimeMessage(mailSession);
msg.setFrom(new InternetAddress(from));
InternetAddress[] address = {new InternetAddress(to)};
msg.setRecipients(Message.RecipientType.TO, address);
msg.setSubject(subject);
msg.setContent("<a href='forgot.jsp#openModal'>Επαναφορά κωδικού πρόσβασης</a>","text/html");
 
// Hand the message to the default transport service
// for delivery.
 
Transport.send(msg); 
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WinCell</title>
        <link href="styles/management.css" rel="stylesheet" type="text/css" />
<link rel="icon" 
      href="./options1screen_files/sign.gif">
<link href="styles/options2screen.css" rel="stylesheet" type="text/css" />
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
</style>
    </head>
    <body>
              <div id="openModal" class="modalDialog">
	<div>
		<a href="index.jsp" title="Close" class="close">X</a>
                <h3>Δημιουργία νέου κωδικού</h3>
                <form action='index.jsp#openModal2' method='post'>
                    <input type='hidden' name='email' value='<%=request.getParameter("email")%>'>
                <table>
                <tr>
                    <td>
                        Εισάγετε νέο κωδικό:
                    </td>
                    <td>
                       
                            <input type='password' name='password1'>
                    </td>
                </tr>
                <tr>
                    <td>
                        Επαλήθεψη κωδικού:
                    </td>
                    <td>
                            <input type='password' name='password2'>
                    </td>
                </tr>     
        </table>
                <input type='submit' value='Αλλαγή κωδικού'>
                </form>
                <a href='index.jsp'><input type='button' value="Άκυρο" ></a>
	</div>
        </div>
                        <%}
                            
    catch(Exception ex){%>
         <meta http-equiv="REFRESH" content="3;url=index.jsp">Καποιο λάθος συνέβη.<%=ex%>
   <% } }
   else{%>
   <meta http-equiv="REFRESH" content="3;url=index.jsp#openModal3">
   <% } %>
    </body>
</html>
