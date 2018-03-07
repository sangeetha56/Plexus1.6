<%--
    Document   : dialySalesReport
    Created on : Jun 2, 2014, 3:25:07 PM
    Author     : sultan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import=" java.math.*;" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Total Sale Summary</title>
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
            .headerTextBlack {
                border-radius:3px;
                width: 10px;
                font-family: Tahoma;
                font-size: 12px;

                color: black;
                font-weight: normal;
                width: auto ;
                height: 22px;
                vertical-align: middle;
                text-align: left;

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

            .dataTextLast {
                border-radius:3px;
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 13px;
                letter-spacing: normal;

                background-color: #E3EFFF;

            }

            .headerTDLastRow{
                border-radius:6px;
                background-color:#4b6a84;
                background-image: url("images/ui-bg_diagonals-small_50_466580_40x40.png");
                color: #FFFFFF;
                font-family: Tahoma;
                font-size: 13px;
                text-transform: uppercase;

                font-weight: bold;
                height: 22px;
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


        <script type="text/javascript">
            $(function() {

                $( "#printprop" )
                .button()
                .click(function() {
                    //alert('hhhh');
                    //CallPrint();

                });



            });



        </script>


        <script type="text/javascript">
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
                //window.back();

            }
            function CallPrintFunction()
            {
                //alert('CallPrintFunction');

                document.getElementById("hide1").style.display='';

                CallPrint();
            }

        </script>

    </head>

    <body>

        <script>
            $(document).ready(function() {
                $(".btnPrint").printPage();
                $("#salesreportDate").val();
                $("#salesreportDate").datepicker();
                $("#show").button();

                $("#salesDate2day").val(getCurrentDate());
                $("#salesDate2day").datepicker();
                $("#show2day").button();

                $("#salesfirstdate").datepicker();
                $("#salesseconddate").datepicker();

            });
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

        <script type="text/javascript">
            function show2day()
            {
                //alert('kkkk:-');

            }
        </script>
        <script type="text/javascript">
            $(function() {



                $( "#sales2day" )
                .button()
                .click(function() {
                    //alert('hhhh');
                    show2dateSales();


                });

                $( "#betweendate" )
                .button()
                .click(function() {
                    showBetweendateDateSales();

                });
                $( "#thismonth" )
                .button()
                .click(function() {
                    showSalesThisMonth();

                });
            });


        </script>

        <script type="text/javascript">
            function show2dateSales(){

                //alert('llll');

                var form1=document.getElementById("form1");
                var dateTodays=document.getElementById("salesDate2day").value;
                //alert(dateTodays);

                form1.action="Controller?process=DailySalesProcess&action=showTodaysSalesReport";
                form1.submit();

            }

            function showBetweendateDateSales(){

                //alert//('2222llll');

                var form1=document.getElementById("form1");

                form1.action="Controller?process=DailySalesProcess&action=showBetweenDateSalesReport";
                form1.submit();

            }

            function showSalesThisMonth(){

                //alert('showDispenseThisMonth');

                var form1=document.getElementById("form1");

                form1.action="Controller?process=DailySalesProcess&action=showSalesThisMonth";
                form1.submit();

            }


        </script>


        <script>
            $(document).ready(function() {
                $(".btnPrint").printPage();
            });
        </script>

        <form id="form1" action="Controller?process=DailySalesProcess&action=showByDateSalesReport" method="post">
            <table width="100%" style-="margin-top:150px">
                <tr>
                    <td  class="headerTD">Daily Sales Report</td>
                </tr>


            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="19%" class="headerTextBlack"><div align="left">Sales Report By Date </div></td>
                                <td width="1%" class="headerTextBlack"><div align="left">:</div></td>
                                <td width="7%"><div align="left">
                                        <label>
                                            <input type="text" name="salesreportDate" id="salesreportDate" size="10" />
                                        </label>
                                    </div></td>
                                <td width="11%" class="headerTextBlack"><div align="left"><input id="show" type="submit" value="Show"/> </div></td>
                                <td width="13%" class="headerTextBlack"><div align="left">Between Date </div></td>
                                <td width="1%" class="headerTextBlack"><div align="left">:</div></td>
                                <td width="9%"><div align="left">
                                        <label></label>
                                        <input  type="text" name="salesfirstdate" id="salesfirstdate" size="10" />
                                    </div></td>
                                <td width="2%" class="headerTextBlack"><div align="left"> To</div></td>
                                <td width="11%"><div align="left">
                                        <input  type="text" name="salesseconddate" id="salesseconddate" size="10"/>
                                    </div></td>
                                <td width="26%" class="headerTextBlack"><div align="left"><button id="thismonth"  >This Month</button></div></td>

                        </table></td>
                </tr>
                <tr>
                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <td width="19%"><div align="left"></div></td>
                            <td width="1%"><div align="left"></div></td>
                            <td width="7%"><div align="left">
                                    <label></label>
                                </div></td>
                            <td width="11%"><div align="left"></div></td>
                            <td width="13%"><div align="left"></div></td>
                            <td width="1%"><div align="left"></div></td>
                            <td width="9%"><div align="left">
                                    <label></label>
                                </div></td>
                            <td width="2%"><div align="left"></div></td>
                            <td width="11%"><div align="left"></div></td>
                            <td width="26%"><div align="left"></div></td>

                        </table></td>
                </tr>
                <tr>
                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <td width="19%" class="headerTextBlack"><div align="left"><button id="sales2day"  >TODAY</button></div></td>
                            <td width="1%"><div align="left"></div></td>
                            <td width="7%"><div align="left">
                                    <label>
                                        <input style="display: none" type="text"  name="salesDate2day" id="salesDate2day" />
                                    </label>
                                </div></td>
                            <td width="11%"><div align="left"></div></td>
                            <td width="13%"><div align="left"></div></td>
                            <td width="1%"><div align="left"></div></td>
                            <td width="9%"><div align="left">
                                    <label></label>
                                </div></td>
                            <td width="2%">&nbsp;</td>
                            <td width="11%"><div align="left"><button id="betweendate"  >Click</button></div></td>
                            <td width="26%"><div align="left"></div></td>

                        </table></td>
                </tr>
                <tr>
                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <td width="19%"><div align="left"></div></td>
                            <td width="1%"><div align="left"></div></td>
                            <td width="7%"><div align="left">
                                    <label></label>
                                </div></td>
                            <td width="11%"><div align="left"></div></td>
                            <td width="13%"><div align="left"></div></td>
                            <td width="1%"><div align="left"></div></td>
                            <td width="9%"><div align="left">
                                    <label></label>
                                </div></td>
                            <td width="2%"><div align="left"></div></td>
                            <td width="11%"><div align="left"></div></td>
                            <td width="26%"><div align="left"></div></td>

                        </table></td>
                </tr>


            </table>
            <div id="printData" >
                <table  width="100%"  border="1"  id="">
                    <tr>
                        <td  colspan="2" class="headerTD" style="color:#000000;">Summary of Sales Billing from&nbsp;&nbsp;&nbsp;  <fmt:formatDate pattern="dd MMMM yyyy " value="${firstdate}" /> To <fmt:formatDate pattern="dd MMMM yyyy " value="${seconddate}" /> </td>
                    </tr>

                </table>
                <table  width="100%"  border="1"  id="myTable">

                    <thead>
                        <tr class="headerText" >
                            <th style="color:#000000;" >Sl No</th>
                            <th style="color:#000000;" >Description</th>
                            <th style="color:#000000;" >No of Bills</th>
                            <th style="color:#000000;" >Total Bill Amount</th>
                            <th style="color:#000000;" >Total Advance Amount</th>


                        </tr>
                    </thead>

                    <tbody >


                        <tr style="border-color:#000000" border="1"  cellpadding="1"  cellspacing="1" >
                            <td class="dataText"  >1</td>
                            <td class="dataText"  >Consultation Charges</td>
                            <%

                                        BigDecimal therapybig = BigDecimal.ZERO;
                                        System.out.println("therapyyyyyy in ");
                            %>

                            <td class="dataText"  ><c:out default="" value="${therapysize}" /></td>

                            <c:forEach  items="${therapy}" var="therapysales">


                                <c:set var="therapyin" value="${therapysales.therapybillcharges}"/>
                                <%
                                            BigDecimal therapytemp = (BigDecimal) pageContext.getAttribute("therapyin");
                                            System.out.println("therapy in sales-" + therapytemp);
                                            therapybig = therapybig.add(therapytemp);
                                            System.out.println("Kamal in trouble for therapy in sales-" + therapybig);


                                %>



                            </c:forEach>

                            <td class="dataText"  ><%=therapybig%></td>
                            <td class="dataText"  >0</td>



                        </tr>


                        <%--     <tr style="border-color:#000000" border="1"  cellpadding="1"  cellspacing="1" >
                            <td class="dataText"  >1</td>
                            <td class="dataText"  >Consultation Charges</td>

                            <td class="dataText"  ><c:out default="" value="${billsize}" /></td>
                            <c:set var="myBill" value="${total}"/>
                            <%
                                        BigDecimal billvalue = BigDecimal.ZERO;
                                        Double duble = (Double) pageContext.getAttribute("myBill");
                                        BigDecimal billvalueTemp = new BigDecimal(duble);
                                        System.out.println("for pharmacy out pateint tempss-" + billvalueTemp);
                                        billvalue = billvalue.add(billvalueTemp);
                                        System.out.println("Kamal in trouble for billllllllll:-" + billvalueTemp);

                            %>
                            <td class="dataText"  ><c:out default="" value="${total}" /></td>



                        </tr>--%>
                        <tr style="border-color:#000000" border="1"  cellpadding="1"  cellspacing="1" >
                            <td class="dataText"  >2</td>
                            <td class="dataText"  >Pharmacy OutPatient</td>
                            <%

                                        BigDecimal myVariableBill = BigDecimal.ZERO;
                                        System.out.println("for pharmacy out pateint");
                            %>

                            <td class="dataText"  ><c:out default="" value="${dispensessize}" /></td>
                            <c:forEach items="${dispenses}" var="dispense">
                                <c:forEach varStatus="status" items="${dispense.dispensedmedicinebills}" var="bill">
                                    <c:choose>
                                        <c:when test="${status.first}">
                                            <c:set var="myTest" value="${bill.amount}"/>
                                            <%
                                                        BigDecimal temp = (BigDecimal) pageContext.getAttribute("myTest");
                                                        System.out.println("for pharmacy out pateint tempss-" + temp);
                                                        myVariableBill = myVariableBill.add(temp);
                                                        System.out.println("Kamal in trouble for pharmacy out pateint:-" + myVariableBill);

                                            %>

                                        </c:when>
                                        <c:otherwise></c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </c:forEach>
                            <td class="dataText"  ><%=myVariableBill%></td>
                            <td class="dataText"  >0</td>


                        </tr>
                        <tr style="border-color:#000000" border="1"  cellpadding="1"  cellspacing="1" >
                            <td class="dataText"  >3</td>
                            <td class="dataText"  >Pharmacy InPatient</td>
                            <%

                                        BigDecimal myVariableBillIn = BigDecimal.ZERO;
                                        System.out.println("pharmacy in pateint");
                            %>

                            <td class="dataText"  ><c:out default="" value="${indispensessize}" /></td>

                            <c:forEach items="${indispenses}" var="dispense">
                                <c:forEach varStatus="status" items="${dispense.indispensedmedicinebills}" var="bill">
                                    <c:choose>
                                        <c:when test="${status.first}">
                                            <c:set var="myTestIn" value="${bill.amount}"/>
                                            <%
                                                        BigDecimal tempin = (BigDecimal) pageContext.getAttribute("myTestIn");
                                                        System.out.println("pharmacy in pateint-" + tempin);
                                                        myVariableBillIn = myVariableBillIn.add(tempin);
                                                        System.out.println("Kamal in trouble for pharmacy in pateint:-" + myVariableBillIn);

                                            %>

                                        </c:when>
                                        <c:otherwise></c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </c:forEach>

                            <td class="dataText"  ><%=myVariableBillIn%></td>
                            <td class="dataText"  >0</td>



                        </tr><tr style="border-color:#000000" border="1"  cellpadding="1"  cellspacing="1" >
                            <td class="dataText"  >4</td>
                            <td class="dataText"  >Pharmacy Return Medicine</td>
                            <%

                                        BigDecimal myVariableBillOut = BigDecimal.ZERO;
                                        System.out.println("for pharmacy return medicine  pateint");
                            %>

                            <td class="dataText"  ><c:out default="" value="${redispensessize}" /></td>
                            <c:forEach items="${redispenses}" var="redispense">
                                <c:forEach varStatus="status" items="${redispense.redispensedmedicinebills}" var="bill">
                                    <c:choose>
                                        <c:when test="${status.first}">
                                            <c:set var="myTestOut" value="${bill.amount}"/>
                                            <%
                                                        BigDecimal tempOut = (BigDecimal) pageContext.getAttribute("myTestOut");
                                                        System.out.println("for pharmacy return medicine out pateint tempss-" + tempOut);
                                                        myVariableBillOut = myVariableBillOut.add(tempOut);
                                                        System.out.println("Kamal in trouble for pharmacy out pateint return medicine:-" + myVariableBillOut);

                                            %>

                                        </c:when>
                                        <c:otherwise></c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </c:forEach>
                            <td class="dataText"  ><%=myVariableBillOut%></td>
                            <td class="dataText"  >0</td>


                        </tr>



                        <tr style="border-color:#000000" border="1"  cellpadding="1"  cellspacing="1" >
                            <td class="dataText"  >5</td>
                            <td class="dataText"  >Investigation Charges</td>
                            <%

                                        BigDecimal investigationbig = BigDecimal.ZERO;
                                        System.out.println("investigationbig in ");
                            %>

                            <td class="dataText"  ><c:out default="" value="${investigationsize}" /></td>

                            <c:forEach  items="${investigation}" var="investigationsales">

                                <c:set var="investigationin" value="${investigationsales.investigationbillcharges}"/>
                                <%

                                            BigDecimal investigationtemp = (BigDecimal) pageContext.getAttribute("investigationin");
                                            System.out.println("investigation in sales-" + investigationtemp);
                                            investigationbig = investigationbig.add(investigationtemp);
                                            System.out.println("Kamal in trouble for investigationbig in sales-" + investigationbig);


                                %>


                            </c:forEach>
                            <td class="dataText"  ><%=investigationbig%></td>
                            <td class="dataText"  >0</td>



                        </tr>

                        <tr style="border-color:#000000" border="1"  cellpadding="1"  cellspacing="1" >
                            <td class="dataText"  >6</td>
                            <td class="dataText"  >Hospital Charges</td>
                            <%

                                        BigDecimal operationbig = BigDecimal.ZERO;
                                        BigDecimal advancebig = BigDecimal.ZERO;
                                        System.out.println("operationbig in ");
                            %>

                            <td class="dataText"  ><c:out default="" value="${operationbillsize}" /></td>

                            <c:forEach  items="${operationbillchild}" var="operationsales">

                                <c:set var="operationin" value="${operationsales.receivedamountchild}"/>
                                <%

                                            BigDecimal operationtemp = (BigDecimal) pageContext.getAttribute("operationin");
                                            System.out.println("operation in sales-" + operationtemp);
                                            operationbig = operationbig.add(operationtemp);
                                            System.out.println("Kamal in trouble for operationbig in sales-" + operationbig);


                                %>


                            </c:forEach>
                            <td class="dataText"  ><%=operationbig%></td>

                            <c:forEach  items="${operationbill}" var="operationsales">

                                <c:set var="advnce" value="${operationsales.advance}"/>
                                <%

                                            BigDecimal advncetemp = (BigDecimal) pageContext.getAttribute("advnce");
                                            System.out.println("operation in sales-" + advncetemp);
                                            advancebig = advancebig.add(advncetemp);
                                            System.out.println("Kamal in trouble for operationbig in sales-" + advancebig);


                                %>


                            </c:forEach>
                            <td class="dataText"  ><%=advancebig%></td>



                        </tr>


                        <tr style="border-color:#000000" border="1"  cellpadding="1"  cellspacing="1" >
                            <td class="dataText"  >7</td>
                            <td class="dataText"  >Hospital Return Charges</td>
                            <%

                                        BigDecimal hospitalreten = BigDecimal.ZERO;
                                        //BigDecimal advanceretenbill = BigDecimal.ZERO;
                                        System.out.println("operationbig in ");
                            %>

                            <td class="dataText"  ><c:out default="" value="${operationbillsizehospitaldue}" /></td>


                            <c:forEach  items="${operationbillchildListReturn}" var="operationsalesreturn">
                                <c:set var="hospitalretenset" value="${operationsalesreturn.totalduechild}"/>
                                <%

                                            BigDecimal hospitalretentemp = (BigDecimal) pageContext.getAttribute("hospitalretenset");
                                            System.out.println("operation in sales-" + hospitalretentemp);
                                            hospitalreten = hospitalreten.add(hospitalretentemp);
                                            System.out.println("Kamal in trouble for operatioadvanceretenbillnbig in sales-" + hospitalreten);


                                %>






                            </c:forEach>
                            <td class="dataText"  ><%=hospitalreten%></td>
                            <td class="dataText"  >0</td>



                        </tr>







                    </tbody>
                    <tfoot>

                        <tr>

                            <td class="headerTDLastRow" colspan="2" align="right" style="color:#000000;">Total</td>


                            <td class="headerTDLastRow"  align="center" style="color:#000000;"><c:out default="" value="${totalNoofBills}" /></td>
                            <%

                                        BigDecimal myTotalCollection = BigDecimal.ZERO;
                                        BigDecimal temp1 = BigDecimal.ZERO;
                                        BigDecimal temp2 = BigDecimal.ZERO;
                                        BigDecimal temp3 = BigDecimal.ZERO;
                                        BigDecimal temp4 = BigDecimal.ZERO;
                                        BigDecimal temp5 = BigDecimal.ZERO;
                                        BigDecimal temp6 = BigDecimal.ZERO;
                                        BigDecimal temp7 = BigDecimal.ZERO;

                                        //temp1 = temp1.add(billvalue);
                                        temp2 = temp1.add(myVariableBill);
                                        temp3 = temp2.add(myVariableBillIn);
                                        temp4 = temp3.subtract(myVariableBillOut);
                                        temp5 = temp4.add(therapybig);
                                        temp6 = temp5.add(investigationbig);
                                        System.out.println("for temp6:::" + temp6);
                                        temp7 = temp6.add(hospitalreten);
                                        System.out.println("for temp7" + temp7);
                                        myTotalCollection = temp7.add(operationbig);//temp7.add(advancebig);
                                        System.out.println("for pharmacy out pateint:-" + myTotalCollection);

                            %>
                            <td class="headerTDLastRow" align="center" style="color:#000000;"><%=myTotalCollection%></td>
                            <td class="headerTDLastRow" align="center" style="color:#000000;"><%=advancebig%></td>
                        </tr>
                        <tr style="display: none" id="hide1">
                            <td colspan="6"  align="center"  height="15px" valign="middle" align="center" style="font-family:verdana; font-weight:bold; font-size:10px; background-image:url(images/bar2.jpg); color:#FFFFCC">©Powered By Jeevan Jyoti Hospital</td>


                        </tr>




                    </tfoot>
                </table>
            </div>

            <table id="table2" width="10%" border="0" align="center"  >

                <tr>
                    <td align="center">

                        <%-- <span id="printprop">Print</span> onclick="CallPrint()" --%>

                        <input type="button" id="printprop" value="Print" onclick="CallPrintFunction();" />
                    </td>



                </tr>


            </table>

        </form>
    </body>
</html>
