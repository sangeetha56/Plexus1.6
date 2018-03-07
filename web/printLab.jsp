<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html >
    <head >
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
        <link rel="stylesheet" href="css/datePicker/jquery-ui-1.8.18.custom.css">
        <link rel="stylesheet" href="css/validation/jquery.ketchup.css">

        <script type="text/javascript" src="js/datePicker/ui/jquery-ui-1.8.17.custom.js"></script> 
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.button.js"></script>
        <link rel="stylesheet" href="css/datePicker/demos.css">
        


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
    <form name="form2" action="Controller?process=BiochemistryProcess&action=add" method="post">


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
<td width="15%" class="txtcls1" align="center"><c:out value="${lab.id}"/></td>
<td width="15%" class="txtcls1" style="font-weight:bold;">REPORT DATE: </td>
<td width="15%" class="txtcls1"><c:out value="${lab.ddate}"/>  </td>
<td width="15%" class="txtcls1" style="font-weight:bold;">CARD NO</td>
<td width="25%" class="txtcls1"><c:out value="${lab.cardno}"/> </td>
</tr>
<tr>
<td width="15%" class="txtcls1" style="font-weight:bold;">NAME</td>
<td width="25%" class="txtcls1" ><c:out value="${lab.name}"/> </td>
<td width="15%" class="txtcls1" style="font-weight:bold;">SEX</td>
<td width="15%" class="txtcls1"><c:out value="${lab.sex}"/> </td>
<td width="15%" class="txtcls1" style="font-weight:bold;">AGE </td>
<td width="15%" class="txtcls1"><c:out value="${lab.age}"/> </td>
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
<c:choose>
      <c:when test="${lab.result1 eq ''}">

      </c:when>

      <c:otherwise>
     <tr>
<td width="25%" class="txtcls1">HAEMOGLOBIN </td>
<td width="25%" class="txtcls1"> 6-10mg %</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result1}" /></td>
</tr>
      </c:otherwise>
    </c:choose>

<c:choose>
      <c:when test="${lab.result2 eq ''}">

      </c:when>

      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">TOTAL WBC COUNT</td>
<td width="25%" class="txtcls1"> 4000-11000/cmm </td>
<td width="50%" class="txtcls1"><c:out value="${lab.result2}" /></td>
</tr>
</c:otherwise>
    </c:choose>

<c:choose>
      <c:when test="${lab.result3 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">NUETROPHILS</td>
<td width="25%" class="txtcls1"> 45-75%</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result3}" /> </td>
</tr>
</c:otherwise>
    </c:choose>

<c:choose>
      <c:when test="${lab.result4 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">LYMPHOCYTE</td>
<td width="25%" class="txtcls1"> 20-40% </td>
<td width="50%" class="txtcls1"><c:out value="${lab.result4}" /> </td>
</tr>
</c:otherwise>
    </c:choose>


 <!--<c:choose>
      <c:when test="${lab.result50 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">MONOCYTES</td>
<td width="25%" class="txtcls1">00-08%</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result50}" /> </td>
</tr>
</c:otherwise>
    </c:choose>-->

<c:choose>
      <c:when test="${lab.result5 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">EOSINOPHIL</td>
<td width="25%" class="txtcls1"> 1-6.8	</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result5}" /> </td>
</tr>
</c:otherwise>
    </c:choose>

<c:choose>
      <c:when test="${lab.result6 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">R.B.C.COUNT</td>
<td width="25%" class="txtcls1"> 0.9-1.7mg %</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result6}" /> </td>
</tr>
</c:otherwise>
    </c:choose>

<c:choose>
      <c:when test="${lab.result7 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">>M.C.V</td>
<td width="25%" class="txtcls1"> 76-96fl </td>
<td width="50%" class="txtcls1"><c:out value="${lab.result7}" /> </td>
</tr>
</c:otherwise>
    </c:choose>

<c:choose>
      <c:when test="${lab.result8 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1"> M.C.H	</td>
