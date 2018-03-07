<%--
    Document   : ${name}
    Created on : ${date}, ${time}
    Author     : ${user}
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import=" java.math.*;" %>
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
            -->
        </style>
        <script type="text/javascript" src="js/datePicker/jquery-1.7.1.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery-ui-1.8.17.custom.js"></script>
        <script src="js/print/jquery.printPage.js" type="text/javascript"></script>
         <script type="text/javascript" src="js/datePicker/ui/jquery.ui.button.js"></script>
        <title>JSP Page</title>
        <script type="text/javascript">
             $(function() {

                 $("#print").printPage();
             });
        </script>
         <script type="text/javascript">
            $(function() {



                $( "#sub" )
                .button()
                .click(function() {

                });

               });


        </script>
         <script >
            function backButtton1()
            {

                window.history.back();

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



    </head>
    <body>
        <form action="Controller?process=DispenseProcess&action=printBill&id=<c:out value="${dispense.id}"/>" method="post" onsubmit="return validateMedicine()">
            <table  width="100%">
                <thead>

                    <tr  >

                        <td colspan="3" class="headerText"><img align="left" src="images/back1.png" style="cursor: pointer" title="click to close" onclick="backButtton1()" />Pharmacy Out Patient Details </td>


                    </tr>
                    <tr  >

                        <td colspan="3" class="headerText">Patient Details</td>


                    </tr>

                </thead>
                <tbody>
                     <c:forEach end="1" items="${dispense.dispensedmedicinebills}" var="dispensedmedicinebill">
                    <tr><td style="width: 45%">Invoice No: <c:out value="${dispensedmedicinebill.id}"/></td></tr>
                      </c:forEach>
                    <tr>
                        <td style="width: 45%">Patient Name: <c:out value="${dispense.patient.name}" /></td>
                        <td style="width: 20%">Contact No:  <c:out value="${dispense.patient.telephoneno}" /></td>
                        <td>Dispense Date: <fmt:formatDate pattern="dd MMMM yyyy " value="${dispense.dispensedate}" /> </td>

                    </tr>

                        <c:forEach end="1" items="${dispense.dispensedmedicinebills}" var="dispensedmedicinebill">
                    <tr>
                        <td style="width: 45%">Card No: <c:out value="${dispense.patient.cardno}"/></td>
                        <td style="width: 30%">Doctor: <c:out value="${dispensedmedicinebill.doctorname}" /></td><!-- dispense.dispensedmedicinebills.doctordepartment -->
                        <td>Department :  <c:out value="${dispensedmedicinebill.doctordepartment}" /></td>
                       

                    </tr>
              <tr>
                  
              <td colspan="3" align="right" style="padding-right:150px;display: none;">MISC Amount : <c:out value="${dispensedmedicinebill.miscellanousamount}" /></td>
              </tr>
                    </c:forEach>


                </tbody>
            </table>
            <table width="100%">
               <thead>
                    <tr  >

                        <td  class="headerText">Medicine Details</td>


                    </tr>

                </thead>

            </table>
            <TABLE id="dataTable" width="100%" border="1" >
                <thead>
                    <tr >

                        <td class="headerText" style="width: 3%">Sl No</td>
                        <td class="headerText" style="width: 15%">Medicine Name</td>
                        <td class="headerText" style="width: 5%">Batch No</td>
                        <td class="headerText" style="width: 15%">Expiry Date</td>
                        <td class="headerText" style="width: 5%">Quantity</td>
                        <td class="headerText" style="width: 5%">Price</td>
                        <td class="headerText" style="width: 5%">CGST%</td>
                        <td class="headerText" style="width: 5%">SGST%</td>
                        <td class="headerText" style="width: 5%">IGST%</td>
                        <td class="headerText" style="width: 5%">GST%</td>
                        <td class="headerText" style="width: 15%">Amount</td>
                        <td class="headerText" style="width: 15%" colspan="2">Tax</td>
                    </tr>
                </thead>
                <tbody>
                     <%
                            int i=1;
                     %>
                    <c:forEach items="${dispense.unitdispensedoses}" var="unitdispensedose">

                        <tr>
                            <td align="center"><%=i%></td>
                            <td align="center"><c:out value="${unitdispensedose.medicine.name}" /></td>
                            <td align="center"><c:out value="${unitdispensedose.medicine.batchno}" /></td>

                            <td align="center"><c:out value="${unitdispensedose.medicine.expirydatemedicine}" /></td>

                            <td align="center"><c:out value="${unitdispensedose.quantity}" /></td>
                            <td align="center"><c:out value="${unitdispensedose.medicine.price}" /></td>
                            <td align="center"><c:out value="${unitdispensedose.medicine.cgst}" /></td>
                            <td align="center"><c:out value="${unitdispensedose.medicine.sgst}" /></td>
                            <td align="center"><c:out value="${unitdispensedose.medicine.igst}" /></td>
                            <td align="center"><c:out value="${unitdispensedose.medicine.gst}" /></td>
                            <td align="center"><c:out value="${unitdispensedose.amount}" /></td>
                            <c:set var="quantity" value="${unitdispensedose.quantity}"/>
                            <c:set var="price" value="${unitdispensedose.medicine.price}"/>
                            <c:set var="gst" value="${unitdispensedose.medicine.gst}"/>
                            <%
                            Long  quantitys = (Long) pageContext.getAttribute("quantity");
                            BigDecimal  prices = (BigDecimal) pageContext.getAttribute("price");
                            BigDecimal  gsts = (BigDecimal) pageContext.getAttribute("gst");
                            BigDecimal quantity = new BigDecimal(quantitys);
                            BigDecimal product1 = quantity.multiply(prices);
                            BigDecimal product2 = product1.multiply(gsts);
                            BigDecimal divider = new BigDecimal(100);
                            BigDecimal finalresult = product2.divide(divider);

                            long q=prices.longValue();
                            long gt=gsts.longValue();
                            //System.out.println("qqqqqqqqq:-"+quantitys);

                                    
                                                   
                                                   // long result = quantitys*q*gt/100;
                                                    %>
                                                    <td align="center" style="font-size: 12px" colspan="2"> <%=finalresult%></td>
                    
                           

                        </tr>
			
                        <%
                        i++;
                        %>

                    </c:forEach>


                </tbody>
                <tfoot>
                    <c:forEach end="1" items="${dispense.dispensedmedicinebills}" var="dispensedmedicinebill">
                 <%--       <tr>

                            <td colspan="7" align="right">Medicine Total</td>
                            <td align="center"><c:out value="${dispensedmedicinebill.medicineamount}" /></td>
                        </tr>

                        <tr>

                            <td colspan="7" align="right">Miscellaneous</td>
                            <td align="center"><c:out value="${dispensedmedicinebill.miscellanousamount}" /></td>
                        </tr>
                        <tr>

                            <td colspan="7" align="right">Bill Value</td>
                            <td align="center"><c:out value="${dispensedmedicinebill.billvaluebeforediscount}" /></td>
                        </tr>
                        <tr>

                            <td colspan="7" align="right">Discount(%)</td>
                            <td align="center"><c:out value="${dispensedmedicinebill.discountparcentage}" /></td>
                        </tr>
                        <tr>

                            <td colspan="7" align="right">Discount Value</td>
                            <td align="center"><c:out value="${dispensedmedicinebill.discountedvalue}" /></td>
                        </tr>
                        <tr>

                            <td colspan="7" align="right">Total Payable</td>
                            <td align="center"><c:out value="${dispensedmedicinebill.amount}" /></td>
                        </tr> --%>
                 <tr>
                        <td colspan="10" width="66%" height="26" style="border:hidden">&nbsp;</td>
                        <td width="21%" align="right">Medicine Total</td>
                        <td align="center" style="width: 15%"><c:out value="${dispensedmedicinebill.medicineamount}" /></td>
                    </tr>
                    <tr>
                        <td colspan="10" height="24" style="border:hidden">&nbsp;</td>
                        <td height="24" align="right">Bill Value</td>
                        <td height="24" align="center" style="width: 15%"><c:out value="${dispensedmedicinebill.miscellanousamount}" /></td>
                    </tr>

                 <%--   <tr>
                        <td colspan="6" height="24" style="border:hidden">&nbsp;</td>
                        <td height="24" align="right"><b>CGST&nbsp;&nbsp;</b></td>
                        <td height="24" align="center" style="width: 15%"><c:out value="${dispensedmedicinebill.cgst}" /></td>

                    </tr>

                    <tr>
                        <td colspan="6" height="24" style="border:hidden">&nbsp;</td>
                        <td height="24" align="right"><b>SGST&nbsp;&nbsp;</b></td>
                        <td height="24" align="center" style="width: 15%"><c:out value="${dispensedmedicinebill.sgst}" /></td>

                    </tr>

                    <tr>
                        <td colspan="6" height="24" style="border:hidden">&nbsp;</td>
                        <td height="24" align="right"><b>IGST&nbsp;&nbsp;</b></td>
                        <td height="24" align="center" style="width: 15%"><c:out value="${dispensedmedicinebill.igst}" /></td>

                    </tr>

                    <tr>
                        <td colspan="6" height="24" style="border:hidden">&nbsp;</td>
                        <td height="24" align="right"><b>GST&nbsp;&nbsp;</b></td>
                        <td height="24" align="center" style="width: 15%"><c:out value="${dispensedmedicinebill.gst}" /></td>

                    </tr>  --%>

                    <tr>
                        <td colspan="10" height="24" style="border:hidden">&nbsp;</td>
                        <td height="24" align="right">Total Tax&nbsp;&nbsp;</td>
                        <td height="24" align="center" style="width: 15%"><c:out value="${dispensedmedicinebill.totaltaxvalue}" /></td>

                    </tr>

                    
                    <tr>
                        <td colspan="10" height="22" style="border:hidden">&nbsp;</td>
                        <td height="22" align="right">Discount(%)</td>
                        <td height="22" align="center" style="width: 15%"><c:out value="${dispensedmedicinebill.discountparcentage}" /></td>
                    </tr>

                    <tr>
                        <td colspan="10" height="27" style="border:hidden">&nbsp;</td>
                        <td height="27" align="right">Discount Amount(-)</td>
                        <td height="27" align="center" style="width: 15%"><c:out value="${dispensedmedicinebill.discountedvalue}" /></td>
                    </tr>
                    
                    <tr>
                        <td colspan="10" height="27" style="border:hidden">&nbsp;</td>
                        <td height="27" align="right">Total Payable</td>
                        <td height="27" align="center" style="width: 15%"><c:out value="${dispensedmedicinebill.amount}" /></td>
                    </tr>
                    </c:forEach>

                </tfoot>
            </TABLE>
                    <table  width="100%"  style="border-collapse:collapse;">
                        <tr style="display: none">
                            <td  align="right"  height="15px" valign="middle" align="center" style="font-family:verdana; font-weight:bold; font-size:10px; background-image:url(images/bar2.jpg); color:#FFFFCC">©Powered By SaluSoft</td>


                    </tr>

                    </table>
            <table id="dataTable" width="100%" border="0">
                <tr>
                    <td align="center" >


                        <a id="print" href="Controller?process=DispenseProcess&action=printBill&id=<c:out value="${dispense.id}"/>">Print</a>
                        <!--<input id="sub" type="submit" value="Print"  /> -->
                    </td>


                </tr>

            </table>

        </form>
    </body>
</html>
