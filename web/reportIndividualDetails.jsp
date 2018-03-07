<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : reportIndividualDetails
    Created on : Jul 17, 2014, 5:47:06 PM
    Author     : sultan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
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

            #jquery-overlay {
                position: absolute;
                top: 0;
                left: 0;
                z-index: 90;
                width: 100%;
                height: 500px;
            }
            #jquery-lightbox {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                z-index: 100;
                text-align: center;
                line-height: 0;
            }
            #jquery-lightbox a img { border: none; }
            #lightbox-container-image-box {
                position: relative;
                background-color: #fff;
                width: 250px;
                height: 250px;
                margin: 0 auto;
            }
            #lightbox-container-image { padding: 10px; }
            #lightbox-loading {
                position: absolute;
                top: 40%;
                left: 0%;
                height: 25%;
                width: 100%;
                text-align: center;
                line-height: 0;
            }
            #lightbox-nav {
                position: absolute;
                top: 0;
                left: 0;
                height: 100%;
                width: 100%;
                z-index: 10;
            }
            #lightbox-container-image-box > #lightbox-nav { left: 0; }
            #lightbox-nav a { outline: none;}
            #lightbox-nav-btnPrev, #lightbox-nav-btnNext {
                width: 49%;
                height: 100%;
                zoom: 1;
                display: block;
            }
            #lightbox-nav-btnPrev {
                left: 0;
                float: left;
            }
            #lightbox-nav-btnNext {
                right: 0;
                float: right;
            }
            #lightbox-container-image-data-box {
                font: 10px Verdana, Helvetica, sans-serif;
                background-color: #fff;
                margin: 0 auto;
                line-height: 1.4em;
                overflow: auto;
                width: 100%;
                padding: 0 10px 0;
            }
            #lightbox-container-image-data {
                padding: 0 10px;
                color: #666;
            }
            #lightbox-container-image-data #lightbox-image-details {
                width: 70%;
                float: left;
                text-align: left;
            }
            #lightbox-image-details-caption { font-weight: bold; }
            #lightbox-image-details-currentNumber {
                display: block;
                clear: left;
                padding-bottom: 1.0em;
            }
            #lightbox-secNav-btnClose {
                width: 66px;
                float: right;
                padding-bottom: 0.7em;
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
                $( "#saveAndSetToday" )
                .button()
                .click(function() {
                    addPatientWithTodaysAppointment();

                });
                $( "#save" )
                .button()
                .click(function() {
                    addPatient();
                    

                });
                $( "#save1" )
                .button()
                .click(function() {
                    addReports();


                });
            });


        </script>



        <script>
            $(function() {
                $( "#reptdate" ).datepicker({changeYear: true, changeMonth: true});
                $( "#anim" ).change(function() {
                    $( "#reptdate" ).datepicker( "option", "showAnim", $( this ).val() );
                });
            });
        </script>

        <script type="text/javascript">
            $(function() {





                $( "#update" )
                .button()
                .click(function() {



                    updateReport();


                });


                $( "#edit" )
                .button()
                .click(function() {



                    editable();
                    


                });

                $( "#cancel" )
                .button()
                .click(function() {


                    window.location='reportIndividualDetails.jsp'


                });

                $( "#delete" )
                .button()
                .click(function() {
                    deleteReport();


                });
                $( "#back" )
                .button()
                .click(function() {
                   
                    window.location='patientDetails_11.jsp'

                });

                $( "#assign" )
                .button()
                .click(function() {
                    //assignToCustomer();
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


                

                //  document.getElementById("reptname").removeAttribute('readonly');
                // document.getElementById("reptdate").removeAttribute('readonly');
                // document.getElementById("reportremarks").removeAttribute('readonly');
                //document.getElementById("reportobservation").removeAttribute('readonly');
                //document.getElementById("reptname").removeAttribute('readonly');
                document.getElementById("reptname").disabled=false;
                document.getElementById("reptdate").disabled=false;
                document.getElementById("reportremarks").disabled=false;
                document.getElementById("reportobservation").disabled=false;
                

            }
        </script>
        <script >
            function backButtton1()
            {

                window.location='patientDetails_11.jsp';

            }
        </script>
        <script type="text/javascript">
            <!--
            function MM_preloadImages() { //v3.0
                var d = document; if (d.images) {
                    if (!d.MM_p) d.MM_p = new Array();
                    var i, j = d.MM_p.length, a = MM_preloadImages.arguments; for (i = 0; i < a.length; i++)
                        if (a[i].indexOf("#") != 0) { d.MM_p[j] = new Image; d.MM_p[j++].src = a[i]; }
                }
            }
            function MM_findObj(n, d) { //v4.01
                var p, i, x; if (!d) d = document; if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
                    d = parent.frames[n.substring(p + 1)].document; n = n.substring(0, p);
                }
                if (!(x = d[n]) && d.all) x = d.all[n]; for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
                for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
                if (!x && d.getElementById) x = d.getElementById(n); return x;
            }
            function MM_swapImgRestore() { //v3.0
                var i, x, a = document.MM_sr; for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
            }
            function MM_swapImage() { //v3.0
                var i, j = 0, x, a = MM_swapImage.arguments; document.MM_sr = new Array; for (i = 0; i < (a.length - 2); i += 3)
                    if ((x = MM_findObj(a[i])) != null) { document.MM_sr[j++] = x; if (!x.oSrc) x.oSrc = x.src; x.src = a[i + 2]; }
            }
            //-->
        </script>
        <script>
            function reformatDate() {
                //alert('kk');

                if(document.getElementById("reptdate").value!='')
                {


                    var dateF=document.getElementById("reptdate");
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
            }

            
            



        </script>


    </head>
    <body onload="reformatDate();">
        <form id="form1" action="" method="post" enctype="multipart/form-data">
            <table width="100%">
                <tr>
                    <td height="32" background="images/header-bg.png" style="background-repeat:repeat-x"><img src="images/back1.png" style="cursor: pointer" title="click to close" onclick="backButtton1()" /></td>


                </tr>
                <tr>

                    <td  class="headerTD">Report Detail</td>

                </tr>
            </table>
            <%--    <table id="table2" width="100%" border="0" align="center" >

                            <tr>
                                <td width="16%"  class="alignRight" >Report Name : &nbsp;  </td>
                                <td width="28%">
                                    <label>
                                        <input name="reptname" type="text" class="textField" id="reptname" size="30" value="<c:out value="${reportDetails.reportname}"/>"  />
                                    </label>
                                </td>
                                </tr>

                                    <tr><td><br/></td></tr>
                                    <tr></tr>
                                    <tr>
                                    <td>
                                        <br/>
                                    </td>
                                </tr>

                                <tr>
                                <td width="16%"  class="alignRight" > Report Date : &nbsp;  </td>
                                <td width="28%">
                                    <label>
                                        <input name="reptdate" type="text" class="textField" id="reptdate" size="30" data-validate="validate(required)" value="<c:out value="${reportDetails.reportdate}"/>"  >
                                    </label>
                                </td>
                                </tr>

                                <tr>
                                    <td>
                                        <br/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <br/>
                                    </td>
                                </tr>
                                <tr>
                                <td width="16%"  class="alignRight" >Remarks :</td>
                                <td width="28%">
                                    <label>
                                        <textarea name="reportobservation" cols="30" rows="5"  id="reportobservation"><c:out value="${reportDetails.remarks}"/></textarea>
                                    <!--    <input name="reportremarks" type="text" class="textField" id="reportremarks" size="30" data-validate="validate(required)"  value="<c:out value="${reportDetails.remarks}"/>">  -->
                                    </label>
                                </td>
                                </tr>

                                <tr>
                                    <td>
                                        <br/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <br/>
                                    </td>
                                </tr>

                                <tr>
                                <td width="16%"  class="alignRight" >Observation :</td>
                                <td width="28%">
                                    <label>
                                        <textarea name="reportobservation" cols="30" rows="5"  id="reportobservation"><c:out value="${reportDetails.observation}"/></textarea>
                                    <!--    <input name="reportobservation" type="text" class="textField" id="reportobservation" size="30" data-validate="validate(required)" value="<c:out value="${reportDetails.observation}"/>" >  -->
                                    </label>
                                </td>
                                </tr>

                                <tr>
                                    <td>
                                        <br/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <br/>
                                    </td>
                                </tr>

                                <tr>
                                <td width="16%"  class="alignRight" >Attached Report :</td>
                                <td width="28%">
                                    <label>
                                        <input name="imagelocation" type="text" class="textField" id="imagelocation" size="30" value="<c:out value="${reportDetails.epmty}"/>"  />
                                        <img src="<c:out value="${reportDetails.epmty}"/>" width="20%" height="100%" />
                                    </label>
                                </td>
                                </tr>


                                <tr>
                                    <td width="35%"  class="alignRight" >Attach Images : &nbsp;  </td>

                                    <td align="left">
                                        <label>

                                           <input type="file" id="reportfile" name="reportfile" accept="image/*"  multiple="muliple" required/><br />

                                        </label>
                                    </td>
                                </tr>


                        </table>  --%>

            <table id="table3" width="100%" border="0" align="center" >

                <tr>
                    <td width="16%"  class="alignRight" >Report Name : &nbsp;  </td>
                    <td width="28%">
                        <label>
                            <input disabled name="reptname" type="text" class="textField" id="reptname" size="30" value="<c:out value="${reportDetails.reportname}"/>"  />
                        </label>
                    </td>
                </tr>


                <tr><td><br/></td></tr>

                <tr>
                    <td width="16%"  class="alignRight" > Report Date : &nbsp;  </td>
                    <td width="28%">
                        <label>
                            <input disabled name="reptdate" type="text" class="textField" id="reptdate" size="30" data-validate="validate(required)" value="<c:out value="${reportDetails.reportdate}"/>"  >
                        </label>
                    </td>
                </tr>

                <tr>
                    <td>
                        <br/>
                    </td>
                </tr>
                <tr>
                    <td width="16%"  class="alignRight" >Remarks :</td>
                    <td width="28%">
                        <label >
                            <textarea disabled name="reportremarks" cols="30" rows="3"  id="reportremarks"><c:out value="${reportDetails.remarks}"/></textarea>
                            <!--    <input name="reportremarks" type="text" class="textField" id="reportremarks" size="30" data-validate="validate(required)"  >  -->
                        </label>
                    </td>
                </tr>

                <tr>
                    <td>
                        <br/>
                    </td>
                </tr>
                <tr>
                    <td width="16%"  class="alignRight" >Observation :</td>
                    <td width="28%">
                        <label>
                            <textarea disabled name="reportobservation" cols="30" rows="3"  id="reportobservation"><c:out value="${reportDetails.observation}"/></textarea>
                            <!--  <input name="reportobservation" type="text" class="textField" id="reportobservation" size="30" data-validate="validate(required)"  >  -->
                        </label>
                    </td>
                </tr>

                <tr>
                    <td>
                        <br/>
                    </td>
                </tr>
                <tr>
                    <td width="16%"  class="alignRight" >Attached Report :</td>
                    <td width="28%"><div id="gallery1">
                            <label>
                                <input name="imagelocation" type="text" class="textField" id="imagelocation" size="30" value="<c:out value="${reportDetails.epmty}"/>"  />
                                <a href="<c:out value="${reportDetails.epmty}"/>"> <img src="<c:out value="${reportDetails.epmty}"/>" width="20%" height="100%" /></a>
                            </label>
                            <script type="text/javascript">
                                // BeginWebWidget lightbox_gallery

                                $(function () {
                                    $('#gallery1 a').lightBox();
                                });


                                // EndWebWidget lightbox_gallery
                            </script></div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br/>
                    </td>
                </tr>
                <tr>
                    <td width="35%"  class="alignRight" >Attach Images : &nbsp;  </td>

                    <td align="left">
                        <label>

                            <input type="file" id="reportfile" name="reportfile" accept="*"  multiple="muliple" required/><br>

                        </label>
                    </td>
                </tr>


                <tr></tr>
                <tr>
                    <td>
                        <br/>
                    </td>
                </tr>

                <tr>
                </tr>
            </table>
        </form>
        <%--          <table id="table2" width="100%" border="0" align="center" >

                                        <tr>
                                           <td>
                            <span id="update" >Update</span>

                        </td>
                        <td>
                            <span  id="cancel">Cancel</span>
                        </td>
                        <td>
                            <span id="delete" >Delete</span>
                        </td>
                                        </tr>
                                    </table>   --%>

        <table id="table2" width="10%" border="0" align="center"  >

            <tr>
                <td align="center">

                    <span id="edit"> Edit</span>


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

        <script type="text/javascript">
            function redirectUrl(){

                var form1=document.getElementById("form1");

                form1.action="Controller?process=PatientProcess&action=addWithAppointment";
                form1.submit();

            }


            function updateReport()
            {
                var con=false
                con=confirm('Do You Want To Update Report');
                if(!con)
                {
                    form1.action="reportIndividualDetails.jsp";
                }
                                            else
                {
                    //alert('Patient id:-'+<c:out  value='${reportDetails.patient.id}'/>);

                                                var form1=document.getElementById("form1");
                    form1.action="Controller?process=ReportProcess&action=updateReport&id=<c:out  value='${reportDetails.reportid}'/>&id2=<c:out  value='${reportDetails.patient.id}'/>";
                    form1.submit();
                    return false;
                }


            }

            

            function deleteReport()
            {
                var con=false
                con=confirm('Do You Want To Delete Report');
                if(!con)
                {
                   
                    form1.action="reportIndividualDetails.jsp";
                }
                                            else
                {
                                                //alert('Report id:-'+<c:out  value='${reportDetails.reportid}'/>);
                    //alert('Patient id:-'+<c:out  value='${reportDetails.patient.id}'/>);
                    var form1=document.getElementById("form1");
                                                //alert('U r Going to Delete this contact');
                    form1.action="Controller?process=ReportProcess&action=deleteReport&id=<c:out  value='${reportDetails.reportid}'/>&id2=<c:out  value='${reportDetails.patient.id}'/>";
                    form1.submit();

                }


            }
            function backButtton()
            {
                //alert('hhh');
                var form1=document.getElementById(form1);
                form1.action="Controller?process=ContactProcess&action=viewAll";
                //form1.action="kk.jsp";
                form1.submit();


            }



        </script>
    </body>
</html>
