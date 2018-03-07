<%--
    Document   : printtherapyDetail
    Created on : Aug 6, 2014, 4:34:57 PM
    Author     : sultan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <style type="text/css" >
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
                height: 22px;
                vertical-align: middle;
                text-align: center;
                background-image: url("images/ui-bg_diagonals-small_50_466580_40x40.png");
            }
            .dataText {
                border-radius:3px;
                font-family: Tahoma;
                color: black;
                font-size: 13px;
                letter-spacing: normal;
                text-align: center;
                background-color: none;

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


                color: #000000;
                font-family: Tahoma;
                font-size: 26px;
                text-transform: uppercase;
                text-align: right;
                font-weight: bold;
                height: 22px;
            }
            .headerTD1{
                border-radius:6px;


                color: #000000;
                font-family: Tahoma;
                font-size: 11px;
                text-transform: uppercase;
                text-align: right;
                font-weight: bold;
                height: 22px;
            }
            .headerTD2{
                border-radius:6px;
                font-style:  italic;

                color: #000000;
                font-family: Tahoma;
                font-size: 8px;
                text-transform: uppercase;
                text-align: right;
                font-weight: bold;
                height: 22px;
            }
            .alignLeft {
                font-family: Tahoma;
                font-size: 11px;
                font-style: normal;
                text-transform: capitalize;
                color: #000000;
                text-align: left;
                vertical-align: middle;
                font-weight: bold;
            }
            .dataTextLeft {
                border-radius:3px;
                font-family: Tahoma;
                color: black;
                font-size: 13px;
                letter-spacing: normal;
                text-align: right;
                background-color: none;

            }

            -->
        </style>

