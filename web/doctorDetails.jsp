<%-- 
    Document   : doctorDetails
    Created on : May 19, 2014, 4:00:38 PM
    Author     : Admin
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


        <script>
            function showProductCatOptn(opt)
            {
                
                document.getElementById("departmentname").value=opt;



            }
        </script>

        <script type="text/javascript">
            $(function() {


                $( "#update" )
                .button()
                .click(function() {
                    updateDoctor();

                });


                $( "#edit" )
                .button()
                .click(function() {
                    editable();
                    disableHRF();

                });

                $( "#cancel" )
                .button()
                .click(function() {
                    window.location='doctorDetails.jsp'
                });

                $( "#delete" )
                .button()
                .click(function() {
                    deleteProduct();


                });
                $( "#back" )
                .button()
                .click(function() {
                   // backButttonn();
                    window.location='doctorTab.jsp';

                });

            });



        </script>
        <script>
            function editable()
            {
                document.getElementById("update").style.display='';
                document.getElementById("cancel").style.display='';
                document.getElementById("delete").style.display='';

                document.getElementById("doctid").disabled=false;
                document.getElementById("doctrname").disabled=false;
                document.getElementById("doctrdesignation").disabled=false;
                document.getElementById("doctrqualifaication").disabled=false;
                document.getElementById("doctremailid").disabled=false;
                document.getElementById("doctrmobno").disabled=false;
                


            }
        </script>
        <script>
            function reformatData() {

                var dctotrname=document.getElementById("doctid").value;
                //alert('kaamal:-'+dctotrname);
                document.getElementById("departmentname").value=dctotrname;
            }
        </script>

        <script >
            function backButtton1()
            {
                //alert('button');
                window.location='doctorTab.jsp';

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

    <body onload="reformatData()" >
        <div  id="bord" >
            <form id="form1"  action="Controller?process=DoctorProcess&action=deleteDoctor&id=<c:out value='${detailsOfDoctor.doctid}'/>" method="POST" >
                <table width="100%" height="29" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td height="32" background="images/header-bg.png" style="background-repeat:repeat-x"><img src="images/back1.png" style="cursor: pointer" title="click to close" onclick="backButtton1()" /></td>
                        <td height="29" valign="top" background="images/header-bg.png" style="background-repeat:repeat-x"><div align="center"><span class="style3">Manage Doctor Information</span></div></td>
                    </tr>
                </table>
                <table width="100%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
                    <tr>
                        <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                <td width="36%" height="44"><div align="right"><span class="style1">Department</span></div></td>
                                <td width="5%">&nbsp;</td>
                                <td width="3%">:</td>
                                <td width="29%"><div align="left">
                                        <select style="width: 200px" name="doctid" id="doctid"  class="style7" disabled="true" >
                                            <option  ><c:out value="${detailsOfDoctor.departmentname.dptname}"/></option>
                                            <%
                                                        Class.forName("org.postgresql.Driver").newInstance();
                                                        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5433/plexus_version1", "postgres", "plexus");

                                                        Statement stmt = con.createStatement();
                                                        ResultSet rs = stmt.executeQuery("Select * from departmentname");
                                                        while (rs.next()) {
                                            %>
                                            <option  onclick="showProductCatOptn(this.label)"  label="<%=rs.getString(2)%>" value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
                                            <%
                                                        }
                                            %>
                                        </select>
                                        <br/>
                                        <input  type="text" id="departmentname" name="departmentname"/><!-- style="display: none" -->

                                    </div></td>
                                <td width="27%" colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="44"><div align="right"><span class="style1">Doctor Name</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                        <input type="text"  name="doctrname" id="doctrname" value="<c:out value="${detailsOfDoctor.doctname}"/>" style="width:200px" class="style7" disabled="true" />
                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="44"><div align="right"><span class="style1">Doctor Designation</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                        <input type="text" name="doctrdesignation" id="doctrdesignation" value="<c:out value="${detailsOfDoctor.doctdesignation}"/>" style="width:200px" class="style7" disabled="true"  />
                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="43"><div align="right"><span class="style1">Doctor Qualification</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                        <input type="text" name="doctrqualifaication" id="doctrqualifaication" value="<c:out value="${detailsOfDoctor.doctqualification}"/>" style="width:200px" class="style7" disabled="true" />
                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="45"><div align="right"><span class="style1">Doctor Email ID</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="left">
                                        <input type="text" name="doctremailid" id="doctremailid" value="<c:out value="${detailsOfDoctor.doctemailid}"/>" style="width:200px" class="style7" disabled="true"  />
                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="37"><div align="right"><span class="style1">Mobile No</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>

                                            <td>
                                                <div align="left" >
                                                    <input type="text" name="doctrmobno" id="doctrmobno" value="<c:out value="${detailsOfDoctor.doctmobno}"/>" style="width:200px" class="style7" disabled="true" />

                                                </div></td>
                                        </tr>

                            </tr>
                                            <tr style="display: none"><!-- style="display: none" -->
                                                <td height="45"><div align="right"><span class="style1">Doctor ID</span></div></td>
                                                <td>&nbsp;</td>
                                                <td>:</td>
                                                <td><div align="right">
                                                        <input type="text" name="dtrid" id="dtrid" style="width:200px" value="<c:out value="${detailsOfDoctor.doctid}"/>" disabled="true" class="style7" />
                                                    </div></td>
                                                <td colspan="3">&nbsp;</td>
                                            </tr>
                                                    <tr style="display: none">
                                                <td height="45"><div align="right"><span class="style1">Department ID</span></div></td>
                                                <td>&nbsp;</td>
                                                <td>:</td>
                                                <td><div align="right">
                                                        <input type="text" name="dptid" id="dptid" style="width:200px" value="<c:out value="${detailsOfDoctor.departmentname.departmentnameid}"/>" disabled="true" class="style7" />
                                                    </div></td>
                                                <td colspan="3">&nbsp;</td>
                                            </tr>
                                <tr>
                                    <td colspan="7"><table width="100%" height="34" border="0" align="center" cellpadding="0" cellspacing="0">

                                        </table></td>
                                </tr>
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

                            </table>
                        </td>
                    </tr>

                </table>

            </form>
                 <script type="text/javascript">
                     function updateDoctor()
            {
                var con=false
                con=confirm('Do You Want To Update Doctor');
                if(!con)
                {
                    form1.action="doctorDetails.jsp";
                }
                else
                {

                    var form1=document.getElementById("form1");
                    form1.action="Controller?process=DoctorProcess&action=updateDoctorDetails&id=<c:out value='${detailsOfDoctor.doctid}'/>&id1=<c:out value='${detailsOfDoctor.departmentname.departmentnameid}'/>";
                    form1.submit();
                    //return false;
                }


            }

            function deleteProduct()
            {
                var con=false
                con=confirm('Do You Want To Delete Doctor');
                if(!con)
                {
                    form1.action="doctorDetails.jsp";
                }
                else
                {
                    var form1=document.getElementById(form1);
                    //alert('U r Going to Delete this Product');
                    form1.action="kk.jsp";
                    //form1.action="Controller?process=ProductProcess&action=deleteProduct&id=<c:out value='${detailsOfProduct.productid}'/>";
                    form1.submit();

                }

            }
                 </script>



        </div>
    </body>
</html>
