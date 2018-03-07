<%--
    Document   : index
    Created on : Dec 23, 2011, 5:52:28 PM
    Author     : Mayur
--%>

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
                    updatePatient();

                });
                $( "#save" )
                .button()
                .click(function() {
                    addPatient();


                });
                $( "#cancel" )
                .button()
                .click(function() {
                    cancel();


                });

                 $( "#admit" )
                .button()
                .click(function() {
                    addInPatient();


                });

            });


        </script>
        <script>
            $(function() {
                $( "#tabs" ).tabs();
                
            });
        </script>

        <script>
            function inPatientCheckBoxNo()
            {
           
                document.getElementById("inPatientCheckYes").checked=false;
                document.getElementById("admit").style.display='none';
                 document.getElementById("hideAdmitDate").style.display='none';



                document.getElementById("set").style.display='inline';
            }

             function inPatientCheckBoxYes()
            {

                document.getElementById("inPatientCheckNo").checked=false;
                document.getElementById("admit").style.display='inline';
                document.getElementById("hideAdmitDate").style.display='';
             //    document.getElementById("hideadmitDate").style.display='';
             //     document.getElementById("hideDischargeDateLable").style.display='';
            //     document.getElementById("hidedischargeDate").style.display='';

                document.getElementById("set").style.display='none';
            }


   </script>



          <script>
            $(function() {
                $( "#admitDate" ).datepicker({changeYear: true, changeMonth: true});
                $( "#anim" ).change(function() {
                    $( "#datepicker" ).datepicker( "option", "showAnim", $( this ).val() );
                });
            });


             $(function() {
                $( "#dischargeDate" ).datepicker({changeYear: true, changeMonth: true});
                $( "#anim" ).change(function() {
                    $( "#datepicker" ).datepicker( "option", "showAnim", $( this ).val() );
                });
            });
        </script>
    </head>
    <body ><form id="form1"  action="Controller?process=PatientProcess&action=update" method="POST">
            <div >
                <div id="tabs">
                    <ul>
                        <li><a href="#tabs-1">General Details</a></li>
                        <li><a href="#tabs-2">Specific Details</a></li>
                    </ul>
                    <div id="tabs-1">
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="table1" style="display: block">

                            <tr><td width="16%"  class="alignRight" >In-Patient &nbsp;  </td>
                                 <td width="2%" >

                                       <input name="inPatientCheckYes" type="radio" class="textField" id="inPatientCheckYes" size="30"  onclick="inPatientCheckBoxYes();" >Yes

                                   &nbsp;&nbsp; <input name="inPatientCheckNo" type="radio"  checked="true" class="textField" id="inPatientCheckNo" size="30"  onclick="inPatientCheckBoxNo();" >No

                                </td>
                                <td></td>
                                   </tr>
                                   <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>

                            <tr>
                               <td width="16%"  class="alignRight" >Card No &nbsp;  </td>
                                <td width="28%"  >
                                    <label>
                                        <input name="cardNo" type="text" class="textField" id="cardNo" size="30" value="<c:out value="${patient.cardno}"/>"  >
                                    </label>
                                </td>

                                
                                <%--  <td width="16%"  class="alignRight" >Date &nbsp;</td>

                                <td width="28%" >
                                    <label>
                                        <input readonly name="creationDate" type="text" class="textField" id="creationDate" size="30"  >
                                    </label>
                                </td> --%>
                                <td></td>
                            </tr>
                             <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>
                            <tr>
                                <td width="16%"  class="alignRight" >Name &nbsp;  </td>
                                <td width="28%"  >
                                     <input type="hidden" name="id" id="=id" value="<c:out value="${patient.id}" />" />
                                     <input type="hidden" name="regno"  id="regno" value="<c:out value="${patient.regno}" />" />
                                    <label>
                                        <input name="name" type="text" value="<c:out value="${patient.name}" />" class="textField" id="name" size="30" data-validate="validate(required)"  >
                                    </label>
                                </td>
                                <td width="16%"  class="alignRight" >Surname &nbsp;  </td>
                                <td width="28%"  >
                                     <input type="hidden" name="id" id="=id" value="<c:out value="${patient.id}" />" />
                                     <input type="hidden" name="regno"  id="regno" value="<c:out value="${patient.regno}" />" />
                                    <label>
                                        <input name="surname" type="text" value="<c:out value="${patient.surname}" />" class="textField" id="surname" size="30" data-validate="validate(required)"  >
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>
                           
                            <tr>
                                <td width="16%"  class="alignRight" >S/O&nbsp;<input type="radio" name="sdw" value="s/o" checked="checked" />
                                D/O&nbsp;<input type="radio" name="sdw" value="d/o"  />
                                w/O&nbsp;<input type="radio" name="sdw" value="w/o"  />
                                </td>
                                <td width="28%"  >
                                    <label>
                                        <input name="sdwof" type="text" value="<c:out default="" value="${patient.sdwof}" />" class="textField" id="sdwof" size="30" onkeypress=" valueExistsChangeColor()" data-validate="validate(required)"  >
                                    </label>
                                </td>
                                <td width="16%"  class="alignRight" >Contact No &nbsp;  </td>

                                <td>
                                    <label>

                                        <input name="contactNO" type="text" value="<c:out default="" value="${patient.telephoneno}" />" class="textField" id="contactNO" size="30" data-validate="validate(required)" >

                                    </label>
                                </td>
                                
                            </tr>
                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>
                            <tr>
                                <td width="16%"  class="alignRight" >Village &nbsp;</td>
                                <td width="28%"  >
                                    <label>
                                        <input name="village" type="text" value="<c:out default="" value="${patient.village}" />" class="textField" id="village" size="30">
                                     </label>

                                </td>
                                <td width="16%"  class="alignRight" >Tehsil &nbsp;</td>
                                <td width="28%"  >
                                    <label>
                                        <input name="tehsil" type="text" value="<c:out default="" value="${patient.tehsil}" />" class="textField" id="tehsil" size="30">
                                     </label>

                               </td>
                                </tr>
                                 <tr>
                                <td>
                                    <br/>
                                </td>
                                 </tr>
                                <tr>
                                  <td width="16%"  class="alignRight" >Dist &nbsp;</td>
                                <td width="28%">
                                    <label><input name="dist" type="text" value="<c:out default="" value="${patient.dist}" />" class="textField" id="dist" size="30">
                                        </label>


                                </td>

                                <td width="16%"  class="alignRight" >State &nbsp;</td>
                                <td width="28%">
                                    <label>
                                        <input name="address" type="text" value="<c:out default="" value="${patient.address}" />" class="textField" id="address" size="30">
                                    </label>


                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>
                            <tr>
                                <td width="16%"  class="alignRight" >Pincode &nbsp;  </td>
                                <td width="28%"  >
                                    <label>
                                        <input name="pincode" type="text" value="<c:out value="${patient.pincode}" />" class="textField" id="pincode" size="30" onkeypress=" valueExistsChangeColor()" data-validate="validate(required)"  >
                                    </label>
                                </td>

                                <td width="16%"  class="alignRight" >Adharcard No &nbsp;  </td>
                                <td width="28%"  >
                                    <label>
                                        <input name="adharcardno" type="text" value="<c:out value="${patient.adharcardno}" />" class="textField" id="adharcardno" size="30" onkeypress=" valueExistsChangeColor()" data-validate="validate(required)"  >
                                    </label>
                                </td>

                            </tr>

                            <tr>
                                <td>
                                    <br/>
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
                                                        <td width="50%"  align="left">
                                                            <c:choose >
                                                                <c:when test="${patient.sex eq 'male'}">
                                                                    <input type="radio" id="sex" checked name="sex" value="male" class="radioCSS"  >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="radio" id="sex"  name="sex" value="male" class="radioCSS"  >
                                                                </c:otherwise>
                                                            </c:choose>

                                                            <span class="style4">Male
                                                            </span>
                                                            <c:choose >
                                                                <c:when test="${patient.sex eq 'female'}">
                                                                    <input type="radio" name="sex" checked value="female"   class="radioCSS" />
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="radio" name="sex" value="female"   class="radioCSS" />
                                                                </c:otherwise>
                                                            </c:choose>


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
                                                <c:choose >
                                                    <c:when test="${patient.married eq 'Yes'}">
                                                        <input type="radio" id="married"  checked name="married" value="Yes" class="radioCSS"  />
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="radio" id="married" name="married" value="Yes" class="radioCSS"  />
                                                    </c:otherwise>
                                                </c:choose>

                                                <span class="style4">Yes</span>
                                                <c:choose >
                                                    <c:when test="${patient.married eq 'No'}">
                                                        <input type="radio" name="married" value="No" checked  class="radioCSS"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="radio" name="married" value="No"   class="radioCSS"/>
                                                    </c:otherwise>
                                                </c:choose>


                                                <span class="style4">No</span>
                                            </td>

                                        </tr>

                                    </table>
                                </td>
                            </tr>


                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>
                             

                                <%-- <td width="17%"  class="alignRight" >Chief Complaints   &nbsp;  </td>
                                <td colspan="3"><textarea name="chiefComplaints" cols="120" rows="7"  id="chiefComplaints" data-validate="validate(required)"></textarea></td> --%>
                           
                               
                            

                                <%--  <td width="20%" class="alignRight" >Nationality &nbsp;
                                </td>
                                <td width="45%"  >
                                    <label>
                                        <select name="nationality" id="nationality"  style="width: 170px" data-validate="validate(required)">
                                            <option value="0" selected></option>
                                            <c:forEach  items="${nationalities}" var="nationality">
                                                <c:choose >
                                                    <c:when test="${nationality.type eq patient.nationality}">
                                                        <option selected value="<c:out value="${nationality.type}"/>"><c:out value="${nationality.type}"/></option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="<c:out value="${nationality.type}"/>"><c:out value="${nationality.type}"/></option>
                                                    </c:otherwise>
                                                </c:choose>

                                            </c:forEach>
                                        </select>
                                    </label>
