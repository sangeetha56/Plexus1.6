<%-- 
    Document   : routineurine
    Created on : Jul 18, 2017, 6:56:50 PM
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
        <title>Routineurine Report</title>

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



    <form name="form1" id="form1" action="Controller?process=RoutineurealProcess&action=add" method="post">
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
<table width="1000" cellpadding="0" cellspacing="0" border="0" class="main_table">
<tr>
<td>

<!--Header Section Start-->
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="23%" class="mobscale" align="right"><img src="images/logo_jjh.png" alt="" width="50" height="100"/></td>
<td width="77%" class="mobscale" align="left" valign="top">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td align="center" valign="top" style="font-size:30px; color: #0067a9; font-family:Arial, Helvetica, sans-serif; font-weight:bold;">JEEVAN JYOTI HOSPITAL, MEGHNAGAR</td>
</tr>
<tr>
<td height="8"></td>
</tr>
<tr>
<td align="center" valign="top" style="font-size:30px; color:#0067a9; font-family:Arial, Helvetica, sans-serif;text-align:center;">Routine Urine Examination Report</td>
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
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin:10px 0px 0px 0px">
<tr>
<td width="70%" class="mobscale" align="left">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="15%" class="txtcls2" align="left"> Name </td>
<td width="85%" class="txtcls2" style="border-bottom:1px solid #000000"><input type="text" name="Name" id="Name" class="nametxt" placeholder="Enter Name" /> </td>
</tr>
</table>
</td>
<td width="30%" class="mobscale" align="left">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="15%" class="txtcls2" align="left"> Date </td>
<td width="85%" class="txtcls2" style="border-bottom:1px solid #000000"> <input type="text" name="Date" id="Date" class="nametxt" placeholder="Enter Date" /></td>
</tr>
</table>
</td>
</tr>
</table>
<!--Bloood Group Section End-->

<!--Bloood Group Section Start-->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin:10px 0px 0px 0px">
<tr>
<td width="100%" class="mobscale" align="left">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="9%" class="txtcls2" align="left">Ref.by.Dr </td>
<td width="81%" class="txtcls2" style="border-bottom:1px solid #000000"> <input type="text" name="Referred by" id="Referred by" class="nametxt" placeholder="Enter Referred by" /></td>
</tr>
</table>
</td>
</tr>
</table>
<!--Bloood Group Section End-->


<!--Name Section Start-->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin:10px 0px">
<h4 style="font-family:arial;text-align:center;">ROUTINE URINE EXAMINATION REPORT</h4>
<tr>
<td width="20%" class="txtcls2" align="left">Name of the sample :</td>
<td width="80%" class="txtcls2" style="border-bottom:1px solid #0067a9;text-align:left"><input type="text" name="sample" id="sample" class="nametxt" placeholder="Enter " /></td>
</tr>
<tr>
<td width="20%" class="txtcls2" align="left">Time of Collection &nbsp;&nbsp; :</td>
<td width="80%" class="txtcls2" style="border-bottom:1px solid #0067a9;text-align:left"> <input type="text" name="Collection" id="Collection" class="nametxt" placeholder="Enter " /></td>
</tr>
</table>
<!--Name Section End-->

<!--Name Section Start-->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin:10px 0px">
<h4 style="font-family:arial;text-align:center;">PHYSICAL EXAMINATION </h4>
<tr>
<td width="20%" class="txtcls2" align="left">Quantity :</td>
<td width="80%" class="txtcls2" style="border-bottom:1px solid #0067a9;text-align:left"><input type="text" name="Quantity" id="Quantity" class="nametxt" placeholder="Enter " /></td>
</tr>
<tr>
<td width="20%" class="txtcls2" align="left">Appearance &nbsp;&nbsp; :</td>
<td width="80%" class="txtcls2" style="border-bottom:1px solid #0067a9;text-align:left"> <input type="text" name="Appearance" id="Appearance" class="nametxt" placeholder="Enter " /></td>
</tr>
<tr>
<td width="20%" class="txtcls2" align="left">Reaction Specific Gravity :</td>
<td width="80%" class="txtcls2" style="border-bottom:1px solid #0067a9;text-align:left"> <input type="text" name="Gravity" id="Gravity" class="nametxt" placeholder="Enter " /></td>
</tr>
</table>
<!--Name Section End-->

<!--Name Section Start-->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin:10px 0px">
<h4 style="font-family:arial;text-align:center;">CHEMICAL EXAMINATION </h4>
<tr>
<td width="20%" class="txtcls2" align="left">Albumin :</td>
<td width="80%" class="txtcls2" style="border-bottom:1px solid #0067a9;text-align:left"><input type="text" name="Albumin" id="Albumin" class="nametxt" placeholder="Enter " /></td>
</tr>
<tr>
<td width="20%" class="txtcls2" align="left">Sugar :</td>
<td width="80%" class="txtcls2" style="border-bottom:1px solid #0067a9;text-align:left"> <input type="text" name="Sugar" id="Sugar" class="nametxt" placeholder="Enter " /></td>
</tr>
<tr>
<td width="20%" class="txtcls2" align="left">Bile Salt :</td>
<td width="80%" class="txtcls2" style="border-bottom:1px solid #0067a9;text-align:left"> <input type="text" name="Salt" id="Salt" class="nametxt" placeholder="Enter " /></td>
</tr>
<tr>
<td width="20%" class="txtcls2" align="left">Bilt Pigment :</td>
<td width="80%" class="txtcls2" style="border-bottom:1px solid #0067a9;text-align:left"> <input type="text" name="Pigment" id="Pigment" class="nametxt" placeholder="Enter " /></td>
</tr>
</table>
<!--Name Section End-->

