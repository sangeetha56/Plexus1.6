<%-- 
    Document   : previewManagementPlan
    Created on : Apr 13, 2013, 3:30:24 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function hideSpan()
            {
                document.getElementById("hide").style.display='none' ;
            }
        </script>
    </head>
    <body>

          <div align="right">
                <table>
                    <tr>
                        <td>
                           <br/>
                        </td>
                    </tr>
                </table>
            </div>
        In-Patient Name: &nbsp;
      
        <c:out value="${param.inPatientName}"/>
        <table border="1" width="100%">
            <tr>
                <th width="30%">
                    Remarks
                </th>
                <th>
                    Management Plan
                </th>
            </tr>

            <tr>
                <td><c:out value="${param.inpatientRemarks}"/></td>
                <td><%=request.getParameter("managementPlan")%></td>
            </tr>
           

        </table>
            <div align="right">
                <table>
                    <tr>
                        <td>
                            <span id="hide" onclick="hideSpan();window.print();" style="text-decoration: underline;color: blue;cursor: pointer">
                                Print
                            </span>
                        </td>
                    </tr>
                </table>
            </div>
    </body>
</html>
