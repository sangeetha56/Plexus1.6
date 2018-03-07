<%-- 
    Document   : addLicenceInfo
    Created on : May 19, 2014, 6:08:30 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
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


                $( "#save" )
                .button()
                .click(function() {
                    addStationary();


                });
                $( "#reset" )
                .button()
                .click(function() {
                   });
            });


        </script>

        <script >
            function backButtton1()
            {
                window.history.back();

            }
        </script>

    </head >

    <body >
        <div  id="bord" >
            <form id="form1"  action="Controller?process=LicenceProcess&action=addLicence" method="POST" enctype="multipart/form-data">
            <table width="100%" height="29" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td height="32" background="images/header-bg.png" style="background-repeat:repeat-x"><img src="images/back1.png" style="cursor: pointer" title="click to close" onclick="backButtton1()" /></td>
                    <td height="29" valign="top" background="images/header-bg.png" style="background-repeat:repeat-x"><div align="center"><span class="style3">Add Licence Info</span></div></td>
                </tr>
                <tr>
                    <td height="32" background="images/header-bg.png" style="background-repeat:repeat-x"></td>
                    <td height="29" valign="top" background="images/header-bg.png" style="background-repeat:repeat-x"><div align="center"><span class="style3">Licence Information</span></div></td>
                </tr>
            </table>
            <table width="100%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
                <tr>
                    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="36%" height="44"><div align="right"><span class="style1">Clinicle/Hospital Name</span></div></td>
                                <td width="5%">&nbsp;</td>
                                <td width="3%">:</td>
                                <td width="29%"><div align="left">
                                               <input  type="text" id="hospitalname" name="hospitalname" style="width:200px" class="style7"/>
                                              </div></td>
                                <td width="27%" colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="44"><div align="right"><span class="style1">CMD Name</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                        <input type="text"  name="cmdname" id="cmdname" style="width:200px" class="style7" />
                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="44"><div align="right"><span class="style1">CMD Contact No</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                        <input type="text" name="cmdconctno" id="cmdconctno" style="width:200px" class="style7" />
                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="43"><div align="right"><span class="style1">CMD Email ID</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                        <input type="text" name="cmdemailid" id="cmdemailid" style="width:200px" class="style7" />

                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="45"><div align="right"><span class="style1">CMD Mob No</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                        <input type="text" name="cmdmobno" id="cmdmobno" style="width:200px" class="style7" />
                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="44"><div align="right"><span class="style1">CMD Email ID1</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                        <input type="text"  name="cmdemailid1" id="cmdemailid1" style="width:200px" class="style7" />
                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="44"><div align="right"><span class="style1">Web Site</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                        <input type="text" name="website" id="website" style="width:200px" class="style7" />
                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="43"><div align="right"><span class="style1">Address Line1</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                        <input type="text" name="addressline1" id="addressline1" style="width:200px" class="style7" />

                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="45"><div align="right"><span class="style1">Address Line2</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                        <input type="text" name="addressline2" id="addressline2" style="width:200px" class="style7" />
                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="45"><div align="right"><span class="style1">Address Line3</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                        <input type="text" name="addressline3" id="addressline3" style="width:200px" class="style7" />
                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="45"><div align="right"><span class="style1">Address Line4</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                        <input type="text" name="addressline4" id="addressline4" style="width:200px" class="style7" />
                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            
                            
                            <tr>
                                <td height="45"><div align="right"><span class="style1">Logo1</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                  
                                        <input name="uploadcopmanyPhoto" id="uploadcopmanyPhoto" type="file" class="style7"  style="width:200px" />
                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="45"><div align="right"><span class="style1">Logo2</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                       
                                        <input name="companylogofile" id="companylogofile" type="file" class="style7"  style="width:200px" />
                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>





                            <table width="100%" border="0" align="center"  >

                                <tr>
                                    <td>&nbsp;&nbsp;</td>
                                    <td align="center">
                                        <button id="save">Save</button>
                                        <button id="reset" type="reset" value="Cancel" name="Cancel">Cancel</button>
                                    </td>
                                </tr>


                            </table>

                        </table></td>
                </tr>

            </table>

        </form>



        </div>
    </body>
</html>
