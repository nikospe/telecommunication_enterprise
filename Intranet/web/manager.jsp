<%-- 
    Document   : manager
    Created on : 6 Δεκ 2013, 5:53:16 μμ
    Author     : NIKOS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>

<%
    try{
             if(!(session.getAttribute("permLevel")==null))
                        {
                            if((Integer)session.getAttribute("permLevel")==3) {
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
    rs = statement.executeQuery("SELECT * FROM User WHERE waitingApp=1");
    rs.beforeFirst();
    rs2 = statement2.executeQuery("SELECT * FROM Acount WHERE customerCode='" + session.getAttribute("customerCode") + "'");
%>

<html>
    <head>
        <link href="styles/options2screen.css" rel="stylesheet" type="text/css" />
        <title>winCell</title>
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
        <div id="outer-frame"><div id="page-header">
              <div id="account-header">
              <a href="logout.jsp" class="downloading-link">Έξοδος από το σύστημα</a>
              </div>
            </div>
        <form action="approve.jsp" method="post">
        <table border="1">
            
            <tr>
                <td>
                    Όνομα
                </td>
                <td>
                    Επίθετο
                </td>
                <td>
                    Αριθμός χρήστη
                </td>
                <td>
                    Αριθμός ενεργών αριθμών
                </td>
                <%
                while(rs.next()){%>
            
            <tr>
                <td>
                    <%=rs.getString("name")%>
                </td>
                <td>
                    <%=rs.getString("surname")%>
                </td>
                <td>
                    <input type="text" name="customerCode" value="<%=rs.getString("customerCode")%>" readonly>
                </td>
                <td>
                    <%=rs.getString("activeAcc")%>
                </td>
                <td>
                    <input type="submit" value="Έγκριση">
                </td>
                <td>
                    <input type="submit" formaction="disapprove.jsp" value="Απόρριψη">
                </td>
            </tr>
                <%}
                %>
            </tr>
            
        </table>          
        </form>
        <%
        } }else {
        %>
        <meta http-equiv="REFRESH" content="2;url=index.jsp"><b>You are not authorised to view this content!
            <%} }
            catch(Exception ex){%>
            <meta http-equiv="REFRESH" content="5;url=options1screen.htm">Άγνωστο λάθος συνέβη<br> <%=ex%>
        <%}%>
        
        <div id="openModal" class="modalDialog">
	<div>
		<a href="management.jsp" title="Close" class="close">X</a>
                <h3>Η άιτηση εκρίθηκε</h3>
                <a href='management.jsp'><input type='button' value="Εντάξει"></a>
	</div>
        </div>
        
        <div id="openModal4" class="modalDialog4">
	<div>
		<a href="#close4" title="Close" class="close4">X</a>
                <h3>Η άιτηση απορρίφθηκε</h3>
                <a href="#close4"><input type="button" value="Εντάξει"></a>
	</div>
        </div>
        
    </body>
</html>
