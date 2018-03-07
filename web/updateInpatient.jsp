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

              

            });


        </script>
        <script>
            $(function() {
                $( "#tabs" ).tabs();

            });
        </script>

        <script>
          
        

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
                            <tr>
                                <td width="16%"  class="alignRight" >Card No&nbsp;  </td>
                                <td width="28%"  >
                                    <label>
                                        <input name="cardNo" type="text" class="textField" id="cardNo" size="30" value="<c:out value="${inpatient.cardno}"/>"  >
                                    </label>
                                </td>
                                 <td width="16%"  class="alignRight" >Adharcard No &nbsp;  </td>
                                <td width="28%"  >
                                    <label>
                                        <input name="adharcardno" type="text" value="<c:out value="${inpatient.adharcardno}" />" class="textField" id="adharcardno" size="30" onkeypress=" valueExistsChangeColor()" data-validate="validate(required)"  >
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
                                     <input type="hidden" name="id" id="=id" value="<c:out value="${inpatient.id}" />" />
                                     <input type="hidden" name="regno"  id="regno" value="<c:out value="${inpatient.regno}" />" />
                                    <label>
                                        <input name="name" type="text" value="<c:out value="${inpatient.name}" />" class="textField" id="name" size="30" data-validate="validate(required)"  >
                                    </label>
                                </td>
                                <td width="16%"  class="alignRight" >Surname &nbsp;  </td>
                                <td width="28%"  >
                                     <input type="hidden" name="id" id="=id" value="<c:out value="${inpatient.id}" />" />
                                     <input type="hidden" name="regno"  id="regno" value="<c:out value="${inpatient.regno}" />" />
                                    <label>
                                        <input name="surname" type="text" value="<c:out value="${inpatient.surname}" />" class="textField" id="surname" size="30" data-validate="validate(required)"  >
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
                           
                                <td width="28%" >
                                   
                                        <input name="sdwof" type="text" value="<c:out default="" value="${inpatient.sdwof}" />" class="textField" id="sdwof" size="30" onkeypress=" valueExistsChangeColor()" data-validate="validate(required)"  >
                                  
                                </td>
                                <td width="16%"  class="alignRight" >Contact No &nbsp; </td>
                                <td width="28%" >
                                    <input name="contactNO" type="text" value="<c:out default="" value="${inpatient.telephoneno}" />" class="textField" id="contactNO" size="30" data-validate="validate(required)" > </td>
                                


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
                                                                <c:when test="${inpatient.sex eq 'male'}">
                                                                    <input type="radio" id="sex" checked name="sex" value="male" class="radioCSS"  >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="radio" id="sex"  name="sex" value="male" class="radioCSS"  >
                                                                </c:otherwise>
                                                            </c:choose>

                                                            <span class="style4">Male
                                                            </span>
                                                            <c:choose >
                                                                <c:when test="${inpatient.sex eq 'female'}">
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
                                                    <c:when test="${inpatient.married eq 'Yes'}">
                                                        <input type="radio" id="married"  checked name="married" value="Yes" class="radioCSS"  />
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="radio" id="married" name="married" value="Yes" class="radioCSS"  />
                                                    </c:otherwise>
                                                </c:choose>

                                                <span class="style4">Yes</span>
                                                <c:choose >
                                                    <c:when test="${inpatient.married eq 'No'}">
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
                         <%--   <tr>

                                <td width="20%" class="alignRight" >Nationality &nbsp;
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
                                </td> --%>
                         <tr>
                                <td class="alignRight">Blood Group &nbsp;
                                </td>
                                <td>
                                    <select name="bloodGroup" id="bloodGroup" style="width: 170px" data-validate="validate(required)">

                                        <c:choose >
                                            <c:when test="${inpatient.bloodgroup eq 'O+'}">
                                                <option selected>O+</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option>O+</option>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:choose >
                                            <c:when test="${inpatient.bloodgroup eq 'O-'}">
                                                <option selected>O-</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option>O-</option>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:choose >
                                            <c:when test="${inpatient.bloodgroup eq 'A+'}">
                                                <option selected>A+</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option>A+</option>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:choose >
                                            <c:when test="${inpatient.bloodgroup eq 'A-'}">
                                                <option selected>A-</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option>A-</option>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:choose >
                                            <c:when test="${inpatient.bloodgroup eq 'B+'}">
                                                <option selected>B+</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option>B+</option>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:choose >
                                            <c:when test="${inpatient.bloodgroup eq 'B-'}">
                                                <option selected>B-</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option>B-</option>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:choose >
                                            <c:when test="${inpatient.bloodgroup eq 'AB+'}">
                                                <option selected>AB+</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option>AB+</option>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:choose >
                                            <c:when test="${inpatient.bloodgroup eq 'AB-'}">
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
                                        <input name="age"  type="text" class="textField" id="age" size="30"  value="<c:out default="" value="${inpatient.age}" />" data-validate="validate(required)">
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
                                    <label><input name="contactperson" type="text" value="<c:out value="${inpatient.contactperson}" />" class="textField" id="contactperson" size="30">
                                    </label>
                               </td>

                                <td width="16%"  class="alignRight" >Mobil No &nbsp;</td>
                                <td  width="28%">
                                    <label><input name="mobilno" type="text" value="<c:out value="${inpatient.mobilno}" />" class="textField" id="mobilno" size="30">
                                    </label>
                                </td>
                            </tr>
                            

                            <tr>

                                

                            </tr>
                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>

                            <tr>

                                <td  width="16%" height="30"  class="alignRight">Admit Date &nbsp;
                                </td>
                                <td>

                                    <input name="admitDate"  type="text" class="textField" id="admitDate" value="<c:out default="" value="${inpatient.admitdate}" />" size="30  ">

                                </td>

                                <td class="alignRight">Discharge Date &nbsp;</td>
                                <td><input name="dischargeDate" type="text" class="textField" value="<c:out default="" value="${inpatient.dischargedate}" />" id="dischargeDate" size="30">
                                </td>



                            </tr>



                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>


                            <tr>

                                <td width="16%"  class="alignRight" >Concluding Summary &nbsp;</td>

                                <td colspan="3">
                                    <label>

                                        <textarea name="concludingsammary" cols="120" rows="7"  id="concludingsammary"><c:out default="" value="${inpatient.concludinghistory}" /></textarea>

                                    </label>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>

                            <tr>

                                <td width="16%"  class="alignRight" >Follow Up &nbsp;</td>

                                <td colspan="3">
                                    <label>

                                        <textarea name="followup" cols="120" rows="7"  id="followup"><c:out default="" value="${inpatient.followup}" /></textarea>

                                    </label>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>






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
                                <td width="16%"  class="alignRight" >Village &nbsp;</td>
                                <td width="28%"  >
                                    <label>
                                        <input name="village" type="text" value="<c:out default="" value="${inpatient.village}" />" class="textField" id="village" size="30">
                                     </label>

                                </td>
                                <td width="16%"  class="alignRight" >Tehsil &nbsp;</td>
                                <td width="28%"  >
                                    <label>
                                        <input name="tehsil" type="text" value="<c:out default="" value="${inpatient.tehsil}" />" class="textField" id="tehsil" size="30">
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
                                    <label><input name="dist" type="text" value="<c:out default="" value="${inpatient.dist}" />" class="textField" id="dist" size="30">
                                        </label>


                                </td>

                                <td width="16%"  class="alignRight" >State &nbsp;</td>
                                <td width="28%">
                                    <label>
                                        <input name="address" type="text" value="<c:out default="" value="${inpatient.address}" />" class="textField" id="address" size="30">
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
                                        <input name="pincode" type="text" value="<c:out value="${inpatient.pincode}" />" class="textField" id="pincode" size="30" onkeypress=" valueExistsChangeColor()" data-validate="validate(required)"  >
                                    </label>
                                </td>

                               

                            </tr>






                            <tr>

                                <td  height="30"  class="alignRightMultiple" >History of Present Illness  &nbsp;</td>
                                <td ><textarea name="historyOfPresentIllness" cols="120" rows="4"  id="historyOfPresentIllness"><c:out default="" value="${inpatient.historyofpresentillness}" /></textarea></td>
                            </tr>

                            <tr><td width="14%"  class="alignRight" >Past History &nbsp;  </td>
                                <td  ><textarea name="pastHistory" cols="120" rows="4"  id="pastHistory"><c:out default="" value="${inpatient.pasthistory}" /></textarea></td>
                            </tr>
                            <tr>                                    </tr>

                            <tr>
                                <td width="14%"  class="alignRight" >Personal History &nbsp;  </td>
                                <td  ><textarea name="personalHistory" cols="120" rows="4"  id="personalHistory"><c:out default="" value="${inpatient.personalhistory}" /></textarea></td>
                            </tr>
                            <tr>
                                <td width="14%" valign="top"  class="alignRightMultiple" >Family History  &nbsp;</td>
                                <td   ><textarea name="familyHistory" cols="120" rows="4"  id="familyHistory"><c:out default="" value="${inpatient.familyhistory}" /></textarea>				</td>
                            </tr>
                            <tr>
                                <td width="14%"  class="alignRight" >Drug Allergies  &nbsp;</td>
                                <td ><label>
                                        <textarea name="drugAllergies" cols="120" rows="4"  id="drugAllergies"><c:out default="" value="${inpatient.drugallergies}" /></textarea>
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

            <script>



                if(document.getElementById("admitDate"))
                {
                    var dateF=document.getElementById("admitDate");
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


                 if(document.getElementById("dischargeDate"))

                {
                    var dateF=document.getElementById("dischargeDate");
                    if((dateF.value)!="undefined/undefined/")
                        {
                //  document.write(dateF).value;

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
                else
                    {
                         var dateF=document.getElementById("dischargeDate");
                         dateF.value='';
                    }

                }


            </script>





            <table id="table2" width="100%" border="0" align="center"  >

                <tr>
                    <td align="center">

                        <button id="set">Update</button>


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
                form1.action="Controller?process=InPatientProcess&action=updateInPatient";
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
