<%-- 
    Document   : newClient
    Created on : Dec 4, 2013, 10:31:00 PM
    Author     : Linosx3x
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String connectionURL = "jdbc:mysql://83.212.105.20:3306/team09?user=team09&password=changeit";
    Connection connection = null;
    Statement statement = null;
    ResultSet rs = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    connection = DriverManager.getConnection(connectionURL);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Δημιουργία νέου χρήστη</title>
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
    
    </style>
    </head>
    <body>
        <%
                        if(!(session.getAttribute("permLevel")==null))
                        {
                            if((Integer)session.getAttribute("permLevel")==2) {
        %>
        <h1>Δημιουργία νέας καρτέλας πελάτη</h1>
        <form method="post" action="checkNew.jsp">
            <table border="0">
                <tr>
                    <td>
                    *Όνομα:
                    </td>
                    <td>
                        <input type="text" name="name" maxlength="30">
                    </td>
                </tr>
                <tr>
                    <td>
                    *Επώνυμο:
                    </td>
                    <td>
                        <input type="text" name="surname" maxlength="30">
                    </td>
                </tr>
                <tr>
                    <td>
                    *Έτος γέννησης:
                    </td>
                    <td>
                        <input type="text" name="birthyear" maxlength="4">
                    </td>
                </tr>
                <tr>
                    <td>
                    *Αριθμός τραπέζης:
                    </td>
                    <td>
                        <input type="text" name="bankAcc">
                    </td>
                </tr>
                <tr>
                    <td>
                    *Φύλο:
                    </td>
                    <td>
                        <select name="gender">
                            <option value="M">Male</option>
                            <option value="F">Female</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                    *Διεύθυνση κατοικίας:
                    </td>
                    <td>
                        <input type="text" name="homeAddr" maxlength="50">
                    </td>
                </tr>
                <tr>
                    <td>
                    *Διεύθυνση εργασίας:
                    </td>
                    <td>
                        <input type="text" name="workAddr" maxlength="50">
                    </td>
                </tr>
                <tr>
                    <td>
                    *Οικογενειακή κατάσταση:
                    </td>
                    <td>
                        <select name="familyState">
                            <option value="Married">Έγγαμος-η</option>
                            <option value="Single">Μόνος-η</option>
                            <option value="Divorced">Διαζευμένος-η</option>
                            <option value="Widowed">Χοίρος-α</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                    *ΑΦΜ:
                    </td>
                    <td>
                        <input type="text" name="afm" maxlength="10">
                    </td>
                </tr>
                <tr id="conName">
                    <td>
                        Ον/μο συγγενούς μέλους:
                    </td>
                    <td>
                        <select name="connectionName">    
                            <option name="connectionName" value=" ">(Κανένας)</option>
                            <%statement=connection.createStatement();
                            rs=statement.executeQuery("Select * From User");
                            rs.beforeFirst();
                            String name=null;%>
                            <%while(rs.next()) {
                            name=rs.getString("surname")+" "+rs.getString("name");%>
                            <option name='connectionName' value="<%=name%>"><%=name%></option>
                            <%}%>
                            
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                    *Δικαιούχος 1:
                    </td>
                    <td>
                        <input type="text" name="beneficiary1" maxlength="50">
                    </td>
                </tr>
                <tr>
                    <td>
                    Δικαιούχος 2:
                    </td>
                    <td>
                        <input type="text" name="beneficiary2" maxlength="50">
                    </td>
                </tr>
                <tr>
                    <td>
                    Αριθμός λογαριασμού:
                    </td>
                    <td>
                        <input type="text" name="activeAcc" maxlength="2" readonly value="0">
                    </td>
                </tr>
            </table>
            <input type="submit" value="Δημιουργία" class="imgClass" />
            <input type="button" value="Ακύρωση" id="cancel" onclick="window.location='options1screen.htm'">
        </form>
        <% 
        }
        } else {
        %>
        <meta http-equiv="REFRESH" content="2;url=index.jsp"><b>You are not authorised to view this content!
            <%} %>
            <div id="openModal" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
                <h3>Πρέπει να συμπληρώσετε όλα τα πεδία με *</h3>
                <a href='#close'><input type='button' value="Εντάξει"></a>
	</div>
        </div>
    </body>
</html>
