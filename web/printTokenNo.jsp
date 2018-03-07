<%-- 
    Document   : printTokenNo
    Created on : Jun 20, 2016, 3:56:45 PM
    Author     : kamal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<head>

    <meta charset="utf-8">

<script src="js/print/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script src="js/print/jquery.printPage.js" type="text/javascript"></script>
        <link rel="stylesheet" href="css/datePicker/jquery-ui-1.8.18.custom.css">
        <link rel="stylesheet" href="css/datePicker/demos.css">

        <script src="js/print/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery-ui-1.8.17.custom.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.datepicker.js"></script>
        <script src="js/print/jquery.printPage.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.button.js"></script>



    <style>.login-form{margin: 120px auto;}</style>
    <meta name="robots" content="noindex,follow" />

    <script type="text/javascript">
        $(function() {


            $( "#save" )
            .button()
            .click(function() {
                addUser();
            });

            $( "#reset" )
            .button()
            .click(function() {
            });
        });


    </script>

    <script>
            function reformatDate() {
                //alert('kk');

                if(document.getElementById("tokendate").value!='')
                {


                    var dateF=document.getElementById("tokendate");
                    var arry= new Array();
                    //    var arry1= new Array();
                    var year=new Array();
                    var month=new Array();
                    var day=new Array();

                    arry=  dateF.value.split('-');

                    year=arry[0];

                    day=arry[1]+'/';



                    month=arry[2]+'/';

                    var finall=(day+month+year);
                    dateF.value=finall;
                }
            }






        </script>
    <script type="text/javascript">
            $(function() {

                $( "#printprop" )
                .button()
                .click(function() {
                    //alert('hhhh');
                    //CallPrint();

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

                callFinalPage();


               

            }

            function CallPrintFunction()
            {
                
                document.getElementById("printprop").style.display='';
               
                CallPrint();
            }
        </script>
    <script type="text/javascript">
            function callFinalPage()
            {

                window.location="Controller?process=TokenSystemProcess&action=issueToken";
            }


        </script>




</head>

<body bgcolor="#E6EEF4" onload="reformatDate();CallPrintFunction()">

    <form id="form1"  action="" method="POST" >

        <div class="login-form" style="background-color: #cad8e3;width:50%;border: ridge" id="printData" >
            <table width="100%" align="center">
                <tr>
                    <td align="center">
                        <h1 style="color: black;font-family:Agency FB;font-size: 20px"><b>Print Token</b></h1>
                    </td>
                </tr>

                <tr>
                    <td>
                        <hr>
                    </td>
                </tr>

            </table>

            <table width="50%" align="center">


                <tr>
                    <td align="center">
                       Token No: <input type="text" name="tokenno" id="tokenno" value="<c:out value="${tokenno}" />" placeholder="Token" size="5"  style="text-align: center;" readonly>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                       Date: <input type="text" name="tokendate" id="tokendate" value="<c:out value="${tokendetails}" />" placeholder="Token" size="10"  style="text-align: center;" >
                    </td>
                </tr>





                <tr>
                    <td>
                        <br/>
                    </td>
                </tr>

            </table>

                   
        </div>
                    <table id="table2" width="10%" border="0" align="center" style="display: none" >

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
