<%-- 
    Document   : departmentDetails
    Created on : Feb 16, 2016, 12:12:22 PM
    Author     : INTEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

        <title>Untitled Document</title>
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
                background-image: url();background-repeat: no-repeat;background-position: center;
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
                    editDepartment();

                });


                $( "#edit" )
                .button()
                .click(function() {
                    editable();
                    //disableHRF();

                });

                $( "#cancel" )
                .button()
                .click(function() {
                    window.location='departmentDetails.jsp';
                });

                $( "#delete" )
                .button()
                .click(function() {
                    deleteDepartment();


                });
                $( "#back" )
                .button()
                .click(function() {
                   // backButttonn();
                    window.location='DepartmentTab.jsp';
                  //  window.location='viewAllConsultancy.jsp';

                });

            });



        </script>
        <script>
            function editable()
            {
                document.getElementById("update").style.display='';
                document.getElementById("cancel").style.display='';
                document.getElementById("delete").style.display='';
                 document.getElementById("edit").style.display='none';

                document.getElementById("departmentNameDetails").disabled=false;
               // document.getElementById("ConsultancyTypeCharges").disabled=false;


            }
        </script>

 <script>
            function showCountryTypeOptn(opt,val)
            {

                document.getElementById("departmentName").value=opt;
                 document.getElementById("departmentNameid").value=val;



            }
        </script>
        <script >
            function backButtton1()
            {
                //alert('button');
                //window.location='consultancyTab.jsp';
                window.location='DepartmentTab.jsp';

            }
        </script>
        <script>
            function disableHRF()
            {
                //alert('hhhh');
                document.getElementById("edit").style.display='none';

            }
        </script>

    </head >

    <body  >
        <div  id="bord" >
            <form id="form1"  action="" method="POST" >
                <table width="100%" height="29" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td height="32" background="images/header-bg.png" style="background-repeat:repeat-x"><img src="images/back1.png" style="cursor: pointer" title="click to close" onclick="backButtton1()" /></td>
                        <td height="29" valign="top" background="images/header-bg.png" style="background-repeat:repeat-x"><div align="center"><span class="style3">Manage Department Type Information</span></div></td>
                    </tr>
                </table>
                <table width="100%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
                <tr>
                    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="36%" height="44"><div align="right"></div></td>
                                <td width="5%">&nbsp;</td>
                                <td width="3%" style="color: white" >:</td>
                                <td width="29%"><div align="right">

                                        <br/>


                                    </div></td>
                                <td width="27%" colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="44"><div align="right"><span class="style1">Department Type Name</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                        <input disabled="true" type="text"  name="departmentNameDetails" id="departmentNameDetails" value="<c:out value="${detailsOfDepartment.dptname}"/>"  style="width:180px" class="style7" />
                                    </div></td>
                                     
                                <td colspan="3">&nbsp;</td>
                            </tr>
                                   

                           

                            <tr>

                            </tr>



                        </table>
                        <br/>
                         <br/>
                          <br/>

            </table>

                <table width="10%" border="0" align="center"  >

                                    <tr>
                                        <td align="center">
                                            <span id="edit">Manage</span>
                                        </td>
                                        <td>
                                            <span id="update" style="display: none">Update</span>
                                        </td>
                                        <td>
                                            <span style="display: none" id="cancel">Cancel</span>
                                        </td>
                                        <td>
                                            <button id="delete" style="display: none">DELETE</button>
                                        </td>
                                        <td>
                                            <span id="back">Back</span>
                                        </td>
                                    </tr>


                                </table>



            </form>
                 <script type="text/javascript">




            function deleteDepartment(){
                var con=false
                con=confirm('Do You Want To Delete Selected DepartmentName');
                if(!con)
                {
                    form1.action="departmentDetails.jsp";
                }
                else
                    {
                        var form1=document.getElementById("form1");
                        form1.action="Controller?process=DepartmentProcess&action=delete&departmentNameid=<c:out value="${detailsOfDepartment.departmentnameid}"/>";
                        form1.submit();

                    }

            }


             function editDepartment(){
                var con=false
                con=confirm('Do You Want To Edit Selected DepartmentName');
                if(!con)
                {
                    form1.action="departmentDetails.jsp";
                }
                else
                    {
                        var form1=document.getElementById("form1");
                        form1.action="Controller?process=DepartmentProcess&action=editDepartment&departmentNameid=<c:out value="${detailsOfDepartment.departmentnameid}"/>";
                        form1.submit();

                    }

            }
        </script>



        </div>
    </body>
</html>
