<%-- 
    Document   : bedSearch
    Created on : Jul 22, 2016, 3:19:46 PM
    Author     : kamal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html >
    <head >
        <%
                    response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
                    response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
                    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
                    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css" title="currentStyle">
            @import "css/dataTable/css/demo_page.css";
            @import "css/dataTable/css/jquery.dataTables.css";
        </style>
        <link rel="stylesheet" href="css/datePicker/jquery-ui-1.8.17.custom.css">
        <link rel="stylesheet" href="css/datePicker/demos.css">
        <!--<script type="text/javascript" language="javascript" src="js/dataTable/jquery.js"></script>-->
        <script type="text/javascript" src="js/datePicker/jquery-1.7.1.js"></script>
        <script type="text/javascript" language="javascript" src="js/dataTable/jquery.dataTables.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery-ui-1.8.17.custom.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.core.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.widget.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.button.js"></script>

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
            -->

            body{
                padding:0px;
                margin:0px;
            }
            .header {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 12px;
                background-color: #4b6a84;
            }
            .table {
                background-color: #3399CC;
                text-align: center;
                width: auto;


            }
            .headerText {
                border-radius:3px;
                width: 10px;
                font-family: Tahoma;
                font-size: 12px;
                background-color: #4b6a84;
                color: #FFFFFF;
                font-weight: normal;
                width: auto ;
                height: 22px;
                vertical-align: middle;
                text-align: center;

            }
            .dataText {
                border-radius:3px;
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 13px;
                letter-spacing: normal;
                text-align: center;
                background-color: #E3EFFF;

            }
            .dataTextInActive {
                border-radius:3px;
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 12px;
                font-weight: bold;
                letter-spacing: normal;
                text-align: left;
                background-color: #E3EFFF;
                text-decoration:none;
            }
            .dataTextActive {
                border-radius:3px;
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 12px;
                font-weight: bold;
                letter-spacing: normal;
                text-align: left;
                background-color: #E3EFFF;
                text-decoration: underline;
            }
            .dataTextHidden {
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 13px;
                letter-spacing: normal;
                text-align: center;
                background-color: #E3EFFF;

            }
            .wrapper
            {
                width:100%;
                margin:0 auto;
                float:none;
                height:auto;
                font-family:sans-serif;

            }
            .header_new
            {
                background:#4b6a84; padding:5px 5px; color: #fff; font-size: 18px;
            }
            .one{padding-bottom: 1px;}
            .one table,th,td{font-size: 12px;padding: 0px 10px;}
            .one th
            {
                background:#4b6a84;
                color:#fff;
            }
            .one td
            {
                background-color:#E3EFFF;
                color:#000;
            }
            .two td{border-collapse:collapse;border: 0px solid black;}
            .three td{border-collapse:collapse;border: 0px solid black;}
            .four td{border-collapse:collapse;border: 0px solid black;}
            ul.pagination {
                display: inline-block;
                padding: 2px 0px;
                margin: 0;

            }

            ul.pagination li {display: inline;}

            ul.pagination li a {
                color: black;
                float: left;
                padding: 2px 8px;
                text-decoration: none;
                background-color: #5384c7;;
                margin-left: 2px;
                border: 1px solid #666;
                font-size: 12px;
            }

            .pagination li:first-child a {
                border-top-left-radius: 5px;
                border-bottom-left-radius: 5px;
            }

            .pagination li:last-child a {
                border-top-right-radius: 5px;
                border-bottom-right-radius: 5px;
            }

            ul.pagination li a.active {
                background-color: rgb(221,221,221);
                color: white;
                border: 1px solid #555555;
            }



            ul.pagination li a:hover:not(.active) {background-color: #ddd;}
        </style>
        <script type="text/javascript" src="js/datetimepicker_css.js"></script>





        <script type="text/javascript" charset="utf-8">
            $(document).ready(function() {
                $('#myTable').dataTable( {
                    "sScrollY": "380px",
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": true,
                    "bInfo": false,
                    "bAutoWidth": false
                } );
            } );
        </script>


        <script type="text/javascript">
            $(function(){
                $("#delete").button({
                    icons:{
                        primary: "ui-icon-trash"
                    }
                }).click(function(){
                    deleteRecords();
                    return false;

                });
                $('#chckHead').click(function () {
                    var length = $('.chcktbl:checked').length;
                    var trLength=$('.trClass').length;
                    if(length>0){
                        $('.chcktbl:checked').attr('checked', false);
                        this.checked=false;

                    }
                    else{
                        if (this.checked == false) {
                            $('.chcktbl:checked').attr('checked', false);
                        }
                        else {
                            $('.chcktbl:not(:checked)').attr('checked', true);
                        }

                    }

                });
                $('.chcktbl').click(function () {
                    var length = $('.chcktbl:checked').length;
                    var trLength=$('.trClass').length;
                    alert(tdLength);
                    if (length > trLength) {

                        $('.chcktbl:not(:checked)').attr('disabled', true);
                    }
                    else {
                        $('.chcktbl:not(:checked)').attr('disabled', false);
                    }
                });

            });


        </script>
        <!------------------------------------------------- ADDED JAVASCRIPT FOR FILTERING TABLE CONTENTS--------------------------------------------------------------  -->
        <script type="text/javascript">
            function filter2 (phrase, _id)
            {
                var words = phrase.value.toLowerCase().split(" ");
                var table = document.getElementById(_id);
                var ele;
                var dd=table.rows.length;
                //alert(dd);
                var aa=dd/2;

                var display=true;

                for (var r = 0; r < table.rows.length; r++)
                {

                    ele = table.rows[r].innerHTML.replace(/<[^>]+>/g,"");
                    var displayStyle = 'none';
                    for (var i = 0; i < words.length; i++)
                    {
                        if (ele.toLowerCase().indexOf(words[i])>=0)
                        {
                            displayStyle = '';
                        }
                        else
                        {
                            displayStyle = 'none';
                            dd=dd-1;
                            display=false;
                            break;
                        }
                    }
                    table.rows[r].style.display = displayStyle;
                }

                var label = document.getElementById("labelDisplay");
                if(display==true)
                {
                    //alert('aa'+aa);
                    label.innerHTML = "UnMatching Results: "+aa;
                    label.style.display='none';
                }
                else
                {
                    //alert('dd'+dd);
                    label.innerHTML ="Matching Results: "+dd;
                    label.style.display='block';
                }


            }

        </script>
        <script>
            function retFalse(){
                return false;
            }
            function isEnterKey(e)
            {
                var keynum = window.event ? e.keyCode : e.which
                return keynum==13
                document.form1.onsubmit=retFalse();
            }
        </script>

        <!--------------------------END OF ADDITION----------------------------------------------------------------------------------------  -->

        <script language="Javascript">
            function onsearchPatientByCardNo()
            {
                if( document.getElementById("patientcardNoSearch").value.length==0)
                {
                    document.getElementById("patientcardNoSearch").style.background='yellow';
                    alert("Enter The Value Before Clicking");

                    return false;
                }

                else
                {
                    searchPatientByCardNo();
                }

            }

            function searchPatientByName()
            {

                if( document.getElementById("primaryName").value.length==0)

                {
                    document.getElementById("primaryName").style.background='yellow';
                    alert("Enter The Value Before Clicking");

                    return false;
                }

                else
                {
                    searchByName();
                }


            }

            function searchPatientByMobileNo()
            {
                if( document.getElementById("patientmobileNoSearch").value.length==0)
                {
                    document.getElementById("patientmobileNoSearch").style.background='yellow';
                    alert("Enter The Value Before Clicking");


                    return false;
                }

                else
                {
                    searchByMobileNo();
                }

            }

            function searchPatientByTEXT()
            {
                if( document.getElementById("byText").value.length==0)

                {
                    document.getElementById("byText").style.background='yellow';
                    alert("Enter The Value Before Clicking");

                    return false;
                }

                else
                {
                    searchPatientByTextInput();
                }


            }

            function searchContactByInputNo()
            {
                if( document.getElementById("byNumber").value.length==0)

                {
                    document.getElementById("byNumber").style.background='yellow';
                    alert("Enter The Value Before Clicking");

                    return false;
                }

                else
                {
                    searchContactByNumber();
                }


            }



            function searchBedByCondition()
            {
                alert('select condition');
                var roomtypeSelect=document.getElementById("roomtype").valueOf();
                var statusSelect=document.getElementById("statusFullEmpty").valueOf();
                alert('roomtypeSelect:-'+roomtypeSelect+':-statusSelect'+statusSelect);

                if( document.getElementById("roomtype").value.length!=0 && document.getElementById("statusFullEmpty").value.length==0 )

                {
                    alert("You have selected bed search by type");
                    //searchPatientByCardNo();

                }

                else if( document.getElementById("statusFullEmpty").value.length!=0 && document.getElementById("roomtype").value.length==0 )

                {
                    alert("You have selected bed search by status");
                    //searchByName();

                }

                

                else
                {
                    alert('Caution!! Multiple Condition are not allowed. Please Search by Only One condition!');
                }


            }
        </script>

    </head>
    <body>
        <form id="form1"  action="" method="POST" >
            <h3 style="background-image:url(images/header-bg.png);width:100%;color:#fff;text-align:center;padding: 8px 0px;margin: 0px;">Bed Search</h3>
            <table style="width:100%;">
                <tr style="width:1000px;" align="center">
                    <td></td>
                    <td></td>
                </tr>
                <tr style="width:1000px;" align="center">
                    <td style="width:50%;">By Type  :

                        <select name="roomtype" id="roomtype"  style="width:100px" onchange="searchByBedType()"><!-- onclick="searchByRoomType()" -->

                            <option  >Select </option>
                            <%
                                        Class.forName("org.postgresql.Driver").newInstance();
                                        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5433/plexus_version1", "postgres", "plexus");

                                        Statement stmt = con.createStatement();
                                        ResultSet rs = stmt.executeQuery("Select * from roomtype");
                                        while (rs.next()) {
                            %>
                            <option   label="<%=rs.getString(3)%>" value="<%=rs.getString(1)%>"><%=rs.getString(3)%></option>
                            <%
                                        }
                            %>


                        </select>


                    </td>
                    <td style="width:50%;">Status:
                        <select name="statusFullEmpty" id="statusFullEmpty" onchange="searchByBedStatus()" style="width:100px">
                            <option value="null">Select</option>
                            <option value="false">Empty</option>
                            <option value="true">Occupied</option>
                        </select>
                    </td>
                </tr>
                <tr style="width:100px; display: none;" align="center">
                    <td style="width:100%;" colspan="2">
                        <input type="button" value="Search" id="" name="" onclick="return searchBedByCondition();" class="ui-button-text" style="padding: 0.2em 1em;background-color: #EAF4FD;">

                </tr>


            </table>
            <hr/>


            <div class="wrapper" ><!--wrapper started-->
                <div class="header_new">
                    <center><strong >Bed Search List </strong></center>
                </div>







                <div class="">
                    <table width="100%" style="border-color:#4b6a84;"   id="myTable">
                        <thead>
                            <tr>
                                <!--     <th class="headerText"><input  type="checkbox" id = "chckHead" /></th> -->
                                <th title="click to sort" class="headerText" >Sl No</th>
                                <th title="click to sort" class="headerText" >Bed No</th>
                                <th title="click to sort" class="headerText">Room Code</th>
                                <th title="click to sort" class="headerText">Floor No</th>
                                <th title="click to sort" class="headerText">Type</th>
                                <th title="click to sort" class="headerText">Charges</th>
                                <th title="click to sort" class="headerText">Status</th>

                            </tr>
                        </thead>
                        <tbody  >

                            <%
                                        int i = 1;
                            %>


                            <c:forEach items="${bedSetUpList}" var="bed">

                                <tr class="trClass"  >

                                    <td class="dataText"><%=i%></td>
                                    <td  class="dataText"><a  class="dataTextInActive"  href="Controller?process=BedManagement&action=viewDetails&id=<c:out  value='${bed.beddetailsid}'/>"><c:out value="${bed.bedno}"/></a></td>
                                    <td  class="dataTextInActive"><a class="dataTextInActive" href="Controller?process=BedManagement&action=viewDetails&id=<c:out  value='${bed.beddetailsid}'/>"><c:out value="${bed.roomndbedsetup.roomcode}"/></a></td>
                                    <td class="dataText"><c:out value="${bed.roomndbedsetup.roomsetup.floorno}"/></td>
                                    <td  class="dataText"><c:out value="${bed.roomndbedsetup.roomtype.roomtype}"/></td>
                                    <td class="dataText"><c:out  value="${bed.roomndbedsetup.roomtype.roomcharges}"/></td>
                                    <c:choose>
                                        <c:when test="${bed.occupied=='False'}">


                                            <td class="dataText"><span class="style9">Not Occupied</span></td>

                                        </c:when>
                                        <c:otherwise>


                                            <td class="dataText"><span class="style9">Occupied</span></td>

                                        </c:otherwise>
                                    </c:choose>

                                </tr>
                                <%
                                            i++;
                                %>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>




            </div>  <!--wrapper closed-->



        </form>



        <script type="text/javascript">

            function searchByBedType()
            {

                alert('for search by room type process');
                var form1=document.getElementById("form1");
                form1.action="Controller?process=BedManagement&action=searchByBedType";

                form1.submit();

            }
            function searchByBedStatus(){
                alert('step 2');
                var form1=document.getElementById("form1");
                
                form1.action="Controller?process=BedManagement&action=searchByBedStatus";
                form1.submit();
            }
            
        </script>

    </body>
</html>
