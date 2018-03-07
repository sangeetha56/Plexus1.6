<%-- 
    Document   : gst
    Created on : Jul 17, 2017, 8:25:10 PM
    Author     : Admin
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gst Report</title>

        <style>
input.nametxt{ outline:0; border:none; width:100%}
.txtcls1{font-family:Arial, Helvetica, sans-serif; font-size:14px; color:#0067a9; text-align:center}
@media screen and (min-width:300px) and (max-width:767px){
	  .main_table{ width:100%}
	  .mobscale{ width:100%; float:left}
	}
</style>
    </head>







    <body>



    <form name="form1" id="form1" action="Controller?process=GstProcess&action=add" method="post">
        <script src="js/print/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script src="js/print/jquery.printPage.js" type="text/javascript"></script>
        <link rel="stylesheet" href="css/datePicker/jquery-ui-1.8.18.custom.css">
        <link rel="stylesheet" href="css/datePicker/demos.css">

        <script src="js/print/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery-ui-1.8.17.custom.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.datepicker.js"></script>
        <script src="js/print/jquery.printPage.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.button.js"></script>




        <table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td>
<table width="1000" cellpadding="0" cellspacing="0" border="0" class="main_table" style="border: 1px solid #ccc;">
<tr>
<td>

<!--Header Section Start-->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="border-bottom: 1px solid #ccc;">
<tr>
<td width="23%" class="mobscale" align="right"><img src="logo_jjh.png" alt="" width="50" height="100"/></td>
<td width="77%" class="mobscale" align="left" valign="top">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td align="left" valign="top" style="font-size:30px; color: #0067a9; font-family:Arial, Helvetica, sans-serif; font-weight:bold;">JEEVAN JYOTI HOSPITAL, MEGHNAGAR</td>
</tr>
<tr>
<td height="8"></td>
</tr>
<tr>
<td align="center" valign="top" style="font-size:30px; color:#0067a9; font-family:Arial, Helvetica, sans-serif;text-align:center;">GST Billing </td>
</tr>
<tr>
<td height="8"></td>
</tr>

</table>
</td>
</tr>
</table>
<!--Header Section End-->

<!--Bloood Group Section Start-->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin:10px 0px 0px 0px;border-bottom:1px solid #ccc;padding-bottom:10px;">
<tr>
<td width="50%" class="mobscale" align="left">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="27%" class="txtcls1" align="left">Patient </td>
<td width="73%" class="txtcls1" style="border-bottom:1px solid #000000"> <input type="text" name="Name" id="Name" class="nametxt" placeholder="Enter " /></td>
</tr>
<tr>
<td width="27%" class="txtcls1" align="left">Referred by </td>
<td width="73%" class="txtcls1" style="border-bottom:1px solid #000000"> <input type="text" name="Referred by" id="Referred by" class="nametxt" placeholder="Enter " /></td>
</tr>
</table>
</td>
<td width="50%" class="mobscale" align="left">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="20%" class="txtcls1" align="left">Card No</td>
<td width="80%" class="txtcls1" style="border-bottom:1px solid #000000"> <input type="text" name="Name" id="Name" class="nametxt" placeholder="Enter " /></td>
</tr>
<tr>
<td width="20%" class="txtcls1" align="left">Date</td>
<td width="80%" class="txtcls1" style="border-bottom:1px solid #000000"> <input type="text" name="Name" id="Name" class="nametxt" placeholder="Enter " /></td>
</tr>
<tr>
<td width="20%" class="txtcls1" align="left">Invoice</td>
<td width="80%" class="txtcls1" style="border-bottom:1px solid #000000"> <input type="text" name="Name" id="Name" class="nametxt" placeholder="Enter " /></td>
</tr>
</table>
</td>
</tr>
</table>
<!--Bloood Group Section End-->



<!--Ward Details Start-->
<table width="100%" class="tableborder" cellpadding="0" cellspacing="0" border="1" style="margin:10px 0px 0px 0px; color:#0067a9;border-color: #ccc;">
<tr>
<td  class="txtcls1">S.No</td>
<td  class="txtcls1">ITEMS</td>
<td  class="txtcls1">MFG DATE</td>
<td  class="txtcls1">BATCH NO</td>
<td  class="txtcls1">EXP DATE</td>
<td  class="txtcls1">QTY</td>
<td  class="txtcls1">RATE</td>
<td  class="txtcls1">SGST %</td>
<td  class="txtcls1">CGST %</td>
<td  class="txtcls1">IGST %</td>
<td  class="txtcls1">AMOUNT</td>
</tr>
<tr>
<td  class="txtcls1"><input type="text" name="id" id="id" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" name="id" id="id"class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" name="id" id="id"class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
</tr>
<tr>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
</tr>
<tr>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
</tr>
<tr>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
</tr>
<tr>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
<td  class="txtcls1"><input type="text" class="nametxt" placeholder="Enter" /></td>
</tr>

</table>
<!--Ward Details End-->


<!--Bloood Group Section Start-->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin:150px 0px 0px 0px;border-bottom:1px solid #ccc;padding-bottom:10px;">
<tr>
<td width="50%" class="mobscale" align="left" style="border:1px solid #ccc;">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr  style="height: 100px;">
<td width="100%" class="txtcls1" align="left">For Jeevan Jyoti Pharma </td>
</tr>
<tr style="margin-top:50px;">
<td width="100%" class="txtcls1"> Authorised Signatory</td>
</tr>
</table>
</td>
<td width="50%" class="mobscale" align="left">
<table width="100%" height="200px" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="25%" class="txtcls1" align="left">SUB TOTAL</td>
<td width="1%" class="txtcls1" align="left">:</td>
<td width="74%" class="txtcls1" style="border-bottom:1px solid #000000"> <input type="text" class="nametxt" placeholder="Enter " /></td>
</tr>
<tr>
<td width="25%" class="txtcls1" align="left">SGST %</td>
<td width="1%" class="txtcls1" align="left">:</td>
<td width="74%" class="txtcls1" style="border-bottom:1px solid #000000"> <input type="text" class="nametxt" placeholder="Enter " /></td>
</tr>
<tr>
<td width="25%" class="txtcls1" align="left">CGST %</td>
<td width="1%" class="txtcls1" align="left">:</td>
<td width="74%" class="txtcls1" style="border-bottom:1px solid #000000"> <input type="text" class="nametxt" placeholder="Enter " /></td>
</tr>
<tr>
<td width="25%" class="txtcls1" align="left">IGST %</td>
<td width="1%" class="txtcls1" align="left">:</td>
<td width="74%" class="txtcls1" style="border-bottom:1px solid #000000"> <input type="text" class="nametxt" placeholder="Enter " /></td>
</tr>
<tr>
<td width="25%" class="txtcls1" align="left">ROUND OFF</td>
<td width="1%" class="txtcls1" align="left">:</td>
<td width="74%" class="txtcls1" style="border-bottom:1px solid #000000"> <input type="text" class="nametxt" placeholder="Enter " /></td>
</tr>
<tr>
<td width="25%" class="txtcls1" align="left">GST TOTAL</td>
<td width="1%" class="txtcls1" align="left">:</td>
<td width="74%" class="txtcls1" style="border-bottom:1px solid #000000"> <input type="text" class="nametxt" placeholder="Enter " /></td>
</tr>
<tr style="border:1px solid #ccc;">
<td width="25%" class="txtcls1" align="left" style="border: 1px solid #ccc;padding: 10px !important;margin-top:20px;">GRAND TOTAL</td>
<td width="1%" class="txtcls1" align="left">:</td>
<td width="74%" class="txtcls1" style="border: 1px solid #ccc;padding: 10px !important;"> <input type="text" class="nametxt" placeholder="Enter " /></td>
</tr>
</table>
</td>
</tr>
</table>
<!--Bloood Group Section End-->

</td>
</tr>
</table>
</td>
</tr>
</table>



















    <table id="table2" width="100%" border="0" align="center"  >

                                            <tr>
                                                <td align="center">
                                                    <button id="save"  onclick="myFunction()" onmouseover="validateButton();">Save and print</button>
                                                    <button id="reset" type="reset" >Cancel</button>








                        <!--    <span id="printprop">Print</span> onclick="CallPrint()" -->


<script>
function myFunction() {
    window.print();
}
</script>
 </td>
                                         </tr>
            </table>

    </form>
</body>
</html>
