<%-- 
    Document   : issueToken
    Created on : Jun 20, 2016, 1:49:22 PM
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

   




    <style>.login-form{margin: 120px auto;}</style>
    <meta name="robots" content="noindex,follow" />

    <script type="text/javascript">
        $(function() {


            $( "#save" )
            .button()
            .click(function() {
                issueToken();
            });

            $( "#reset" )
            .button()
            .click(function() {
                resetToken();
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

    

</head>

<body bgcolor="#E6EEF4" onload="reformatDate();">

    <form id="form1"  action="" method="POST" >

        <div class="login-form" style="background-color: #cad8e3;width:50%;border: ridge" >
            <table width="100%" align="center">
                <tr>
                    <td align="center">
                        <h1 style="color: black;font-family:Agency FB;font-size: 20px"><b>Issue Token</b></h1>
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
                        <input type="text" name="tokenno" id="tokenno" value="<c:out value="${tokenno}" />" placeholder="Token" size="5"  style="text-align: center;" readonly>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <input type="text" name="tokendate" id="tokendate" value="<c:out value="${tokendate}" />" placeholder="Token" size="5"  style="text-align: center;" >
                    </td>
                </tr>
               


                

                <tr>
                    <td>
                        <br/>
                    </td>
                </tr>


                <tr>
                    <td align="center">

                        <button id="save"  >Issue Token</button>
                        <button id="reset" >Reset Token</button>

                    </td>
                </tr>
            </table>
        </div>
    </form>

    <script type="text/javascript">
        function issueToken()
        {
            var form1=document.getElementById("form1");
            //    var a=document.getElementByName("country");
            //    alert(a.innerHTML);
            form1.action="Controller?process=TokenSystemProcess&action=printToken";//printTokenNo.jsp
            form1.submit();
        }

         function resetToken()
        {
            var form1=document.getElementById("form1");
            //    var a=document.getElementByName("country");
            //    alert(a.innerHTML);
            form1.action="Controller?process=TokenSystemProcess&action=resetToken";//printTokenNo.jsp
            form1.submit();
        }
    </script>
</body>
</html>
