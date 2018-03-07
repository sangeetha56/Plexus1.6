
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Biochemistry </title>
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
 <form name="form1" id="form1" action="Controller?process=BbiochemistryProcess&action=add" method="post">
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
<td align="left" valign="top" style="font-size:30px; color: #0067a9; font-family:Arial, Helvetica, sans-serif; font-weight:bold;">JEEVAN JYOTI HOSPITAL, MEGHNAGAR</td>
</tr>
<tr>
<td height="8"></td>
</tr>
<tr>
<td align="center" valign="top" style="font-size:30px; color:#0067a9; font-family:Arial, Helvetica, sans-serif;text-align:center;">BIOCHEMISTRY <span style="border: 1px solid #0067a9;border-radius: 50px;padding: 3px 15px;font-size:14px;">BLOOD / SERUM SNALYSIS </span></td>
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
<td width="40%" class="mobscale" align="left">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="27%" class="txtcls1" align="left">Name</td>
<td width="73%" class="txtcls1" style="border-bottom:1px solid #000000"><input type="text" name="Name" id="Name" class="nametxt" placeholder="Enter Name" /> </td>
</tr>
</table>
</td>
<td width="15%" class="mobscale" align="left">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="10%" class="txtcls1" align="left">Age</td>
<td width="90%" class="txtcls1" style="border-bottom:1px solid #000000"> <input type="number" name="Age" id="Age" class="nametxt" placeholder="Enter Age" /></td>
</tr>
</table>
</td>
<td width="15%" class="mobscale" align="left">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="10%" class="txtcls1" align="left">Sex</td>
<td width="90%" class="txtcls1" style="border-bottom:1px solid #000000"> <input type="text" name="Sex" id="Sex" class="nametxt" placeholder="Enter Gender" /></td>
</tr>
</table>
</td>
<td width="30%" class="mobscale" align="left">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="30%" class="txtcls1" align="left">O.P/I.P.D NO</td>
<td width="70%" class="txtcls1" style="border-bottom:1px solid #000000"> <input type="number" name="O.P/I.P.D NO" id="O.P/I.P.D NO" class="nametxt" placeholder="Enter O.P/I.P.D NO" /></td>
</tr>
</table>
</td>
</tr>
</table>
<!--Bloood Group Section End-->

<!--Bloood Group Section Start-->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin:10px 0px 0px 0px">
<tr>
<td width="50%" class="mobscale" align="left">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="27%" class="txtcls1" align="left">Referred by</td>
<td width="73%" class="txtcls1" style="border-bottom:1px solid #000000"> <input type="text" name="Referred by" id="Referred by" class="nametxt" placeholder="Enter Referred by" /></td>
</tr>
</table>
</td>
<td width="50%" class="mobscale" align="left">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="20%" class="txtcls1" align="left">Serial No</td>
<td width="80%" class="txtcls1" style="border-bottom:1px solid #000000"> <input type="number" name="Serial No" id="Serial No" class="nametxt" placeholder="Enter Serial No" /></td>
</tr>
</table>
</td>
</tr>
</table>
<!--Bloood Group Section End-->



<!--Ward Details Start-->
<table width="100%" class="tableborder" cellpadding="0" cellspacing="0" border="1" style="margin:10px 0px 0px 0px; color:#0067a9;    border-color: #0067a9;">
<tr>
<td width="30%" class="txtcls1">Lipid Profile</td>
<td width="30%" class="txtcls1">Normal Value</td>
<td width="40%" class="txtcls1">Result</td>
</tr>
<tr>
<td width="30%" class="txtcls1">S.Cholestrol</td>
<td width="30%" class="txtcls1">150 - 200 mg %</td>
<td width="40%" class="txtcls1"><input type="text" name="result1" id="result1" class="nametxt" placeholder="Enter " /></td>
</tr>
<tr>
<td width="30%" class="txtcls1">Triglycerides</td>
<td width="30%" class="txtcls1">50 - 150 mg %</td>
<td width="40%" class="txtcls1"><input type="text" name="result2" id="result2" class="nametxt" placeholder="Enter " /></td>
</tr>
<tr>
<td width="30%" class="txtcls1">HDL - CHO</td>
<td width="30%" class="txtcls1">40 - 80 mg %</td>
<td width="40%" class="txtcls1"><input type="text" name="result3" id="result3" class="nametxt" placeholder="Enter " /></td>
</tr>
<tr>
<td width="30%" class="txtcls1">LDL - CHO</td>
<td width="30%" class="txtcls1">60 - 160 mg %</td>
<td width="40%" class="txtcls1"><input type="text" name="result4" id="result4" class="nametxt" placeholder="Enter " /></td>
</tr>
<tr>
<td width="30%" class="txtcls1">VLDL - </td>
<td width="30%" class="txtcls1">20 - 40 mg %</td>
<td width="40%" class="txtcls1"><input type="text" name="result5" id="result5" class="nametxt" placeholder="Enter " /></td>
</tr>

</table>
<!--Ward Details End-->


<!--Name Section Start-->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin:10px 0px">
<tr>
<td width="13%" class="txtcls1" align="left">Remarks :</td>
<td width="87%" class="txtcls1" style="border-bottom:1px solid #0067a9;text-align:left"><input type="text" name="Remarks :" id="Remarks :" class="nametxt" placeholder="Enter Remarks" /></td>
</tr>
<tr>
<td width="13%" class="txtcls1" align="left">Lab.Tech :</td>
<td width="87%" class="txtcls1" style="border-bottom:1px solid #0067a9;text-align:left"> <input type="text" name="Lab.Tech :" id="Lab.Tech :" class="nametxt" placeholder="Enter Lab.Tech" /></td>
</tr>
<tr>
<td width="13%" class="txtcls1" align="left">Date :</td>
<td width="87%" class="txtcls1" style="border-bottom:1px solid #0067a9;text-align:left"><input type="text" name="Date :" id="Date :" class="nametxt" placeholder="Enter Date" /></td>
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
