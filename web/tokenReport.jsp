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
                height: 22px;
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
                height: 22px;
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


        <script type="text/javascript">
            $(function() {

                $( "#printprop" )
                .button()
                .click(function() {
                   
                });



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
                $(".btnPrint").printPage();
            });
        </script>

        <form id="form1" action="" method="post">
            <table width="100%">
                <tr>
                    <td  class="headerTD">Token Report View</td>
                </tr>


            </table>
            
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="19%" class="headerTextBlack"><div align="left">By Date </div></td>
                                <td width="1%" class="headerTextBlack"><div align="left">:</div></td>
                                <td width="7%"><div align="left">
                                        <label>
                                            <input type="text" name="tokenByDate" id="tokenByDate" size="10" />
                                        </label>
                                    </div></td>
                                <td width="11%" class="headerTextBlack"><div align="left"><button id="show">Show</button> </div></td>
                                <td width="13%" class="headerTextBlack"><div align="left">Between Date </div></td>
                                <td width="1%" class="headerTextBlack"><div align="left">:</div></td>
                                <td width="9%"><div align="left">
                                        <label></label>
                                        <input  type="text" name="firstdate" id="firstdate" size="10" />
                                    </div></td>
                                <td width="2%" class="headerTextBlack"><div align="left"> To</div></td>
                                <td width="11%"><div align="left">
                                        <input  type="text" name="seconddate" id="seconddate" size="10"/>
                                    </div></td>
                                <td width="26%" class="headerTextBlack"><div align="left"><button id="thismonth"  >This Month</button></div></td>

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
                            <td width="19%" class="headerTextBlack"><div align="left"><button id="2day"  >TODAY</button></div></td>
                            <td width="1%"><div align="left"></div></td>
                            <td width="7%"><div align="left">
                                    <label>
                                        <input style="display: none " type="text"  name="tokenDate2day" id="tokenDate2day" />
                                    </label>
                                </div></td>
                            <td width="11%"><div align="left"></div></td>
                            <td width="13%"><div align="left"></div></td>
                            <td width="1%"><div align="left"></div></td>
                            <td width="9%"><div align="left">
                                    <label></label>
                                </div></td>
                            <td width="2%">&nbsp;</td>
                            <td width="11%"><div align="left"><button id="betweendate"  >Click</button></div></td>
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


            </table>

            <div class="login-form" style="background-color: #cad8e3;width:100%;border: ridge" id="printData" >
                <table  width="100%"   id="" border="1">
                    <tr>
                        <td  colspan="2" class="headerTD">Summary of Token Issued  </td>
                        
                    </tr>
                    <tr>
                        <td  colspan="2" class="headerTD"><c:out value="${tokenno}"/> Token Issued for  <fmt:formatDate pattern="dd MMMM yyyy " value="${firstdate}" /> To <fmt:formatDate pattern="dd MMMM yyyy " value="${seconddate}" /> </td>
                    </tr>

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

