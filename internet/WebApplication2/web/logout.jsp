<%-- 
    Document   : logout
    Created on : 9 Ιαν 2014, 12:05:28 μμ
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
        
        <%
            try {
                internet.NewWebService_Service service = new internet.NewWebService_Service();
                internet.NewWebService port = service.getNewWebServicePort();
                // TODO initialize WS operation arguments here
                java.lang.String username = request.getParameter("");
                java.lang.String password = request.getParameter("");
                // TODO process result here
                java.lang.String result = port.logoutC(username, password);
                out.print(result);
                session.invalidate();
            } catch (Exception ex) {
                // TODO handle custom exceptions here
            }
        %>
        <meta http-equiv="REFRESH" content="2;url=index.jsp">
    </body>
</html>
