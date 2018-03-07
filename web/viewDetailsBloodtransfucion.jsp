<%--
    Document   : userDetails
    Created on : Apr 11, 2017, 12:59:08 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
      <meta charset="utf-8">

    <title>User Information</title>

    <link rel="stylesheet" href="userTypeFormCSS/css/login-form.css" media="screen">

    <script src="js/datePicker/jquery-1.7.1.js"></script>
    <script src="js/datePicker/ui/jquery.ui.core.js"></script>
    <script src="js/datePicker/ui/jquery.ui.widget.js"></script>
    <script src="js/datePicker/ui/jquery.ui.datepicker.js"></script>
    <script src="js/datePicker/ui/jquery.ui.tabs.js"></script>
    <script src="js/datePicker/ui/sliderAccess.js"></script>
    <script src="js/datePicker/ui/jquery-ui-timepicker-addon.js"></script>
    <script src="js/validation/jquery.ketchup.all.min.js"></script>



    <script type="text/javascript" src="js/datePicker/ui/jquery-ui-1.8.17.custom.js"></script>

    <link rel="stylesheet" href="css/login.css">

    <link rel="stylesheet" href="css/datePicker/jquery-ui-1.8.18.custom.css">
    <link rel="stylesheet" href="css/validation/jquery.ketchup.css">


    <script type="text/javascript" src="js/datePicker/ui/jquery.ui.button.js"></script>
    <script type="text/javascript" src="js/datePicker/ui/jquery.ui.dialog.js"></script>
    <link rel="stylesheet" href="css/datePicker/demos.css">
 <script type="text/javascript">
            $(function() {


                $( "#update" )
                .button()
                .click(function() {
                    updateUserType();

                });


                $( "#edit" )
                .button()
                .click(function() {

                    editable();
                    //disableHRF();

                });

                $( "#cancel" )
                .button()
                .click(function() {
                    window.location='viewDetailsBloodtransfucion.jsp'
                });

                $( "#delete" )
                .button()
                .click(function() {
                    deleteUserType();


                });
                $( "#back" )
                .button()
                .click(function() {
                   // backButttonn();
                    //window.location='consultancyTab.jsp';
                    window.location='Controller?process=BloodtransfucionProcess&action=viewAll';

                });

            });



        </script>
    <script>
            function editable()
            {

                document.getElementById("update").style.display='';
                document.getElementById("cancel").style.display='';
                document.getElementById("delete").style.display='';
                document.getElementById("edit").style.display='none';
                document.getElementById("back").style.display='none';


            }
        </script>
      
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
       <form name="form1" id="form1" action="" method="post">
             
 <table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td>
<table width="1000" cellpadding="0" cellspacing="0" border="0" class="main_table">
<tr>
<td>

<!--Header Section Start-->
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="23%" class="mobscale" align="right"><img src="images/logo_jjh.png" alt="" width="50" height="100" /></td>
<td width="77%" class="mobscale" align="left" valign="top">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td align="left" valign="top" style="font-size:30px; color: #0067a9; font-family:Arial, Helvetica, sans-serif; font-weight:bold;">JEEVAN JYOTI HOSPITAL, MEGHNAGAR</td>
</tr>
<tr>
<td height="8"></td>
</tr>
<tr>
<td align="center" valign="top" style="font-size:30px; color:#0067a9; font-family:Arial, Helvetica, sans-serif;"><span style="border: 1px solid #0067a9;border-radius: 50px;padding: 3px 15px;">Blood transfuction service</span></td>
</tr>
<tr>
<td height="8"></td>
</tr>
<tr>
<td align="center" valign="top" style="font-size:21px; color:#0067a9; font-family:Arial, Helvetica, sans-serif;"><u>CROSS MATCHING REPORT</u></td>
</tr>
</table>
</td>
</tr>
</table>
<!--Header Section End-->





<!--Name Section Start-->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin:10px 0px">
<tr>
<td width="13%" class="txtcls1" align="left">Patient Name:</td>
<td width="87%" class="txtcls1" style="border-bottom:1px solid #0067a9"><input type="text" name="patientname" id="patientname" class="dataText" value="${bloodtransfucion.pateintname}"/></td>
</tr>
</table>
<!--Name Section End-->

<!--Ward Details Start-->
<table width="100%" class="tableborder" cellpadding="0" cellspacing="0" border="1" style="margin:10px 0px 0px 0px; color:#0067a9;    border-color: #0067a9;">
<tr>
<td width="12%" class="txtcls1">Ward/Dept <br />  <input type="text" name="wardDept" id="wardDept" value="${bloodtransfucion.warddept}"/></td>
<td width="12%" class="txtcls1">Ward/Dep. <br /><input type="text" name="wardDep." id="wardDep." value="${bloodtransfucion.warddep}"/> </td>
<td width="12%" class="txtcls1">Bed No. <br /> <input type="number" name="bedNo." id="bedNo." value="${bloodtransfucion.bedno}"/></td>
<td width="12%" class="txtcls1">Age <br /> <input type="number" name="age" id="age" class="nametxt" placeholder="Enter here" value="${bloodtransfucion.age}"/></td>
<td width="12%" class="txtcls1">Sex <br /> <input type="text" name="sex" id="sex" class="nametxt" placeholder="Enter here" value="${bloodtransfucion.sex}"/></td>
<td width="40%" class="txtcls1">Pt's Doctor<br /> <input type="text" name="ptsDoctor" id="ptsDoctor" class="nametxt" placeholder="Enter here" value="${bloodtransfucion.ptsdoctor}"/></td>
</tr>
</table>
<!--Ward Details End-->