<td width="25%" class="txtcls1"> .27-32pg </td>
<td width="50%" class="txtcls1"><c:out value="${lab.result8}" /> </td>
</tr>
</c:otherwise>
    </c:choose>

<c:choose>
      <c:when test="${lab.result9 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">M.C.H.C</td>
<td width="25%" class="txtcls1"> 29.35%</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result9}" /> </td>
</tr>
</c:otherwise>
    </c:choose>

<!--<c:choose>
      <c:when test="${lab.result10 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">PCV</td>
<td width="25%" class="txtcls1"> M:40-54</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result10}" /> </td>
</tr>
</c:otherwise>
    </c:choose>-->

<c:choose>
      <c:when test="${lab.result48 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">PLATELETS</td>
<td width="25%" class="txtcls1"> 1.5-4.5 </td>
<td width="50%" class="txtcls1"><c:out value="${lab.result49}" /> </td>
</tr>
</c:otherwise>
    </c:choose>

<c:choose>
      <c:when test="${lab.result49 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">ESR(WINTROBE'S METHOD)</td>
<td width="25%" class="txtcls1"> M:0-10,F:0-20mm </td>
<td width="50%" class="txtcls1"><c:out value="${lab.result49}" /> </td>
</tr>
</c:otherwise>
    </c:choose>


</table>
<!--Ward Details End-->

<!--Ward Details Start-->
<table width="100%" class="tableborder" cellpadding="0" cellspacing="0" border="1" style="margin:10px 0px 0px 0px;border-radius:5px;">

    <tr>
<td width="25%" class="txtcls1" style="font-weight:bold;">RFT</td>
<td width="25%" class="txtcls1" style="font-weight:bold;"> Normal Value </td>
<td width="50%" class="txtcls1" style="font-weight:bold;"> Result</td>
    </tr>

<c:choose>
      <c:when test="${lab.result11 eq ''}">
      </c:when>
      <c:otherwise>
    <tr>
<td width="25%" class="txtcls1">TOTAL BILIRUBIN</td>
<td width="25%" class="txtcls1"> 0.1 1.0mg </td>
<td width="50%" class="txtcls1"><c:out value="${lab.result11}" /> </td>
</tr>
</c:otherwise>
    </c:choose>


<c:choose>
      <c:when test="${lab.result12 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">D.BILIRUBIN</td>
<td width="25%" class="txtcls1">  0.0-0.5</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result12}" /> </td>
</tr>
</c:otherwise>
    </c:choose>


<c:choose>
      <c:when test="${lab.result13 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">SG OT</td>
<td width="25%" class="txtcls1"> 5-4OI.U/L </td>
<td width="50%" class="txtcls1"><c:out value="${lab.result13}" /> </td>
</tr>
</c:otherwise>
    </c:choose>

<c:choose>
      <c:when test="${lab.result14 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">SG PT</td>
<td width="25%" class="txtcls1"> 5-30I.U/L</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result14}" /> </td>
</tr>
</c:otherwise>
    </c:choose>

<c:choose>
      <c:when test="${lab.result15 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">TOTAL PROTINE</td>
<td width="25%" class="txtcls1"> 6-8g% </td>
<td width="50%" class="txtcls1"><c:out value="${lab.result15}" /> </td>
</tr>
</c:otherwise>
    </c:choose>

<c:choose>
      <c:when test="${lab.result16 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">ALBUMIN</td>
<td width="25%" class="txtcls1">3.2-5.0g%</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result16}" /> </td>
</tr>
</c:otherwise>
    </c:choose>

<c:choose>
      <c:when test="${lab.result17 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">ALKALINE PHOSPHASE</td>
<td width="25%" class="txtcls1"> 3.13 KA.U/100ml</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result17}" /> </td>
</tr>
</c:otherwise>
    </c:choose>

 <tr>
<td width="25%" class="txtcls1" style="font-weight:bold;">LFT</td>
<td width="25%" class="txtcls1" style="font-weight:bold;"> Normal Value </td>
<td width="50%" class="txtcls1" style="font-weight:bold;"> Result</td>
    </tr>

<c:choose>
      <c:when test="${lab.result18 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">BLOOD UREA</td>