<script src="js/print/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script src="js/print/jquery.printPage.js" type="text/javascript"></script>
        <link rel="stylesheet" href="css/datePicker/jquery-ui-1.8.18.custom.css">
        <link rel="stylesheet" href="css/datePicker/demos.css">

        <script src="js/print/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery-ui-1.8.17.custom.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.datepicker.js"></script>
        <script src="js/print/jquery.printPage.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.button.js"></script>


        <title></title>
        <script type="text/javascript">
             $(function() {

                 $("#print").printPage();
             });
        </script>
        <script >
            function backButtton1()
            {

                //window.location='viewAll_DataTables.jsp';
                window.back();

            }
        </script>

        <script type="text/javascript">
            $(function() {

                $( "#printprop" )
                .button()
                .click(function() {

                });



            });



        </script>


        <script language="javascript" type="text/javascript">

            function CallPrint()
            {

                    //alert('gdfgdf');
                    //window.print();

            //Get the HTML of div
            var divElements = document.getElementById('printData').innerHTML;
            //Get the HTML of whole page
            var oldPage = document.body.innerHTML;

            //Reset the page's HTML with div's HTML only
            document.body.innerHTML =
              "<html><head><title></title></head><body>" +
              divElements + "</body>";

            //Print Page
            window.print();

            //Restore orignal HTML
            document.body.innerHTML = oldPage;


/*
var DocumentContainer = document.getElementById('printData');
var WindowObject = window.open('', 'PrintWindow', 'width=750,height=650,top=50,left=50,toolbars=no,scrollbars=yes,status=no,resizable=yes');
var strHtml = "<html>\n<head>\n <link rel=\"stylesheet\" type=\"text/css\" href=\"test.css\">\n</head><body><div style=\"testStyle\">\n"
+ DocumentContainer.innerHTML + "\n</div>\n</body>\n</html>";
WindowObject.document.writeln(strHtml);
WindowObject.document.close();
WindowObject.focus();
WindowObject.print();
WindowObject.close();
*/

window.back();

                }
        </script>


    </head>
    <body onload="CallPrint();">
    <%--    <table width="100%">
            <tr>
                <td  class="headerTD">Plexus

                </td>
            </tr>
            <tr>
                <td  class="headerTD1">Neuro Centre and Multispeciality clinic

                </td>
            </tr>
            <tr>
                <td  class="headerTD2">.......rejuvenate your zest for life

                </td>
            </tr>
        </table>
        <table width="100%"  id="table1" align="center">
            <tr >
                <td width="25%"  class="alignLeft" >Name</td>
                <td width="25%" >
                    <c:out value="${bill.visit.patient.name}" />
                </td>

                <td width="25%"  class="alignLeft" >Age/Sex</td>
                <td width="25%"  >
                    <c:out default="" value="${bill.visit.patient.age}" />&nbsp;&nbsp;<c:out default="" value="${patient.sex}" />
                </td>

            </tr>
            <tr>
                <td width="25%"   class="alignLeft" >Contact No</td>
                <td width="25%"  >
                    <c:out default="" value="${bill.visit.patient.telephoneno}" />
                </td>
                <td width="25%"  class="alignLeft">Date</td>
                <td  width="25%" >
                   <fmt:formatDate pattern="EEEE, dd MMMM yyyy " value="${bill.visit.visittime}" /> at <fmt:formatDate pattern="hh:mm a" value="${bill.visit.visittime}" />
                </td>
            </tr>

        </table>
    --%>

    <table width="100%">
                <tr style="display: none">
                    <td height="32" background="images/header-bg.png" style="background-repeat:repeat-x"><img src="images/back1.png" style="cursor: pointer" title="click to close" onclick="backButtton1()" /></td>


               </tr>
    </table>
    <div id="printData">
    <table  width="100%">
                <thead>
                    <tr  >

                        <td colspan="3" class="headerText" style="color:#000">Consultancy Bill Charges Details </td>


                    </tr>
                    <tr  >

                        <td colspan="3" class="headerText" style="color:#000">Patient Details</td>


                    </tr>

                </thead>
                <tbody>
                    <tr><td class="dataText" style="width: 45%">Invoice No: <c:out value="${therapybill.therapybillid}"/></td></tr>

                    <tr>
                        <td class="dataText" style="width: 45%">Patient Name: <c:out value="${therapybill.patient.name}" /></td>
                        <td class="dataText" style="width: 20%">Contact No:  <c:out value="${therapybill.patient.telephoneno}" /></td>
                        <td class="dataText">Visit Date: <fmt:formatDate pattern="dd MMMM yyyy " value="${therapybill.therapybilldate}" /> </td>

                    </tr>


                    <tr>
                        <td class="dataText" style="width: 45%">Card No: <c:out value="${therapybill.patient.cardno}" /></td>
                        <td class="dataText" style="width: 30%">Doctor: <c:out value="${therapybill.doctorinfo.doctname}" /></td><!-- dispense.dispensedmedicinebills.doctordepartment -->
                        <td class="dataText">Department :  <c:out value="${therapybill.doctorinfo.departmentname.dptname}" /></td>

                    </tr>



                </tbody>
            </table>
            <table width="100%">
               <thead>
                   <tr style="display: none" >

                        <td  class="headerText">Therapy Bill Charges Details</td>


                    </tr>

                </thead>

            </table>
            <TABLE id="dataTable" width="100%" border="1" >
                <thead>
                    <tr >

                        <td class="headerText" style="color:#000">Sl No</td>
                        <td class="headerText" style="color:#000">Consultancy Type</td>
                        <td class="headerText" style="color:#000">Consultancy Bill Charges</td>
                        <td class="headerText" style="color:#000">Amount</td>

                    </tr>
                </thead>
                <tbody>
                     <%
                            int i=1;
                     %>


                        <c:forEach items="${therapybill.detailstherapybills}" var="therapyk">
                        <tr>
                            <td class="dataText" align="center"><%=i%></td>

                            <td class="dataText" align="center"><c:out value="${therapyk.theraphy.theraphytype}" /></td>
                            <td class="dataText" align="center"><c:out value="${therapyk.theraphy.theraphycharge}" /></td>
                            <td class="dataText" align="center"><c:out value="${therapyk.theraphy.theraphycharge}" /></td>


                        </tr>

                        <%
                        i++;
                        %>
                        </c:forEach>



                </tbody>
                <tfoot>

                        <tr>
                            <td></td>

                            <td class="dataTextLeft"  colspan="2" align="right" style="color:#000">Total</td>
                            <td class="dataText" align="center"><c:out value="${therapybill.therapybillcharges}" /></td>
                        </tr>
                        <tr >
                            <td colspan="6"  align="center"  height="15px" valign="middle" align="center" style="font-family:verdana; font-weight:bold; font-size:10px; background-image:url(images/bar2.jpg); color:#FFFFCC">©Powered By Jeevan Jyoti Hospital</td>


                        </tr>



                </tfoot>
            </TABLE>
                        </div>
            <table id="dataTable" width="100%" border="0">
                <tr style="display: none">
                    <td align="center" >
                   <input type="button" id="printprop" value="Print" onclick="CallPrint();" />
                    </td>


                </tr>

            </table>

    </body>
</html>
