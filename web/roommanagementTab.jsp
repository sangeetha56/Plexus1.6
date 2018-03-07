<%-- 
    Document   : roommanagementTab
    Created on : Jul 13, 2016, 11:32:35 AM
    Author     : kamal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/datePicker/jquery-ui-1.8.18.custom.css">
        <link rel="stylesheet" href="css/validation/jquery.ketchup.css">

        <script type="text/javascript" src="js/datePicker/ui/jquery-ui-1.8.17.custom.js"></script>
        <script src="js/datePicker/jquery-1.7.1.js"></script>
        <script src="js/datePicker/ui/jquery.ui.core.js"></script>
        <script src="js/datePicker/ui/jquery.ui.widget.js"></script>
        <script src="js/datePicker/ui/jquery.ui.datepicker.js"></script>
        <script src="js/datePicker/ui/jquery.ui.tabs.js"></script>
        <script src="js/datePicker/ui/sliderAccess.js"></script>
        <script src="js/datePicker/ui/jquery-ui-timepicker-addon.js"></script>
        <script src="js/validation/jquery.ketchup.all.min.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.button.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.dialog.js"></script>
        <script type="text/javascript" src="js/datetimepicker_css.js"></script>

 <style type="text/css">

      #bord     {
          background-color: white;

}
   </style>

        <script>
            $(function() {
                $( "#tabs" ).tabs();

            });
        </script>

   </head>
    <body >
            <div id="bord" >

                <div id="tabs">
                    <ul>
                        <li><a href="Controller?process=RoomManagement&action=viewAllRoomndBeds">View All Room&Bed </a></li>
                        <li><a href="Controller?process=BuildingProcess&action=firstAddpageforroomNdBed">Add Room&Bed</a></li> <!-- addRoomndBeds.jsp -->
                         <li><a href="manageRoomndBeds.jsp">Manage Room&Bed</a></li>

                    </ul>

                </div>
            </div>
    </body>
</html>