<!--Bloood Group Section Start-->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin:10px 0px 0px 0px">
<tr>
<td width="50%" class="mobscale" align="left">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="27%" class="txtcls1" align="left">Patient Blood Group</td>
<td width="73%" class="txtcls1" style="border-bottom:1px solid #000000"><input type="text" name="patientBloodGroup" id="patientBloodGroup" class="nametxt" placeholder="Enter Name" value="${bloodtransfucion.bloodgroup}" /></td>
</tr>
</table>
</td>
<td width="50%" class="mobscale" align="left">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="5%" class="txtcls1" align="left">Rh</td>
<td width="95%" class="txtcls1" style="border-bottom:1px solid #000000"><input type="text" name="rh" id="rh" class="nametxt" placeholder="Enter Name" value="${bloodtransfucion.rh}"/></td>
</tr>
</table>
</td>
</tr>
</table>
<!--Bloood Group Section End-->


<!--Ward Details Start-->
<table width="100%" class="tableborder" cellpadding="0" cellspacing="0" border="1" style="margin:10px 0px 0px 0px;border-color: #0067a9;">
<p style="font-size:14px; color:#000000; font-family:Arial, Helvetica, sans-serif; line-height:0px">Cross matched and found compatible with following donors:</p>
<tr>
<td width="10%" class="txtcls1">Date</td>
<td width="20%" class="txtcls1">Donor's</td>
<td width="10%" class="txtcls1">Bottle No.</td>
<td width="10%" class="txtcls1">Group</td>
<td width="10%" class="txtcls1">HIV</td>
<td width="10%" class="txtcls1">HCV</td>
<td width="10%" class="txtcls1">HBSAG</td>
<td width="10%" class="txtcls1">VDRL</td>
<td width="10%" class="txtcls1">MP</td>
</tr>
<tr>
    <td width="10%" class="txtcls1"><input type="text" name="date" id="date" class="nametxt" value="${bloodtransfucion.ddate}" /></td>
<td width="20%" class="txtcls1"><input type="text" name="donor's" id="donor's" class="nametxt" value="${bloodtransfucion.donors}" /></td>
<td width="10%" class="txtcls1"><input type="number" name="bottle No." id="bottle No." class="nametxt" value="${bloodtransfucion.bottleno}" /></td>
<td width="10%" class="txtcls1"><input type="text" name="group" id="group" class="nametxt" value="${bloodtransfucion.bgroup}" /></td>
<td width="10%" class="txtcls1"><input type="text" name="hIV" id="hIV" class="nametxt"  value="${bloodtransfucion.hiv}"/></td>
<td width="10%" class="txtcls1"><input type="text" name="hCV" id="hCV" class="nametxt" value="${bloodtransfucion.hcv}"/></td>
<td width="10%" class="txtcls1"><input type="text" name="hBSAG" id="hBSAG" class="nametxt" value="${bloodtransfucion.hbsag}"/></td>
<td width="10%" class="txtcls1"><input type="text" name="vDRL" id="vDRL" class="nametxt" value="${bloodtransfucion.vdrl}" /></td>
<td width="10%" class="txtcls1"><input type="text" name="mP" id="mP" class="nametxt" value="${bloodtransfucion.mp}" /></td>
</tr>
<tr>
 <td width="10%" class="txtcls1"><input type="text" name="date1" id="date1" class="nametxt" value="${bloodtransfucion.ddate1}" /></td>
<td width="20%" class="txtcls1"><input type="text" name="donor's1" id="donor's1" class="nametxt" value="${bloodtransfucion.donors1}" /></td>
<td width="10%" class="txtcls1"><input type="number" name="bottle No.1" id="bottle No.1" class="nametxt" value="${bloodtransfucion.bottleno1}" /></td>
<td width="10%" class="txtcls1"><input type="text" name="group1" id="group1" class="nametxt" value="${bloodtransfucion.bgroup1}" /></td>
<td width="10%" class="txtcls1"><input type="text" name="hIV1" id="hIV1" class="nametxt"  value="${bloodtransfucion.hiv1}"/></td>
<td width="10%" class="txtcls1"><input type="text" name="hCV1" id="hCV1" class="nametxt" value="${bloodtransfucion.hcv1}"/></td>
<td width="10%" class="txtcls1"><input type="text" name="hBSAG1" id="hBSAG1" class="nametxt" value="${bloodtransfucion.hbsag1}"/></td>
<td width="10%" class="txtcls1"><input type="text" name="vDRL1" id="vDRL1" class="nametxt" value="${bloodtransfucion.vdrl1}" /></td>
<td width="10%" class="txtcls1"><input type="text" name="mP1" id="mP1" class="nametxt" value="${bloodtransfucion.mp1}" /></td>
</tr>
<tr>
 <td width="10%" class="txtcls1"><input type="text" name="date2" id="date2" class="nametxt" value="${bloodtransfucion.ddate2}" /></td>
