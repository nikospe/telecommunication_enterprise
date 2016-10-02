<%-- 
    Document   : checkNewNumber
    Created on : 15 Ιαν 2014, 4:33:02 μμ
    Author     : NIKOS
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
        try
        {
        internet.NewWebService_Service service = new internet.NewWebService_Service();
	internet.NewWebService port= service.getNewWebServicePort();
        String res=port.insertNum(request.getParameter("bankAcc"),request.getParameter("activeAcc"),request.getParameter("accPhoneNum"));
        port.waitingApp(session.getAttribute("username").toString(), "0");
        session.setAttribute("notified", null);
        if(res.equalsIgnoreCase("sql")||res.contains("Exception"))
        {
            out.print(res);
            throw new java.lang.Exception();
        }
        else
        {
            out.print(res);
            
        }
        }
        catch(Exception ex)
        {
            out.println(ex+"\n <meta http-equiv=\"REFRESH\" content=\"3;url=index.jsp\">");
        }
        
        %>
        <meta http-equiv="REFRESH" content="3;url=indexUser.jsp">
    </body>
</html>
