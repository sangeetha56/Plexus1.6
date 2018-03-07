<%--
    Document   : viewAllRoom
    Created on : Jul 5, 2016, 4:29:10 PM
    Author     : INTEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html >
    <head >
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css" title="currentStyle">
            @import "css/dataTable/css/demo_page.css";
            @import "css/dataTable/css/jquery.dataTables.css";
        </style>
        <link rel="stylesheet" href="css/datePicker/jquery-ui-1.8.17.custom.css">
        <link rel="stylesheet" href="css/datePicker/demos.css">
        <!--<script type="text/javascript" language="javascript" src="js/dataTable/jquery.js"></script>-->
        <script type="text/javascript" src="js/datePicker/jquery-1.7.1.js"></script>
        <script type="text/javascript" language="javascript" src="js/dataTable/jquery.dataTables.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery-ui-1.8.17.custom.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.core.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.widget.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.button.js"></script>
        
       
        
        <style>
input.nametxt{ outline:0; border:none; width:100%}
.txtcls1{font-family:Arial, Helvetica, sans-serif; font-size:14px; color:#0067a9; text-align:center}
@media screen and (min-width:300px) and (max-width:767px){
	  .main_table{ width:100%}
	  .mobscale{ width:100%; float:left}
	}
</style>
    </head>
    <body  style=" background-image: url(images/salesForceBk.png);background-repeat: no-repeat;background-position: center">
        <div id="bord">
            <form name="form2" action="Controller?process=BloodtransfucionProcess&action=viewAll" method="post">
                <div style="overflow: hidden">
                    <table width="100%">
                        <tr>
                            <td  class="headerTD">Bloodtransfusion View All</td>
                        </tr>


                    </table>
                    <table   width="100%"  border="0" style="border-color:#4b6a84;"  id="myTable">

                        <thead>
                            <tr  >
                                <th>Id</th>
                                <th>Patient Name</th>
                                <th>Ward/Dept</th>
                                <th>Ward/Dep.</th>
                                <th>Bed No.</th>
                                <th>Age</th>
                                <th>Sex</th>
                                <th>Pt's Doctor</th>
                                <th>Patient Blood Group</th>





                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach items="${bloodtransfucionList}" var="bloodtransfucion">

                                <tr class="trClass" style="border-color:#000000" border="1"  cellpadding="1"  cellspacing="1" >
                                <td class="dataText"><c:out value="${bloodtransfucion.id}"/></td>
                                <td  class="dataText"><a class="dataText"  href="Controller?process=BloodtransfucionProcess&action=viewDetails&id=<c:out value='${bloodtransfucion.id}'/>"><c:out value="${bloodtransfucion.pateintname}"/></a></td>
                                <td  class="dataText"><c:out value="${bloodtransfucion.warddept}"/></td>
                                <td  class="dataText"><c:out value="${bloodtransfucion.warddep}"/></td>
                                <td  class="dataText"><c:out value="${bloodtransfucion.bedno}"/></td>
                                <td  class="dataText"><c:out value="${bloodtransfucion.age}"/></td>
                                <td  class="dataText"><c:out value="${bloodtransfucion.sex}"/></td>
                                <td  class="dataText"><c:out value="${bloodtransfucion.ptsdoctor}"/></td>
                                <td  class="dataText"><c:out value="${bloodtransfucion.bloodgroup}"/></td>


                                </tr>
                            </c:forEach>
                        </tbody>

                    </table>
                    



                </div>
                <input type="submit" value="ok" name="ok" />
            </form>
        </div>
    </body>
</html>
