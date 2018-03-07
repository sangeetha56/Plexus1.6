<%--
    Document   : viewMedicineBill_kamal
    Created on : Jul 10, 2014, 2:55:42 PM
    Author     : sultan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import=" java.math.BigDecimal;" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Medicine Bill</title>
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
            .dataTextLast {
                border-radius:3px;
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 13px;
                letter-spacing: normal;

                background-color: #E3EFFF;

            }
            .dataTextAmount {
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
        <link rel="stylesheet" href="css/datePicker/jquery-ui-1.8.18.custom.css">
        <link rel="stylesheet" href="css/datePicker/demos.css">

        <script src="js/print/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery-ui-1.8.17.custom.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.datepicker.js"></script>
        <script src="js/print/jquery.printPage.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.button.js"></script>

        <script type="text/javascript">
            function calculate()
            {
                var valuek=document.getElementById("amountbill").value;
                alert('kkkk:-'+valuek)

            }
        </script>

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

                }

                function CallPrintFunction()
            {
                //alert('CallPrintFunction');
                document.getElementById("summary").style.display='';
                document.getElementById("summary1").style.display='';
                document.getElementById("hide1").style.display='';

                CallPrint();
            }
        </script>
    </head>

    <body>
        <script>
            $(document).ready(function() {
                $(".btnPrint").printPage();
                $("#dispenseDate").val();
                $("#dispenseDate").datepicker();
                $("#show").button();

                $("#redispenseDate2day").val(getCurrentDate());
                $("#redispenseDate2day").datepicker();
                $("#show2day").button();

               $("#firstdate").datepicker();
               $("#seconddate").datepicker();

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



                $( "#2day" )
                .button()
                .click(function() {
                   // alert('hhhh');
                    show2dateRedispense();


                });

                $( "#betweendate" )
                .button()
                .click(function() {
                     showBetweendateRedispense();

                   });
                   $( "#thismonth" )
                .button()
                .click(function() {
                     showRedispenseThisMonth();

                   });
            });


        </script>

        <script type="text/javascript">
    function show2dateRedispense(){

        //alert('llll');

        var form1=document.getElementById("form1");
        var dateTodays=document.getElementById("redispenseDate2day").value;
        //alert(dateTodays);

        form1.action="Controller?process=RedispenseProcess&action=showTodaysRedispensedBills";
        form1.submit();

    }

    function showBetweendateRedispense(){

        //alert('2222llll');

        var form1=document.getElementById("form1");

        form1.action="Controller?process=RedispenseProcess&action=showBetweenTodaysRedispensedBills";
        form1.submit();

    }

    function showRedispenseThisMonth(){

        //alert('showDispenseThisMonth');

        var form1=document.getElementById("form1");

        form1.action="Controller?process=RedispenseProcess&action=showRedispensedBillsForThisMonth";
        form1.submit();

    }


</script>


        <form id="form1" action="Controller?process=RedispenseProcess&action=showRedispensedBills" method="post">
            <table width="100%">
                <tr>
                    <td  colspan="2" class="headerTD" style="color:#000;">Summary of Pharmacy Return Medicine Billing </td>
                </tr>
            </table>
      <%--          <tr>

                    <td class="headerTextBlack">Dispense by Date: <input type="text" name="dispenseDate" id="dispenseDate" />&nbsp;&nbsp;&nbsp;<input id="show" type="submit" value="Show"/></td>
                    <td> </td>
                </tr>
                <tr>

                    <td class="headerTextBlack"><input style="display: none" type="text" name="dispenseDate2day" id="dispenseDate2day" />&nbsp;&nbsp;&nbsp;<button id="2day"  >TODAY</button></td>
                    <td class="headerTextBlack">Between Date:<input  type="text" name="firstdate" id="firstdate" size="10" /> To <input  type="text" name="seconddate" id="seconddate" size="10"/><button id="betweendate"  >Click</button> </td>
                    <td class="headerTextBlack"><button id="thismonth"  >This Month</button> </td>
                </tr>
