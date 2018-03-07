<%--
    Document   : index
    Created on : Dec 23, 2011, 5:52:28 PM
    Author     : Mayur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
                    response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
                    response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
                    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
                    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/datePicker/jquery-ui-1.8.18.custom.css">
        <link rel="stylesheet" href="css/validation/jquery.ketchup.css">
        <script type="text/javascript" src="js/datePicker/jquery-1.7.1.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery-ui-1.8.17.custom.js"></script>

        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.core.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.widget.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.datepicker.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.tabs.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/sliderAccess.js"></script>

        <script type="text/javascript" src="js/validation/jquery.ketchup.all.min.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.button.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.accordion.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.effects.core.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.accordion.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.effects.slide.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.effects.bounce.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.effects.clip.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.effects.transfer.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.effects.blind.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/sliderAccess.js"></script>

        <link rel="stylesheet" href="css/datePicker/demos.css">
        <style type="text/css">
            <!--
            .divCSS{
                overflow:  scroll;
                height: 100%;
                width: 100%;
            }

            .fiedlSet {
                border-top-width: 1px;
                border-right-width: 1px;
                border-bottom-width: 1px;
                border-left-width: 1px;
                border-top-style: solid;
                border-right-style: solid;
                border-bottom-style: solid;
                border-left-style: solid;
                border-width: 1;
                width: 100%;
                color: #000000;
                font-size: 16px;
                font-weight: bold;
                font-variant: normal;
                font-stretch: wider;
                background-color: #e2ebf3;
                border-top-color: #5d7e9b;
                border-right-color: #5d7e9b;
                border-bottom-color: #5d7e9b;
                border-left-color: #5d7e9b;
            }
            .legendCSS {
                color: #666666;
            }
            .tableCSS {
                width: 100%;
                height: 100%;
                position: absolute;
                left: 0px;
                top: 0px;
            }
            .textAreaCSS {
                height: auto;
                width: auto;
            }
            .textField {
                border-top-style: solid;
                border-right-style: solid;
                border-bottom-style: solid;
                border-left-style: solid;
                border-top-color: #5d7e9b;
                border-right-color: #5d7e9b;
                border-bottom-color: #5d7e9b;
                border-left-color: #5d7e9b;
                border-top-width: 1px;
                border-right-width: 1px;
                border-bottom-width: 1px;
                border-left-width: 1px;
                width: auto;
                height: auto;
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
            .alignRightMultiple {
                font-family: Tahoma;
                font-size: 11px;
                font-weight: bolder;
                text-align: right;
                vertical-align: middle;
                font-style: normal;
                color: #325F6D;
            }
            .alignCentreMultiple {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 12px;
                font-weight: bolder;
                text-align: center;
                vertical-align: middle;
                font-style: normal;
                color: #000000;
            }
            .autoAdjust {
                height: auto;
                width: auto;
            }
            .radioSpanCSS {
                font-size: 12px;
                font-family: Arial, Helvetica, sans-serif;
                text-align: left;
                vertical-align: middle;
            }
            .radioCSS {
                background-position: left center;
            }
            .spanText {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 12px;
                font-weight: bold;
                color: #000000;
            }
            .emptyFieldSet {
                border-top-color: #FA7676;
                border-right-color: #FA7676;
                border-bottom-color: #FA7676;
                border-left-color: #FA7676;
                border-top-style: solid;
                border-right-style: solid;
                border-bottom-style: solid;
                border-left-style: solid;
                border-top-width: thin;
                border-right-width: thin;
                border-bottom-width: thin;
                border-left-width: thin;
                background-image: url(images/close.JPG);
                background-repeat: repeat-y;
                background-attachment: scroll;
                background-position: right;
                width: auto;
                height: auto;
                display: inline;
            }
            .style1 {
                font-family: Tahoma;
                font-size: 14px;
            }
            .style2 {
                color: #666666;
                font-family: Tahoma;
                font-size: 14px;
            }
            .style4 {
                font-size: 12px;
                font-family: Tahoma;
                text-align: left;
                vertical-align: middle;
                color: #325f6d;
            }
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
                height: 27px;
                vertical-align:text-top;
                text-align: center;
                background-image: url("images/ui-bg_diagonals-small_50_466580_40x40.png");
            }
            .dataText {
                border-radius:3px;
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 13px;
                letter-spacing: normal;
                text-align: left;
                background-color: #E3EFFF;

            }
            .dataTextInActive {
                border-radius:3px;
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 12px;
                font-weight: bold;
                letter-spacing: normal;
                text-align: left;
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

        </style>
        <style>

            #button { padding: .5em 1em; text-decoration: none; }

        </style>
        <script type="text/javascript">
            function redirectUrl(){
                var form1=document.getElementById("form1");
                form1.action="Controller?process=PatientProcess&action=addWithAppointment";
                form1.submit();
            }
            
            function addCompany(){
                var form1=document.getElementById("form1");
                form1.action="Controller?process=CompanyProcess&action=addCompany";
                form1.submit();
            }
           
            function validateEmptyField(elementName){
                var txtBox=document.getElementById(elementName);
                if(txtBox.value==""){
                    txtBox.className="emptyFieldSet";
                }
                else if(txtBox.value!=""){
                    txtBox.className="textField";
                }
            }
            function notEmptyField(elementName){
                alert(elementName);
                var txtBox=document.getElementById(elementName);
                if(txtBox.value!=""){
                    txtBox.className="textField";

                }
                else if(txtBox.value==""){
                    txtBox.className="emptyFieldSet";

                }



            }
        </script>
        <script type="text/javascript">
            $(function() {
                // run the currently selected effect
                function runEffect() {
                    var clipEffect='blind';
                    var options = {};
                    $( "#effect" ).toggle( clipEffect, options, 1000 );
                };
                // set effect from select menu value
                $( "#add" ).button().click(function() {
                    runEffect();
                    return false;
                });
            });
        </script>
        <script type="text/javascript" src="js/datetimepicker_css.js"></script>
        <script type="text/javascript">
            $(function() {
                $( "#add" )
                .button()
                .click(function() {
                    runEffect();

                });
                $( "#save" )
                .button()
                .click(function() {
                    addCompany();

                });
                $( "#effect" ).hide();
            });
        </script>
        <script type="text/javascript">
            $(function() {
                $( "#tabs" ).tabs();
                //$( "#expiryDate" ).datepicker();



            });
        </script>

        <script language="Javascript">
            function validateFieldCompany()
            {
                if( document.getElementById("companyName").value.length==0 )

                {
                    document.getElementById("companyName").style.background='red';

                    alert("Enter the manufacturer  name");

                }

                if( document.getElementById("companyAddress").value.length==0 )

                {
                    document.getElementById("companyAddress").style.background='white';

                    alert("Enter the manufacturer Address");

                }



            }
        </script>

        <script language="Javascript">


            function valueExistsChangeColor()
            {
                if( document.getElementById("companyName").value.length!=0)

                {
                    document.getElementById("companyName").style.background='white';

                }

                if( document.getElementById("companyAddress").value.length!=0)

                {
                    document.getElementById("companyAddress").style.background='white';

                }


            }
        </script>


    </head>
    <body >
        <form id="form1"  action="Controller?process=VendorProcess&action=add" method="POST">
            <div style="height: 28px">
                <!--<a href="#" id="button" class="ui-state-default ui-corner-all">Add Medicine</a>-->

                <button id="add">Add Manufacturer</button>
                <br/>
            </div>


            <div >

                <div class="toggler">
                    <div id="effect" class="ui-widget-content ui-corner-all">
                        <div id="tabs">
                            <ul>

                                <li><a href="#tabs-1">Details</a></li>
                            </ul>

                            <div id="tabs-1">
                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="table1" style="display: block">
                                    <tr>
                                        <td width="5%"  class="alignRight" >Name &nbsp;  </td>
                                        <td width="35%"  >
                                            <label>
                                                <input name="companyName" type="text" class="textField" id="companyName" onkeypress="valueExistsChangeColor()" size="30"   >
                                            </label>
                                        </td>
                                    </tr>

                                    <tr><td><br/></td></tr>
                                    <tr></tr>
                                    <tr>
                                        <td width="5%" class="alignRight" >Address &nbsp;
                                        </td>
                                        <td width="35%" colspan="3">
                                            <label>
                                                <textarea name="companyAddress" cols="120" rows="5"  id="companyAddress"></textarea>

                                            </label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <table id="table2" width="100%" border="0" align="center"  >

                                <tr>
                                    <td align="center">
                                        <button id="save" onmouseover="validateFieldCompany();">Save</button>

                                    </td>
                                </tr>


                            </table>

                        </div>
                    </div>
                </div>
            </div>

            <div style="overflow:scroll;height: 600px">
                <table width="100%">
                    <tr>
                        <td  class="headerTD">Menufacturer View All</td>
                    </tr>
                </table>
                <table   width="100%"  border="0" style="border-color:#4b6a84;"  id="myTable">

                    <thead >
                        <tr>
                            <th title="click to sort" class="headerText">Menufacturer Name<img  alt=" "  style="position:relative; top: 4px;  " src="images/sort_both.png" /></th>

                            <th title="click to sort" class="headerText">Address<img  alt=" "  style="position:relative; top: 4px;  " src="images/sort_both.png" /></th>
                        </tr>
                    </thead>

                    <tbody  >
                        <c:forEach items="${companies}" var="company">

                            <tr style="border-color:#000000" border="1"  cellpadding="1"  cellspacing="1" >
                                <td  class="dataTextInActive" width="30%"><c:out value="${company.name}"/></td>
                                <td class="dataText"><c:out value="${company.address}"/></td>

                            </tr>
                        </c:forEach>

                    </tbody>
                </table>

            </div>


        </form>

    </body>
</html>
