<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Biochemistry Report</title>

        <style>
input.nametxt{ outline:0; border:none; width:100%}
.txtcls1{font-family:Arial, Helvetica, sans-serif; font-size:14px; color:#0067a9; text-align:center}
@media screen and (min-width:300px) and (max-width:767px){
	  .main_table{ width:100%}
	  .mobscale{ width:100%; float:left}
	}
</style>
         <script type="text/javascript">
            /**
             * Comment
             *
             */


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


            });


        </script>

        <script>
        $(function() {

            $(document).ready(function() {
                $("#thpybilldate").val(getCurrentDate());
                $("#thpybilldate").datepicker();
            });
        });

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


        </script>

        <script>
        function showProductCatOptn(opt,val)
        {
            // var a=document.getElementById("optContryID");
            // document.getElementById("countrynameTxt").value=a.innerHTML;
            //document.getElementById("therapynamebill").value=opt;
            var x = document.getElementById("doctid").selectedIndex;
            var y = document.getElementById("doctid").options;

            document.getElementById("therapynamebill").value=y[x].text;
            document.getElementById("therapycharges").value=opt;



        }
        </script>

        <script language="javascript" type="text/javascript">
        var xmlHttp
        var xmlHttp
        function showState(str){


            //  alert(a.innerHTML);
            if (typeof XMLHttpRequest != "undefined"){
                xmlHttp= new XMLHttpRequest();
            }
            else if (window.ActiveXObject){
                xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
            }
            if (xmlHttp==null){
                alert("Browser does not support XMLHTTP Request")
                return;
            }
            var url="doctor.jsp";
            url +="?count=" +str;
            xmlHttp.onreadystatechange = stateChange;
            xmlHttp.open("GET", url, true);
            xmlHttp.send(null);
        }

        function stateChange(){
            if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
                document.getElementById("state").innerHTML=xmlHttp.responseText


            }
        }
        </script>
        <script>
        function showCountryOptn(opt)
        {

            document.getElementById("countrynameTxt").value=opt;
            //alert('depart ment name is:-'+document.getElementById("countryID").value)



        }

        function showStateOptn(opt)
        {

            document.getElementById("statenameTxt").value=opt;
            //alert('doctor name is:-'+document.getElementById("state").value);



        }

        </script>

        <script language="Javascript">
        function validateButton()
        {
            if( document.getElementById("patientName").value.length==0 )

            {
                document.getElementById("patientName").style.background='red';

                alert("Enter the Patient  name");

            }

            else

            {
                var cBoxes = document.getElementsByName('personalIDs');
                if(cBoxes.length<0)
                {
                    alert("Please Select the Therapy Type  ");
                }




            }

            /*        else if( document.getElementById("therapynamebill").value.length==0 )

            {
                document.getElementById("therapynamebill").style.background='red';

                alert("Please Select the Therapy Type  ");

            }

            else if( document.getElementById("therapycharges").value.length==0 )

            {
                document.getElementById("therapycharges").style.background='';

                alert("Please Enter the Therapy Charge  ");

            }  */



        }
        </script>

        <script language="Javascript">


        function valueExistsChangeColor()
        {
            if( document.getElementById("patientName").value.length!=0)

            {
                document.getElementById("patientName").style.background='white';

            }



            else if( document.getElementById("therapycharges").value.length!=0)

            {
                document.getElementById("therapycharges").style.background='white';

            }


        }

        /*    function kkkk()
        {
            var cBoxes = document.getElementsByName('personalIDs');
            var cBoxes1 = document.getElementsByName('therapychargesdiff');
            var points = [];
            var selectedVal = '';
            var selectedVal1 = '';
            for(var i=0;i<cBoxes.length;i++){
                var cBox = cBoxes[i]
                var cBox1 = cBoxes1[i]
                if(cBox.checked){
                    selectedVal  =selectedVal+cBox.value+'#';
                    selectedVal1  =selectedVal1+cBox1.value+'#';
                    points.push(cBox.value);
                    alert('kk value is:-'+selectedVal);
                    alert('kk charge  is:-'+selectedVal1);
                }
            }

            alert('list data is:-'+points.toSource());
            document.getElementById("f").value=points.toSource();
        }  */
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
        <form name="form1" id="form1" action="Controller?process=BloodtransfucionProcess&action=add" method="post">
        
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
<table width="1000" cellpadding="0" cellspacing="0" border="0" class="main_table" style="border: 1px solid #000;padding-top: 15px;padding-bottom:15px;">
<tr>
<td>

