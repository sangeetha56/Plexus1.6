<%--
    Document   : tokenReport
    Created on : Jun 21, 2016, 2:24:26 PM
    Author     : kamal
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
        <title>Token Report</title>
        <style type="text/css" >
            <!--
            .header {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 12px;
                background-color: #4b6a84;
            }
            .table {
                background-color: #3399CC;
                text-align: center;
                width: auto;


            }
            .headerText {
                border-radius:3px;
                width: 10px;
                font-family: Tahoma;
                font-size: 12px;
                background-color: #4b6a84;
                color: #FFFFFF;
                font-weight: normal;
                width: auto ;
                height: 22px;
                vertical-align: middle;
                text-align: center;
                background-image: url("images/ui-bg_diagonals-small_50_466580_40x40.png");
            }
            .headerTextBlack {
                border-radius:3px;
                width: 10px;
                font-family: Tahoma;
                font-size: 12px;

                color: black;
                font-weight: normal;
                width: auto ;
                height: 25px;
                vertical-align: middle;
                text-align: left;

            }
            .dataText {
                border-radius:3px;
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 13px;
                letter-spacing: normal;
                text-align: center;
                background-color: #E3EFFF;

            }
            .dataTextInActive {
                border-radius:3px;
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 12px;
                font-weight: bold;
                letter-spacing: normal;
                text-align: center;
                background-color: #E3EFFF;
                text-decoration:none;
            }
            .dataTextActive {
                border-radius:3px;
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 12px;
                font-weight: bold;
                letter-spacing: normal;
                text-align: center;
                background-color: #E3EFFF;
                text-decoration: underline;
            }
            .dataTextHidden {
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 13px;
                letter-spacing: normal;
                text-align: center;
                background-color: #E3EFFF;

            }
            .headerTD{
                border-radius:6px;
                background-color:#4b6a84;
                background-image: url("images/ui-bg_diagonals-small_50_466580_40x40.png");
                color: #FFFFFF;
                font-family: Tahoma;
                font-size: 13px;
                text-transform: uppercase;
                text-align: center;
                font-weight: bold;
                height: 35px;
            }

            .dataTextLast {
                border-radius:3px;
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 13px;
                letter-spacing: normal;

                background-color: #E3EFFF;

            }

            .headerTDLastRow{
                border-radius:6px;
                background-color:#4b6a84;
                background-image: url("images/ui-bg_diagonals-small_50_466580_40x40.png");
                color: #FFFFFF;
                font-family: Tahoma;
                font-size: 13px;
                text-transform: uppercase;

                font-weight: bold;
                height: 22px;
                }
            .tab {
            overflow: hidden;
            border: 1px solid #ccc;
            background-color: #4b6a84;
                }
                .alignRight {
                font-family: Tahoma;
                font-size: 11px;
                font-style: normal;
                text-transform: capitalize;
                color: #325F6D;
                text-align: right;
                vertical-align: middle;
                font-weight: bold;
                }
/* Style the buttons that are used to open the tab content */
.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
}