<td width="25%" class="txtcls1"> 15.45mg</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result18}" /> </td>
</tr>
</c:otherwise>
    </c:choose>

<c:choose>
      <c:when test="${lab.result19 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">SERUM CATENINE</td>
<td width="25%" class="txtcls1"> 0.9 - 1.7 mg</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result19}" /> </td>
</tr>
</c:otherwise>
    </c:choose>

<c:choose>
      <c:when test="${lab.result20 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">SERUM SODIUM</td>
<td width="25%" class="txtcls1"> 135-145 MEQ/L</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result20}" /> </td>
</tr>
</c:otherwise>
    </c:choose>
<c:choose>
      <c:when test="${lab.result21 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">SERUM POTASSCIUM</td>
<td width="25%" class="txtcls1"> 3.8-5.5 m Eq/L</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result21}" /> </td>
</tr>
</c:otherwise>
    </c:choose>
<c:choose>
      <c:when test="${lab.result22 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">SERUM CALCIUM</td>
<td width="25%" class="txtcls1"> 9.11%</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result22}" /> </td>
</tr>
</c:otherwise>
    </c:choose>
<c:choose>
      <c:when test="${lab.result23 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">SERUM CHOLRIDES</td>
<td width="25%" class="txtcls1">95-105MEQ%</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result23}" /> </td>
</tr>
</c:otherwise>
    </c:choose>
 <tr>
<td width="25%" class="txtcls1" style="font-weight:bold;">Other Investications</td>
<td width="25%" class="txtcls1" style="font-weight:bold;"> Normal Value </td>
<td width="50%" class="txtcls1" style="font-weight:bold;"> Result</td>
    </tr>

<c:choose>
      <c:when test="${lab.result24 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">FBS</td>
<td width="25%" class="txtcls1"> 60-110mg%L</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result24}" /> </td>
</tr>
</c:otherwise>
    </c:choose>
<c:choose>
      <c:when test="${lab.result25 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">PPBS</td>
<td width="25%" class="txtcls1"> 60-160mg %</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result25}" /> </td>
</tr>
</c:otherwise>
    </c:choose>
<c:choose>
      <c:when test="${lab.result26 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">RBS</td>
<td width="25%" class="txtcls1"> 60-160mg%</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result26}" /> </td>
</tr>
</c:otherwise>
    </c:choose>
<c:choose>
      <c:when test="${lab.result27 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">SERUM PROTINE</td>
<td width="25%" class="txtcls1"> 6-8g%<</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result27}" /> </td>
</tr>
</c:otherwise>
    </c:choose>
<c:choose>
      <c:when test="${lab.result28 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">ALBU MIN</td>
<td width="25%" class="txtcls1">3.2-5.0G%</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result28}" /> </td>
</tr>
</c:otherwise>
    </c:choose>
<c:choose>
      <c:when test="${lab.result29 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">HIV</td>
<td width="25%" class="txtcls1"> P/N </td>
<td width="50%" class="txtcls1"><c:out value="${lab.result29}" /> </td>
</tr>
</c:otherwise>
    </c:choose>
<c:choose>
      <c:when test="${lab.result30 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">ALBU MIN</td>
<td width="25%" class="txtcls1"> P/N</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result30}" /> </td>
</tr>
</c:otherwise>
    </c:choose>
<c:choose>
      <c:when test="${lab.result31 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">HBSAG</td>
<td width="25%" class="txtcls1">P/N</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result31}" /> </td>
</tr>
</c:otherwise>
    </c:choose>
<c:choose>
      <c:when test="${lab.result32 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">SERUM CALCIUME</td>
<td width="25%" class="txtcls1"> 9-11%</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result32}" /> </td>
</tr>
</c:otherwise>
    </c:choose>
<c:choose>
      <c:when test="${lab.result33 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">SICKLING</td>
<td width="25%" class="txtcls1">P/N</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result33}" /> </td>
</tr>
</c:otherwise>
    </c:choose>
<c:choose>
      <c:when test="${lab.result34 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">BLOOD WIDAL</td>
