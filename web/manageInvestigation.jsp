<%-- 
    Document   : manageInvestigation
    Created on : Aug 1, 2014, 6:15:29 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.sql.*"%>
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
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.dialog.js"></script>
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

            .alignRightHead {
                font-family: Tahoma;
                font-size: 12px;
                font-style: normal;
                text-transform: capitalize;
                color: #325F6D;


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
                        color: red;
                        text-transform: capitalize;
                    }



            -->
        </style>

        <script type="text/javascript">
            $(function() {


                $( "#save" )
                .button()
                .click(function() {
                    addInvestigation();


                });

                $( "#delete" )
                .button()
                .click(function() {
                    deleteInvestigation();

                });

                $( "#save1" )
                .button()
                .click(function() {
                    addInvestigation1();


                });

                $( "#edit" )
                .button()
                .click(function() {
                    editInvestigation();


                });

                $( "#reset" )
                .button()
                .click(function() {

                   });

            });


        </script>
        <script>
            $(function() {
                $( "#tabs" ).tabs();

            });
        </script>

          <script>

            function viewCountryNames()
            {

             location.href="Controller?process=CountryProcess&action=viewAll"
            }
            </script>
        <script>
            function showCountryTypeOptn(opt,val)
            {

                document.getElementById("investigationName").value=opt;
                 document.getElementById("investigationid").value=val;



            }
        </script>

        <script >
            function backButtton1()
            {
                //alert('button');
                window.history.back();

            }
        </script>

        <script language="Javascript">
            function validateButton()
            {
                if( document.getElementById("InvestigationtypeName").value.length==0 )

                {
                    document.getElementById("InvestigationtypeName").style.background='red';

                    alert("Enter Investigation Type Name");

                }



            }

            function validateButton1()
            {
                if( document.getElementById("investigationName").value.length==0 )

                {
                    document.getElementById("investigationName").style.background='';

                    alert("Investigation Type Name can't be Empty");

                }



            }
        </script>
        <script language="Javascript">


            function valueExistsChangeColor()
            {
                if( document.getElementById("InvestigationtypeName").value.length!=0)

                {
                    document.getElementById("InvestigationtypeName").style.background='white';

                }


            }
        </script>

    </head>
    <body>

        <form id="form1"  action="" method="post"  >
            <div >
                             <table width="100%" height="29" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td height="32" background="images/header-bg.png" style="background-repeat:repeat-x"><img src="images/back1.png" style="cursor: pointer" title="click to close" onclick="backButtton1()" /></td>
                                    <td height="29" valign="top" background="images/header-bg.png" style="background-repeat:repeat-x"><div align="center"><span class="style3">Manage Investigation Type</span></div></td>
                                </tr>
                             </table>
                <div id="tabs">
                    <ul>
                        <li onmouseover="" ><a href="#tabs-1"> Manage Investgation Type</a></li>  <!-- onmouseover="viewCountryNames();" -->
                          <li><a href="#tabs-2">Add New-Investigation</a></li>



                    </ul>


        <div id="tabs-1">
             <table width="100%" height="29" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td height="29" valign="top" background="images/header-bg.png" style="background-repeat:repeat-x"><div align="center"><span class="style3">Add Investigation </span></div></td>
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




                                                    </div></td>
                                                <td width="27%" colspan="3">&nbsp;</td>
                                            </tr>



                                            <tr>
                                                <td height="44"><div align="right"><span class="style1">Investigation Name:</span></div></td>
                                                <td>&nbsp;</td>
                                                <td>:</td>
                                                <td><div align="left">
                                                        <input type="text" name="investigationName" id="investigationName" style="width:180px" class="style7" />
                                                    </div></td>
                                                     <td><div align="right">
                                                        <input type="text" name="investigationid" id="investigationid" style="width:50px" />
                                                    </div></td>
                                                <td colspan="3">&nbsp;</td>
                                            </tr>



                                            <tr>
                                                <td  height="44"><div align="right"><span class="style1" style="display: none">Department Name</span></div></td>
                                                <td>&nbsp;</td>
                                                <td ><label style="display: none">:</label></td>
                                                <td><div align="left">

                                                        <select  style="width: 180px;" class="style7" name='countryID'  onchange="showState(this.value)" size="10">

                                                          <%
                                                                        Class.forName("org.postgresql.Driver").newInstance();
                                                                        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5433/plexus_version1", "postgres", "plexus");

                                                                        Statement stmt = con.createStatement();
                                                                        ResultSet rs = stmt.executeQuery("Select * from investigation");
                                                                        while (rs.next()) {
                                                          %>
                                                            <option  onclick="showCountryTypeOptn(this.label,this.value)"  label="<%=rs.getString(2)%>" value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
                                                            <%
                                                                        }
                                                            %>
                                                        </select>


                                                        <br/>
                                                        <br/>

                                                    </div></td>
                                                <td colspan="3">&nbsp;</td>
                                            </tr>








                                            <tr>
                                                <td>

                                                </td>
                                                <td>

                                                </td>
                                                <td>

                                                </td>
                                                <td align="left" colspan="8">
                                                    <span id="save1" onmouseover="validateButton1();">Save</span>
                                                    <span id="edit" onmouseover="validateButton1();">Edit</span>
                                                    <span id="delete">Delete</span>

                                                </td>
                                                <td>

                                                </td>


                                            </tr>


                                        </table>


                            </table>
                        </div>
                    <div id="tabs-2" align="center">






                         <table width="100%" height="29" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td height="29" valign="top" background="images/header-bg.png" style="background-repeat:repeat-x"><div align="center"><span class="style3">Add New Investigation Type</span></div></td>
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
                                <td height="44"><div align="right"><span class="style1">Investigation Type Name</span></div></td>
                                <td>&nbsp;</td>
                                <td>:</td>
                                <td><div align="right">
                                        <input type="text" name="InvestigationtypeName" id="InvestigationtypeName" onkeypress="valueExistsChangeColor()" style="width:180px" class="style7" />
                                    </div></td>
                                <td colspan="3">&nbsp;</td>
                            </tr>



                        </table>
                        <br/>
                         <br/>
                          <br/>

            </table>

                        <table id="table2" width="100%" border="0" align="center"  >

                                    <tr>
                                        <td align="center">
                                            <button id="save" onmouseover="validateButton();">Save</button>
                                            <button id="reset" type="reset" >Cancel</button>

                                        </td>
                                    </tr>


                                </table>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                        <br/>

                            </div>



                    </div>


                </div>




        </form>
        <script type="text/javascript">

            function addInvestigation(){
          //var country=document.getElementById("DepartmentName");

                var form1=document.getElementById("form1");
                 alert(form1.InvestigationtypeName.value)
                form1.action="Controller?process=InvestigationProcess&action=add";
              form1.submit();

            }


            function deleteInvestigation(){
                var con=false
                con=confirm('Do You Want To Delete Selected Investigation');
                if(!con)
                {
                    form1.action="manageInvestigation.jsp";
                }
                else
                    {
                        var form1=document.getElementById("form1");
                        form1.action="Controller?process=InvestigationProcess&action=delete";
                        form1.submit();

                    }

            }

            function addInvestigation1(){
                //var country=document.getElementById("departmentName");

                var form1=document.getElementById("form1");
                 alert('mk:-'+form1.investigationName.value);
                 var con=false
                con=confirm('Do You Want To Add Selected investigation');
                if(!con)
                {
                    form1.action="manageInvestigation.jsp";
                }
                else
                    {
                        form1.action="Controller?process=InvestigationProcess&action=add1";
                        form1.submit();

                    }



            }
            function editInvestigation(){
                var con=false
                con=confirm('Do You Want To Edit Selected Investigation');
                if(!con)
                {
                    form1.action="manageInvestigation.jsp";
                }
                else
                    {
                        var form1=document.getElementById("form1");
                        form1.action="Controller?process=InvestigationProcess&action=editInvestigation";
                        form1.submit();

                    }

            }
        </script>
    </body>
</html>
