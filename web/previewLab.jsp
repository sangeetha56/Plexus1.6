
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html >
    <head >
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css" title="currentStyle">
            @import "css/dataTable/css/demo_page.css";
            @import "css/dataTable/css/jquery.dataTables.css";
        </style>
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




         <script src="js/print/jquery.printPage.js" type="text/javascript"></script>
          
       


         <style>

body{
font-family:Arial, Helvetica, sans-serif;
}
input.nametxt{ outline:0; border:none; width:100%}
.txtcls1{font-family:Arial, Helvetica, sans-serif; font-size:14px;text-align:center}
@media screen and (min-width:300px) and (max-width:767px){
	  .main_table{ width:100%}
	  .mobscale{ width:100%; float:left}
	}
	td
	{
	padding:3px;
	}
</style>
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

</head>

<body>
    <form name="form2" action="Controller?process=lab&action=printBill&id=<c:out value="${lab.id}"/>">


        <table width="100%" cellpadding="0" cellspacing="0" border="0">
           
<tr>
<td>
<table width="1000" cellpadding="0" cellspacing="0" border="0" class="main_table">

<tr>
<td>

<!--lab Details Start-->
<table  width="100%" class="tableborder" cellpadding="0" cellspacing="0" border="1" style="margin:10px 0px 0px 0px;border-radius:5px;">


 <tr>
<td width="15%" class="txtcls1" style="font-weight:bold;">REPORT NO: </td>
<td width="15%" class="dataText"><c:out value="${lab.id}"/></td>
<td width="15%" class="txtcls1" style="font-weight:bold;">REPORT DATE: </td>
<td width="15%" class="dataText"><c:out value="${lab.ddate}"/>  </td>
<td width="15%" class="txtcls1" style="font-weight:bold;">CARD NO</td>
<td width="25%" class="dataText"><c:out value="${lab.cardno}"/> </td>
</tr>
<tr>
<td width="15%" class="txtcls1" style="font-weight:bold;">NAME</td>
<td width="25%" class="dataText" ><c:out value="${lab.name}"/> </td>
<td width="15%" class="txtcls1" style="font-weight:bold;">SEX</td>
<td width="15%" class="dataText"><c:out value="${lab.sex}"/> </td>
<td width="15%" class="txtcls1" style="font-weight:bold;">AGE </td>
<td width="15%" class="dataText"><c:out value="${lab.age}"/> </td>
</tr>

</table>
<!--Ward Details End-->




<!--Ward Details Start-->
<table width="100%" class="tableborder" cellpadding="0" cellspacing="0" border="1" style="margin:10px 0px 0px 0px;border-radius:5px;">

    <tr>
<td width="25%" class="txtcls1" style="font-weight:bold;">CBC</td>
<td width="25%" class="txtcls1" style="font-weight:bold;"> Normal Value </td>
<td width="50%" class="txtcls1" style="font-weight:bold;"> Result</td>
</tr>
     <tr>
