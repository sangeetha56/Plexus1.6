
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/datePicker/jquery-ui-1.8.18.custom.css">
        <link rel="stylesheet" href="css/validation/jquery.ketchup.css">

        <script type="text/javascript" src="js/datePicker/ui/jquery-ui-1.8.17.custom.js"></script>
        <script src="js/datePicker/jquery-1.7.1.js"></script>
        <script src="js/datePicker/ui/jquery.ui.core.js"></script>
        <script src="js/datePicker/ui/jquery.ui.widget.js"></script>
        <script src="js/datePicker/ui/jquery.ui.datepicker.js"></script>
        <script src="js/datePicker/ui/jquery.ui.tabs.js"></script>
        <script src="js/datePicker/ui/sliderAccess.js"></script>
        <script src="js/datePicker/ui/jquery-ui-timepicker-addon.js"></script>
        <script src="js/validation/jquery.ketchup.all.min.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.button.js"></script>
        <link rel="stylesheet" href="css/datePicker/demos.css">
        <style>
input.nametxt{ outline:0; border:none; width:100%}
.txtcls1{font-family:Arial, Helvetica, sans-serif; font-size:14px; color:#0067a9; text-align:center}
@media screen and (min-width:300px) and (max-width:767px){
	  .main_table{ width:100%}
	  .mobscale{ width:100%; float:left}
	}
</style>
         <script type="text/javascript">
    $(function() {



        $( "#sub" )
        .button()
        .click(function() {
            //alert('hhhh');



        });

    });


        </script>



         <script type = "text/javascript">
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
            $(document).ready(function () {

                var creationDate=document.getElementById('creationDate');
                creationDate.value=getCurrentDate();
                var expiryDate=document.getElementById('expiryDate');
                //expiryDate.value=getCurrentDate();

                var manufactureDate=document.getElementById('manufactureDate');
                // manufactureDate.value=getCurrentDate();
                $('#myTable').Scrollable({
                    ScrollHeight: 300
                });
            });
        </script>
         <script type="text/javascript" src="js/datetimepicker_css.js"></script>
        <script type="text/javascript">
             $(function() {
                $( "#manufactureDate" ).datepicker({

                    changeMonth: true,
                    changeYear: true
                });
                $( "#creationDate" ).datepicker({

                    changeMonth: true,
                    changeYear: true
                });
                $( "#expiryDate" ).datepicker({

                    changeMonth: true,
                    changeYear: true
                });
                $( "#tabs" ).tabs();
                $( "#save" )
                .button()
                .click(function() {
                    addStock();
                });
                $( "#effect" ).hide();

            });
        </script>
         <script type = "text/javascript">
          var patients = [
            <c:forEach varStatus="status" items="${patientList}" var="patient">{
                value:'<c:out default="0" value="${patient.name}" />',
                id:'<c:out default="0" value="${patient.id}" />',
                cardno:'<c:out default="0" value="${patient.cardno}" />'
            }<c:if test="${!status.last}">,</c:if>
            </c:forEach>
        ];
        $(function() {
            $( "#patientName").autocomplete({
                source: patients,
                minLength: 1,
                change:function(event,ui){
                    $( "#patientId").val( ui.item.id );
                },
                focus: function( event, ui ) {
                    $( "#patientId").val( ui.item.id );
                    return true;
                },
                select: function( event, ui ) {
                    $( "#patientId").val( ui.item.id );
                    return true;
                }
            }).data( "autocomplete" )._renderItem = function( ul, item ) {
                return $( "<li></li>" )
                .data( "item.autocomplete", item )
                .append( "<a><b> " + item.value +", </b> <b>Card No: "+item.cardno +"</b></a>" )
                .appendTo( ul );
            };
            </script>
           <script type="text/javascript">
            //*********************NEWLY ADDED FOR PropertyAdd.jsp:-For "title=select Contact" POPUP Window BY GIRIJA...****************

            var winChild5=null;
            var fName = null;

            function openWin5(pName,winWidth,winHeight,fieldName) {
               // alert("kusum still :")

                fName=fieldName;

                X = (screen.width/2) - (winWidth/2);
                Y = (screen.height/2) - (winHeight/2);

                if(winChild5 == null) {
                    winChild5=document.getElementById("contPopup");        //To accept 'id=seekHist' from menu-owner's History
                    winChild5= window.open(pName,'','width = '+ winWidth +',height = '+ winHeight +',left = '+ X +',top = '+ Y +',resizable=1,status=1,toolbar=no,scrollbar = 1');
                }
                else if(winChild5.closed){
                    winChild5=document.getElementById("contPopup");        //To accept 'id=seekHist' from menu-owner's History
                    winChild5= window.open(pName,'','width = '+ winWidth +',height = '+ winHeight +',left = '+ X +',top = '+ Y +',resizable=1,status=1,toolbar=no,scrollbar = 1');
                }
                else if(winChild5==""){winChild5.focus();}
                else  winChild5.focus();
            }

            //-----------------------------------------END----------------------------------------------------------------

        </script>
                <script type="text/javascript">
            jQuery(function($){
                $("#patientName").Watermark("Click here to select patient");

            });
        </script>

    </head>


        


        

    <body>

        

    <form name="form1" id="form1" action="Controller?process=LabProcess&action=add" method="post">
        <script src="js/print/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script src="js/print/jquery.printPage.js" type="text/javascript"></script>
        <link rel="stylesheet" href="css/datePicker/jquery-ui-1.8.18.custom.css">
        <link rel="stylesheet" href="css/datePicker/demos.css">

        <script src="js/print/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery-ui-1.8.17.custom.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.datepicker.js"></script>
        <script src="js/print/jquery.printPage.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.button.js"></script>
<table width="96%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td>
<table width="1000" cellpadding="0" cellspacing="0" border="0" class="main_table" style="border: 1px solid #000;padding-top: 15px;">
<tr>
<td>

<!--Header Section Start-->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="border-bottom: 1px solid #000;">
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
<td align="center" valign="top" style="font-size:30px; color:#0067a9; font-family:Arial, Helvetica, sans-serif;text-align:center;">Lab <span style="border: 1px solid #0067a9;border-radius: 50px;padding: 3px 15px;font-size:14px;">CBC/LFT/RFT </span></td>
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
<table width="96%" cellpadding="0" cellspacing="0" border="0" style="margin:10px 0px 0px 0px">
<tr>
<td width="40%" class="mobscale" align="left">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="10%" class="txtcls1" align="left">Name</td>
<td width="90%" class="txtcls1" style="border-bottom:1px solid #000000">  <a id="contPopup"  href="javascript:openWin5('Controller?process=PatientProcess&action=viewAllPopUpForBioChemistry&patientControllerValue=null&noOfRecords=20&pageno=1&alphabit=null&flag=0',700,300,'propAdd1')"    class="nametxt" ><input  type="text" name="patientName" id="patientName" width="100%" style="border:0px" title="Click here to Select Patient"  size="50%"/></a> <input name="patientID" type="hidden" id="patientID" value="" /></td>
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
<td width="30%" class="txtcls1" align="left">Card NO</td>
<td width="70%" class="txtcls1" style="border-bottom:1px solid #000000"> <input type="number" name="cardNo" id="cardNo" class="nametxt" placeholder="Enter Card No" /></td>
</tr>
</table>
</td>
</tr>
</table>
<!--Bloood Group Section End-->
<%--
<!--Bloood Group Section Start-->
<table width="96%" cellpadding="0" cellspacing="0" border="0" style="margin:10px 0px 0px 0px">
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
--%>


<table width="93%" class="tableborder" cellpadding="0" cellspacing="0" border="1" style="margin:10px 0px 0px 0px; color:#0067a9;border-color: #0067a9;margin-left:3%;margin-right: 3%;">
<tr>
<td width="15%" class="txtcls1"><b>CBC</b></td>
<td width="20%" class="txtcls1"><b>Result</b></td>
<td width="15%" class="txtcls1"><b>Normal Value</b></td>
<td width="15%" class="txtcls1"><b>LFT</b></td>
<td width="20%" class="txtcls1"><b>Result</b></td>
<td width="15%" class="txtcls1"><b>Normal Value</b></td>
</tr>
<tr>
<td width="15%" class="txtcls1" >HAEMOGLOBIN</td>
<td width="20%" class="txtcls1"><input type="text" name="result1" id="result1" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1"><select class="txtcls1"><option name="result50" id="result50" value="M:13-18" >M:13-18</option><option value="femalehemo">F:11.5-16.5</option></select></td>
<td width="15%" class="txtcls1" >TOTAL BILIRUBIN</td>
<td width="20%" class="txtcls1" ><input type="text" name="result11" id="result11" class="nametxt" placeholder="" /> </td>
<td width="15%" class="txtcls1" > 0.1 1.0mg %</td>
</tr>
<tr>
<td width="15%" class="txtcls1">TOTAL WBC COUNT</td>
<td width="20%" class="txtcls1"><input type="text" name="result2" id="result2" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1">4000-11000/cmm %</td>
<td width="15%" class="txtcls1">D.BILIRUBIN</td>
<td width="20%" class="txtcls1"><input type="text" name="result12" id="result12" class="nametxt" placeholder="" /> </td>
<td width="15%" class="txtcls1">0.0-0.5</td>
</tr>
<tr>
<td width="15%" class="txtcls1">NUETROPHILS</td>
<td width="20%" class="txtcls1"><input type="text" name="result3" id="result3" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1">45-75% %</td>
<td width="15%" class="txtcls1">SG OT</td>
<td width="20%" class="txtcls1"> <input type="text" name="result13" id="result13" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1">5-4OI.U/L</td>
</tr>
<tr>
<td width="15%" class="txtcls1">LYMPHOCYTE</td>
<td width="20%" class="txtcls1"><input type="text" name="result4" id="result4" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1">20-40%</td>
<td width="15%" class="txtcls1">SG PT</td>
<td width="20%" class="txtcls1"><input type="text" name="result14" id="result14" class="nametxt" placeholder="" /> </td>
<td width="15%" class="txtcls1">5-30I.U/L</td>
</tr>
<tr>
<td width="15%" class="txtcls1">EOSINOPHIL</td>
<td width="20%" class="txtcls1"><input type="text" name="result5" id="result5" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1">1-6.8</td>
<td width="15%" class="txtcls1">TOTAL PROTIN</td>
<td width="20%" class="txtcls1"><input type="text" name="result15" id="result15" class="nametxt" placeholder="" /> </td>
<td width="15%" class="txtcls1">6-8g%</td>
</tr>
<tr>
<td width="15%" class="txtcls1">R.B.C.COUNT</td>
<td width="20%" class="txtcls1"><input type="text" name="result6" id="result6" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1"><select class="txtcls1"><option value="malerbc">M:4.5-6.5</option><option value="femalerbc">F:3.8-5.8</option></select></td>
<td width="15%" class="txtcls1">ALBUMIN</td>
<td width="20%" class="txtcls1"><input type="text" name="result16" id="result16" class="nametxt" placeholder="" /> </td>
<td width="15%" class="txtcls1">3.2-5.0g%</td>
</tr>
<tr>
<td width="15%" class="txtcls1">M.C.V</td>
<td width="20%" class="txtcls1"><input type="text" name="result7" id="result7" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1">76-96fl</td>
<td width="15%" class="txtcls1">ALKALINE PHOSPHASE</td>
<td width="20%" class="txtcls1"><input type="text" name="result17" id="result17" class="nametxt" placeholder="" /> </td>
<td width="15%" class="txtcls1">3.13 KA.U/100ml</td>
</tr>
<tr>
<td width="15%" class="txtcls1">M.C.H</td>
<td width="20%" class="txtcls1"><input type="text" name="result8" id="result8" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1">.27-32pg</td>
<td width="15%" class="txtcls1"><b>RFT</b></td>
<td width="20%" class="txtcls1"></td>
<td width="15%" class="txtcls1"></td>
</tr>
<tr>
<td width="15%" class="txtcls1">M.C.H.C</td>
<td width="20%" class="txtcls1"><input type="text" name="result9" id="result9" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1">29.35%</td>
<td width="15%" class="txtcls1">BLOOD UREA</td>
<td width="20%" class="txtcls1"><input type="text" name="result18" id="result18" class="nametxt" placeholder="" /> </td>
<td width="15%" class="txtcls1">15.45mg</td>
</tr>
<tr>
<td width="15%" class="txtcls1">PCV</td>
<td width="20%" class="txtcls1"><input type="text" name="result10" id="result10" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1"><select class="txtcls1"><option value="malepcv">M:40-54</option><option value="femalepcv">F:37-47</option></select></td>
<td width="15%" class="txtcls1">SERUM CATENINE</td>
<td width="20%" class="txtcls1"><input type="text" name="result19" id="result19" class="nametxt" placeholder="" /> </td>
<td width="15%" class="txtcls1">0.9 - 1.7 mg</td>
</tr>
<tr>
<td width="15%" class="txtcls1">PLATELETS</td>
<td width="20%" class="txtcls1"><input type="text" name="result48" id="result48" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1">1.5 4.5</td>
<td width="15%" class="txtcls1">SERUM SODIUM</td>
<td width="20%" class="txtcls1"><input type="text" name="result20" id="result20" class="nametxt" placeholder="" /> </td>
<td width="15%" class="txtcls1">135-145 MEQ/L</td>
</tr>
<tr>
<td width="15%" class="txtcls1">ESR(WINTROBE'S METHOD)</td>
<td width="20%" class="txtcls1"><input type="text" name="result49" id="result49" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1"><select class="txtcls1"><option value="maleesr">M:0-10</option><option value="femaleesr">F:0-20</option></select></td>
<td width="15%" class="txtcls1">SERUM POTASSCIUM</td>
<td width="20%" class="txtcls1"><input type="text" name="result21" id="result21" class="nametxt" placeholder="" /> </td>
<td width="15%" class="txtcls1">3.8-5.5 MEQ/L</td>
</tr>
<tr>
<td width="15%" class="txtcls1">MONOCYTES</td>
<td width="20%" class="txtcls1"><input type="text" name="result49" id="result49" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1">00-08%</td>
<td width="15%" class="txtcls1">SERUM CALCIUM</td>
<td width="20%" class="txtcls1"><input type="text" name="result22" id="result22" class="nametxt" placeholder="" /> </td>
<td width="15%" class="txtcls1">9.11%</td>
</tr>
<tr>
<td width="15%" class="txtcls1"><b>lIPID PROFILE</b></td>
<td width="20%" class="txtcls1"></td>
<td width="15%" class="txtcls1"></td>
<td width="15%" class="txtcls1">SERUM CHOLRIDES</td>
<td width="20%" class="txtcls1"><input type="text" name="result23" id="result23" class="nametxt" placeholder="" /> </td>
<td width="15%" class="txtcls1">95-105MEQ%</td>
</tr>
<tr>
<td width="15%" class="txtcls1">S.CHOLESTROL</td>
<td width="20%" class="txtcls1"><input type="text" name="result51" id="result51" class="nametxt" placeholder="" /> </td>
<td width="15%" class="txtcls1">150-200mg%</td>
<td width="15%" class="txtcls1"></td>
<td width="20%" class="txtcls1"></td>
<td width="15%" class="txtcls1"></td>
</tr>
<tr>
<td width="15%" class="txtcls1">TRIGLYCERIDES</td>
<td width="20%" class="txtcls1"><input type="text" name="result52" id="result52" class="nametxt" placeholder="" /> </td>
<td width="15%" class="txtcls1">50-150mg%</td>
<td width="15%" class="txtcls1"></td>
<td width="20%" class="txtcls1"></td>
<td width="15%" class="txtcls1"></td>
</tr>
<tr>
<td width="15%" class="txtcls1">HDL-CHO</td>
<td width="20%" class="txtcls1"><input type="text" name="result53" id="result53" class="nametxt" placeholder="" /> </td>
<td width="15%" class="txtcls1">40-80mg%</td>
<td width="15%" class="txtcls1"></td>
<td width="20%" class="txtcls1"></td>
<td width="15%" class="txtcls1"></td>
</tr>
<tr>
<td width="15%" class="txtcls1">LDL-CHO</td>
<td width="20%" class="txtcls1"><input type="text" name="result54" id="result54" class="nametxt" placeholder="" /> </td>
<td width="15%" class="txtcls1">60-160mg%</td>
<td width="15%" class="txtcls1"></td>
<td width="20%" class="txtcls1"> </td>
<td width="15%" class="txtcls1"></td>
</tr>
<tr>
<td width="15%" class="txtcls1">VLDL</td>
<td width="20%" class="txtcls1"><input type="text" name="result55" id="result55" class="nametxt" placeholder="" /> </td>
<td width="15%" class="txtcls1">20-40mg%</td>
<td width="15%" class="txtcls1"></td>
<td width="20%" class="txtcls1"> </td>
<td width="15%" class="txtcls1"></td>
</tr>

</table>

<p>
<p>
<p>
<p>
<center style="font-size:30px; color:#0067a9; font-family:Arial, Helvetica, sans-serif;text-align:center;"><span style="border: 1px solid #0067a9;border-radius: 50px;padding: 3px 15px;font-size:14px;">ROUTINE URINE EXAMINATION REPORT</span></center>
<table width="93%" class="tableborder" cellpadding="0" cellspacing="0" border="1" style="margin:10px 0px 0px 0px; color:#0067a9;border-color: #0067a9;margin-left:3%;margin-right: 3%;">

    <tr>
<td width="15%" class="txtcls1"><b>PHYSICAL EXAMINATION</b></td>
<td width="20%" class="txtcls1"><b>Result</b></td>
<td width="15%" class="txtcls1"><b>Normal Value</b></td>
<td width="15%" class="txtcls1"><b>CHEMICAL EXAMINATION</b></td>
<td width="20%" class="txtcls1"><b>Result</b></td>
<td width="15%" class="txtcls1"><b>Normal Value</b></td>
</tr>

 <tr>
<td width="15%" class="txtcls1">QUANTITY</td>
<td width="15" class="txtcls1"><input type="text" name="quantity" id="quantity" value="5ml" placeholder="" class="txtcls1"/></td>
<td width="15%" class="txtcls1"></td>
<td width="15%" class="txtcls1">ALBUMIN</td>
<td width="15%" class="txtcls1"><select id="albumin" name="albumin" class="txtcls1">
        <option value="fine">FINE TRAC</option>
        <option value="trace">TRACE</option>
        <option value="p">+</option>
        <option value="pp">++</option>
         <option value="ppp">+++</option>
         <option value="pppp">++++</option>
    </select>
</td>
<td width="15%" class="txtcls1"></td>
</tr>

</tr>
<tr>
<td width="15%" class="txtcls1">COLOUR</td>
<td width="15%" class="txtcls1"><select id="color" name="color" class="txtcls1">
        <option value="yellow">Pale Yellow</option>
        <option value="colourless">COLOURLESS</option>
        <option value="milky">MILKY</option>
        <option value="orange">ORANGE</option>
         <option value="redbeet">RED BEET</option>
         <option value="darkbroun">DARK BROUN</option>
    </select>
</td>
<td width="15%" class="txtcls1"></td>
<td width="15%" class="txtcls1">SUGAR</td>
<td width="15%" class="txtcls1"><select id="sugur" name="sugur" class="txtcls1">
        <option value="sugur1">+</option>
        <option value="sugur2">++</option>
        <option value="sugur3">+++</option>
        <option value="sugur4">++++</option>
        <option value="sugur5">NILL</option>
    </select>
</td>
<td width="15%" class="txtcls1"></td>
</tr>
<tr>
<td width="15%" class="txtcls1">REACTION</td>
<td width="15" class="txtcls1"><input type="text" name="reaction" id="reaction" value="ALKALION" placeholder="" class="txtcls1"/></td>
<td width="15%" class="txtcls1"></td>
<td width="15%" class="txtcls1">BILESALT </td>
<td width="20%" class="txtcls1"><input type="text" name="bilesalt" id="bilesalt"  placeholder="" class="nametxt" /></td>
<td width="15%" class="txtcls1">P/N</td>
</tr>
<tr>
<td width="15%" class="txtcls1">SPECIFIC GRAVITY</td>
<td width="15" class="txtcls1"><input type="text" name="gravity" id="gravity" placeholder="" class="nametxt"  /></td>
<td width="15%" class="txtcls1">1.003-1.030</td>
<td width="15%" class="txtcls1">BILT PIGMENT</td>
<td width="20%" class="txtcls1"><input type="text" name="biltpigment" id="biltpigment"  placeholder="" class="nametxt" /></td>
<td width="15%" class="txtcls1">P/N</td>
</tr>
<tr>
<td width="15%" class="txtcls1"><b>Microscopic examination</b></td>
<td width="15" class="txtcls1"></td>
<td width="15%" class="txtcls1"></td>
<td width="15%" class="txtcls1"></td>
<td width="20%" class="txtcls1"></td>
<td width="15%" class="txtcls1"></td>
</tr>
<tr>
<td width="15%" class="txtcls1">PUS CELLS</td>
<td width="15" class="txtcls1"><input type="text" name="puscells" id="puscells"  placeholder="" class="nametxt" /></td>
<td width="15%" class="txtcls1"></td>
<td width="15%" class="txtcls1"></td>
<td width="20%" class="txtcls1"></td>
<td width="15%" class="txtcls1"></td>
</tr>

<td width="15%" class="txtcls1">EPITHELIAL CELLS  </td>
<td width="15" class="txtcls1"><input type="text" name="epithcells" id="epithcells"  placeholder="" class="nametxt" /></td>
<td width="15%" class="txtcls1"></td>
<td width="15%" class="txtcls1"></td>
<td width="20%" class="txtcls1"></td>
<td width="15%" class="txtcls1"></td>
</tr>
<tr>
<td width="15%" class="txtcls1">CASTS</td>
<td width="15" class="txtcls1"><input type="text" name="casts   " id="casts"  placeholder="" class="nametxt" /></td>
<td width="15%" class="txtcls1"></td>
<td width="15%" class="txtcls1"></td>
<td width="20%" class="txtcls1"></td>
<td width="15%" class="txtcls1"></td>
</tr>
<tr>
<td width="15%" class="txtcls1">CASTS</td>
<td width="15" class="txtcls1"><input type="text" name="casts" id="casts"  placeholder="" class="nametxt" /></td>
<td width="15%" class="txtcls1"></td>
<td width="15%" class="txtcls1"></td>
<td width="20%" class="txtcls1"></td>
<td width="15%" class="txtcls1"></td>
</tr>
<tr>
<td width="15%" class="txtcls1">CRYSTALS</td>
<td width="15" class="txtcls1"><input type="text" name="crystals" id="crystals"  placeholder="" class="nametxt" /></td>
<td width="15%" class="txtcls1"></td>
<td width="15%" class="txtcls1"></td>
<td width="20%" class="txtcls1"></td>
<td width="15%" class="txtcls1"></td>
</tr>
<tr>
<td width="15%" class="txtcls1">R.B.C</td>
<td width="15" class="txtcls1"><input type="text" name="rbc" id="rbc"  placeholder="" class="nametxt" /></td>
<td width="15%" class="txtcls1"></td>
<td width="15%" class="txtcls1"></td>
<td width="20%" class="txtcls1"></td>
<td width="15%" class="txtcls1"></td>
</tr>♣
</table>




<p>
<p>
    <p>
<p>
<center style="font-size:30px; color:#0067a9; font-family:Arial, Helvetica, sans-serif;text-align:center;"><span style="border: 1px solid #0067a9;border-radius: 50px;padding: 3px 15px;font-size:14px;">Other Investications</span></center>
<table width="93%" class="tableborder" cellpadding="0" cellspacing="0" border="1" style="margin:10px 0px 0px 0px; color:#0067a9;border-color: #0067a9;margin-left:3%;margin-right: 3%;">
<tr>
<td width="15%" class="txtcls1"><b>Test</b></td>
<td width="20%" class="txtcls1"><b>Result</b></td>
<td width="15%" class="txtcls1"><b>Normal Value</b></td>
<td width="15%" class="txtcls1"><b>Test</b></td>
<td width="20%" class="txtcls1"><b>Result</b></td>
<td width="15%" class="txtcls1"><b>Normal Value</b></td>
</tr>
<tr>
<td width="15%" class="txtcls1" >FBS</td>
<td width="20%" class="txtcls1"><input type="text" name="result24" id="result24" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1">60-110mg%</td>
<td width="15%" class="txtcls1" >PPBS</td>
<td width="20%" class="txtcls1" ><input type="text" name="result25" id="result25" class="nametxt" placeholder="" /> </td>
<td width="15%" class="txtcls1" >60-160mg %</td>
</tr>
<tr>
<td width="15%" class="txtcls1">RBS</td>
<td width="20%" class="txtcls1"><input type="text" name="result26" id="result26" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1">60-160mg%</td>
<td width="15%" class="txtcls1">SERUM PROTINE</td>
<td width="20%" class="txtcls1"><input type="text" name="result27" id="result27" class="nametxt" placeholder="" /> </td>
<td width="15%" class="txtcls1">6-8g%</td>
</tr>
<tr>
<td width="15%" class="txtcls1">ALBU MIN</td>
<td width="20%" class="txtcls1"><input type="text" name="result28" id="result28" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1">3.2-5.0G%</td>
<td width="15%" class="txtcls1">HIV</td>
<td width="20%" class="txtcls1"> <input type="text" name="result29" id="result29" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1">P/N</td>
</tr>
<tr>
<td width="15%" class="txtcls1">ALBU MIN</td>
<td width="20%" class="txtcls1"><input type="text" name="result30" id="result30" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1">P/N</td>
<td width="15%" class="txtcls1">HBSAG</td>
<td width="20%" class="txtcls1"><input type="text" name="result31" id="result32" class="nametxt" placeholder="" /> </td>
<td width="15%" class="txtcls1">P/N</td>
</tr>
<tr>
<td width="15%" class="txtcls1">SERUM CALCIUME</td>
<td width="20%" class="txtcls1"><input type="text" name="result32" id="result32" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1">9-11%</td>
<td width="15%" class="txtcls1">SICKLING</td>
<td width="20%" class="txtcls1"><input type="text" name="result33" id="result34" class="nametxt" placeholder="" /> </td>
<td width="15%" class="txtcls1">P/N</td>
</tr>
<tr>
<td width="15%" class="txtcls1">BLOOD WIDAL</td>
<td width="20%" class="txtcls1"><input type="text" name="result34" id="result34" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1">P/N</td>
<td width="15%" class="txtcls1">MALARIYA</td>
<td width="20%" class="txtcls1"><input type="text" name="result35" id="result35" class="nametxt" placeholder="" /> </td>
<td width="15%" class="txtcls1">P/N</td>
</tr>
<tr>
<td width="15%" class="txtcls1">RA TEST</td>
<td width="20%" class="txtcls1"><input type="text" name="result36" id="result36" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1">P/N</td>
<td width="15%" class="txtcls1">ASO</td>
<td width="20%" class="txtcls1"><input type="text" name="result37" id="result37" class="nametxt" placeholder="" /> </td>
<td width="15%" class="txtcls1">P/N</td>
</tr>
<tr>
<td width="15%" class="txtcls1">CRP</td>
<td width="20%" class="txtcls1"><input type="text" name="result38" id="result38" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1">P/N</td>
<td width="15%" class="txtcls1">VDRL</td>
<td width="20%" class="txtcls1"><input type="text" name="result39" id="result39" class="nametxt" placeholder="" /> </td>
<td width="15%" class="txtcls1">P/N</td>
</tr>
<tr>
<td width="15%" class="txtcls1">B.T TIME</td>
<td width="20%" class="txtcls1"><input type="text" name="result40" id="result40" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1">1-5 MINT</td>
<td width="15%" class="txtcls1">C.T TIME</td>
<td width="20%" class="txtcls1"><input type="text" name="result41" id="result41" class="nametxt" placeholder="" /> </td>
<td width="15%" class="txtcls1">4-9 MINT</td>
</tr>
<tr>
<td width="15%" class="txtcls1">HB</td>
<td width="20%" class="txtcls1"><input type="text" name="result42" id="result42" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1"><select class="txtcls1"><option value="malepcv">M:13-18</option><option value="femalepcv">F:11-16</option></select></td>
<td width="15%" class="txtcls1">URICE ACID</td>
<td width="20%" class="txtcls1"><input type="text" name="result43" id="result43" class="nametxt" placeholder="" /> </td>
<td width="15%" class="txtcls1">2-5G%</td>
</tr>
<tr>
<td width="15%" class="txtcls1">SPUTAM FOR AFB</td>
<td width="20%" class="txtcls1"><input type="text" name="result44" id="result44" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1">P/N</td>
<td width="15%" class="txtcls1">UPT</td>
<td width="20%" class="txtcls1"><input type="text" name="result45" id="result45" class="nametxt" placeholder="" /> </td>
<td width="15%" class="txtcls1">P/N</td>
</tr>
<tr>
<td width="15%" class="txtcls1">DENDUE TEST</td>
<td width="20%" class="txtcls1"><input type="text" name="result46" id="result" class="result46" placeholder="" /></td>
<td width="15%" class="txtcls1">P/N</td>
<td width="15%" class="txtcls1">ESR</td>
<td width="20%" class="txtcls1"><input type="text" name="result47" id="normalvalue47" class="nametxt" placeholder="" /> </td>
<td width="15%" class="txtcls1"><select class="txtcls1"><option value="malepcv">M:0.10</option><option value="femalepcv">F:0.20</option></select></td>
</tr>
<tr>
</table>
<!--Ward Details End-->

<%--
<!--Name Section Start-->
<table width="96%" cellpadding="0" cellspacing="0" border="0" style="margin:10px 0px">
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
<td width="87%" class="txtcls1" style="border-bottom:1px solid #0067a9;text-align:left"><input readonly name="creationDate" type="text" class="nametxt" id="creationDate" /></td>
</table>
<!--Name Section End-->
<table width="96%" cellpadding="0" cellspacing="0" border="0" style="margin:10px 0px">
<tr>
<td width="13%" class="txtcls1" align="left">CRP :</td>
<td width="87%" class="txtcls1" style="border-bottom:1px solid #0067a9;text-align:right"><input type="text" name="crp" id="crp" class="nametxt" placeholder="Enter Crp" /></td>
</tr>
<tr>
<td width="13%" class="txtcls1" align="left">RA :</td>
<td width="87%" class="txtcls1" style="border-bottom:1px solid #0067a9;text-align:right"><input type="text" name="ra" id="ra" class="nametxt" placeholder="Enter RA" /></td>
</tr>
</table>--%>

</td>
</tr>
</table>
</td>
</tr>
</table>
<table id="table2" width="100%" border="0" align="center"  >   <td >
<input readonly name="creationDate" type="hidden" class="nametxt" id="creationDate" /></td></table>

    <table id="table2" width="100%" border="0" align="center"  >

                                            <tr>
                                                <td align="center">
                                                   
                                                    <button id="save"  onmouseover="validateButton();">Save </button>
                                                    <button id="reset" type="reset" >Cancel</button>
                                                  

                                                
                                   


                                        
        

                        <!--    <span id="printprop">Print</span> onclick="CallPrint()" 
                       

<script>
function myFunction() {
    window.print();
}
</script>-->
 </td>
                                         </tr>
            </table>

    </form>
</body>
</html>
