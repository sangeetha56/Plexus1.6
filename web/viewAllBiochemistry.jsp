
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
                    response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
                    response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
                    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
                    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css" title="currentStyle">
            @import "css/dataTable/css/demo_page.css";
            @import "css/dataTable/css/jquery.dataTables.css";
        </style>
        <link rel="stylesheet" href="css/datePicker/jquery-ui-1.8.17.custom.css">
        <link rel="stylesheet" href="css/datePicker/demos.css">
        <!--<script type="text/javascript" language="javascript" src="js/dataTable/jquery.js"></script>-->
        <script type="text/javascript" src="js/datePicker/jquery-1.7.1.js"></script>
        <script type="text/javascript" language="javascript" src="js/dataTable/jquery.dataTables.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery-ui-1.8.17.custom.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.core.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.widget.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.button.js"></script>
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


    <table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td>
<table width="1000" cellpadding="0" cellspacing="0" border="0" class="main_table">
<tr>
<td>

<!--Header Section Start-->
<table width="100%" cellpadding="0" cellspacing="0" border="0">
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
<td width="27%" class="txtcls1" align="left">Name </td>
<td width="73%" class="txtcls1" style="border-bottom:1px solid #000000"> </td>
</tr>
</table>
</td>
<td width="15%" class="mobscale" align="left">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="5%" class="txtcls1" align="left">Age</td>
<td width="95%" class="txtcls1" style="border-bottom:1px solid #000000"></td>
</tr>
</table>
</td>
<td width="15%" class="mobscale" align="left">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="5%" class="txtcls1" align="left">Sex</td>
<td width="95%" class="txtcls1" style="border-bottom:1px solid #000000"></td>
</tr>
</table>
</td>
<td width="30%" class="mobscale" align="left">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="30%" class="txtcls1" align="left">O.P/I.P.D NO</td>
<td width="70%" class="txtcls1" style="border-bottom:1px solid #000000"></td>
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
<td width="73%" class="txtcls1" style="border-bottom:1px solid #000000"> </td>
</tr>
</table>
</td>
<td width="50%" class="mobscale" align="left">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="20%" class="txtcls1" align="left">Serial No</td>
<td width="80%" class="txtcls1" style="border-bottom:1px solid #000000"></td>
</tr>
</table>
</td>
</tr>
</table>
<!--Bloood Group Section End-->



<!--Ward Details Start-->
<table width="100%" class="tableborder" cellpadding="0" cellspacing="0" border="1" style="margin:10px 0px 0px 0px; color:#0067a9;    border-color: #0067a9;">
<tr>
<td width="15%" class="txtcls1">Blood Ureal</td>
<td width="15%" class="txtcls1">Normal Value</td>
<td width="20%" class="txtcls1"></td>
<td width="15%" class="txtcls1">Total Protiens</td>
<td width="15%" class="txtcls1">Normal Value 6-8%</td>
<td width="20%" class="txtcls1"> </td>
</tr>
<tr>
<td width="15%" class="txtcls1" rowspan="2">Blood Sugar Fasting / PPBS</td>
<td width="15%" class="txtcls1">6-10mg %</td>
<td width="20%" class="txtcls1"></td>
<td width="15%" class="txtcls1" rowspan="2">Albumin</td>
<td width="15%" class="txtcls1" rowspan="2"> 3.2-5.0mg %</td>
<td width="20%" class="txtcls1" rowspan="2"> </td>
</tr>
<tr>
<td width="15%" class="txtcls1">80-160mg %</td>
<td width="20%" class="txtcls1"></td>
</tr>
<tr>
<td width="15%" class="txtcls1">S.Phophorus</td>
<td width="15%" class="txtcls1">3.4-5mg %</td>
<td width="20%" class="txtcls1"></td>
<td width="15%" class="txtcls1">A/G Ration</td>
<td width="15%" class="txtcls1">1.2 - 1.8</td>
<td width="20%" class="txtcls1"> </td>
</tr>
<tr>
<td width="15%" class="txtcls1">S.Calcium</td>
<td width="15%" class="txtcls1">9-11 %</td>
<td width="20%" class="txtcls1"></td>
<td width="15%" class="txtcls1">Total Billrubin</td>
<td width="15%" class="txtcls1">0.1 - 1.0mg %</td>
<td width="20%" class="txtcls1"> </td>
</tr>
<tr>
<td width="15%" class="txtcls1">S.Amylase</td>
<td width="15%" class="txtcls1">90-200u / 100ml</td>
<td width="20%" class="txtcls1"></td>
<td width="15%" class="txtcls1">Conjugated</td>
<td width="15%" class="txtcls1">0.1 - 0.4mg %</td>
<td width="20%" class="txtcls1"> </td>
</tr>
<tr>
<td width="15%" class="txtcls1">S.Cholesterd</td>
<td width="15%" class="txtcls1">150-200mg %</td>
<td width="20%" class="txtcls1"></td>
<td width="15%" class="txtcls1">Alkaline Phosphase</td>
<td width="15%" class="txtcls1">3-13 K.A.U /100ml</td>
<td width="20%" class="txtcls1"> </td>
</tr>
<tr>
<td width="15%" class="txtcls1">S.Creatnine</td>
<td width="15%" class="txtcls1">0.9-1.7mg %</td>
<td width="20%" class="txtcls1"></td>
<td width="15%" class="txtcls1">Add Phosphatase</td>
<td width="15%" class="txtcls1">1.0-3.5 K.A.U /100ml</td>
<td width="20%" class="txtcls1"> </td>
</tr>
<tr>
<td width="15%" class="txtcls1">S.Uric Acid</td>
<td width="15%" class="txtcls1">2-5mg %</td>
<td width="20%" class="txtcls1"></td>
<td width="15%" class="txtcls1">Serum Sodium</td>
<td width="15%" class="txtcls1">135-145 m Eq/L</td>
<td width="20%" class="txtcls1"> </td>
</tr>
<tr>
<td width="15%" class="txtcls1">S.G.O.T</td>
<td width="15%" class="txtcls1">5-40 I U\L</td>
<td width="20%" class="txtcls1"></td>
<td width="15%" class="txtcls1">Serum Potassium</td>
<td width="15%" class="txtcls1">3.8-5.5 m Eq/L</td>
<td width="20%" class="txtcls1"> </td>
</tr>
<tr>
<td width="15%" class="txtcls1">S.G.P.T</td>
<td width="15%" class="txtcls1">5-30 I U\L</td>
<td width="20%" class="txtcls1"></td>
<td width="15%" class="txtcls1">Serum Chlorides</td>
<td width="15%" class="txtcls1">95-105 m Eq/L</td>
<td width="20%" class="txtcls1"> </td>
</tr>
</table>
<!--Ward Details End-->


<!--Name Section Start-->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin:10px 0px">
<tr>
<td width="13%" class="txtcls1" align="left">Remarks :</td>
<td width="87%" class="txtcls1" style="text-align:left"></td>
</tr>
<tr>
<td width="13%" class="txtcls1" align="left">Lab.Tech :</td>
<td width="87%" class="txtcls1" style="text-align:left"></td>
</tr>
<tr>
<td width="13%" class="txtcls1" align="left">Date :</td>
<td width="87%" class="txtcls1" style="text-align:left"></td>
</tr>
</table>
<!--Name Section End-->

</td>
</tr>
</table>
</td>
</tr>
</table>

</body>
</html>