<td width="25%" class="txtcls1">HAEMOGLOBIN</td>
<td width="25%" class="txtcls1"> 6-10mg %</td>
<td width="50%" class="dataText"><c:out value="${lab.result1}" /></td>
</tr>
<td width="25%" class="txtcls1">TOTAL WBC COUNT</td>
<td width="25%" class="txtcls1"> 4000-11000/cmm</td>
<td width="50%" class="dataText"><c:out value="${lab.result2}" /></td>
</tr>
<tr>
<td width="25%" class="txtcls1">NUETROPHILS</td>
<td width="25%" class="txtcls1"> 45-75% </td>
<td width="50%" class="dataText"><c:out value="${lab.result3}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">LYMPHOCYTE</td>
<td width="25%" class="txtcls1"> 20-40% </td>
<td width="50%" class="dataText"><c:out value="${lab.result4}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">MONOCYTES</td>
<td width="25%" class="txtcls1">00-08%</td>
<td width="50%" class="dataText"><c:out value="${lab.result50}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">EOSINOPHIL</td>
<td width="25%" class="txtcls1"> 1-6.8	</td>
<td width="50%" class="dataText"><c:out value="${lab.result5}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">R.B.C.COUNT</td>
<td width="25%" class="txtcls1"> 0.9-1.7mg %</td>
<td width="50%" class="dataText"><c:out value="${lab.result6}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">M.C.V</td>
<td width="25%" class="txtcls1"> 76-96fl</td>
<td width="50%" class="dataText"><c:out value="${lab.result7}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">M.C.H</td>
<td width="25%" class="txtcls1"> .27-32pg </td>
<td width="50%" class="txtcls1"><c:out value="${lab.result8}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">M.C.H.C</td>
<td width="25%" class="txtcls1"> 29.35%</td>
<td width="50%" class="dataText"><c:out value="${lab.result9}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">PCV</td>
<td width="25%" class="txtcls1"> M:40-54</td>
<td width="50%" class="dataText"><c:out value="${lab.result10}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">PLATELETS</td>
<td width="25%" class="txtcls1">1.5-4.5</td>
<td width="50%" class="dataText"><c:out value="${lab.result48}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">ESR(WINTROBE'S METHOD)</td>
<td width="25%" class="txtcls1"> M:0-10,F:0-20mm</td>
<td width="50%" class="dataText"><c:out value="${lab.result49}" /> </td>
</tr>

</table>
<!--Ward Details End-->

<!--Ward Details Start-->
<table width="100%" class="tableborder" cellpadding="0" cellspacing="0" border="1" style="margin:10px 0px 0px 0px;border-radius:5px;">

    <tr>
<td width="25%" class="txtcls1" style="font-weight:bold;">LFT</td>
<td width="25%" class="txtcls1" style="font-weight:bold;"> Normal Value</td>
<td width="50%" class="txtcls1" style="font-weight:bold;"> Result </td>
    </tr>
    <tr>
<td width="25%" class="txtcls1"> TOTAL BILIRUBIN </td>
<td width="25%" class="txtcls1"> 0.1 1.0mg </td>
<td width="50%" class="dataText"><c:out value="${lab.result11}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">D.BILIRUBIN</td>
<td width="25%" class="txtcls1"> 0.0-0.5</td>
<td width="50%" class="dataText"><c:out value="${lab.result12}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">SG OT</td>
<td width="25%" class="txtcls1"> 5-4OI.U/L</td>
<td width="50%" class="dataText"><c:out value="${lab.result13}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">SG PT</td>
<td width="25%" class="txtcls1">5-30I.U/L</td>
<td width="50%" class="dataText"><c:out value="${lab.result14}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">TOTAL PROTIN</td>
<td width="25%" class="txtcls1">6-8g%	</td>
<td width="50%" class="dataText"><c:out value="${lab.result15}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">ALBUMIN</td>
<td width="25%" class="txtcls1">3.2-5.0g%	</td>
<td width="50%" class="dataText"><c:out value="${lab.result16}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">ALKALINE PHOSPHASE</td>
<td width="25%" class="txtcls1"> 3.13 KA.U/100ml </td>
<td width="50%" class="dataText"><c:out value="${lab.result17}" /> </td>
</tr>
</table>

<table width="100%" class="tableborder" cellpadding="0" cellspacing="0" border="1" style="margin:10px 0px 0px 0px;border-radius:5px;">

    <tr>
<td width="25%" class="txtcls1" style="font-weight:bold;">RFT</td>
<td width="25%" class="txtcls1" style="font-weight:bold;"> Normal Value</td>
<td width="50%" class="txtcls1" style="font-weight:bold;"> Result </td>
    </tr>
    <tr>
<td width="25%" class="txtcls1"> BLOOD UREA </td>
<td width="25%" class="txtcls1"> 15 45mg </td>
<td width="50%" class="dataText"><c:out value="${lab.result18}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">SERUM CATENINE</td>
<td width="25%" class="txtcls1"> 0.9  1.7 mg </td>
<td width="50%" class="dataText"><c:out value="${lab.result19}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">SERUM SODIUM</td>
<td width="25%" class="txtcls1"> 135   145 MEQ/L</td>
<td width="50%" class="dataText"><c:out value="${lab.result20}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">SERUM POTASSCIUM</td>
<td width="25%" class="txtcls1">3.8  5.5 MEQ/L</td>
<td width="50%" class="dataText"><c:out value="${lab.result21}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">SERUM CALCIUM</td>
<td width="25%" class="txtcls1">9.11%	</td>
<td width="50%" class="dataText"><c:out value="${lab.result22}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">SERUM CHOLRIDES</td>
<td width="25%" class="txtcls1">    95   105 MEQ/</td>
<td width="50%" class="dataText"><c:out value="${lab.result23}" /> </td>
</tr>
</table>

<table width="100%" class="tableborder" cellpadding="0" cellspacing="0" border="1" style="margin:10px 0px 0px 0px;border-radius:5px;">

    <tr>
<td width="25%" class="txtcls1" style="font-weight:bold;">OTHER INVESTICATION</td>
<td width="25%" class="txtcls1" style="font-weight:bold;"> Normal Value</td>
<td width="50%" class="txtcls1" style="font-weight:bold;"> Result </td>
    </tr>
    <tr>
<td width="25%" class="txtcls1"> FBS </td>
<td width="25%" class="txtcls1"> 60 -110 mg% </td>
<td width="50%" class="dataText"><c:out value="${lab.result24}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">PPBS</td>
<td width="25%" class="txtcls1"> 60 -160 mg% </td>
<td width="50%" class="dataText"><c:out value="${lab.result25}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">RBS</td>
<td width="25%" class="txtcls1"> 60-160 mg%</td>
<td width="50%" class="dataText"><c:out value="${lab.result26}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">SERUM PROTINE</td>
<td width="25%" class="txtcls1">6-8g%</td>
<td width="50%" class="dataText"><c:out value="${lab.result27}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">ALBU MIN</td>
<td width="25%" class="txtcls1">3.2-5.0G%	</td>
<td width="50%" class="dataText"><c:out value="${lab.result28}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">HIV</td>
<td width="25%" class="txtcls1">P/N</td>
<td width="50%" class="dataText"><c:out value="${lab.result29}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">ALBU MIN</td>
<td width="25%" class="txtcls1">P/N</td>
<td width="50%" class="dataText"><c:out value="${lab.result30}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">HBSAG</td>
<td width="25%" class="txtcls1">P/N</td>
<td width="50%" class="dataText"><c:out value="${lab.result31}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">SERUM CALCIUME</td>
<td width="25%" class="txtcls1">9-11%</td>
<td width="50%" class="dataText"><c:out value="${lab.result32}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">SICKLING</td>
<td width="25%" class="txtcls1">P/N</td>
<td width="50%" class="dataText"><c:out value="${lab.result33}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">BLOOD WIDAL</td>
<td width="25%" class="txtcls1">P/N</td>
<td width="50%" class="dataText"><c:out value="${lab.result34}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">MALARIYA</td>
<td width="25%" class="txtcls1">P/N</td>
<td width="50%" class="dataText"><c:out value="${lab.result35}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">RA TEST</td>
<td width="25%" class="txtcls1">P/N</td>
<td width="50%" class="dataText"><c:out value="${lab.result36}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">ASO</td>
<td width="25%" class="txtcls1">P/N</td>
<td width="50%" class="dataText"><c:out value="${lab.result37}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">CRP</td>
<td width="25%" class="txtcls1">P/N</td>
<td width="50%" class="dataText"><c:out value="${lab.result38}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">VDRL</td>
<td width="25%" class="txtcls1">P/N</td>
<td width="50%" class="dataText"><c:out value="${lab.result39}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">B.T TIME</td>
<td width="25%" class="txtcls1">1-5 MINT</td>
<td width="50%" class="dataText"><c:out value="${lab.result40}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">C.T TIME</td>
<td width="25%" class="txtcls1">P/N</td>
<td width="50%" class="dataText"><c:out value="${lab.result41}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">HB</td>
<td width="25%" class="txtcls1">P/N</td>
<td width="50%" class="dataText"><c:out value="${lab.result42}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">URICE ACID</td>
<td width="25%" class="txtcls1">2-5G%</td>
<td width="50%" class="dataText"><c:out value="${lab.result43}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">UPT</td>
<td width="25%" class="txtcls1">P/N</td>
<td width="50%" class="dataText"><c:out value="${lab.result44}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">SPUTAM FOR AFB</td>
<td width="25%" class="txtcls1">P/N</td>
<td width="50%" class="dataText"><c:out value="${lab.result45}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">DENDUE TEST</td>
<td width="25%" class="txtcls1">P/N</td>
<td width="50%" class="dataText"><c:out value="${lab.result46}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">ESR</td>
<td width="25%" class="txtcls1">M:010F0.20</td>
<td width="50%" class="dataText"><c:out value="${lab.result47}" /> </td>
</tr>
</table>
<!--Ward Details End-->



<!--Ward Details Start-->
<table width="100%" class="tableborder" cellpadding="0" cellspacing="0" border="1" style="margin:10px 0px 0px 0px;border-radius:5px;">
<tr>
<td width="50%" class="txtcls1" style="font-weight:bold;"> Test Performed By</td>
<td width="50%" class="txtcls1" style="font-weight:bold;">Test Results Checked By </td>
</tr>
</table>
<!--Ward Details End-->





</td>
</tr>

</table>
        <table id="dataTable" width="100%" border="0">
                <tr>
                    <td align="center" >
                       <a id="print" href="Controller?process=LabProcess&action=printBill&id=<c:out value="${lab.id}"/>">Print</a>
                        <!--<input id="sub" type="submit" value="Print"  /> -->
                    </td>


                </tr>

            </table>
    </form>

</body>
</html>
