<%-- 
    Document   : checkReload
    Created on : 16 Ιαν 2014, 2:06:17 μμ
    Author     : NIKOS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wincell</title>
    </head>
    <body>
         <%
        try
        {
        internet.NewWebService_Service service = new internet.NewWebService_Service();
	internet.NewWebService port= service.getNewWebServicePort();
        String res=port.checkreload(request.getParameter("accPhoneNum"),request.getParameter("sum"),request.getParameter("curRem"));
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
            out.println(ex+"\n <meta http-equiv=\"REFRESH\" content=\"3;url=ramain.jsp\">");
        }
        
        %>
        <meta http-equiv="REFRESH" content="3;url=remain.jsp">
    </body>
</html>
