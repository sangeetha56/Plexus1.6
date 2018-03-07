
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

        

    <form name="form1" id="form1" action="Controller?process=BiochemistryProcess&action=add" method="post">
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
<table width="96%" cellpadding="0" cellspacing="0" border="0" style="margin:10px 0px 0px 0px">
<tr>
<td width="40%" class="mobscale" align="left">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="10%" class="txtcls1" align="left">Name</td>
<td width="90%" class="txtcls1" style="border-bottom:1px solid #000000">  <a id="contPopup"  href="javascript:openWin5('Controller?process=PatientProcess&action=viewAllPopUpForBiochemistry&patientControllerValue=null&noOfRecords=20&pageno=1&alphabit=null&flag=0',700,300,'propAdd1')"    class="nametxt" ><input  type="text" name="patientName" id="patientName" width="100%" style="border:0px" title="Click here to Select Patient"  size="50%"/></a> <input name="patientID" type="hidden" id="patientID" value="" /></td>
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
<td width="15%" class="txtcls1">Blood Ureal</td>
<td width="15%" class="txtcls1">Normal Value</td>
<td width="20%" class="txtcls1">Result</td>
<td width="15%" class="txtcls1">Total Protiens</td>
<td width="15%" class="txtcls1">Normal Value 6-8%</td>
<td width="20%" class="txtcls1">Result</td>
</tr>
<tr>
<td width="15%" class="txtcls1" rowspan="2">Blood Sugar Fasting / PPBS</td>
<td width="15%" class="txtcls1">6-10mg %</td>
<td width="20%" class="txtcls1"><input type="text" name="result1" id="result1" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1" rowspan="2">Albumin</td>
<td width="15%" class="txtcls1" rowspan="2"> 3.2-5.0mg %</td>
<td width="20%" class="txtcls1" rowspan="2"><input type="text" name="normalvalue1" id="normalvalue1" class="nametxt" placeholder="" /> </td>
</tr>
<tr>
<td width="15%" class="txtcls1">80-160mg %</td>
<td width="20%" class="txtcls1"><input type="text" name="result2" id="result2" class="nametxt" placeholder="" /></td>
</tr>
<tr>
<td width="15%" class="txtcls1">S.Phophorus</td>
<td width="15%" class="txtcls1">3.4-5mg %</td>
<td width="20%" class="txtcls1"><input type="text" name="result3" id="result3" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1">A/G Ration</td>
<td width="15%" class="txtcls1">1.2 - 1.8</td>
<td width="20%" class="txtcls1"><input type="text" name="normalvalue2" id="normalvalue2" class="nametxt" placeholder="" /> </td>
</tr>
<tr>
<td width="15%" class="txtcls1">S.Calcium</td>
<td width="15%" class="txtcls1">9-11 %</td>
<td width="20%" class="txtcls1"><input type="text" name="result4" id="result4" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1">Total Billrubin</td>
<td width="15%" class="txtcls1">0.1 - 1.0mg %</td>
<td width="20%" class="txtcls1"> <input type="text" name="normalvalue3" id="normalvalue3" class="nametxt" placeholder="" /></td>
</tr>
<tr>
<td width="15%" class="txtcls1">S.Amylase</td>
<td width="15%" class="txtcls1">90-200u / 100ml</td>
<td width="20%" class="txtcls1"><input type="text" name="result5" id="result5" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1">Conjugated</td>
<td width="15%" class="txtcls1">0.1 - 0.4mg %</td>
<td width="20%" class="txtcls1"><input type="text" name="normalvalue4" id="normalvalue4" class="nametxt" placeholder="" /> </td>
</tr>
<tr>
<td width="15%" class="txtcls1">S.Cholesterd</td>
<td width="15%" class="txtcls1">150-200mg %</td>
<td width="20%" class="txtcls1"><input type="text" name="result6" id="result6" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1">Alkaline Phosphase</td>
<td width="15%" class="txtcls1">3-13 K.A.U /100ml</td>
<td width="20%" class="txtcls1"><input type="text" name="normalvalue5" id="normalvalue5" class="nametxt" placeholder="" /> </td>
</tr>
<tr>
<td width="15%" class="txtcls1">S.Creatnine</td>
<td width="15%" class="txtcls1">0.9-1.7mg %</td>
<td width="20%" class="txtcls1"><input type="text" name="result7" id="result7" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1">Add Phosphatase</td>
<td width="15%" class="txtcls1">1.0-3.5 K.A.U /100ml</td>
<td width="20%" class="txtcls1"><input type="text" name="normalvalue6" id="normalvalue6" class="nametxt" placeholder="" /> </td>
</tr>
<tr>
<td width="15%" class="txtcls1">S.Uric Acid</td>
<td width="15%" class="txtcls1">2-5mg %</td>
<td width="20%" class="txtcls1"><input type="text" name="result8" id="result8" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1">Serum Sodium</td>
<td width="15%" class="txtcls1">135-145 m Eq/L</td>
<td width="20%" class="txtcls1"><input type="text" name="normalvalue7" id="normalvalue7" class="nametxt" placeholder="" /> </td>
</tr>
<tr>
<td width="15%" class="txtcls1">S.G.O.T</td>
<td width="15%" class="txtcls1">5-40 I U\L</td>
<td width="20%" class="txtcls1"><input type="text" name="result9" id="result9" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1">Serum Potassium</td>
<td width="15%" class="txtcls1">3.8-5.5 m Eq/L</td>
<td width="20%" class="txtcls1"><input type="text" name="normalvalue8" id="normalvalue8" class="nametxt" placeholder="" /> </td>
</tr>
<tr>
<td width="15%" class="txtcls1">S.G.P.T</td>
<td width="15%" class="txtcls1">5-30 I U\L</td>
<td width="20%" class="txtcls1"><input type="text" name="result10" id="result10" class="nametxt" placeholder="" /></td>
<td width="15%" class="txtcls1">Serum Chlorides</td>
<td width="15%" class="txtcls1">95-105 m Eq/L</td>
<td width="20%" class="txtcls1"><input type="text" name="normalvalue9" id="normalvalue9" class="nametxt" placeholder="" /> </td>
</tr>
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
