<%-- 
    Document   : LicenceDetails
    Created on : May 20, 2014, 12:34:55 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

        <title>Stationary Add</title>
        <link rel="stylesheet" href="css/datePicker/jquery-ui-1.8.18.custom.css"/>
        <link rel="stylesheet" href="css/validation/jquery.ketchup.css"/>

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
        <link rel="stylesheet" href="css/datePicker/demos.css"/>

        <style type="text/css">

       #bord     {
background-image: url(images/salesForceBk.png);background-repeat: no-repeat;background-position: center;
}
            <!--
            .divCSS{
                overflow:  scroll;
                height: 100%;
                width: 100%;
                background-image: url()
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
                border-top-width: 2px;
                border-right-width: 2px;
                border-bottom-width: 2px;
                border-left-width: 2px;
                width: auto;
                height: auto;
            }
            .alignRight {
                font-family: Tahoma;
                font-size: 13px;
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

            .style3 {
                font-family: Calibri;
                color: #FFFFFF;
                font-weight: bold;
                font-size: 18px;
            }
            .style7 {
                        color: black;
                        text-transform: capitalize;
                    }
            .style8 {
                        color: black;
                    }
            -->
        </style>
        <script type="text/javascript" src="js/datetimepicker_css.js"></script>




        <script type="text/javascript">
            $(function() {

                $( "#update" )
                .button()
                .click(function() {
                    editLicence();
                });


                $( "#edit" )
                .button()
                .click(function() {
                    editable();
                    });

                $( "#cancel" )
                .button()
                .click(function() {

                    window.location='LicenceDetails.jsp'
                });

                $( "#delete" )
                .button()
                .click(function() {
                    deleteLicence();
                });
                $( "#back" )
                .button()
                .click(function() {
                    //alert('jj');

                     window.back();
                    //window.location='Controller?process=LicenceProcess&action=viewLicence'

                });
                
           });

        </script>

        <script >
            function backButtton1()
            {
                //alert('gg');
                //window.location='viewAllLicence.jsp';
                window.back();

            }
        </script>

         <script>
            function editable()
            {
                document.getElementById("update").style.display='';
                document.getElementById("cancel").style.display='';
                document.getElementById("delete").style.display='';
                document.getElementById("edit").style.display='none';

                document.getElementById("hospitalname").disabled=false;
                document.getElementById("cmdname").disabled=false;
                document.getElementById("cmdconctno").disabled=false;
                document.getElementById("cmdemailid").disabled=false;
                document.getElementById("cmdmobno").disabled=false;
                document.getElementById("cmdemailid1").disabled=false;
                document.getElementById("website").disabled=false;
                document.getElementById("addressline1").disabled=false;
                document.getElementById("addressline2").disabled=false;
                document.getElementById("addressline3").disabled=false;
                document.getElementById("addressline4").disabled=false;
                

                document.getElementById("companyphoto").disabled=false;
                document.getElementById("companylogo").disabled=false;


            }
        </script>

    </head >

    <body >
        <div   >
            <form id="form1"  action="" method="POST" enctype="multipart/form-data" >
            <table width="100%" height="29" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td height="32" background="images/header-bg.png" style="background-repeat:repeat-x"><img src="images/back1.png" style="cursor: pointer" title="click to close" onclick="backButtton1()" /></td>
                    <td height="29" valign="top" background="images/header-bg.png" style="background-repeat:repeat-x"><div align="center"><span class="style3">Licence Info Details</span></div></td>
                </tr>
                <tr>
                    <td height="32" background="images/header-bg.png" style="background-repeat:repeat-x"></td>
                    <td height="29" valign="top" background="images/header-bg.png" style="background-repeat:repeat-x"><div align="center"><span class="style3">Licence Information</span></div></td>
                </tr>
            </table>
            <table width="100%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
                <tr>
                    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">


                            <tr style="display: none">
                                <td height="45"><div align="right"><span class="style1">Licence ID</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                        <input type="text" name="licenceid" id="licenceid" value="<c:out value="${licenceInfoDetails.licenceid}"/>" style="width:200px" class="style7" />
                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td width="36%" height="44"><div align="right"><span class="style1">Clinicle/Hospital Name</span></div></td>
                                <td width="5%">&nbsp;</td>
                                <td width="3%">:</td>
                                <td width="29%"><div align="left">
                                               <input disabled="true" type="text" id="hospitalname" name="hospitalname" value="<c:out value="${licenceInfoDetails.clientname}"/>" style="width:200px" class="style7"/>
                                              </div></td>
                                <td width="27%" colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="44"><div align="right"><span class="style1">CMD Name</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                        <input disabled="true" type="text"  name="cmdname" id="cmdname" value="<c:out value="${licenceInfoDetails.chiefmdname}"/>" style="width:200px" class="style7" />
                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="44"><div align="right"><span class="style1">CMD Contact No</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                        <input disabled="true" type="text" name="cmdconctno" id="cmdconctno" value="<c:out value="${licenceInfoDetails.cmdcontno}"/>" style="width:200px" class="style7" />
                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="43"><div align="right"><span class="style1">CMD Email ID</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                        <input disabled="true" type="text" name="cmdemailid" id="cmdemailid" value="<c:out value="${licenceInfoDetails.cmdemailid}"/>" style="width:200px" class="style7" />

                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="45"><div align="right"><span class="style1">CMD Mob No</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                        <input disabled="true" type="text" name="cmdmobno" id="cmdmobno" value="<c:out value="${licenceInfoDetails.cmdmobno}"/>" style="width:200px" class="style7" />
                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="44"><div align="right"><span class="style1">CMD Email ID1</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                        <input disabled="true" type="text"  name="cmdemailid1" id="cmdemailid1" value="<c:out value="${licenceInfoDetails.emailid}"/>" style="width:200px" class="style7" />
                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="44"><div align="right"><span class="style1">Web Site</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                        <input disabled="true" type="text" name="website" id="website"  value="<c:out value="${licenceInfoDetails.webaddress}"/>" style="width:200px" class="style7" />
                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="43"><div align="right"><span class="style1">Address Line1</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                        <input disabled="true" type="text" name="addressline1" id="addressline1" value="<c:out value="${licenceInfoDetails.addressline1}"/>" style="width:200px" class="style7" />

                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="45"><div align="right"><span class="style1">Address Line2</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                        <input disabled="true" type="text" name="addressline2" id="addressline2" value="<c:out value="${licenceInfoDetails.addressline2}"/>" style="width:200px" class="style7" />
                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="45"><div align="right"><span class="style1">Address Line3</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                        <input disabled="true" type="text" name="addressline3" id="addressline3" value="<c:out value="${licenceInfoDetails.addressline3}"/>" style="width:200px" class="style7" />
                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="45"><div align="right"><span class="style1">Address Line4</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                        <input disabled="true" type="text" name="addressline4" id="addressline4" value="<c:out value="${licenceInfoDetails.addressline4}"/>" style="width:200px" class="style7" />
                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                           <tr>
                                <td height="45"><div align="right"><span class="style1">Company photo</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                       <input disabled="true" type="text" name="companyphoto" id="companyphoto" value="<c:out value="${licenceInfoDetails.logo1}"/>" style="width:200px" class="style7" />
                                       <img src="<c:out value="${licenceInfoDetails.logo1}"/>" width="25%" height="100%" />
                                       <input name="uploadcopmanyPhoto" id="uploadcopmanyPhoto" type="file" class="textField" value="<c:out value="${licenceInfoDetails.logo1}"/>"  style="width:200px" />
                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="45"><div align="right"><span class="style1">Company Logo</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                      <input disabled="true" type="text" name="companylogo" id="companylogo" value="<c:out value="${licenceInfoDetails.logo2}"/>" style="width:200px" class="style7" />
                                      <img src="<c:out value="${licenceInfoDetails.logo2}"/>" width="25%" height="100%" />
                                      <input name="companylogofile" id="companylogofile" type="file" class="style7"  style="width:200px" />
                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>







                            <table id="table2" width="10%" border="0" align="center"   >

                                <tr>
                        <td align="center">

                            <span id="edit"> Manage</span>


                        </td>
                        <td>
                            <span id="update" style="display: none">Update</span>

                        </td>
                        <td>
                            <span style="display: none" id="cancel">Cancel</span>
                        </td>
                        <td>
                            <span id="delete" style="display: none">Delete</span>
                        </td>
                        <td>
                            <span id="back">Back</span>
                        </td>
                        

                    </tr>


                            </table>

                        </table></td>
                </tr>

            </table>

        </form>



        </div>

       <script type="text/javascript">

            function editLicence()
            {
                var con=false
                con=confirm('Do You Want To Update Licence');
                if(!con)
                {
                    form1.action="LicenceDetails.jsp";
                }
                else
                {

                    var form1=document.getElementById("form1");
                    form1.action="Controller?process=LicenceProcess&action=updateLicence&id=<c:out value='${licenceInfoDetails.licenceid}'/>";
                    form1.submit();
                    return false;
                }


            }


            function deleteLicence()
            {
                var con=false
                con=confirm('Do You Want To Delete LicenceProcess');
                if(!con)
                {
                    form1.action="LicenceDetails.jsp";
                }
                else
                {

                    var form1=document.getElementById("form1");
                    //alert('U r Going to Delete this contact');
                    form1.action="Controller?process=LicenceProcess&action=deleteLicence&id=<c:out  value='${licenceInfoDetails.licenceid}'/>";
                    form1.submit();

                }


            }


        </script>
    </body>
</html>
