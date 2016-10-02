<%-- 
    Document   : newCusLog
    Created on : 7 Ιαν 2014, 6:53:53 μμ
    Author     : Nikos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WinCell</title>
        
    </head>
    <body>
    <center>
        
        <%
        int flag=0;
        try {
	internet.NewWebService_Service service = new internet.NewWebService_Service();
	internet.NewWebService port = service.getNewWebServicePort();
	 // TODO initialize WS operation arguments here
	java.lang.String name = request.getParameter("name");
        java.lang.String surname = request.getParameter("surname");
	java.lang.String birthyear = request.getParameter("birthyear");
	java.lang.String gender = request.getParameter("gender");
	java.lang.String homeAddr = request.getParameter("homeAddr");
        java.lang.String workAddr = request.getParameter("workAddr");
        java.lang.String familyState = request.getParameter("familyState");
	java.lang.String afm = request.getParameter("afm");
        java.lang.String bankAccount = request.getParameter("bankAccount");
	java.lang.String family = request.getParameter("family");
        java.lang.String beneficiary1 = request.getParameter("beneficiary1");
        java.lang.String beneficiary2 = request.getParameter("beneficiary2");
        java.lang.String username = request.getParameter("username");
	java.lang.String password = request.getParameter("password");
        
        if(name.isEmpty() || surname.isEmpty() || birthyear.isEmpty() || homeAddr.isEmpty() || familyState.isEmpty() || beneficiary1.isEmpty() || username.isEmpty() || password.isEmpty())
        {
        out.print("Missing Parameter");
        flag=1;
        }
        if(flag==0){
        session.setAttribute("username", username);
        session.setAttribute("password", password);

        Long customerCode1 = System.nanoTime()/10000;
	String customerCode = Long.toString(customerCode1);
        
	java.lang.String result = port.insertC(name, surname, birthyear, gender, homeAddr, workAddr, familyState, afm, bankAccount, family, beneficiary1, beneficiary2, customerCode, username, password);
	out.print(result);
        }
        } catch (Exception ex) {
	
        }
        %>
        <% if(flag==0){%>
            <meta http-equiv="REFRESH" content="2;url=indexUser.jsp">
        <%}
        else{%>
            <meta http-equiv="REFRESH" content="2;url=newCusLogin.jsp">
        <%}%>
        </center>
        
    </body>
</html>
