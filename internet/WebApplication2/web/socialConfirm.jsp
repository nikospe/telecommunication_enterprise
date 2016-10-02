<%-- 
    Document   : socialConfirm
    Created on : 9 Ιαν 2014, 11:38:24 πμ
    Author     : Nikos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>winCell</title>
    </head>
    <body>
        <%
        int flag=0;
        try {
	internet.NewWebService_Service service = new internet.NewWebService_Service();
	internet.NewWebService port = service.getNewWebServicePort();
	 // TODO initialize WS operation arguments here
	java.lang.String name = request.getParameter("name");
        java.lang.String surname = request.getParameter("surname");
	java.lang.String address = request.getParameter("address");
	java.lang.String email = request.getParameter("email");
	
        if(name.isEmpty() || surname.isEmpty() || address.isEmpty() || email.isEmpty() ){
            out.print("Missing Parameter");
            flag=1;
        }
        if(flag==0){
	java.lang.String result = port.insertS(name, surname, address, email);
	out.print(result);
        }
        } catch (Exception ex) {
	
        }
        if(flag==0){%>
            <meta http-equiv="REFRESH" content="2;url=indexUser.jsp">
        <%}
        else{%>
            <meta http-equiv="REFRESH" content="2;url=social.jsp">
        <%}%>
    </body>
</html>