/* Change background color of buttons on hover */
.tab button:hover {
    background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
    background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
}

            -->
        </style>
        <script src="js/print/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script src="js/print/jquery.printPage.js" type="text/javascript"></script>
        <link rel="stylesheet" href="css/datePicker/jquery-ui-1.8.18.custom.css">
        <link rel="stylesheet" href="css/datePicker/demos.css">

        <script src="js/print/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery-ui-1.8.17.custom.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.datepicker.js"></script>
        <script src="js/print/jquery.printPage.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.button.js"></script>
        <link rel="stylesheet" href="css/datePicker/jquery-ui-1.8.18.custom.css">
        <link rel="stylesheet" href="css/graph/jquery.jqplot.css">
         <script src="js/datePicker/ui/jquery.ui.tabs.js"></script>
  
        <script type="text/javascript" src="js/datePicker/jquery-1.7.1.js"></script>

        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.dialog.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.autocomplete.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.core.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.widget.js"></script>

        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.accordion.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/sliderAccess.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery-ui-timepicker-addon.js"></script>
        <script  type="text/javascript" src="js/datePicker/ui/jquery.ui.position.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.mouse.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.draggable.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.resizable.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.button.js"></script>
        <script src="js/watermark/watermark.js" type="text/javascript" ></script>

        <script type="text/javascript">

           
     
            $(function() {

                $( "#printprop" )
                .button()
                .click(function() {

                });



            });
              function validatePatient() {
                if($("#patientId").val()==""){
                    alert("Select Id");
                    return false;

                }
                else{
                    return true;
                }

            }



        </script>
        <script>
             $(function() {
                $( "#tabs" ).tabs();

            });
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
                $("#ipno").Watermark("Click here to select Ipno");

            });
        </script>


        <script language="javascript" type="text/javascript">


            function CallPrint()
            {

                //Get the HTML of div
                var divElements = document.getElementById('printData').innerHTML;
                //Get the HTML of whole page
                var oldPage = document.body.innerHTML;

                //Reset the page's HTML with div's HTML only
                document.body.innerHTML =
                    "<html><head><title></title></head><body>" +
                     divElements+ "</body>";
                //"<thead><tr  border-radius:3px;width: 10px;font-family: Tahoma;font-size: 12px;background-color: #4b6a84;color: #FFFFFF;font-weight: normal;width: auto ;height: 22px; vertical-align: middle;text-align: center;><th  >Sl No</th><th  >Patient Name</th><th  >Consultancy Type</th><th  >Visit Time</th><th  >Amount</th></tr></thead>"
                //Print Page
                window.print();

                //Restore orignal HTML
                document.body.innerHTML = oldPage;




            }

            function CallPrintFunction()
            {
                   CallPrint();
            }
        </script>
       
    </head>

    <body>

        <script>
            $(document).ready(function() {
                $(".btnPrint").printPage();
                $("#tokenByDate").val();
                $("#tokenByDate").datepicker();
                $("#show").button();

                $("#tokenDate2day").val(getCurrentDate());
                $("#tokenDate2day").datepicker();
                $("#show2day").button();

                $("#firstdate").datepicker();
                $("#seconddate").datepicker();

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

        <script type="text/javascript">
            function show2day()
            {

            }
        </script>
        <script type="text/javascript">
            $(function() {

                $( "#show" )
                .button()
                .click(function() {
                    //alert('hhhh');
                    tokenIssuedByDate();


                });
                $( "#2day" )
                .button()
                .click(function() {
                    //alert('hhhh');
                    tokenIssuedToday();


                });

                $( "#betweendate" )
                .button()
                .click(function() {
                    showTokenIssuedBetweendate();

                });
                $( "#thismonth" )
                .button()
                .click(function() {
                    showTokenIssuedThisMonth();

                });
            });


        </script>

        <script type="text/javascript">
            function tokenIssuedByDate(){

                //alert('llll');

                var form1=document.getElementById("form1");
                var dateTodays=document.getElementById("tokenByDate").value;
                //alert(dateTodays);

                form1.action="Controller?process=TokenSystemProcess&action=issueTokenByDate";
                form1.submit();

            }

            function tokenIssuedToday(){

                //alert('llll');

                var form1=document.getElementById("form1");


                form1.action="Controller?process=TokenSystemProcess&action=tokenIssuedToday";
                form1.submit();

            }

            function showTokenIssuedBetweendate(){

                //alert('2222llll');

                var form1=document.getElementById("form1");

                form1.action="Controller?process=TokenSystemProcess&action=showTokenIssuedBetweendate";
                form1.submit();

            }

            function showTokenIssuedThisMonth(){

                //alert('showDispenseThisMonth');

                var form1=document.getElementById("form1");

                form1.action="Controller?process=TokenSystemProcess&action=showTokenIssuedThisMonth";
                form1.submit();

            }


        </script>
            <script>
$(document).ready(function() {
    $('#txtDate').datepicker({
        showAnim: 'slide',
        dateFormat: 'dd-mm-yy'
});

</script>

        <script>
            $(document).ready(function() {
                $(".btnPrint").printPage();
            });
        </script>

        <form id="form1" action="" method="post">
            <table width="100%">
                <tr>
                    <td class="headerTD" colspan="2" width="5">Operation Record </td>
                </tr>


            </table>

            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0"></table>
                            <tr>
                                <td width="440%" class="headerTextBlack"><div align="center">Ip No </div></td>
                                <td width="50%"><div align="center">
                                        <div>
                                            <label >
                                                <a id="contPopup"  href="javascript:openWin5('Controller?process=PatientProcess&action=viewAllPopUp&patientControllerValue=null&noOfRecords=20&pageno=1&alphabit=null&flag=0',700,300,'propAdd1')"    style="font-size:7pt;" class="anchor" ><input  type="text" name="patientName" id="Ipno" style="width: 20px" title="Click here to Select Patient" /></a> <input name="patientID" type="hidden" id="Ipno" value="" />
                                            </label>
                                        </div></td>
                                    </div></td>&nbsp;&nbsp;
                                    
                            </tr>
                            
                           <tr>
                                <td width="16%"  class="alignRight" >Date &nbsp;  </td>
                                <td width="28%">
                                    <label>
                                      <input readonly name="creationDate" type="text" class="textField" id="creationDate" size="30"  >
                                    </label>
                                </td>
                               <td width="6%"  class="alignRight" >Time &nbsp;</td>

                                <td width="70%" >
                                    <label>
                                        <input readonly name="creationDate" type="text" class="textField" id="creationDate" size="30"  >
                                    </label>
                                </td>

                            </tr>
                    </tr>
                            
                                
                        </table></td>
                </tr>
                <tr>
                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <td width="19%"><div align="left"></div></td>
                            <td width="1%"><div align="left"></div></td>
                            <td width="7%"><div align="left">
                                    <label></label>
                                </div></td>
                            <td width="11%"><div align="left"></div></td>
                            <td width="13%"><div align="left"></div></td>
                            <td width="1%"><div align="left"></div></td>
                            <td width="9%"><div align="left">
                                    <label></label>
                                </div></td>
                            <td width="2%"><div align="left"></div></td>
                            <td width="11%"><div align="left"></div></td>
                            <td width="26%"><div align="left"></div></td>

                        </table></td>
                </tr>
               
                <tr>
                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <td width="19%"><div align="left"></div></td>
                            <td width="1%"><div align="left"></div></td>
                            <td width="7%"><div align="left">
                                    <label></label>
                                </div></td>
                            <td width="11%"><div align="left"></div></td>
                            <td width="13%"><div align="left"></div></td>
                            <td width="1%"><div align="left"></div></td>
                            <td width="9%"><div align="left">
                                    <label></label>
                                </div></td>
                            <td width="2%"><div align="left"></div></td>
                            <td width="11%"><div align="left"></div></td>
                            <td width="26%"><div align="left"></div></td>

                        </table></td>
                </tr>

                <form id="form1"  action=" # "method="POST" enctype="multipart/form-data">
            <div>
                <%-- <div id="tabs">
                
                     <tr>
                    <td class="headerTD" colspan="2" width="5">
                     <ul>--%>
                <div class="tab">
                    <button class="#tabs-1" onclick="operationrecord(event, 'General Details')">General Details</button>
                    <button class="#tabs-2" onclick="operationrecord(event, 'Specific Details')">Specific Detail</button>
                    <button class="#tabs-3" onclick="operationrecord(event, 'Reports(Scanned')">Reports(Scanned)</button>
                       </div><br>
                       
                <div id="tabs-1">
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="table1" style="display: block">
                            <tr>
                                <td width="16%"  class="alignRight" >Card No &nbsp;  </td>
                                <td width="28%">
                                    <label>
                                        <input   onmouseout="exist(this.value);" name="cardNo" type="text" class="textField" id="cardNo" size="30" data-validate="validate(required)"  >
                                    </label>
                                </td>
                            </tr>
                        </table>
                </div>
            <div class="login-form" style="background-color: #cad8e3;width:100%;border: ridge" id="printData" >
                <table  width="100%"   id="" border="1">
                   
                </table>
                  </div>


            <table id="table2" width="10%" border="0" align="center"  >

                <tr>
                    <td align="center">

                        <!--    <span id="printprop">Print</span> onclick="CallPrint()" -->
                        <input type="button" id="printprop" value="Print" onclick="CallPrintFunction();" /> <!-- CallPrint(); -->

                    </td>



                </tr>


            
</table>

        </form>
    </body>
</html>

