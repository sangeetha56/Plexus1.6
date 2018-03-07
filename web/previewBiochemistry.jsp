
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
    <form name="form2" action="Controller?process=BiochemistryProcess&action=printBill&id=<c:out value="${biochemistry.id}"/>">


        <table width="100%" cellpadding="0" cellspacing="0" border="0">
           
<tr>
<td>
<table width="1000" cellpadding="0" cellspacing="0" border="0" class="main_table">

<tr>
<td>

<!--Biochemistry Details Start-->
<table  width="100%" class="tableborder" cellpadding="0" cellspacing="0" border="1" style="margin:10px 0px 0px 0px;border-radius:5px;">


 <tr>
<td width="15%" class="txtcls1" style="font-weight:bold;">REPORT NO: </td>
<td width="15%" class="dataText"><c:out value="${biochemistry.id}"/></td>
<td width="15%" class="txtcls1" style="font-weight:bold;">REPORT DATE: </td>
<td width="15%" class="dataText"><c:out value="${biochemistry.ddate}"/>  </td>
<td width="15%" class="txtcls1" style="font-weight:bold;">CARD NO</td>
<td width="25%" class="dataText"><c:out value="${biochemistry.cardno}"/> </td>
</tr>
<tr>
<td width="15%" class="txtcls1" style="font-weight:bold;">NAME</td>
<td width="25%" class="dataText" ><c:out value="${biochemistry.name}"/> </td>
<td width="15%" class="txtcls1" style="font-weight:bold;">SEX</td>
<td width="15%" class="dataText"><c:out value="${biochemistry.sex}"/> </td>
<td width="15%" class="txtcls1" style="font-weight:bold;">AGE </td>
<td width="15%" class="dataText"><c:out value="${biochemistry.age}"/> </td>
</tr>

</table>
<!--Ward Details End-->




<!--Ward Details Start-->
<table width="100%" class="tableborder" cellpadding="0" cellspacing="0" border="1" style="margin:10px 0px 0px 0px;border-radius:5px;">

    <tr>
<td width="25%" class="txtcls1" style="font-weight:bold;">Blood Ureal</td>
<td width="25%" class="txtcls1" style="font-weight:bold;"> Normal Value </td>
<td width="50%" class="txtcls1" style="font-weight:bold;"> Result</td>
</tr>
     <tr>
<td width="25%" class="txtcls1">Blood Sugar Fasting </td>
<td width="25%" class="txtcls1"> 6-10mg %</td>
<td width="50%" class="dataText"><c:out value="${biochemistry.result1}" /></td>
</tr>
<td width="25%" class="txtcls1">Blood Sugar PPBS</td>
<td width="25%" class="txtcls1"> 80-160mg %</td>
<td width="50%" class="dataText"><c:out value="${biochemistry.result2}" /></td>
</tr>
<tr>
<td width="25%" class="txtcls1">S.Phophorus</td>
<td width="25%" class="txtcls1"> 3.4-5mg %</td>
<td width="50%" class="dataText"><c:out value="${biochemistry.result3}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">S.Calcium</td>
<td width="25%" class="txtcls1"> 9-11 %</td>
<td width="50%" class="dataText"><c:out value="${biochemistry.result4}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">S.Amylase</td>
<td width="25%" class="txtcls1">90-200u / 100ml</td>
<td width="50%" class="dataText"><c:out value="${biochemistry.result5}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">S.Cholesterd</td>
<td width="25%" class="txtcls1"> 150-200mg %	</td>
<td width="50%" class="dataText"><c:out value="${biochemistry.result6}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">S.Creatnine</td>
<td width="25%" class="txtcls1"> 0.9-1.7mg %</td>
<td width="50%" class="dataText"><c:out value="${biochemistry.result7}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">S.Uric Acid</td>
<td width="25%" class="txtcls1"> 2-5mg %</td>
<td width="50%" class="dataText"><c:out value="${biochemistry.result8}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">S.G.O.T	</td>
<td width="25%" class="txtcls1"> 5-40 I U\L</td>
<td width="50%" class="txtcls1"><c:out value="${biochemistry.result9}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">S.G.P.T</td>
<td width="25%" class="txtcls1"> 5-30 I U\L</td>
<td width="50%" class="dataText"><c:out value="${biochemistry.result10}" /> </td>
</tr>

</table>
<!--Ward Details End-->

<!--Ward Details Start-->
<table width="100%" class="tableborder" cellpadding="0" cellspacing="0" border="1" style="margin:10px 0px 0px 0px;border-radius:5px;">

    <tr>
<td width="25%" class="txtcls1" style="font-weight:bold;">Total Protiens</td>
<td width="25%" class="txtcls1" style="font-weight:bold;"> Normal Value 6-8% </td>
<td width="50%" class="txtcls1" style="font-weight:bold;"> Result </td>
    </tr>
    <tr>
<td width="25%" class="txtcls1">Albumin</td>
<td width="25%" class="txtcls1"> 3.2-5.0mg %</td>
<td width="50%" class="dataText"><c:out value="${biochemistry.normalvalue1}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">A/G Ration</td>
<td width="25%" class="txtcls1"> 1.2 - 1.8</td>
<td width="50%" class="dataText"><c:out value="${biochemistry.normalvalue2}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">Total Billrubin</td>
<td width="25%" class="txtcls1"> 0.1 - 1.0mg %</td>
<td width="50%" class="dataText"><c:out value="${biochemistry.normalvalue3}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">Conjugated</td>
<td width="25%" class="txtcls1">0.1 - 0.4mg %</td>
<td width="50%" class="dataText"><c:out value="${biochemistry.normalvalue4}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">Alkaline Phosphase</td>
<td width="25%" class="txtcls1">3-13 K.A.U /100ml	</td>
<td width="50%" class="dataText"><c:out value="${biochemistry.normalvalue5}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">Add Phosphatase</td>
<td width="25%" class="txtcls1">1.0-3.5 K.A.U /100ml	</td>
<td width="50%" class="dataText"><c:out value="${biochemistry.normalvalue6}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">Serum Sodium</td>
<td width="25%" class="txtcls1"> 135-145 m Eq/L	</td>
<td width="50%" class="dataText"><c:out value="${biochemistry.normalvalue7}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">Serum Potassium	</td>

<td width="25%" class="txtcls1"> 3.8-5.5 m Eq/L</td>

    <td width="50%" class="txtcls1"><c:out value="${biochemistry.normalvalue8}" /> </td>
</tr>
<tr>
<td width="25%" class="txtcls1">Serum Chlorides</td>
<td width="25%" class="txtcls1"> 95-105 m Eq/L</td>
<td width="50%" class="dataText"><c:out value="${biochemistry.normalvalue9}" /> </td>
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
                       <a id="print" href="Controller?process=BiochemistryProcess&action=printBill&id=<c:out value="${biochemistry.id}"/>">Print</a>
                        <!--<input id="sub" type="submit" value="Print"  /> -->
                    </td>


                </tr>

            </table>
    </form>

</body>
</html>
