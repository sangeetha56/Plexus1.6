<%-- 
    Document   : advancebillDetailToAddMore
    Created on : 3 Sep, 2017, 4:10:32 PM
    Author     : Lifecell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/datePicker/jquery-ui-1.8.18.custom.css">
        <link rel="stylesheet" href="css/graph/jquery.jqplot.css">

        <link rel="stylesheet" href="css/datePicker/demos.css">
        <script type="text/javascript" src="js/datePicker/jquery-1.7.1.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery-ui-1.8.17.custom.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.dialog.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.autocomplete.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.core.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.widget.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.datepicker.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.accordion.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/sliderAccess.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery-ui-timepicker-addon.js"></script>
        <script  type="text/javascript" src="js/datePicker/ui/jquery.ui.position.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.mouse.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.draggable.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.resizable.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.button.js"></script>
        <script src="js/watermark/watermark.js" type="text/javascript" ></script>
        <style type="text/css">
            <!--
            .labelCss {
                font-family: Tahoma;
                font-size: 11px;
                font-weight: bold;
            }
            .dataTextInActive {
                border-radius:1px;
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 12px;
                font-weight: bold;
                letter-spacing: normal;
                text-align: center;
                vertical-align: top;
                text-decoration:none;
            }
            .headerText {
                border-radius:3px;
                font-family: Tahoma;
                font-size: 12px;
                background-color: #4b6a84;
                color: #FFFFFF;
                font-weight: normal;
                width: auto ;
                height: 22px;
                vertical-align: middle;
                text-align: center;
                background-image: url("images/ui-bg_diagonals-small_50_466580_40x40.png");
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
            .smallheaderTD{
                color: #4b6a84;
                font-family: Tahoma;
                font-size: 11px;
                text-transform: uppercase;
                text-align: left;
                font-weight: bold;
            }
            .textFieldFixedWidth{
                width: 57px;
            }
            .subHeaderTD{
                color: #325F6D;
                font-family: Tahoma;
                font-size: 11px;
                text-transform: uppercase;
                text-align: left;
                font-weight: bold;
            }
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
            .alignLeft {
                font-family: Tahoma;
                font-size: 11px;
                font-style: normal;
                text-transform: capitalize;
                color: #325F6D;
                text-align: left;
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
            .style5 {
                font-size: 15px;
                font-family: Tahoma;

                color: black;
            }

            .dataText {
                border-radius:3px;
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 12px;
                letter-spacing: normal;
                text-align: center;
                vertical-align: middle;
                background-color: #E3EFFF;

            }


            -->
        </style>


        <title>.....</title>
        <script type="text/javascript">
            $(function() {
                $( "#print" )
                .button()
                .click(function() {
                    //alert('hhhh');
                    //CallPrint();

                });

            });
        </script>
        <script type="text/javascript">
            $(function() {

                $( "#printprop" )
                .button()
                .click(function() {

                });



            });



        </script>


        <script language="javascript" type="text/javascript">

            function CallPrint()
            {

                //alert('gdfgdf');
                //window.print();

                //Get the HTML of div
                var divElements = document.getElementById('printData').innerHTML;
                //Get the HTML of whole page
                var oldPage = document.body.innerHTML;

                //Reset the page's HTML with div's HTML only
                document.body.innerHTML =
                    "<html><head><title></title></head><body>" +
                    divElements + "</body>";

                //Print Page
                window.print();

                //Restore orignal HTML
                document.body.innerHTML = oldPage;


                /*
var DocumentContainer = document.getElementById('printData');
var WindowObject = window.open('', 'PrintWindow', 'width=750,height=650,top=50,left=50,toolbars=no,scrollbars=yes,status=no,resizable=yes');
var strHtml = "<html>\n<head>\n <link rel=\"stylesheet\" type=\"text/css\" href=\"test.css\">\n</head><body><div style=\"testStyle\">\n"
+ DocumentContainer.innerHTML + "\n</div>\n</body>\n</html>";
WindowObject.document.writeln(strHtml);
WindowObject.document.close();
WindowObject.focus();
WindowObject.print();
WindowObject.close();
                 */

            }

            function CallPrintFunction()
            {
                alert('CallPrintFunction');

                document.getElementById("hide1").style.display='';

                CallPrint();
            }
        </script>
        <script >
            function backButtton1()
            {

                window.history.back();

            }
        </script>

        <script>
        $(function() {

            $(document).ready(function() {
                $("#advancebilldate").val(getCurrentDate());
                $("#advancebilldate").datepicker();
            });
        });

        function getCurrentDate(){
            var today = new Date();
            var day=today.getDate();
            var month=today.getMonth()+1;
            var year=today.getFullYear();
            if(month <10){
                month="0"+month;

            }
            else {
                month=month;
            }
            if(day <10){
                day="0"+day;

            }
            else {
                day=day;
            }
            return month+"/"+day+"/"+year;

        }


        </script>

        <script language="Javascript">
        function validateButton()
        {
            if( document.getElementById("patientName").value.length==0 )

            {
                document.getElementById("patientName").style.background='red';

                alert("Enter the Patient  name");

            }

            /*      else if( document.getElementById("investigationnamebill").value.length==0 )

                {
                    document.getElementById("investigationnamebill").style.background='red';

                    alert("Please Select the Investigation Type  ");

                }

                else if( document.getElementById("investigationcharges").value.length==0 )

                {
                    document.getElementById("investigationcharges").style.background='';

                    alert("Please Enter the Investigation Charge  ");

                }   */



        }
        </script>

        <script language="Javascript">


        function valueExistsChangeColor()
        {
            if( document.getElementById("patientName").value.length!=0)

            {
                document.getElementById("patientName").style.background='white';

            }



            /*      else if( document.getElementById("investigationcharges").value.length!=0)

                {
                    document.getElementById("investigationcharges").style.background='white';

                }  */


        }
        </script>

        <script type="text/javascript">
        $(function() {


            $( "#save" )
            .button()
            .click(function() {
                addAdvanceBillChild();


            });
            $( "#reset" )
            .button()
            .click(function() {
            });

        });


        </script>



    </head>
    <body>
        <form id="form1"  action="" method="POST" >
            <%--    <table width="100%">
                    <tr>
                        <td  class="headerTD">Plexus

                </td>
            </tr>
            <tr>
                <td  class="headerTD1">Neuro Centre and Multispeciality clinic

                </td>
            </tr>
            <tr>
                <td  class="headerTD2">.......rejuvenate your zest for life

                </td>
            </tr>
        </table>
        <table width="100%"  id="table1" align="center">
            <tr >
                <td width="25%"  class="alignLeft" >Name</td>
                <td width="25%" >
                    <c:out value="${bill.visit.patient.name}" />
                </td>

                <td width="25%"  class="alignLeft" >Age/Sex</td>
                <td width="25%"  >
                    <c:out default="" value="${bill.visit.patient.age}" />&nbsp;&nbsp;<c:out default="" value="${patient.sex}" />
                </td>

            </tr>
            <tr>
                <td width="25%"   class="alignLeft" >Contact No</td>
                <td width="25%"  >
                    <c:out default="" value="${bill.visit.patient.telephoneno}" />
                </td>
                <td width="25%"  class="alignLeft">Date</td>
                <td  width="25%" >
                   <fmt:formatDate pattern="EEEE, dd MMMM yyyy " value="${bill.visit.visittime}" /> at <fmt:formatDate pattern="hh:mm a" value="${bill.visit.visittime}" />
                </td>
            </tr>

        </table>
            --%>
            <table width="100%">
                <tr>
                    <td height="32" background="images/header-bg.png" style="background-repeat:repeat-x"><img src="images/back1.png" style="cursor: pointer" title="click to close" onclick="backButtton1()" /></td>


                </tr>
            </table>
            <div id="printData">
                <table  width="100%">
                    <thead>
                        <tr  >

                            <td colspan="3" class="headerText" style="color:#000">Advance Bill Charges Details </td>


                        </tr>
                        <tr  >

                            <td colspan="3" class="headerText" style="color:#000">Patient Details</td>


                        </tr>

                    </thead>
                    <tbody>
                        <tr><td class="dataText" style="width: 45%">Invoice No: <c:out value="${advance.advancebillid}"/></td></tr>
                        <tr>
                            <td class="dataText" style="width: 45%">Patient Name: <c:out value="${advance.patient.name}" /></td>
                            <td class="dataText" style="width: 20%">Contact No:  <c:out value="${advance.patient.telephoneno}" /></td>
                            <td class="dataText">Visit Date: <fmt:formatDate pattern="dd MMMM yyyy " value="${advance.advancebilldate}" /> </td>

                        </tr>


                        <tr>
                            <td class="dataText" style="width: 45%">Card No: <c:out value="${advance.patient.cardno}" /></td>
                            <td class="dataText" style="width: 30%">Doctor: <c:out value="${advance.doctorinfo.doctname}" /></td><!-- dispense.dispensedmedicinebills.doctordepartment -->
                            <td class="dataText">Department :  <c:out value="${advance.doctorinfo.departmentname.dptname}" /></td>

                        </tr>



                    </tbody>
                </table>
                <table width="100%">
                    <thead>
                        <tr style="display: none" >

                            <td  class="headerText">Advance Bill Charges Details</td>


                        </tr>

                    </thead>

                </table>
                <TABLE id="dataTable" width="100%" border="1" >
                    <thead>
                        <tr >

                            <td class="headerText" style="color:#000">Sl No</td>
                            <td class="headerText" style="color:#000">Advance</td>
                            <td class="headerText" style="color:#000">Balace Amount</td>
                            <td class="headerText" style="color:#000">Total Amount</td>


                        </tr>
                    </thead>
                    <tbody>
                        <%
                                    int i = 1;
                        %>



                        <tr>
                            <td class="dataText" align="center"><%=i%></td>
                            <td class="dataText" align="center"><c:out value="${advance.advanceamount}" /></td>
                            <td class="dataText" align="center"><c:out value="${advance.paid}" /></td>
                            <td class="dataText" align="center"><c:out value="${advance.totalbill}" /></td>



                        </tr>
                        <%
                                    i++;
                        %>



                    </tbody>
                    <tfoot>


                        <tr id="hide1" style="display: none">
                            <td colspan="6"  align="center"  height="15px" valign="middle" align="center" style="font-family:verdana; font-weight:bold; font-size:10px; background-image:url(images/bar2.jpg); color:#FFFFCC">©Powered By Jeevan Jyoti Hospital</td>


                        </tr>



                    </tfoot>
                </TABLE>

                        <TABLE id="dataTable" width="100%" border="1" >
                    <thead>
                        <tr  >

                            <td colspan="6" class="headerText" style="color:#000">Advance Bill Charges Details Next </td>


                        </tr>
                        <tr >

                            <td class="headerText" style="color:#000">Sl No</td>
                            <td class="headerText" style="color:#000">Bill Date</td>
                            <td class="headerText" style="color:#000">Advance</td>
                            <td class="headerText" style="color:#000">Balace Amount</td>
                            <td class="headerText" style="color:#000">Total Amount</td>
                            <td class="headerText" style="color:#000">Bill Paid</td>


                        </tr>
                    </thead>
                    <tbody>
                        <%
                                    int j = 1;
                        %>

                        <c:forEach items="${advance.advancechildbills}" var="advancechild">

                        <tr>
                            <td class="dataText" align="center"><%=j%></td>
                            <td class="dataText" align="center"><c:out value="${advancechild.advancebilldate}" /></td>
                            <td class="dataText" align="center"><c:out value="${advancechild.advanceamountchild}" /></td>
                            <td class="dataText" align="center"><c:out value="${advancechild.remainingchildamount}" /></td>
                            <td class="dataText" align="center"><c:out value="${advancechild.totalbillchild}" /></td>
                            <td class="dataText" align="center"><c:out value="${advancechild.paidchild}" /></td>



                        </tr>
                        <%
                                    j++;
                        %>
                        </c:forEach>



                    </tbody>
                    <tfoot>


                        <tr id="hide1" style="display: none">
                            <td colspan="6"  align="center"  height="15px" valign="middle" align="center" style="font-family:verdana; font-weight:bold; font-size:10px; background-image:url(images/bar2.jpg); color:#FFFFCC">©Powered By Jeevan Jyoti Hospital</td>


                        </tr>



                    </tfoot>
                </TABLE>
            </div>
            <table id="dataTable" width="100%" border="0">
                <tr>
                    <td align="center" >
                        <%--  <a id="print" href="Controller?process=BillProcess&action=printConsultationCharge&id=<c:out value="${bill.id}"/>">Print</a>
                        --%>
                        <!--<input id="sub" type="submit" value="Print"  /> -->
                        <input type="button" id="print" value="Print" onclick="CallPrintFunction();" />
                    </td>


                </tr>

            </table>


            <table width="100%">
                <tr>
                    <td height="32" background="images/header-bg.png" style="background-repeat:repeat-x"><img src="images/back1.png" style="cursor: pointer" title="click to close" onclick="backButtton1()" />Add More</td>


                </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" >
                <tr>
                    <td width="20%" ><div align="left">&nbsp;</div></td>
                    <td width="1%" ><div align="left">&nbsp;</div></td>
                    <td width="29%" ><div align="left">&nbsp;</div></td>
                    <td width="23%" ><div align="left">&nbsp;</div></td>
                    <td width="1%" ><div align="left">&nbsp;</div></td>
                    <td width="26%" ><div align="left">&nbsp;</div></td>
                </tr>
                <tr>
                    <td height="28"><div align="right" class="style5">Patient Name</div></td>
                    <td><div align="right" class="style5">:</div></td>
                    <td><div align="left">
                            <label>
                                <input  type="text" name="patientName" id="patientName" style="width: 200px" value="<c:out value="${advance.patient.name}" />" readonly/> <input name="patientID" type="hidden" id="patientID" value="<c:out value="${advance.patient.id}" />" />
                            </label>
                        </div></td>
                    <td><div align="right" class="style5">Advance Bill Date</div></td>
                    <td><div align="right" class="style5">:</div></td>
                    <td><div align="left">
                            <label>
                                <input type="text" name="advancebilldate" id="advancebilldate" style="width: 100px" />
                            </label>
                        </div></td>
                </tr>
                <tr>
                    <td><div align="left">
                            <div align="left"><label>
                                    <input type="text" name="advancebillid" id="advancebillid" style="width: 100px" value="<c:out value="${advance.advancebillid}" />" readonly/>
                            </label></div>
                        </div></td>
                    <td><div align="left">&nbsp;</div></td>
                    <td><div align="left">&nbsp;</div></td>
                    <td><div align="left">&nbsp;</div></td>
                    <td><div align="left">&nbsp;</div></td>
                    <td><div align="left">&nbsp;</div></td>
                </tr>
                
                <tr >
                    <td height="21"><div align="left" >&nbsp;</div></td>
                    <td><div align="left">&nbsp;</div></td>
                    <td><div align="left">&nbsp;</div></td>
                    <td><div align="left">&nbsp;</div></td>
                    <td><div align="left">&nbsp;</div></td>
                    <td><div align="left">&nbsp;</div></td>
                </tr>



                <tr>
                    <td>
                        <div align="right" class="style5">Advance</div>
                    </td>
                    <td><div align="right" class="style5">:</div></td>
                    <td><div align="left">
                            <label>
                                <input type="text" name="advanceamountchild" id="advanceamountchild" style="width: 100px" />
                            </label>

                        </div></td>
                    <td><div align="right" class="style5">Total Amount</div></td>
                    <td><div align="right" class="style5">:</div></td>
                    <td><div align="left" id="state">

                            <label>
                                <input type="text" name="totalbillchild" id="totalbillchild" style="width: 100px" />
                            </label>

                        </div></td>
                </tr>
                <tr >
                    <td height="21"><div align="left" >&nbsp;</div></td>
                    <td><div align="left">&nbsp;</div></td>
                    <td><div align="left">&nbsp;</div></td>
                    <td><div align="left">&nbsp;</div></td>
                    <td><div align="left">&nbsp;</div></td>
                    <td><div align="left">&nbsp;</div></td>
                </tr>
                <tr>
                    <td>
                        <div align="right" class="style5">Bill Amount paid</div>
                    </td>
                    <td><div align="right" class="style5">:</div></td>
                    <td><div align="left">
                            <label>
                                <input type="text" name="paidchild" id="paidchild" style="width: 100px" />
                            </label>

                        </div></td>
                </tr>

                <tr>
                    <td>
                        <div align="right" class="style5">Balance Amount</div>
                    </td>
                    <td><div align="right" class="style5">:</div></td>
                    <td><div align="left">
                            <label>
                                <input type="text" name="remainingchildamount" id="remainingchildamount" style="width: 100px" />
                            </label>

                        </div></td>
                </tr>
            </table>





            <table id="table2" width="100%" border="0" align="center"  >

                <tr>
                    <td align="center">
                        <button id="save" onmouseover="validateButton();">Save</button>
                        <button id="reset" type="reset" >Cancel</button>

                    </td>
                </tr>


            </table>
        </form>
        <script type="text/javascript">

            function addAdvanceBillChild(){
                //alert('Hi for adding');
                var form1=document.getElementById("form1");
                form1.action="Controller?process=AdvanceProcess&action=addAdvanceChildBill";
                form1.submit();
            }

        </script>
    </body>
</html>
