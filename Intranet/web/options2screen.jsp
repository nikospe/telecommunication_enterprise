<%-- 
    Document   : options2screen
    Created on : 5 Δεκ 2013, 2:44:25 μμ
    Author     : NIKOS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    try{
             if(!(session.getAttribute("permLevel")==null))
                        {
                            if((Integer)session.getAttribute("permLevel")==2) {
    String connectionURL = "jdbc:mysql://83.212.105.20:3306/team09?user=team09&password=changeit";
    Connection connection = null;
    Statement statement = null;
    Statement statement2 = null;
    ResultSet rs = null;
    ResultSet rs2 = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    connection = DriverManager.getConnection(connectionURL);
    statement = connection.createStatement();
    statement2 = connection.createStatement();
    rs = statement.executeQuery("SELECT * FROM User WHERE customerCode='" + session.getAttribute("customerCode") + "'");
    rs2 = statement2.executeQuery("SELECT * FROM Acount WHERE customerCode='" + session.getAttribute("customerCode") + "'");
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
        <a href='options1screen.htm'>Αρχική</a>
        <div id="outer-frame"><div id="page-header"><div id="account-header"><a href="logout.jsp" class="downloading-link">Έξοδος από το σύστημα</a></div></div>
        <div id="account_info">
            <table>
                <tr>
                    <td>
                        <%rs.first();%>
                        <%=rs.getString("name")%>
                        
                    </td>
                    <td>
                        <%rs.first();%>
                        <%=rs.getString("surname")%>
                    </td>
                </tr>
                <tr>
                    <td>
                        ΑΦΜ:
                    </td>
                    <td>
                        <%rs.first();%>
                        <%=rs.getString("afm")%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Δικαιούχος 1:
                    </td>
                    <td>
                        <%rs.first();%>
                        <%=rs.getString("beneficiary1")%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Δικαιούχος 2:
                    </td>
                    <td>
                        <%rs.first();%>
                        <%=rs.getString("beneficiary2")%>
                    </td>
                </tr>
            </table>
        </div>
        
        <IMG SRC="./images/simB4.jpg"   USEMAP="#map">
            <map name="map">
<!-- #$VERSION:2.3 -->
<area shape="rect" coords="21,137,571,261" href="management.jsp" />
<area shape="rect" coords="17,330,572,455" href="#openModal" />
</map>
        <div id="openModal" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
                <h3>Ανανέωση χρόνου ομιλίας</h3>
                <%rs.first();%>
                <form action='reload.jsp' method='post'>
                <table>
                    <tr>
                        <td>
                            Αριθμός τραπέζης:
                        </td>
                        <td>
                <input type='text' value='<%=rs.getString("bankAcc")%>' readonly>
                        </td>
                </tr>
                <tr>
                    <td>
                        Αριθμός:
                    </td>
                    <td>
                        <select name="accPhoneNum">
                            <%rs2.beforeFirst();%>
                            <%while(rs2.next()) {%>
                            <option value="<%=rs2.getString("accPhoneNum")%>"><%=rs2.getString("accPhoneNum")%></option>
                            <%}%>
                        </select>
                    </td>
                </tr>
                   <tr>
                        <td>
                            Ποσό:
                        </td>
                        <td>
                <input type='text' name='sum' >
                        </td>
                </tr>
                   <tr>
                        <td>
                            <a href='#close' ><input type='button' value='Άκυρο'></a>
                        </td>
                        <td>
                <input type='submit' value='Ανανέωση'>
                        </td>
                </tr>
                <tr>
                    <td>
                </table>
                </form>
        </div>
	</div>
    </body>
</html>
<%} }else {
                               
        %>
        <meta http-equiv="REFRESH" content="2;url=index.jsp"><b>You are not authorised to view this content!
            <%} }
            catch(Exception ex){%>
                <meta http-equiv="REFRESH" content="2;url=index.jsp"><b>Άγνωστο λάθος συνέβη.
<%}%>
                            