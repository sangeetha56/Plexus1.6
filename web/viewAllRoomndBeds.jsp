<%-- 
    Document   : viewAllRoomndBeds
    Created on : Jul 14, 2016, 4:32:09 PM
    Author     : kamal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

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
        <style type="text/css" >
            <!--
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
                text-transform: capitalize;
            }
            .dataTextActive {
                border-radius:3px;
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 12px;
                font-weight: bold;
                letter-spacing: normal;
                text-align: center;
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
            .footerTD{
                border-radius:6px;
                background-color:#4b6a84;


                text-align: left;


            }

            #bord     {
                background-image: url();background-repeat: no-repeat;background-position: center;
            }
            -->
        </style>
        <script type="text/javascript" charset="utf-8">
            $(document).ready(function() {
                $('#myTable').dataTable( {
                    "sScrollY": "380px",
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": true,
                    "bSort": true,
                    "bInfo": false,
                    "bAutoWidth": false
                } );
            } );
        </script>
        <script type="text/javascript">
            function deleteRecords(){
                var form2=document.getElementById("form2");

                form2.submit();
            }
            function filter2 (phrase, _id)
            {
                var words = phrase.value.toLowerCase().split(" ");
                var table = document.getElementById(_id);
                var ele;
                var dd=table.rows.length;
                //var aa=dd/2;
                var aa=dd-1;
                var display=true;

                for (var r = 1; r < table.rows.length; r++)
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
                    label.innerHTML = "Matching Results: "+aa;
                    label.style.display='none';
                }
                else
                {
                    label.innerHTML ="Matching Results: "+dd;
                    label.style.display='block';
                }
            }

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
    </head>
    <body  style=" background-image: url(images/);background-repeat: no-repeat;background-position: center">
        <div id="bord">
            <form name="form2" action="" method="post">
                <div style="overflow: hidden">
                    <table width="100%">
                        <tr>
                            <td  class="headerTD">Room and Bed Type View All</td>
                        </tr>


                    </table>
                    <table   width="100%"  border="0" style="border-color:#4b6a84;"  id="myTable">

                        <thead>
                            <tr  >

                                <th title="click to sort" class="headerText" >Room Code</th>
                                <th title="click to sort" class="headerText" >Building Block</th>
                                <th title="click to sort" class="headerText">Floor No</th>
                                <th title="click to sort" class="headerText">Room No</th>
                                <th title="click to sort" class="headerText">No of Bed</th>
                                <th title="click to sort" class="headerText">Room Type</th>
                                <th title="click to sort" class="headerText">Room Charge</th>

                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach items="${roomndBedSetUpList}" var="roomNdBedsetup">

                                <tr class="trClass" style="border-color:#000000" border="1"  cellpadding="1"  cellspacing="1" >

                                    <td  class="dataTextInActive"><a  class="dataTextInActive"  href="Controller?process=RoomManagement&action=viewDetails&id=<c:out  value='${roomNdBedsetup.roomndbedsetupid}'/>"><c:out value="${roomNdBedsetup.roomcode}"/></a></td>
                                    <td  class="dataTextInActive"><a  class="dataTextInActive"  href="Controller?process=RoomManagement&action=viewDetails&id=<c:out  value='${roomNdBedsetup.roomndbedsetupid}'/>"><c:out value="${roomNdBedsetup.roomsetup.buildingtypesetup.buildingblock}"/></a></td>

                                    <td  class="dataText"><c:out value="${roomNdBedsetup.roomsetup.floorno}"/></td>
                                    <td  class="dataText"><c:out value="${roomNdBedsetup.roomno}"/></td>
                                    <td  class="dataText"><c:out value="${roomNdBedsetup.noofbeds}"/></td>
                                    <td  class="dataText"><c:out value="${roomNdBedsetup.roomtype.roomtype}"/></td>
                                    <td  class="dataText"><c:out value="${roomNdBedsetup.roomtype.roomcharges}"/></td>




                                </tr>
                            </c:forEach>
                        </tbody>

                    </table>
                    <br/>



                </div>
            </form>
        </div>
    </body>
</html>