</td>--%>
                             <tr>    <td class="alignRight">Blood Group &nbsp;
                                </td>
                                <td>
                                    <select name="bloodGroup" id="bloodGroup" style="width: 170px" data-validate="validate(required)">

                                        <c:choose >
                                            <c:when test="${patient.bloodgroup eq 'O+'}">
                                                <option selected>O+</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option>O+</option>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:choose >
                                            <c:when test="${patient.bloodgroup eq 'O-'}">
                                                <option selected>O-</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option>O-</option>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:choose >
                                            <c:when test="${patient.bloodgroup eq 'A+'}">
                                                <option selected>A+</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option>A+</option>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:choose >
                                            <c:when test="${patient.bloodgroup eq 'A-'}">
                                                <option selected>A-</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option>A-</option>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:choose >
                                            <c:when test="${patient.bloodgroup eq 'B+'}">
                                                <option selected>B+</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option>B+</option>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:choose >
                                            <c:when test="${patient.bloodgroup eq 'B-'}">
                                                <option selected>B-</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option>B-</option>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:choose >
                                            <c:when test="${patient.bloodgroup eq 'AB+'}">
                                                <option selected>AB+</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option>AB+</option>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:choose >
                                            <c:when test="${patient.bloodgroup eq 'AB-'}">
                                                <option selected>AB-</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option>AB-</option>
                                            </c:otherwise>
                                        </c:choose>


                                    </select>

                                </td>

                                <td width="16%" height="30"  class="alignRight" >Age &nbsp;
                                </td>
                                <td>
                                    <label>
                                        <input name="age"  type="text" class="textField" id="age" size="30"  value="<c:out default="" value="${patient.age}" />" data-validate="validate(required)">
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>
                            <tr>
                                <td width="16%"  class="alignRight" >Contactperson &nbsp;</td>
                                <td  width="28%">
                                    <label><input name="contactperson" type="text" value="<c:out value="${patient.contactperson}" />" class="textField" id="contactperson" size="30">
                                    </label>
                               </td>

                                <td width="16%"  class="alignRight" >Mobil No &nbsp;</td>
                                <td  width="28%">
                                    <label><input name="mobilno" type="text" value="<c:out value="${patient.mobilno}" />" class="textField" id="mobilno" size="30">
                                    </label>
                                </td>
                            </tr>

                            <tr>
                                <td width="16%"  class="alignRight" >Advance Given &nbsp;</td>
                                <td  width="28%">
                                    <label><input name="advancecharges" type="text" value="<c:out value="${patient.advancecharges}" />" class="textField" id="advancecharges" size="30">
                                    </label>
                               </td>

                                <td width="16%"  class="alignRight" >Due Amount &nbsp;</td>
                                <td  width="28%">
                                    <label><input name="duecharges" type="text" value="<c:out value="${patient.duecharges}" />" class="textField" id="duecharges" size="30">
                                    </label>
                                </td>
                            </tr>
                            

                            <%--  <tr>

                                <td class="alignRight">Referred By &nbsp;</td>
                                <td><input name="referencedBy" type="text" class="textField" value="<c:out default="" value="${patient.refferedby}" />" id="referencedBy" size="30">
                                </td>

                            </tr>--%>
                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>
                            
                            <tr id="hideAdmitDate" style="display: none">

                                <td  width="16%" height="30"  class="alignRight">Admit Date &nbsp;
                                </td>
                                <td>
                                   
                                        <input name="admitDate"  type="text" class="textField" id="admitDate" size="30">
                                   
                                </td>


                               
                            </tr>
                             <script type="text/javascript">


                                date = new Date();
                                var month = date.getMonth()+1;
                                var day = date.getDate();
                                var year = date.getFullYear();
                                    if(day>=1 && day<=10)
                                        {
                                            day='0'+day;
                                        }


                                         if(month>=1 && month<=10)
                                        {
                                            month='0'+month;
                                        }
                                if (document.getElementById('admitDate').value == ''){
                                    document.getElementById('admitDate').value = month + '/' + day + '/' + year;
                                }

                               
                                </script>



                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>
                            <%--       <tr>

                                <td width="16%"  class="alignRight" >State &nbsp;</td>

                                <td colspan="3">
                                    <label>

                                        <textarea name="address" cols="120" rows="7"  id="address"><c:out default="" value="${patient.address}" /></textarea>

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
                                <td colspan="3"><textarea name="chiefComplaints" cols="120" rows="7"  id="chiefComplaints" data-validate="validate(required)"><c:out default="" value="${patient.chiefcomplaints}" /></textarea></td>
                            </tr>
                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>--%>
                        </table>
                    </div>
                    <div id="tabs-2">
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
                                <td ><textarea name="historyOfPresentIllness" cols="120" rows="4"  id="historyOfPresentIllness"><c:out default="" value="${patient.historyofpresentillness}" /></textarea></td>
                            </tr>

                            <tr><td width="14%"  class="alignRight" >Past History &nbsp;  </td>
                                <td  ><textarea name="pastHistory" cols="120" rows="4"  id="pastHistory"><c:out default="" value="${patient.pasthistory}" /></textarea></td>
                            </tr>
                            <tr>                                    </tr>

                            <tr>
                                <td width="14%"  class="alignRight" >Personal History &nbsp;  </td>
                                <td  ><textarea name="personalHistory" cols="120" rows="4"  id="personalHistory"><c:out default="" value="${patient.personalhistory}" /></textarea></td>
                            </tr>
                            <tr>
                                <td width="14%" valign="top"  class="alignRightMultiple" >Family History  &nbsp;</td>
                                <td   ><textarea name="familyHistory" cols="120" rows="4"  id="familyHistory"><c:out default="" value="${patient.familyhistory}" /></textarea>				</td>
                            </tr>
                            <tr>
                                <td width="14%"  class="alignRight" >Drug Allergies  &nbsp;</td>
                                <td ><label>
                                        <textarea name="drugAllergies" cols="120" rows="4"  id="drugAllergies"><c:out default="" value="${patient.drugallergies}" /></textarea>
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
                    </div>
                </div>
            </div>
            <table id="table2" width="100%" border="0" align="center"  >

                <tr>
                    <td align="center">

                        <button id="set">Update</button>
                       
                        <button id="admit" style="display: none;">Admit</button>
                         <button id="cancel">Cancel</button>
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


             function addInPatient(){
                 //alert('id is:-'+<c:out  value="${patient.id}" />);
                var form1=document.getElementById("form1");
                form1.action="Controller?process=InPatientProcess&action=add&id=<c:out  value="${patient.id}" />";
                form1.submit();
            }

            function cancel(){
                var form1=document.getElementById("form1");
                form1.action="Controller?process=PatientProcess&action=viewDetails&id=<c:out  value='${patient.id}'/>";
                form1.submit();
            }
            function addPatientWithAppointment(){
                var form1=document.getElementById("form1");
                form1.action="Controller?process=PatientProcess&action=addWithAppointment";
                form1.submit();
            }
            function updatePatient(){
                var form1=document.getElementById("form1");
                form1.action="Controller?process=PatientProcess&action=update";
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
