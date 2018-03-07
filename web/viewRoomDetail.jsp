<%-- 
    Document   : viewRoomDetail
    Created on : Jul 19, 2016, 4:04:28 PM
    Author     : kamal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

        <title>Untitled Document</title>
        <link rel="stylesheet" href="css/datePicker/jquery-ui-1.8.18.custom.css"/>
        <link rel="stylesheet" href="css/validation/jquery.ketchup.css"/>

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
        <link rel="stylesheet" href="css/datePicker/demos.css"/>

        <style type="text/css">

            #bord     {
                background-image: url();background-repeat: no-repeat;background-position: center;
            }
            <!--
            .divCSS{
                overflow:  scroll;
                height: 100%;
                width: 100%;
                background-image: url()
            }

            .fiedlSet {
                border-top-width: 1px;
                border-right-width: 1px;
                border-bottom-width: 1px;
                border-left-width: 1px;
                border-top-style: solid;
                border-right-style: solid;
                border-bottom-style: solid;
                border-left-style: solid;
                border-width: 1;
                width: 100%;
                color: #000000;
                font-size: 16px;
                font-weight: bold;
                font-variant: normal;
                font-stretch: wider;
                background-color: #e2ebf3;
                border-top-color: #5d7e9b;
                border-right-color: #5d7e9b;
                border-bottom-color: #5d7e9b;
                border-left-color: #5d7e9b;
            }
            .legendCSS {
                color: #666666;
            }
            .tableCSS {
                width: 100%;
                height: 100%;
                position: absolute;
                left: 0px;
                top: 0px;
            }
            .textAreaCSS {
                height: auto;
                width: auto;
            }
            .textField {
                border-top-style: solid;
                border-right-style: solid;
                border-bottom-style: solid;
                border-left-style: solid;
                border-top-color: #5d7e9b;
                border-right-color: #5d7e9b;
                border-bottom-color: #5d7e9b;
                border-left-color: #5d7e9b;
                border-top-width: 2px;
                border-right-width: 2px;
                border-bottom-width: 2px;
                border-left-width: 2px;
                width: auto;
                height: auto;
            }
            .alignRight {
                font-family: Tahoma;
                font-size: 13px;
                font-style: normal;
                text-transform: capitalize;
                color: #325F6D;
                text-align: right;
                vertical-align: middle;
                font-weight: bold;
            }





            .alignRightMultiple {
                font-family: Tahoma;
                font-size: 11px;
                font-weight: bolder;
                text-align: right;
                vertical-align: middle;
                font-style: normal;
                color: #325F6D;
            }
            .alignCentreMultiple {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 12px;
                font-weight: bolder;
                text-align: center;
                vertical-align: middle;
                font-style: normal;
                color: #000000;
            }
            .autoAdjust {
                height: auto;
                width: auto;
            }
            .radioSpanCSS {
                font-size: 12px;
                font-family: Arial, Helvetica, sans-serif;
                text-align: left;
                vertical-align: middle;
            }
            .radioCSS {
                background-position: left center;
            }
            .spanText {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 12px;
                font-weight: bold;
                color: #000000;
            }
            .emptyFieldSet {
                border-top-color: #FA7676;
                border-right-color: #FA7676;
                border-bottom-color: #FA7676;
                border-left-color: #FA7676;
                border-top-style: solid;
                border-right-style: solid;
                border-bottom-style: solid;
                border-left-style: solid;
                border-top-width: thin;
                border-right-width: thin;
                border-bottom-width: thin;
                border-left-width: thin;
                background-image: url(images/close.JPG);
                background-repeat: repeat-y;
                background-attachment: scroll;
                background-position: right;
                width: auto;
                height: auto;
                display: inline;
            }
            .style1 {
                font-family: Tahoma;
                font-size: 14px;
            }
            .style2 {
                color: #666666;
                font-family: Tahoma;
                font-size: 14px;
            }
            .style4 {
                font-size: 12px;
                font-family: Tahoma;
                text-align: left;
                vertical-align: middle;
                color: #325f6d;
            }

            .style3 {
                font-family: Calibri;
                color: #FFFFFF;
                font-weight: bold;
                font-size: 18px;
            }
            .style7 {
                color: black;
                text-transform: capitalize;
            }
            .style8 {
                color: black;
            }
            .style9 {
                font-size: 17px;
                font-family: Tahoma;
                text-align: left;
                vertical-align: middle;
                color: #666666;
            }
            -->
        </style>
        <script type="text/javascript" src="js/datetimepicker_css.js"></script>



        <script >
            function backButtton1()
            {
                
                window.location='viewAllRooms.jsp';

            }
        </script>

    </head >

    <body  >
        <span class="style9" style="text-align:center;padding-top: 10px;"><h4 style="text-align:center;padding-top: 10px;">Room Information</h4></span>
        <div style="width:100%;">
            <div style="width:30%;float:left;">
                <table>
                    <tr>
                        <td ><span class="style9">Room Code</span></td>
                        <td ><span class="style9">:</span></td>
                        <td><span class="style9"><c:out value="${detailsOfRoom.roomcode}"/></span></td>
                    </tr>
                </table>
            </div>
            <div style="width:35%;float:left;">
                <table>
                    <tr>
                        <td><span class="style9">Floor No</span></td>
                        <td ><span class="style9">:</span></td>
                        <td><span class="style9"><c:out value="${detailsOfRoom.roomsetup.floorno}"/></span></td>
                    </tr>
                </table>
            </div>
            <div style="width:35%;float:left;">
                <table>
                    <tr>
                        <td><span class="style9">Type</span></td>
                        <td ><span class="style9">:</span></td>
                        <td><span class="style9"><c:out value="${detailsOfRoom.roomtype.roomtype}"/></span></td>
                    </tr>
                </table>
            </div>
        </div>
        <span class="style9" style="text-align:center;padding-top: 10px;"><h4 style="text-align:center;padding-top: 50px;">Bed Information</h4></span>
        <div style="width:100%;">
            <c:forEach items="${detailsOfRoom.beddetailses}" var="bed">
                <div style="width:30%;margin-left:20%;float:left;">

                    <table>
                        <tr>
                            <td><span class="style9">Bed No</span></td>
                            <td ><span class="style9">:</span></td>
                            <td><span class="style9"><c:out value="${bed.bedno}"/></span></td>
                        </tr>

                    </table>
                </div>
                <div style="width:30%;margin-left:20%;float:left;">
                    <table>
                        <c:choose>
                            <c:when test="${bed.occupied=='False'}">
                                <tr>
                                    <td><span class="style9">Status</span></td>
                                    <td ><span class="style9">:</span></td>
                                    <td><span class="style9">Not Occupied</span></td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td><span class="style9">Status</span></td>
                                    <td ><span class="style9">:</span></td>
                                    <td><span class="style9">Occupied</span></td>
                                </tr>
                            </c:otherwise>
                        </c:choose>

                    </table>
                </div>
            </c:forEach>
        </div>
    </body>
</html>
