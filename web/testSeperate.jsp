<%-- 
    Document   : testSeperate
    Created on : Mar 28, 2016, 2:51:43 PM
    Author     : kamal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <%
                    response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
                    response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
                    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
                    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
%>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Appointment</title>
        <link rel="stylesheet" href="css/datePicker/jquery-ui-1.8.18.custom.css">
        <link rel="stylesheet" href="css/datePicker/demos.css">


        <script type="text/javascript" src="js/datePicker/jquery-1.7.1.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery-ui-1.8.17.custom.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.dialog.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.core.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.widget.js"></script>
        <script src="js/watermark/watermark.js" type="text/javascript" ></script>


        <style type="text/css" >
            <!--


            .headerText {
                width: 10px;
                font-family:Tahoma;
                font-size: 12px;
                background-color: #4b6a84;
                color: #FFFFFF;
                font-weight: normal;
                width: auto
            }
            .dataText {
                font-family: arial, Helvetica,sans-serif;
                color: #3C5468;
                font-size: 13px;
                letter-spacing: normal;
                text-align: center;

            }
            .dataTextName {
                font-family: arial, Helvetica,sans-serif;
                color: #3C5468;
                font-size: 13px;
                letter-spacing: normal;
                text-align: center;
                text-decoration: underline;
                cursor: pointer;
            }
            .search {
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 11px;
                letter-spacing: normal;
                text-align: left;
                font-weight: bold;
            }
            .headerTD{
                background-color:#4b6a84;
                color: #FFFFFF;
                font-family: Tahoma;
                font-size: 13px;
                text-transform: uppercase;
                text-align: center;
                font-weight: bold;
            }

            -->
        </style>



        <script type="text/javascript">
            //*********************NEWLY ADDED FOR PropertyAdd.jsp:-For "title=select Contact" POPUP Window BY GIRIJA...****************

            var winChild5=null;
            var fName = null;

            function openWin5(pName,winWidth,winHeight,fieldName) {
                alert("kusum still in confusion:")

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
    </head>
    <body>
        <form id="form1" name="form1" method="post">
        <table border="0" align="center" cellspacing="0" cellpadding="0" height="" width="">

            <tr>
                <td><!-----------------------------------division 2------------------------------------------>

                    <div style="position:absolute; left:10px; text-align:left; text-size=5;" >
                       

                        <a id="contPopup"  href="javascript:openWin5('Controller?process=PatientProcess&action=viewAllPopUp&patientControllerValue=null&noOfRecords=20&pageno=1&alphabit=null&flag=0',500,300,'propAdd1')"    style="font-size:7pt;" class="anchor" >Select Contact</a>
                        <Br>
                       
                    </div>
                </td>
            </tr>
            <tr>
                <td><input type="text" name="patientid" id="patientid" value="null" size="50" /></td>
                <td><input type="text" name="patientname" id="patientname" value="null" size="50" /></td>
            </tr>
        </table>
            </form>
    </body>
</html>