<!--Header Section Start-->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="border-bottom: 1px solid #000;padding-bottom: 15px;">
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
<td width="87%" class="txtcls1" style="border-bottom:1px solid #0067a9"><input type="text" name="patientname" id="patientname" class="nametxt" placeholder="Enter Name" /></td>
</tr>
</table>
<!--Name Section End-->

<!--Ward Details Start-->
<table width="100%" class="tableborder" cellpadding="0" cellspacing="0" border="1" style="margin:10px 0px 0px 0px; color:#0067a9;    border-color: #0067a9;">
<tr>
<td width="12%" class="txtcls1">Ward/Dept <br />  <input type="text" name="wardDept" id="wardDept" class="nametxt" placeholder="Enter here" value="${bloodtransfucion.wardDept}"/></td>
<td width="12%" class="txtcls1">Ward/Dep. <br /><input type="text" name="wardDep." id="wardDep." class="nametxt" placeholder="Enter here" value="${bloodtransfucion.wardDept}"/> </td>
<td width="12%" class="txtcls1">Bed No. <br /> <input type="number" name="bedNo." id="bedNo." class="nametxt" placeholder="Enter here" value="${bloodtransfucion.wardDept}"/></td>
<td width="12%" class="txtcls1">Age <br /> <input type="number" name="age" id="age" class="nametxt" placeholder="Enter here" value="${bloodtransfucion.wardDept}"/></td>
<td width="12%" class="txtcls1">Sex <br /> <input type="text" name="sex" id="sex" class="nametxt" placeholder="Enter here" value="${bloodtransfucion.wardDept}"/></td>
<td width="40%" class="txtcls1">Pt's Doctor<br /> <input type="text" name="ptsDoctor" id="ptsDoctor" class="nametxt" placeholder="Enter here" value="${bloodtransfucion.wardDept}"/></td>
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
<td width="73%" class="txtcls1" style="border-bottom:1px solid #000000"><input type="text" name="patientBloodGroup" id="patientBlood Group" class="nametxt" placeholder="Enter Name"  /></td>
</tr>
</table>
</td>
<td width="50%" class="mobscale" align="left">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="5%" class="txtcls1" align="left">Rh</td>
<td width="95%" class="txtcls1" style="border-bottom:1px solid #000000"><input type="text" name="rh" id="rh" class="nametxt" placeholder="Enter Name" /></td>
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
<td width="10%" class="txtcls1"><input type="text" name="date" id="date" class="nametxt"/></td>
<td width="20%" class="txtcls1"><input type="text" name="donor's" id="donor's" class="nametxt"/></td>
<td width="10%" class="txtcls1"><input type="number" name="bottle No." id="bottle No." class="nametxt"/></td>
<td width="10%" class="txtcls1"><select  name="group" id="group">
            <option>select</option>
            <option>A+</option>
            <option>B+</option>
            <option>AB+</option>
            <option>O+</option>
            <option>A-</option>
            <option>B-</option>
            <option>AB-</option>
            <option>O-</option> </select></td>
<td width="10%" class="txtcls1"><select  name="hIV" id="hIV">
            <option>select</option>
            <option>positive</option>
            <option>nagative</option> </select></td>
<td width="10%" class="txtcls1"><select name="hCV" id="hCV">
            <option>select</option>
            <option>positive</option>
            <option>nagative</option> </select><input type="text" name="hCV" id="hCV" class="nametxt"/></td>
<td width="10%" class="txtcls1"><select name="hBSAG" id="hBSAG">
            <option>select</option>
            <option>positive</option>
            <option>nagative</option> </select></td>
<td width="" class="txtcls1"><select name="vDRL" id="vDRL">
            <option>select</option>
            <option>positive</option>
            <option>nagative</option> </select></td>
<td width="10%" class="txtcls1"><select name="mP" id="mP">
            <option>select</option>
            <option>FP</option>
            <option>VP</option>
            <option>EP</option> </select></td>