<td width="20%" class="txtcls1"><input type="text" name="donor's2" id="donor's2" class="nametxt" value="${bloodtransfucion.donors2}" /></td>
<td width="10%" class="txtcls1"><input type="number" name="bottle No.2" id="bottle No.2" class="nametxt" value="${bloodtransfucion.bottleno2}" /></td>
<td width="10%" class="txtcls1"><input type="text" name="group2" id="group2" class="nametxt" value="${bloodtransfucion.bgroup2}" /></td>
<td width="10%" class="txtcls1"><input type="text" name="hIV2" id="hIV2" class="nametxt"  value="${bloodtransfucion.hiv2}"/></td>
<td width="10%" class="txtcls1"><input type="text" name="hCV2" id="hCV2" class="nametxt" value="${bloodtransfucion.hcv2}"/></td>
<td width="10%" class="txtcls1"><input type="text" name="hBSAG2" id="hBSAG2" class="nametxt" value="${bloodtransfucion.hbsag2}"/></td>
<td width="10%" class="txtcls1"><input type="text" name="vDRL2" id="vDRL2" class="nametxt" value="${bloodtransfucion.vdrl2}" /></td>
<td width="10%" class="txtcls1"><input type="text" name="mP2" id="mP2" class="nametxt" value="${bloodtransfucion.mp2}" /></td>
</tr>
</table>
<!--Ward Details End-->

<!--Name Section Start-->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin:10px 0px">
<tr>
<td width="25%" align="left">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="40%" class="txtcls1" align="left">Quality of Blood</td>
<td width="60%" class="txtcls1" style="border-bottom:1px solid #000000"><input type="text" name="qualityofBlood" id="qualityofBlood" class="nametxt" placeholder="Enter Name" value="${bloodtransfucion.qualityofblood}" /></td>
</tr>
</table>
</td>
<td width="65%" align="right">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="10%" style="font-size:14px; color:#0067a9; font-family:Arial, Helvetica, sans-serif;">ml issued</td>
<td width="10%" style="font-size:14px; color:#0067a9; font-family:Arial, Helvetica, sans-serif;"><input type="checkbox" name="ml issued" id="ml issued" value="${bloodtransfucion.ml}" />Whole</td>
<td width="10%" style="font-size:14px; color:#0067a9; font-family:Arial, Helvetica, sans-serif;"><input type="checkbox" name="ml issued1" id="ml issued1" value="${bloodtransfucion.ml1}" />Packed Celli</td>
<td width="10%" style="font-size:14px; color:#0067a9; font-family:Arial, Helvetica, sans-serif;"><input type="checkbox" name="ml issued2" id="ml issued2" value="${bloodtransfucion.ml2}" />Plasma</td>
<td width="10%" style="font-size:14px; color:#0067a9; font-family:Arial, Helvetica, sans-serif;"><input type="checkbox" name="ml issued3" id="ml issued3" value="${bloodtransfucion.ml3}" />Platelets Conc.</td>
</tr>
</table>
</td>
</tr>
</table>
<!--Name Section End-->


<!--Name Section Start-->
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="70%" align="left"></td>
<td width="30%" align="left">
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td width="13%" class="txtcls1" align="left">S/d</td>
<td width="87%" class="txtcls1" style="border-bottom:1px solid #000000"><input type="text" name="sd" id="sd" class="nametxt" placeholder="Enter Name" value="${bloodtransfucion.sd}" /></td>
<td>ID   : <input type="text" name="id" id="id" value="${clist.id}"></td>
</tr>
</table>

</tr>
</table>
<!--Name Section End-->




</td>
</tr>
</table>


<tr>
                    <td align="center">

                        <span id="edit">Manage</span>
                        <span id="delete">DELETE</span>
                        <span style="display: none" id="cancel">Cancel</span>
                        <span id="back">Back</span>


                    </td>
</table>
</form>
<script type="text/javascript">
    function updateUserType(){
                var con=false
                con=confirm('Do You Want To Edit Selected User Type');
                if(!con)
                {
                    form1.action="viewDetailsBloodtransfucion.jsp";
                }
                else
                    {
                        var form1=document.getElementById("form1");
                        form1.action="Mycontroller?process=contactprocess&action=updateUser&id=<c:out value="${clist.id}"/>";
                        form1.submit();

                    }

            function deleteUserType(){
                var con=false
                con=confirm('Do You Want To Delete Selected user Type');
                if(!con)
                {
                    form1.action="viewDetailsBloodtransfucion.jsp";
                }
                else
                    {
                        var form1=document.getElementById("form1");
                        form1.action="Controller?process=BloodtransfucionProcess&action=deleteUser&id=<c:out value="${bloodtransfucion.id}"/>";
                        form1.submit();

                    }

            }

         </script>

</body>
</html>