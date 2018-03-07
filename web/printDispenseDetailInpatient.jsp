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

            .headerText {

                width: 10px;
                font-family: Tahoma;
                font-size: 12px;

                color: #FFFFFF;
                font-weight: normal;
                width: auto ;
                height: 22px;
                vertical-align: middle;
                text-align: center;

            }
            .headerTextLeft {

                width: 10px;
                font-family: Tahoma;
                font-size: 12px;

                color: #FFFFFF;
                font-weight: normal;
                width: auto ;
                height: 22px;
                vertical-align: middle;
                text-align: left;

            }
            .dataTextBold {
                font-weight: bold;
                font-family: Tahoma;
                color: black;
                font-size: 12px;
                letter-spacing: normal;
                text-align: center;


            }
            .dataTextBoldLeft {
                font-weight: bold;
                font-family: Tahoma;
                color: black;
                font-size: 12px;
                letter-spacing: normal;
                text-align: left;


            }
            .dataText {

                font-family: Tahoma;
                color: black;
                font-size: 12px;
                letter-spacing: normal;
                text-align: center;


            }

            -->
        </style>
        <title>Invoice Print</title>
    </head>
    <body style="text-align: center">
        <form action="Controller?process=inDispenseProcess&action=add" method="post" onsubmit="return validateMedicine()">
            <%--      <br>
            <br><br><br><br> <br><br><br><br>
      --%>

            <table  width="100%"  style="border-collapse:collapse;">

                <tbody>
                    <c:forEach end="1" items="${dispenseInpatient.indispensedmedicinebills}" var="indispensedmedicinebill">
                    <tr><td style="width: 45%" align="left">Invoice No: <c:out value="${indispensedmedicinebill.id}"/></td></tr>
                      </c:forEach>
                    <tr>
                        <td style="width: 40%" align="left">Patient Name: <c:out value="${dispenseInpatient.inpatient.name}" /></td>
                        <td style="width: 30%" align="left">Contact No:  <c:out value="${dispenseInpatient.inpatient.telephoneno}" /></td>
                        <td style="width: 30%" align="right">Date: <fmt:formatDate pattern="dd MMMM yyyy " value="${dispenseInpatient.dispensedate}" /> </td>

                    </tr>

                    <c:forEach end="1" items="${dispenseInpatient.indispensedmedicinebills}" var="indispensedmedicinebill">
                            <tr>
                        <td style="width: 40%" align="left">Card No: <c:out value="${dispenseInpatient.inpatient.cardno}"/></td>
                        <td style="width: 30%" align="left">Doctor: <c:out value="${indispensedmedicinebill.doctorname}" /></td><!-- dispense.dispensedmedicinebills.doctordepartment -->
                        <td style="width: 30%" align="right">Department :  <c:out value="${indispensedmedicinebill.doctordepartment}" /></td>

                    </tr>
                     <tr>
              <td colspan="3" align="right" style="display: none;">MISC Amount : <c:out value="${indispensedmedicinebill.miscellanousamount}" /></td>
              </tr>
                    </c:forEach>


                </tbody>



            </table>
            <%--<TABLE id="dataTable" width="100%" border="1" style="border-collapse:collapse;">
                <tr>

                    <td colspan="4" class="headerTextLeft"></td>

                </tr>
            </TABLE>--%>

            <TABLE id="dataTable" width="100%" border="1" style="border: solid thin;">


                <thead style="color:black">
                   <tr >

                        <td class="headerText" style="color:#000;">Sl No</td>
                        <td class="headerText" style="color:#000;">Medicine Name</td>
                        <td class="headerText" style="color:#000;">Batch No</td>
                        <td class="headerText" style="color:#000;">Expiry Date</td>
                        <td class="headerText" style="color:#000;">Quantity</td>
                        <td class="headerText" style="color:#000;">Price</td>
                        <td class="headerText" style="color:#000;">CGST%</td>
                        <td class="headerText" style="color:#000;">SGST%</td>
                        <td class="headerText" style="color:#000;">IGST%</td>
                        <td class="headerText" style="color:#000;">GST%</td>
                        <td class="headerText" style="color:#000;">Amount</td>
                        <td class="headerText" style="color:#000;"  colspan="2">Tax</td>
                        

                    </tr>
                </thead>
                <tbody>
                     <%
                            int i=1;
                     %>
                    <c:forEach items="${dispenseInpatient.inunitdispensedoses}" var="unitdispensedose">
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
                    <c:forEach end="1" items="${dispenseInpatient.indispensedmedicinebills}" var="dispensedmedicinebill">
                        <%--  <tr>

                            <td colspan="10" align="right">Medicine Total</td>
                            <td align="center"><c:out value="${dispensedmedicinebill.medicineamount}" /></td>
                        </tr>

                        <tr>

                            <td colspan="10" align="right">Miscellaneous</td>
                            <td align="center"><c:out value="${dispensedmedicinebill.miscellanousamount}" /></td>
                        </tr>
                        <tr>

                            <td colspan="10" align="right">Bill Value</td>
                            <td align="center"><c:out value="${dispensedmedicinebill.billvaluebeforediscount}" /></td>
                        </tr>
                        <tr>

                            <td colspan="10" align="right">Discount(%)</td>
                            <td align="center"><c:out value="${dispensedmedicinebill.discountparcentage}" /></td>
                        </tr>
                        <tr>

                            <td colspan="10" align="right">Discount Value</td>
                            <td align="center"><c:out value="${dispensedmedicinebill.discountedvalue}" /></td>
                        </tr>
                        <tr>

                            <td colspan="10" align="right">Total Payable</td>
                            <td align="center"><c:out value="${dispensedmedicinebill.amount}" /></td>
                        </tr>  --%>
                   <tr>
                        <td colspan="10" width="66%" height="26" style="border:hidden">&nbsp;</td>
                        <td width="21%" align="right">Medicine Total</td>
                        <td align="center" style="width: 15%"><c:out value="${dispensedmedicinebill.medicineamount}" /></td>
                    </tr>
                    <tr>
                        <td colspan="10" height="24" style="border:hidden">&nbsp;</td>
                        <td height="24" align="right">Bill Value</td>
                        <td height="24" align="center" style="width: 15%"><c:out value="${dispensedmedicinebill.billvaluebeforediscount}" /></td>
                    </tr>
                     
                    <tr>
                        <td colspan="10" height="10" style="border:hidden">&nbsp;</td>
                        <td height="10" align="right">Discount(%)</td>
                        <td height="10" align="center" style="width: 15%"><c:out value="${dispensedmedicinebill.discountparcentage}" /></td>
                    </tr>
                     <tr>
                        <td colspan="10" height="24" style="border:hidden">&nbsp;</td>
                        <td height="24" align="right">Total Tax&nbsp;&nbsp;</td>
                        <td height="24" align="center" style="width: 15%"><c:out value="${dispensedmedicinebill.totaltaxvalue}" /></td>

                    </tr>
                    <tr>
                        <td colspan="10" height="10" style="border:hidden">&nbsp;</td>
                        <td height="10" align="right">Discount Amount(-)</td>
                        <td height="10" align="center" style="width: 15%"><c:out value="${dispensedmedicinebill.discountedvalue}" /></td>
                    </tr>
                   
                    <tr>
                        <td colspan="10" height="27" style="border:hidden">&nbsp;</td>
                        <td height="10" align="right"><b>Total Payable</b></td>
                        <td height="10" align="center" style="width: 15%;font-size: 12px"><c:out value="${dispensedmedicinebill.amount}" /></td>
                    </tr>
                    </c:forEach>
                </tfoot>


            </TABLE>

                    <table  width="100%"  style="border-collapse:collapse;">
                        <tr>
                            <td  align="right"  height="15px" valign="middle" align="center" style="font-family:verdana; font-weight:bold; font-size:10px; background-image:url(images/bar2.jpg); color:#FFFFCC">Powered By Jeevan Jyoti Hospital</td>


                    </tr>

                    </table>


        </form>
    </body>
</html>