<td width="25%" class="txtcls1">P/N</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result34}" /> </td>
</tr>
</c:otherwise>
    </c:choose>
<c:choose>
      <c:when test="${lab.result35 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">MALARIYA</td>
<td width="25%" class="txtcls1">P/N</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result35}" /> </td>
</tr>
</c:otherwise>
    </c:choose>
<c:choose>
      <c:when test="${lab.result36 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">RA TEST</td>
<td width="25%" class="txtcls1"> P/N</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result36}" /> </td>
</tr>
</c:otherwise>
    </c:choose>
<c:choose>
      <c:when test="${lab.result37 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">ASO</td>
<td width="25%" class="txtcls1">P/N</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result37}" /> </td>
</tr>
</c:otherwise>
    </c:choose>
<c:choose>
      <c:when test="${lab.result38 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">CRP</td>
<td width="25%" class="txtcls1"> P/N</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result38}" /> </td>
</tr>
</c:otherwise>
    </c:choose>

<c:choose>
      <c:when test="${lab.result39 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">VDRL</td>
<td width="25%" class="txtcls1"> P/N</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result39}" /> </td>
</tr>
</c:otherwise>
    </c:choose>
<c:choose>
      <c:when test="${lab.result40 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">B.T TIME</td>
<td width="25%" class="txtcls1"> 1-5 MINT</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result40}" /> </td>
</tr>
</c:otherwise>
    </c:choose>
<c:choose>
      <c:when test="${lab.result41 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">C.T TIME</td>
<td width="25%" class="txtcls1"> 4-9 MINT </td>
<td width="50%" class="txtcls1"><c:out value="${lab.result41}" /> </td>
</tr>
</c:otherwise>
    </c:choose>
<c:choose>
      <c:when test="${lab.result42 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">HB</td>
<td width="25%" class="txtcls1">M:13-18,F:11-16</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result42}" /> </td>
</tr>
</c:otherwise>
    </c:choose>
<c:choose>
      <c:when test="${lab.result43 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">URICE ACID</td>
<td width="25%" class="txtcls1">2-5G%</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result43}" /> </td>
</tr>
</c:otherwise>
    </c:choose><c:choose>
      <c:when test="${lab.result44 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">SPUTAM FOR AFB</td>
<td width="25%" class="txtcls1"> P/N</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result44}" /> </td>
</tr>
</c:otherwise>
    </c:choose>
<c:choose>
      <c:when test="${lab.result45 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">UPT</td>
<td width="25%" class="txtcls1"> P/N</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result45}" /> </td>
</tr>
</c:otherwise>
    </c:choose>
<c:choose>
      <c:when test="${lab.result46 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">DENDUE TEST</td>
<td width="25%" class="txtcls1"> P/N</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result46}" /> </td>
</tr>
</c:otherwise>
    </c:choose>
<c:choose>
      <c:when test="${lab.result47 eq ''}">
      </c:when>
      <c:otherwise>
<tr>
<td width="25%" class="txtcls1">ESR</td>
<td width="25%" class="txtcls1"> M:0.10</td>
<td width="50%" class="txtcls1"><c:out value="${lab.result47}" /> </td>
</tr>
</c:otherwise>
  </c:choose>

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
</td>
</tr>

</table>



 <table  width="100%"  style="border-collapse:collapse;">
                        <tr>
                            <td  align="right"  height="15px" valign="middle" align="center" style="font-family:verdana; font-weight:bold; font-size:10px; background-image:url(images/bar2.jpg); color:#FFFFCC">Powered By Jeevan Jyoti Hospital</td>


                    </tr>

                    </table>

<%--
        <table id="dataTable" width="100%" border="0">
                <tr>
                    <td align="center" >
                       <a id="print" href="Controller?process=BiochemistryProcess&action=printBill&id=<c:out value="${biochemistry.id}"/>">Print</a>
                        <!--<input id="sub" type="submit" value="Print"  /> -->
                    </td>


                </tr>

</table>--%>
    </form>

</body>
</html>
