<%-- 
    Document   : management
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
    ResultSet rs = null;
    Statement statement2 = null;
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
        <link href="styles/management.css" rel="stylesheet" type="text/css" />
<link rel="icon" 
      href="./options1screen_files/sign.gif">
<link href="styles/options2screen.css" rel="stylesheet" type="text/css" />
	<style>
            html {
        background-image:url('images/background.jpg');
        background-repeat:no-repeat; 
    }
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
        <a href='options1screen.htm'>Αρχική</a></br>
        <a href='options2screen.jsp'>Μενού λογαριασμού</a>
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
        
        <IMG SRC="./images/simB2.jpg"   USEMAP="#map">
            <map name="map">
<!-- #$VERSION:2.3 -->
<%rs.first();
Statement statement3=connection.createStatement();
String activeAcc = rs.getString("activeAcc");
rs.first();
if(Integer.parseInt(rs.getString("waitingApp"))==3) 
{
statement3.executeUpdate("Update User set waitingApp='1' where customerCode='"+session.getAttribute("customerCode")+"'");
statement3.close();
%>
<area shape="rect" coords="24,46,545,148" href="newNumber.jsp#openModal4" />  
<%}
else if(Integer.parseInt(rs.getString("waitingApp"))==2||Integer.parseInt(activeAcc)<6){
    statement3.executeUpdate("Update User set waitingApp='0' where customerCode='"+session.getAttribute("customerCode")+"'");
    statement3.close();
%>
<area shape="rect" coords="24,46,545,148" href="newNumber.jsp" />
<%}else if(Integer.parseInt(activeAcc)>=6){
    
    statement3.executeUpdate("Update User set waitingApp='1' where customerCode='"+session.getAttribute("customerCode")+"'");
    statement3.close();
%>
<area shape="rect" coords="24,46,545,148" href="newNumber.jsp#openModal" />
<%}rs.first();%>
<area shape="rect" coords="25,178,543,279" href="#openModal3" />
<area shape="rect" coords="24,310,546,412" href="#openModal2" />
<area shape="rect" coords="26,434,548,537" href="#openModal" />
</map>
         <div id="openModal" class="modalDialog">
	<div>
		<a href="#close" title="Close" class="close">X</a>
                <h3>Επιβεβαίωση διαγραφής λογαριασμού</h3>
                <a href='deleting.jsp'><input type='button' value="Διαγραφή λογαριασμού" ></a>
	</div>
        </div>
        <div id="openModal2" class="modalDialog2">
	<div>
		<a href="#close2" title="Close" class="close2">X</a>
                <h3>Διαγραφή αριθμού</h3>
                <form action='deletingNumber.jsp' method='post'>
                <table>
                <tr>
                    <td>
                        Αριθμός:
                    </td>
                    <td>
                        <select name="accPhoneNum">
                            <%rs2.beforeFirst();%>
                            <%while(rs2.next()) {%>
                            <option name='accPhoneNum' value="<%=rs2.getString("accPhoneNum")%>"><%=rs2.getString("accPhoneNum")%></option>
                            <%}%>
                        </select>
                    </td>
                </tr>
        </table>
                        <%rs.first();
                        int num=Integer.parseInt(rs.getString("activeAcc"));
                        num=num-1;
                        
                        rs.first();%>
                        <input type="hidden" name="num" value="<%=num%>">
                        <input type='submit' value='Διαγραφή αριθμού'>
                </form>
                <a href='#close2'><input type='button' value="Άκυρο" ></a>
	</div>
        </div>
       <div id="openModal3" class="modalDialog3">
	<div>
		<a href="#close3" title="Close" class="close3">X</a>
                <h3>Αλλαγή δικαιούχων</h3>
                <form action='changeBen.jsp' method='post'>
                <table>
                <tr>
                    <td>
                        Δικαιούχος 1:
                    </td>
                    <td>
                        <%rs.first();%>
                            <input type='text' name='beneficiary1' value="<%=rs.getString("beneficiary1")%>">
                    </td>
                </tr>
                <tr>
                    <td>
                        Δικαιούχος 2:
                    </td>
                    <td>
                            <input type='text' name='beneficiary2' value="<%=rs.getString("beneficiary2")%>">
                    </td>
                </tr>     
        </table>
                        <input type='submit' value='Αλλαγή δικαιούχων'>
                </form>
                <a href='#close3'><input type='button' value="Άκυρο" ></a>
	</div>
        </div>
    </body>
</html>
<%} }else {
                               
        %>
        <meta http-equiv="REFRESH" content="2;url=index.jsp"><b>You are not authorised to view this content!
            <%} }
            catch (Exception ex){%>
                <meta http-equiv="REFRESH" content="2;url=options2screen.jsp">Άγνωστο λάθος συνέβη.<%=ex%>
<%}%>