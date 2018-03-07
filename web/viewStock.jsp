<%-- 
    Document   : viewStock
    Created on : Jul 30, 2012, 1:53:35 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/datePicker/jquery-ui-1.8.18.custom.css">
        <link rel="stylesheet" href="css/datePicker/demos.css">
        <style type="text/css">
            <!--
            .divCSS{
                overflow:  scroll;
                height: 100%;
                width: 100%;
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
                border-top-width: 1px;
                border-right-width: 1px;
                border-bottom-width: 1px;
                border-left-width: 1px;
                width: auto;
                height: auto;
            }
            .alignRight {
                font-family: Tahoma;
                font-size: 11px;
                font-style: normal;
                text-transform: capitalize;
                color: #325F6D;
                text-align: left;
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
            <!--
            .header {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 12px;
                background-color: #4b6a84;
            }
            .table {
                background-color: #3399CC;
                text-align: center;
                width: auto;


            }
            .headerText {
                border-radius:3px;
                width: 10px;
                font-family: Tahoma;
                font-size: 12px;
                background-color: #4b6a84;
                color: #FFFFFF;
                font-weight: normal;
                width: auto ;
                height: 27px;
                vertical-align:text-top;
                text-align: center;
                background-image: url("images/ui-bg_diagonals-small_50_466580_40x40.png");
            }
            .dataText {
                border-radius:3px;
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 13px;
                letter-spacing: normal;
                text-align: center;
                background-color: #E3EFFF;

            }
            .dataTextInActive {
                border-radius:3px;
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 12px;
                font-weight: bold;
                letter-spacing: normal;
                text-align: center;
                background-color: #E3EFFF;
                text-decoration:none;
            }
            .dataTextActive {
                border-radius:3px;
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 12px;
                font-weight: bold;
                letter-spacing: normal;
                text-align: center;
                background-color: #E3EFFF;
                text-decoration: underline;
                cursor: pointer;
            }
            .dataTextHidden {
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 13px;
                letter-spacing: normal;
                text-align: center;
                background-color: #E3EFFF;
            }
            .headerTD{
                border-radius:6px;
                background-color:#4b6a84;
                background-image: url("images/ui-bg_diagonals-small_50_466580_40x40.png");
                color: #FFFFFF;
                font-family: Tahoma;
                font-size: 13px;
                text-transform: uppercase;
                text-align: center;
                font-weight: bold;
                height: 22px;
            }

        </style>
        <style>

            #button { }

        </style>
        <link rel="stylesheet" href="css/validation/jquery.ketchup.css">
        <script type="text/javascript" src="js/datePicker/jquery-1.7.1.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery-ui-1.8.17.custom.js"></script>
        <script type="text/javascript" language="javascript" src="js/dataTable/jquery.dataTables.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.core.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.widget.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.datepicker.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.tabs.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/sliderAccess.js"></script>

        <script type="text/javascript" src="js/validation/jquery.ketchup.all.min.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.button.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.accordion.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.effects.core.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.accordion.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.effects.slide.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.effects.bounce.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.effects.clip.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.effects.transfer.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.effects.blind.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/ScrollableGridPlugin.js"></script>
        <script type = "text/javascript">
            
            function getCurrentDate(){
                var today = new Date();
                var day=today.getDate();
                var month=today.getMonth()+1;
                var year=today.getFullYear();
                if(month <10){
                    month="0"+month;

                }
                else {
                    month=month;
                }
                if(day <10){
                    day="0"+day;

                }
                else {
                    day=day;
                }
                return month+"/"+day+"/"+year;

            }
            
        </script>

        <script type="text/javascript" src="js/datetimepicker_css.js"></script>
        <script type="text/javascript">
            
            $(function() {
                $( "#manufactureDate" ).datepicker({
                    defaultDate: new Date('<fmt:formatDate pattern="yyyy" value="${stock.manufacturedate}" />',<fmt:formatDate pattern="MM" value="${stock.manufacturedate}" />-1,<fmt:formatDate pattern="dd" value="${stock.manufacturedate}" />),

                   
                    

                    changeMonth: true,
                    changeYear: true
                });
                $( "#creationDate" ).datepicker({
                    defaultDate: new Date('<fmt:formatDate pattern="yyyy" value="${stock.creationdate}" />',<fmt:formatDate pattern="MM" value="${stock.creationdate}" />-1,<fmt:formatDate pattern="dd" value="${stock.creationdate}" />),
                    
                    changeMonth: true,
                    changeYear: true
                });
                $( "#expiryDate" ).datepicker({
                    defaultDate: new Date('<fmt:formatDate pattern="yyyy" value="${stock.expirydate}" />',<fmt:formatDate pattern="MM" value="${stock.expirydate}" />-1,<fmt:formatDate pattern="dd" value="${stock.expirydate}" />),
                   
                    changeMonth: true,
                    changeYear: true
                });
                $( "#manufactureDate").val('<fmt:formatDate pattern="MM/dd/yyyy" value="${stock.manufacturedate}" />');
                $( "#creationDate" ).val('<fmt:formatDate pattern="MM/dd/yyyy" value="${stock.creationdate}" />');
                $( "#expiryDate" ).val('<fmt:formatDate pattern="MM/dd/yyyy" value="${stock.expirydate}" />');
                $( "#medicineName" ).val('<c:out value="${stock.medicine.name}" />');
                $( "#stockQuantity" ).val('<c:out value="${stock.availablestock}" />');
                $( "#batchNo" ).val('<c:out value="${stock.batchno}" />');
                $( "#stockId" ).val('<c:out value="${stock.id}" />');
                $( "#tabs" ).tabs();
                $( "#save" )
                .button()
                .click(function() {
                    
                });
                $( "#cancel" )
                .button()
                .click(function() {

                });

            });
        </script>

                <script >
            function backButtton1()
            {
                window.history.back();

                //window.location='addMedicine_JQUERY.jsp';

            }
        </script>
    </head>
    <body>
        <form action="Controller?process=StockProcess&action=updateStock" method="Post" >

            <table width="100%">
                <tr>
                    <td height="32" background="images/header-bg.png" style="background-repeat:repeat-x"><img src="images/back1.png" style="cursor: pointer" title="click to close" onclick="backButtton1()" /></td>


               </tr>
            </table>
            <div id="effect" class="ui-widget-content ui-corner-all">
                <div id="tabs">
                    <ul>
                        <li><a href="#tabs-1">Details</a></li>

                    </ul>
                    <div id="tabs-1">
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="table1" style="display: block">
                            <tr>
                                <td width="10%"  class="alignRight" >Medicine Name </td>
                                <td width="70%"  >
                                    <label>
                                        <input id="medicineName" name="medicineName" type="text" class="textField"  size="30" value=""  >
                                        <input id="stockId" name="stockId" type="hidden" value="" >
                                        <input id="medicineId" name="medicineId" type="hidden" value="<c:out value="${stock.medicine.id}" />"  >
                                    </label>
                                </td>
                            </tr>

                            <tr><td><br/></td></tr>
                            <tr></tr>
                            <tr>
                                <td width="10%"  class="alignRight" >Stock Quantity &nbsp;  </td>
                                <td width="70%"  >
                                    <label>
                                        <input name="stockQuantity" type="text" class="textField" id="stockQuantity" size="30" value=""   >
                                    </label>
                                </td>
                            </tr>
                            <tr><td><br/></td></tr>
                            <tr></tr>
                            <tr>
                                <td class="alignRight" width="10%" >Entry date &nbsp;
                                </td>
                                <td width="70%" >
                                    <label>
                                        <input  name="creationDate" type="text" class="textField" id="creationDate" size="30" value="" >
                                    </label>
                                </td>
                            </tr>
                            <tr><td><br/></td></tr>
                            <tr></tr>
                            <tr>
                                <td class="alignRight" width="10%" >Manufacturer date &nbsp;
                                </td>
                                <td width="70%" >
                                    <label>
                                        <input  name="manufactureDate" type="text" class="textField" id="manufactureDate" size="30" value=""  >
                                    </label>
                                </td>
                            </tr>
                            <tr><td><br/></td></tr>
                            <tr></tr>
                            <tr>
                                <td class="alignRight" width="10%" >Expiry date &nbsp;
                                </td>
                                <td width="70%" >
                                    <label>
                                        <input  name="expiryDate" type="text" class="textField" id="expiryDate" size="30" value="" >
                                    </label>
                                </td>
                            </tr>
                            <tr><td><br/></td></tr>
                            <tr></tr>
                            <tr>
                                <td width="10%"  class="alignRight" >Batch No &nbsp;  </td>
                                <td width="70%"  >
                                    <label>
                                        <input id="batchNo" name="batchNo" type="text" class="textField" id="stockQuantity" size="30" value=""   >
                                    </label>
                                </td>
                            </tr>

                        </table>
                        <table id="table2" width="15%" border="0" align="center"  >
                            <tr>
                                <td align="center" >
                                    <button id="save">update</button>
                                   
                                </td>
                                <td align="center">
                                <a id="cancel" href="Controller?process=MedicineProcess&action=viewMedicineDetails&id=<c:out value="${stock.medicine.id}" />">Cancel</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