</tr>
<tr>
<td width="10%" class="txtcls1"><input type="text" name="date1" id="date1" class="nametxt" /></td>
<td width="20%" class="txtcls1"><input type="text" name="donor's1" id="donor's1" class="nametxt" /></td>
<td width="10%" class="txtcls1"><input type="number" name="bottle No.1" id="bottle No.1" class="nametxt" /></td>
<td width="10%" class="txtcls1"><select name="group1" id="group1">
            <option>select</option>
            <option>A+</option>
            <option>B+</option>
            <option>AB+</option>
            <option>O+</option>
            <option>A-</option>
            <option>B-</option>
            <option>AB-</option>
            <option>O-</option> </select></td>
<td width="10%" class="txtcls1"><select name="hIV1" id="hIV1">
            <option>select</option>
            <option>positive</option>
            <option>nagative</option> </select></td>
<td width="10%" class="txtcls1"><select name="hCV1" id="hCV1">
            <option>select</option>
            <option>positive</option>
            <option>nagative</option> </select></td>
<td width="10%" class="txtcls1"><select name="hBSAG1" id="hBSAG1">
            <option>select</option>
            <option>positive</option>
            <option>nagative</option> </select></td>
<td width="10%" class="txtcls1"><select name="vDRL1" id="vDRL1">
            <option>select</option>
            <option>positive</option>
            <option>nagative</option> </select></td>
<td width="10%" class="txtcls1"><select name="mP1" id="mP1">
            <option>select</option>
            <option>positive</option>
            <option>nagative</option> </select></td>
</tr>
<tr>
<td width="10%" class="txtcls1"><input type="text" name="date2" id="date2" class="nametxt" /></td>
<td width="20%" class="txtcls1"><input type="text" name="donor's2" id="donor's2" class="nametxt" /></td>
<td width="10%" class="txtcls1"><input type="number" name="bottle No.2" id="bottle No.2" class="nametxt" /></td>
<td width="10%" class="txtcls1"><select name="group2" id="group2">
            <option>select</option>
            <option>A+</option>
            <option>B+</option>
            <option>AB+</option>
            <option>O+</option>
            <option>A-</option>
            <option>B-</option>
            <option>AB-</option>
            <option>O-</option> </select></td>
<td width="10%" class="txtcls1"><select name="hIV2" id="hIV2">
            <option>select</option>
            <option>positive</option>
            <option>nagative</option> </select></td>
<td width="10%" class="txtcls1"><select name="hCV2" id="hCV2">
            <option>select</option>
            <option>positive</option>
            <option>nagative</option> </select></td>
<td width="10%" class="txtcls1"><select name="hBSAG2" id="hBSAG2">
            <option>select</option>
            <option>positive</option>
            <option>nagative</option> </select></td>
<td width="10%" class="txtcls1"><select name="vDRL2" id="vDRL2">
            <option>select</option>
            <option>positive</option>
            <option>nagative</option> </select></td>
<td width="10%" class="txtcls1"><select name="mP2" id="mP2">
            <option>select</option>
            <option>FP</option>
            <option>VP</option>
            <option>EP</option> </select></td>
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
<td width="60%" class="txtcls1" style="border-bottom:1px solid #000000"><input type="text" name="qualityofBlood" id="qualityofBlood" class="nametxt" placeholder="Enter Name" /></td>
</tr>
</table>
</td>
<td width="65%" align="right">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="10%" style="font-size:14px; color:#0067a9; font-family:Arial, Helvetica, sans-serif;">ml issued</td>
<td width="10%" style="font-size:14px; color:#0067a9; font-family:Arial, Helvetica, sans-serif;"><input type="checkbox" name="ml issued" id="ml issued" value="Whole" />Whole</td>
<td width="10%" style="font-size:14px; color:#0067a9; font-family:Arial, Helvetica, sans-serif;"><input type="checkbox" name="ml issued1" id="ml issued1" value="Packed" />Packed Celli</td>
<td width="10%" style="font-size:14px; color:#0067a9; font-family:Arial, Helvetica, sans-serif;"><input type="checkbox" name="ml issued2" id="ml issued2" value="Plasma" />Plasma</td>
<td width="10%" style="font-size:14px; color:#0067a9; font-family:Arial, Helvetica, sans-serif;"><input type="checkbox" name="ml issued3" id="ml issued3" value="Platelets" />Platelets Conc.</td>
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
<td width="87%" class="txtcls1" style="border-bottom:1px solid #000000"><input type="text" name="sd" id="sd" class="nametxt" placeholder="Enter Name" /></td>
</tr>
</table>

</tr>
</table>
<!--Name Section End-->




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
</table>
</form>
       
</body>
</html>