<!--Name Section Start-->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin:10px 0px">
<h4 style="font-family:arial;text-align:center;">MICROSCOPIC EXAMINATION </h4>
<tr>
<td width="20%" class="txtcls2" align="left">Pus Cells :</td>
<td width="80%" class="txtcls2" style="border-bottom:1px solid #0067a9;text-align:left"><input type="text" name="Pus Cells" id="Pus Cells" class="nametxt" placeholder="Enter " /></td>
</tr>
<tr>
<td width="20%" class="txtcls2" align="left">Epithelial Cells :</td>
<td width="80%" class="txtcls2" style="border-bottom:1px solid #0067a9;text-align:left"> <input type="text" name="Epithelial Cells" id="Epithelial Cells" class="nametxt" placeholder="Enter " /></td>
</tr>
<tr>
<td width="20%" class="txtcls2" align="left">Casts :</td>
<td width="80%" class="txtcls2" style="border-bottom:1px solid #0067a9;text-align:left"> <input type="text" name="Casts" id="Casts" class="nametxt" placeholder="Enter " /></td>
</tr>
<tr>
<td width="20%" class="txtcls2" align="left">Crystals :</td>
<td width="80%" class="txtcls2" style="border-bottom:1px solid #0067a9;text-align:left"> <input type="text" name="Crystals" id="Crystals" class="nametxt" placeholder="Enter " /></td>
</tr>
<tr>
<td width="20%" class="txtcls2" align="left">R.B.C :</td>
<td width="80%" class="txtcls2" style="border-bottom:1px solid #0067a9;text-align:left"> <input type="text" name="R.B.C" id="R.B.C" class="nametxt" placeholder="Enter " /></td>
</tr>
<tr>
<td width="20%" class="txtcls2" align="left">Others :</td>
<td width="80%" class="txtcls2" style="border-bottom:1px solid #0067a9;text-align:left"> <input type="text" name="Others" id="Others" class="nametxt" placeholder="Enter " /></td>
</tr>
</table>
<!--Name Section End-->

<!--Name Section Start-->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin:10px 0px">
<h4 style="font-family:arial;text-align:center;">ROUTINE STOOL EXAMINATION </h4>
<tr>
<td width="20%" class="txtcls2" align="left">Occult Blood :</td>
<td width="80%" class="txtcls2" style="border-bottom:1px solid #0067a9;text-align:left"><input type="text" name="Occult Blood" id="Occult Blood" class="nametxt" placeholder="Enter " /></td>
</tr>
<tr>
<td width="20%" class="txtcls2" align="left">ovs Cyst:</td>
<td width="80%" class="txtcls2" style="border-bottom:1px solid #0067a9;text-align:left"> <input type="text" name="ovs Cyst" id="ovs Cyst" class="nametxt" placeholder="Enter " /></td>
</tr>
<tr>
<td width="20%" class="txtcls2" align="left">R.B.S :</td>
<td width="80%" class="txtcls2" style="border-bottom:1px solid #0067a9;text-align:left"> <input type="text" name="R.B.S" id="R.B.S" class="nametxt" placeholder="Enter " /></td>
</tr>
<tr>
<td width="20%" class="txtcls2" align="left">Pus Cells :</td>
<td width="80%" class="txtcls2" style="border-bottom:1px solid #0067a9;text-align:left"> <input type="text" name="Pus Cells1" id="Pus Cells1" class="nametxt" placeholder="Enter " /></td>
</tr>
</table>
<!--Name Section End-->

<!--Name Section Start-->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin:10px 0px">
<h4 style="font-family:arial;text-align:center;">SPUTUM EXAMINATION </h4>
<tr>
<td width="20%" class="txtcls2" align="left">A.F.B :</td>
<td width="80%" class="txtcls2" style="border-bottom:1px solid #0067a9;text-align:left"><input type="text" name="A.F.B" id="A.F.B" class="nametxt" placeholder="Enter " /></td>
</tr>
</table>
<!--Name Section End-->

<!--Name Section Start-->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin:10px 0px">
<h4 style="font-family:arial;text-align:center;">PREGNENCY EXAMINATION </h4>
<tr>
<td width="20%" class="txtcls2" align="left">RESULT :</td>
<td width="80%" class="txtcls2" style="border-bottom:1px solid #0067a9;text-align:left"><input type="text" name="RESULT" id="RESULT" class="nametxt" placeholder="Enter " /></td>
</tr>
</table>
<!--Name Section End-->

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
