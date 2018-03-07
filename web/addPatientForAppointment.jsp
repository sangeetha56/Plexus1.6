<%--
    Document   : index
    Created on : Dec 23, 2011, 5:52:28 PM
    Author     : Mayur
--%>
<%--

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
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
            -->
        </style>
        <script type="text/javascript" src="js/datetimepicker_css.js"></script>
        <script type="text/javascript">
            $(function() {

                $( "#set" )
                .button()
                .click(function() {
                    addPatientWithAppointment();

                });
                $( "#save" )
                .button()
                .click(function() {
                    addPatient();


                });
            });


        </script>
        <script>
            $(function() {
                $( "#tabs" ).tabs();
                $('#form1').ketchup();
            });
        </script>
         <script language="Javascript">
            function validateButton1()
            {
                if( document.getElementById("name").value.length==0 )

                {
                    document.getElementById("name").style.background='red';

                    alert("Enter the Patient  name");

                }

                if( document.getElementById("cardNo").value.length==0 )

                {
                    document.getElementById("cardNo").style.background='';

                    alert("Enter the Patient Card Number  ");

                }

                if( document.getElementById("contactNO").value.length==0 )

                {
                    document.getElementById("contactNO").style.background='';

                    alert("Enter the Patient  Contact Number");

                }



            }
       </script>
         <script language="Javascript">


            function valueChangeColor()
            {
                if( document.getElementById("name").value.length!=0)

                {
                    document.getElementById("name").style.background='white';

                }

            }
        </script>
    </head>
    <body ><form id="form1"  action="Controller?process=PatientProcess&action=add" method="POST" enctype="multipart/form-data">
            <div >
                <div id="tabs">
                    <ul>
                        <li><a href="#tabs-1">General Details</a></li>
                        <li><a href="#tabs-2">Specific Details</a></li>
                    </ul>
                    <div id="tabs-1">
                           <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="table1" style="display: block">
                            <tr>
                                <td width="16%"  class="alignRight" >Card No &nbsp;  </td>
                                <td width="28%"  >
                                    <label>
                                        <input name="cardNo" type="text" class="textField" id="cardNo" size="30" onkeypress="" data-validate="validate(required)"  >
                                    </label>
                                </td>
                                 <td width="16%"  class="alignRight" >Adharcard No &nbsp;  </td>
                                <td width="28%"  >
                                    <label>
                                        <input name="adharcardno" type="text" class="textField" id="adharcardno" size="30" onkeypress=" valueExistsChangeColor()" data-validate="validate(required)"  >
                                    </label>
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>
                            <tr>
                                <td width="16%"  class="alignRight" >Name &nbsp;  </td>
                                <td width="28%"  >
                                    <label>
                                        <input name="name" type="text" class="textField" id="name" size="30"  onkeypress="valueChangeColor()" data-validate="validate(required)"  >
                                    </label>
                                </td>
                                <td width="16%"  class="alignRight" >Contact No &nbsp;  </td>

                                <td>
                                    <label>

                                        <input name="contactNO" type="text" class="textField" id="contactNO" size="30"  data-validate="validate(required)" >

                                    </label>
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>
                            <tr>

                                <td width="20%" class="alignRight" >Nationality &nbsp;
                                </td>
                                <td width="45%"  >
                                    <label>
                                        <select name="nationality" id="nationality"  style="width: 170px" data-validate="validate(required)">
                                            <option value="0" selected></option>
                                            <c:forEach  items="${nationalities}" var="nationality">
                                                <option value="<c:out value="${nationality.type}"/>"><c:out value="${nationality.type}"/></option>
                                            </c:forEach>
                                        </select>
                                    </label>
                                </td>
                                <td class="alignRight">Blood Group &nbsp;
                                </td>
                                <td>
                                    <select name="bloodGroup" id="bloodGroup" style="width: 170px" data-validate="validate(required)">
                                        <option selected></option>
                                        <option>O+</option>
                                        <option>O-</option>
                                        <option>A+</option>
                                        <option>A-</option>
                                        <option>B+</option>
                                        <option>B-</option>
                                        <option>AB+</option>
                                        <option>AB-</option>
                                    </select>

                                </td>
                            </tr>
                            <tr>
                                <td width="16%" valign="top"  class="alignRight" >Sex &nbsp;
                                </td>
                                <td align="center" valign="middle" >
                                    <table width="92%" border="0">
                                        <tr>
                                            <td>
                                                <table width="99%" border="0">
                                                    <tr>
                                                        <td width="50%"  align="left"><input type="radio" id="sex" checked name="sex" value="male" class="radioCSS"  >
                                                            <span class="style4">Male
                                                            </span> <input type="radio" name="sex" value="female"   class="radioCSS" />

                                                            <span class="style4">Female

                                                            </span>

                                                        </td>
                                                    </tr>

                                                </table>
                                            </td>
                                        </tr>

                                    </table>
                                </td>

                                <td class="alignRight">Married &nbsp;
                                </td>

                                <td>
                                    <table width="99%" border="0">

                                        <tr>

                                            <td width="50%"  align="left">
                                                <input type="radio" id="married" name="married" value="Yes" class="radioCSS"  />
                                                <span class="style4">Yes</span>
                                                <input type="radio" name="married" value="No" checked  class="radioCSS"/>

                                                <span class="style4">No</span>
                                            </td>

                                        </tr>

                                    </table>
                                </td>
                            </tr>

                            <tr>

                                <td width="16%" height="30"  class="alignRight" >Age &nbsp;
                                </td>
                                <td>
                                    <label>
                                        <input name="age" type="text" class="textField" id="age" size="30" data-validate="validate(required)">
                                    </label>
                                </td>
                                <td class="alignRight">Referred By &nbsp;</td>
                                <td><input name="referencedBy" type="text" class="textField" id="referencedBy" size="30">
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>
                            <tr>

                                <td width="16%"  class="alignRight" >Address &nbsp;</td>

                                <td colspan="3">
                                    <label>

                                        <textarea name="address" cols="120" rows="7"  id="address"></textarea>

                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>
                            <tr>
                                <td width="17%"  class="alignRight" >Chief Complaints   &nbsp;  </td>
                                <td colspan="3"><textarea name="chiefComplaints" cols="120" rows="7"  id="chiefComplaints" data-validate="validate(required)"></textarea></td>
                            </tr>
                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <%--<div id="tabs-2">
                        <table id="table2" width="100%" border="0" align="center" >
                            <!--<tr><td class="alignRight">Examination &nbsp;</td></tr>
                            <tr>
                                <td class="alignRight">Pulse &nbsp;</td>
                                <td colspan="3">

                                    <input name="pulse" type="text" class="textFieldFixedWidth" id="pulse" />
                                    &nbsp;<span class="alignRight">BP</span>
                                    <input name="bp" type="text" class="textFieldFixedWidth" id="bp" />
                                    &nbsp;<span class="alignRight">RR</span>
                                    <input name="rr" type="text" class="textFieldFixedWidth" id="rr" /></td>
                            </tr>-->
                            <tr>

                                <td  height="30"  class="alignRightMultiple" >History of Present Illness  &nbsp;</td>
                                <td ><textarea name="historyOfPresentIllness" cols="120" rows="4"  id="historyOfPresentIllness"></textarea></td>
                            </tr>

                            <tr><td width="14%"  class="alignRight" >Past History &nbsp;  </td>
                                <td  ><textarea name="pastHistory" cols="120" rows="4"  id="pastHistory"></textarea></td>
                            </tr>
                            <tr>                                    </tr>

                            <tr>
                                <td width="14%"  class="alignRight" >Personal History &nbsp;  </td>
                                <td  ><textarea name="personalHistory" cols="120" rows="4"  id="personalHistory"></textarea></td>
                            </tr>
                            <tr>
                                <td width="14%" valign="top"  class="alignRightMultiple" >Family History  &nbsp;</td>
                                <td   ><textarea name="familyHistory" cols="120" rows="4"  id="familyHistory"></textarea>				</td>
                            </tr>
                            <tr>
                                <td width="14%"  class="alignRight" >Drug Allergies  &nbsp;</td>
                                <td ><label>
                                        <textarea name="drugAllergies" cols="120" rows="4"  id="drugAllergies"></textarea>
                                    </label>
                                </td>
                                <!--<td width="14%"  class="alignRight" >Diagnosis  &nbsp;</td>
                            <td ><label>
                                    <textarea name="diagnosis" cols="120" rows="4"  id="diagnosis"></textarea>
                                </label></td>-->
                            </tr>
                            <tr>                                    </tr>
                            <!--<tr>
                                <td width="14%"  class="alignRight" >Investigation  &nbsp;</td>
                                <td ><label>
                                        <textarea name="investigations" cols="120" rows="4"  id="investigations"></textarea>
                                    </label></td>
                                <td width="14%"  class="alignRight" >Treatment  &nbsp;</td>
                                <td ><label>
                                        <textarea name="treatment" cols="120" rows="4"  id="treatment"></textarea>
                                    </label></td>
                            </tr>-->
                            <tr>
                            </tr>
                        </table>
                    </div>--%>
                </div>
            </div>
            <table id="table2" width="100%" border="0" align="center"  >

                <tr>
                    <td align="center">
                        
                        <button id="set" onmouseover="validateButton1();">Save & proceed to appointment</button>
                    </td>
                </tr>


            </table>
        </form>
        <script type="text/javascript">
            function redirectUrl(){

                var form1=document.getElementById("form1");

                form1.action="Controller?process=PatientProcess&action=addWithAppointment";
                form1.submit();

            }
            function addPatient(){
                var form1=document.getElementById("form1");
                form1.action="Controller?process=PatientProcess&action=add";
                form1.submit();
            }
            function addPatientWithAppointment(){
                var form1=document.getElementById("form1");
                form1.action="Controller?process=PatientProcess&action=addWithAppointment";
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
    </body>
</html>