--%>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="19%" class="headerTextBlack"><div align="left">By Date </div></td>
        <td width="1%" class="headerTextBlack"><div align="left">:</div></td>
        <td width="7%"><div align="left">
          <label>
              <input type="text" name="dispenseDate" id="dispenseDate" size="10" />
          </label>
        </div></td>
        <td width="11%" class="headerTextBlack"><div align="left"><input id="show" type="submit" value="Show"/> </div></td>
        <td width="13%" class="headerTextBlack"><div align="left">Between Date </div></td>
        <td width="1%" class="headerTextBlack"><div align="left">:</div></td>
        <td width="9%"><div align="left">
          <label></label>
          <input  type="text" name="firstdate" id="firstdate" size="10" />
        </div></td>
        <td width="2%" class="headerTextBlack"><div align="left"> To</div></td>
        <td width="11%"><div align="left">
          <input  type="text" name="seconddate" id="seconddate" size="10"/>
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
      <td width="19%" class="headerTextBlack"><div align="left"><button id="2day"  >TODAY</button></div></td>
        <td width="1%"><div align="left"></div></td>
        <td width="7%"><div align="left">
          <label>
              <input style="display: none" type="text"  name="dispenseDate2day" id="dispenseDate2day" />
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



                <table  width="100%" border="1"  id="">
                <tr>
                    <td  colspan="2" class="headerTD" style="color:#000;">Summary of Pharmacy Return Medicine Billing for&nbsp;&nbsp;&nbsp;  <fmt:formatDate pattern="dd MMMM yyyy " value="${firstdate}" /> To <fmt:formatDate pattern="dd MMMM yyyy " value="${seconddate}" /> </td>
                </tr>

            </table>
                <%--
            <table  width="100%"   id="myTable" border="1">

                <thead>
                    <tr class="headerText" >
                        <th  >Sl No</th>
                        <th  >Patient Name</th>
                        <th  >Dispense Time</th>
                        <th  >Amount</th>
                        <th>Detail</th>

                    </tr>
                </thead>

                <tbody >
                    <%
                            int i=1;
                            BigDecimal myVariableBill=BigDecimal.ZERO;
                            System.out.println("fdsfdsf");
                    %>

                    <c:forEach items="${dispenses}" var="dispense">
                        <tr style="border-color:#000000" border="1"  cellpadding="1"  cellspacing="1" >
                            <td class="dataText"  ><%=i%></td>
                            <td class="dataText"  ><c:out value="${dispense.patient.name}"/></td>
                            <td class="dataText"  ><fmt:formatDate pattern="dd-MM-yyyy " value="${dispense.dispensedate}" /> </td>
                            <c:forEach varStatus="status" items="${dispense.dispensedmedicinebills}" var="bill">
                                <c:choose>
                                    <c:when test="${status.first}">
                                        <c:set var="myTest" value="${bill.amount}"/>
                                        <%
                                        BigDecimal temp = (BigDecimal)pageContext.getAttribute("myTest");
                                        System.out.println("qqqqq:-"+temp);
                                        myVariableBill=myVariableBill.add(temp);
                                        System.out.println("Kamal in trouble:-"+myVariableBill);

                                        %>
                                        <td id="amount"   class="dataTextAmount"><c:out value="${bill.amount}" /></td><!--  <input type="text" name="amountbill" id="amountbill" onchange="calculate();" value="<c:out value="${bill.amount}" />" size="5" />   -->
                                    </c:when>
                                    <c:otherwise></c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <td class="dataText"><a href="Controller?process=DispenseProcess&action=previewBill&id=<c:out value="${dispense.id}"/>">Preview</a></td>



                        </tr>
                        <%
                        i++;
                        %>
                    </c:forEach>
                </tbody>
                <tfoot>

                        <tr>

                            <td class="headerTDLastRow" colspan="3" align="right">Total</td>
                            <td class="headerTDLastRow" align="left" colspan="2"><%=myVariableBill%></td>
                        </tr>
                        <tr>
                            <td colspan="6"  align="center"  height="15px" valign="middle" align="center" style="font-family:verdana; font-weight:bold; font-size:10px; background-image:url(images/bar2.jpg); color:#FFFFCC">©Powered By SaluSoft</td>


                        </tr>



                </tfoot>

            </table> --%>

                <table width="100%"  border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td width="88%"><div id="printData">
      <table  width="100%"   id="" border="1">
          <tr style="display: none" id="summary">
                       <td  colspan="2" class="headerTD" style="color:#000;">Summary of Pharmacy Return Medicine Billing for&nbsp;&nbsp;&nbsp;  <fmt:formatDate pattern="dd MMMM yyyy " value="${firstdate}" /> To <fmt:formatDate pattern="dd MMMM yyyy " value="${seconddate}" /></td>
                    </tr>

                </table>
                <table  width="100%"   id="myTable" border="1">

                <thead>
                    <tr class="headerText" >
                        <th style="color:#000;" >Sl No</th>
                        <th  style="color:#000;">Patient Name</th>
                        <th style="color:#000;" >Dispense Time</th>
                        <th style="color:#000;" >Amount</th>


                    </tr>
                </thead>

                <tbody >
                    <%
                            int i=1;
                            BigDecimal myVariableBillOut=BigDecimal.ZERO;
                            System.out.println("fdsfdsf");
                    %>

                    <c:forEach items="${redispenses}" var="redispense">
                        <tr style="border-color:#000000" border="1"  cellpadding="1"  cellspacing="1" >
                            <td class="dataText"  ><%=i%></td>
                            <td class="dataText"  ><c:out value="${redispense.patient.name}"/></td>
                            <td class="dataText"  ><fmt:formatDate pattern="dd-MM-yyyy " value="${redispense.dispensedate}" /> </td>
                            <c:forEach varStatus="status" items="${redispense.redispensedmedicinebills}" var="bill">
                                <c:choose>
                                    <c:when test="${status.first}">
                                        <c:set var="myTestOut" value="${bill.amount}"/>
                                        <%
                                        BigDecimal tempOut = (BigDecimal)pageContext.getAttribute("myTestOut");
                                        System.out.println("qqqqq:-"+tempOut);
                                        myVariableBillOut=myVariableBillOut.add(tempOut);
                                        System.out.println("Kamal in trouble return:-"+myVariableBillOut);

                                        %>
                                        <td id="amount"   class="dataTextAmount"><c:out value="${bill.amount}" /></td><!--  <input type="text" name="amountbill" id="amountbill" onchange="calculate();" value="<c:out value="${bill.amount}" />" size="5" />   -->
                                    </c:when>
                                    <c:otherwise></c:otherwise>
                                </c:choose>
                            </c:forEach>




                        </tr>
                        <%
                        i++;
                        %>
                    </c:forEach>
                </tbody>
                <tfoot>

                        <tr>

                            <td class="headerTDLastRow" colspan="3" align="right" style="color:#000;">Total</td>
                            <td class="headerTDLastRow" align="left" colspan="2"><%=myVariableBillOut%></td>
                        </tr>
                        <tr style="display: none" id="hide1">
                            <td colspan="6"  align="center"  height="15px" valign="middle" align="center" style="font-family:verdana; font-weight:bold; font-size:10px; background-image:url(images/bar2.jpg); color:#FFFFCC">©Powered By Jeevan Jyoti Hospital</td>


                        </tr>



                </tfoot>

            </table>
    </div></td>
    <td width="12%"><div>
      <table  width="100%"   id="" border="1">
                    <tr style="display: none" id="summary1">
                        <td  colspan="2" class="headerTD"></td>
                    </tr>

                </table>
                    <table  width="100%"   id="myTable" border="1">

                <thead>
                    <tr class="headerText" >

                        <th style="color:#000;">Detail</th>

                    </tr>
                </thead>

                <tbody >


                    <c:forEach items="${redispenses}" var="redispense">
                        <tr style="border-color:#000000" border="1"  cellpadding="1"  cellspacing="1" >

                            <c:forEach varStatus="status" items="${redispense.redispensedmedicinebills}" var="bill">
                                <c:choose>
                                    <c:when test="${status.first}">
                                        <c:set var="myTestOut" value="${bill.amount}"/>


                                    </c:when>
                                    <c:otherwise></c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <td class="dataText"><a href="Controller?process=RedispenseProcess&action=previewBill&id=<c:out value="${redispense.id}"/>">Preview</a></td>



                        </tr>

                    </c:forEach>
                </tbody>
                <tfoot>

                        <tr>

                            <td class="headerTDLastRow" colspan="3" align="right"></td>

                        </tr>
                        <tr style="display: none">
                            <td colspan="6"  align="center"  height="15px" valign="middle" align="center" style="font-family:verdana; font-weight:bold; font-size:10px; background-image:url(images/bar2.jpg); color:#FFFFCC"></td>


                        </tr>



                </tfoot>

            </table>
    </div></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
</table>


                        <table id="table2" width="10%" border="0" align="center"  >

                <tr>
                    <td align="center">

                      <!--  <span id="printprop">Print</span> onclick="CallPrint()" -->

                        <input type="button" id="printprop" value="Print" onclick="CallPrintFunction();" />
                    </td>



                </tr>


            </table>

        </form>
    </body>
</html>
