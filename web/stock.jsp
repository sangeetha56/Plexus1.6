<%--
    Document   : index
    Created on : Dec 23, 2011, 5:52:28 PM
    Author     : Mayur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
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



        <link rel="stylesheet" href="css/validation/jquery.ketchup.css">
        <script type="text/javascript" src="js/datePicker/jquery-1.7.1.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery-ui-1.8.17.custom.js"></script>
        <script type="text/javascript" language="javascript" src="js/dataTable/jquery.dataTables.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.core.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.widget.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.datepicker.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.tabs.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/sliderAccess.js"></script>


        <script type="text/javascript" src="js/datePicker/ui/ScrollableGridPlugin.js"></script>
        <style type="text/css">

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
        <script type="text/javascript" charset="utf-8">
            $(document).ready(function() {
                $('#myTable').dataTable( {
                    "sScrollY": "360px",
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": true,
                    "bInfo": false,
                    "bAutoWidth": false
                } );
            } );
        </script>
        <script type = "text/javascript">
            function select(id,name){
                var clipEffect='blind';
                var options = {};


                $( "#effect" ).show();
                $("#medicineId").val(id)
                $("#medicineName").val(name);



            }
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
            $(document).ready(function () {

                var creationDate=document.getElementById('creationDate');
                creationDate.value=getCurrentDate();
                var expiryDate=document.getElementById('expiryDate');
                //expiryDate.value=getCurrentDate();

                var manufactureDate=document.getElementById('manufactureDate');
                // manufactureDate.value=getCurrentDate();
                $('#myTable').Scrollable({
                    ScrollHeight: 300
                });
            });
        </script>
        <script type="text/javascript">
            $(function() {
                // run the currently selected effect
                function runEffect() {

                    var clipEffect='blind';
                    var options = {};
                    $( "#effect" ).toggle( clipEffect, options, 1000 );
                };
                // set effect from select menu value
                $( "#add" ).button().click(function() {
                    runEffect();
                    return false;
                });
            });
        </script>
        <script type="text/javascript" src="js/datetimepicker_css.js"></script>
        <script type="text/javascript">
            function addStock(){
                var form1=document.getElementById("form1");
                form1.action="Controller?process=StockProcess&action=addInitialStock";
                form1.method="POST";
                form1.submit();

            }
            $(function() {
                $( "#manufactureDate" ).datepicker({

                    changeMonth: true,
                    changeYear: true
                });
                $( "#creationDate" ).datepicker({

                    changeMonth: true,
                    changeYear: true
                });
                $( "#expiryDate" ).datepicker({

                    changeMonth: true,
                    changeYear: true
                });
                $( "#tabs" ).tabs();
                $( "#save" )
                .button()
                .click(function() {
                    addStock();
                });
                $( "#effect" ).hide();

            });
        </script>
        <script language="Javascript">
            function validateFieldMedicine()
            {


                if( document.getElementById("stockQuantity").value.length==0 )

                {
                    document.getElementById("stockQuantity").style.background='red';

                    alert("Enter the Medicine  Stock Quantity");

                }

                if( document.getElementById("batchNo").value.length==0 )

                {
                    document.getElementById("batchNo").style.background='white';

                    alert("Enter the Medicine  batchNo");

                }
                if( document.getElementById("manufactureDate").value==document.getElementById("expiryDate").value )

                {
                    alert('Please make sure Expiry Date is not same as Manufacturing date!');
                }



            }
        </script>
        <script language="Javascript">


            function valueExistsChangeColor()
            {
                if( document.getElementById("stockQuantity").value.length!=0)

                {
                    document.getElementById("stockQuantity").style.background='white';

                }


            }
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

    </head>
    <body >
        <form id="form1"  action="Controller?process=StockProcess&action=addStock" method="POST">
            <div style="height: 28px">
                <button id="add">Add Initial Stock</button>
                <br/>
            </div>

            <div id="effect" class="ui-widget-content ui-corner-all">
                <div id="tabs">
                    <ul>
                        <li><a href="#tabs-1">Details</a></li>

                    </ul>
                    <div id="tabs-1">
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="table1" style="display: block">
                            <tr>
                                <td width="10%"  class="alignRight" >Name &nbsp;  </td>
                                <td width="70%"  >
                                    <label>
                                        <input id="medicineName" name="medicineName" type="text" class="textField"  size="30"   >
                                        <input id="medicineId" name="medicineId" type="hidden" >
                                    </label>
                                </td>
                            </tr>

                            <tr><td><br/></td></tr>
                            <tr></tr>
                            <tr>
                                <td width="10%"  class="alignRight" >Stock Quantity &nbsp;  </td>
                                <td width="70%"  >
                                    <label>
                                        <input name="stockQuantity" type="text" class="textField" id="stockQuantity" onkeypress="valueExistsChangeColor()" size="30"   >
                                    </label>
                                </td>
                            </tr>
                            <tr><td><br/></td></tr>
                            <tr></tr>
                            <tr>
                                <td class="alignRight" width="10%" >Entry date &nbsp;
                                </td>
                                <td width="70%" >
                                    <label>
                                        <input readonly name="creationDate" type="text" class="textField" id="creationDate" size="30"  >
                                    </label>
                                </td>
                            </tr>
                            <tr><td><br/></td></tr>
                            <tr></tr>
                            <tr>
                                <td class="alignRight" width="10%" >Manufacturer date &nbsp;
                                </td>
                                <td width="70%" >
                                    <label>
                                        <input readonly name="manufactureDate" type="text" class="textField" id="manufactureDate" size="30"  >
                                    </label>
                                </td>
                            </tr>
                            <tr><td><br/></td></tr>
                            <tr></tr>
                            <tr>
                                <td class="alignRight" width="10%" >Expiry date &nbsp;
                                </td>
                                <td width="70%" >
                                    <label>
                                        <input readonly name="expiryDate" type="text" class="textField" id="expiryDate" size="30" >
                                    </label>
                                </td>
                            </tr>
                            <tr><td><br/></td></tr>
                            <tr></tr>
                            <tr>
                                <td width="10%"  class="alignRight" >Batch No &nbsp;  </td>
                                <td width="70%"  >
                                    <label>
                                        <input name="batchNo" type="text" class="textField" id="batchNo" size="30"   >
                                    </label>
                                </td>
                            </tr>

                        </table>
                        <table id="table2" width="100%" border="0" align="center"  >
                            <tr>
                                <td align="center">
                                    <button id="save" onmouseover="validateFieldMedicine();">Save</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

            <div class="wrapper"><!--wrapper started-->
                <div class="header_new">
                    <center><strong >Medicine Initial Stock List </strong></center>
                </div>

                <div class="two" style="margin-top:3px;padding-left: 65px;display: none;">
                    <table width="100%" >
                        <tr>
                        <input type="text" name="actionPage" value="<c:out value="${action}"/>"  size="30"/>
                        <input type="text" name="alphabitFromPage" id="alphabitFromPage" value="<c:out value="${alphabit}"/>" />
                        <input type="text" name="actionValue" id="actionValue" value="<c:out value="${controllerValue}"/>" />
                        <input type="text" name="noOFRecordsInput" id="noOFRecordsInput" value="<c:out value="${noOfRecordPerPage}"/>" />
                        <tr>
                    </table>
                </div>

                <div class="three" style="padding:0px 1px";>
                     <table>
                        <tr>
                            <td>Record/Page:</td>
                            <td style="padding-left:20px;width: 100px;"><select class="selectpicker" name="noOfRecordsFromPage" onchange="changeNoOfRecord();">
                                    <option value="<c:out value="${noOfRecordPerPage}"/>" ><c:out value="${noOfRecordPerPage}"/></option>
                                    <option value="20" >20</option>
                                    <option value="50" >50</option>
                                    <option value="100">100</option>
                                    <option value="500">500</option>
                                    <option value="1000">1000</option>

                                </select>
                            </td>

                            <td style="width: 80px;">Showing : </td>
                            <td style="width: 60px;"> <input type="text" class="form-control" name="firstValue" name="firstValue" value="<c:out value="${firstShowingRecord}"/>" size="5" readonly style="text-align: center;"> </td>
                            <td style="padding: 10px 10px;" >-</td>
                            <td style="width: 60px;"><input type="text" class="form-control" name="lastValue" value="<c:out value="${lastShowingRecord}"/>" size="5" readonly style="text-align: center;"></td>
                            <td style="width: 60px; padding: 10px 10px;">Out of</td>
                            <td style="width: 80px;"><input type="text" class="form-control" name="" value="<c:out value="${totalRecord}" />" size="5" readonly style="text-align: center;"></td>
                            <td style="width: 60px; padding: 10px 10px;">Records</td>
                            <td >

                                <span style="color: black;"<label id="labelDisplay"></label></span>
                                <input type="text" class="form-control"  placeholder="Search" id="search"  title="enter keywords"  onkeyup="filter2(this,'myTable')" onkeypress="return (event.keyCode!=13);" style="margin-left:200px;">

                            </td>


                        </tr>
                    </table>
                    <div style="float:right;padding-right:30px;padding-bottom: 3px;">


                    </div>
                </div>



                <div class="">
                    <table width="100%" style="border-color:#4b6a84;"   id="myTable">
                        <thead >
                            <tr>

                                <th title="click to sort" class="headerText" >Sl No</th>
                                <th title="click to sort" class="headerText">Medicine Name</th>
                                <th title="click to sort" class="headerText">Strength</th>
                                <th title="click to sort" class="headerText">Nature</th>
                                <th title="click to sort" class="headerText">Price</th>
                                <th title="click to sort" class="headerText">License No</th>
                                <th title="click to sort" class="headerText">Company Name</th>
                                <th title="click to sort" class="headerText">Vendor Name</th>
                            </tr>
                        </thead>
                        <tbody  >
                            <%
                                        int i = 0;
                            %>

                            <c:set var="firstRecord" value="${firstShowingRecord}"/>
                            <c:set var="lastRecord" value="${lastShowingRecord}"/>
                            <%

                                        int firstRecord = (Integer) pageContext.getAttribute("firstRecord");
                                        int secondRecord = (Integer) pageContext.getAttribute("lastRecord");

                                        System.out.println("First Record:-" + firstRecord + "Second Record:-" + secondRecord);
                                        i = firstRecord;

                            %>
                            <c:choose>
                                <c:when test="${size eq 0}">
                                    <tr style="border-color:#000000" border="1"  cellpadding="1"  cellspacing="1" >
                                        <td  class="dataTextActive" ></td>
                                        <td  class="dataTextInActive"></td>
                                        <td class="dataText"></td>
                                        <td  class="dataText"></td>
                                        <td class="dataText"></td>
                                        <td  class="dataText"></td>
                                        <td class="dataText"   ></td>
                                        <td class="dataText"   ></td>

                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${medicinesWithoutStocks}" var="medicine">

                                        <tr style="border-color:#000000" border="1"  cellpadding="1"  cellspacing="1" >
                                            <td class="dataText"><%=i%></td>
                                            <td  class="dataTextActive" style="cursor: pointer;" onclick="select('<c:out value="${medicine.id}"/>','<c:out value="${medicine.name}"/>')"><c:out value="${medicine.name}"/></td>
                                            <td  class="dataTextInActive"><c:out value="${medicine.strength}"/></td>
                                            <td class="dataText"><c:out value="${medicine.nature}"/></td>
                                            <td  class="dataText"><c:out value="${medicine.price}"/></td>
                                            <td class="dataText"><c:out value="${medicine.batchno}"/></td>
                                            <td  class="dataText"><c:out value="${medicine.company.name}"/></td>
                                            <td class="dataText"   ><c:out value="${medicine.vendor.name}"/></td>
                                        </tr>
                                        <%
                                                    i++;
                                        %>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>



                        </tbody>

                    </table>
                </div>

                <div class="four">
                    <table width="100%" style="border-top: solid 1px #4b6a84;">
                        <tr>
                            <td width="65%" >
                                <ul class="pagination">
                                    <li class="arrow unavailable">
                                        <c:if test="${currentPage != 1}">
                                            <a onclick="accordingToPreviousPage()" style="cursor: pointer">Prev</a>
                                        </c:if>
                                    </li>
                                    <li class="current">
                                        <c:choose>
                                            <c:when test="${currentPage gt 6}">

                                                <c:forEach begin="${(currentPage)-5}"  var="i" end="${currentPage+5}">
                                                    <c:if test="${(i le noOfPages) }"  >
                                                        <c:choose>
                                                            <c:when test="${currentPage eq i}">
                                                                <a style="color: white;">${i}</a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a class="link_color" id="" onclick="accordingToPageNo(this)" style="cursor: pointer;" value="${i}">${i}</a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:if>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach begin="${1}"  var="i" end="${currentPage+9}">
                                                    <c:if test="${(i le noOfPages) }"  >
                                                        <c:choose>
                                                            <c:when test="${currentPage eq i}">
                                                                <a style="color: white;" >${i}</a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a class="link_color" id="" onclick="accordingToPageNo(this)" style="cursor: pointer" value="${i}">${i}</a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:if>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                    </li>

                                    <li class="arrow">
                                        <c:if test="${currentPage lt noOfPages}">
                                            <a onclick="accordingToNextPage()" style="cursor: pointer">Next</a>
                                        </c:if>
                                    </li>
                                </ul>
                            </td>


                            <td style="padding-left:230px; " >Jump To Page:
                                <select name="pageno1" class="selectpicker" style="color:black;padding-right:20px;" onchange="forjumpToPage();">
                                    <option value="<c:out value="${currentPage}"/>" ><c:out value="${currentPage}"/></option>
                                    <c:forEach begin="${1}"  var="i" end="${noOfPages}">
                                        <option value="${i}" ><c:out value="${i}"/></option>
                                    </c:forEach>

                                </select>
                            </td>
                        </tr>
                    </table>
                </div>

                <div><center>
                        <ul class="pagination">
                            <input type="submit" name="avalue"  value="All" onclick="CallFunction();" style="background-color:#E3EFFF;"/>

                            <input type="submit" name="avalue"  value="A" onclick="CallFunctionAlpha();" size="1" style="background-color:#E3EFFF;"/>
                            <input type="submit" name="avalue" value="B" onclick="CallFunctionAlpha();" style="background-color:#E3EFFF;"/>
                            <input type="submit" name="avalue" value="C" onclick="CallFunctionAlpha();" style="background-color:#E3EFFF;"/>
                            <input type="submit" name="avalue" value="D" onclick="CallFunctionAlpha();" style="background-color:#E3EFFF;"/>
                            <input type="submit" name="avalue" value="E" onclick="CallFunctionAlpha();" style="background-color:#E3EFFF;"/>
                            <input type="submit" name="avalue" value="F" onclick="CallFunctionAlpha();" style="background-color:#E3EFFF;"/>
                            <input type="submit" name="avalue" value="G" onclick="CallFunctionAlpha();" style="background-color:#E3EFFF;"/>
                            <input type="submit" name="avalue" value="H" onclick="CallFunctionAlpha();" style="background-color:#E3EFFF;"/>
                            <input type="submit" name="avalue" value="I" onclick="CallFunctionAlpha();" style="background-color:#E3EFFF;"/>
                            <input type="submit" name="avalue" value="J" onclick="CallFunctionAlpha();" style="background-color:#E3EFFF;"/>
                            <input type="submit" name="avalue" value="K" onclick="CallFunctionAlpha();" style="background-color:#E3EFFF;"/>
                            <input type="submit" name="avalue" value="L" onclick="CallFunctionAlpha();" style="background-color:#E3EFFF;"/>
                            <input type="submit" name="avalue" value="M" onclick="CallFunctionAlpha();" style="background-color:#E3EFFF;"/>
                            <input type="submit" name="avalue" value="N" onclick="CallFunctionAlpha();" style="background-color:#E3EFFF;"/>
                            <input type="submit" name="avalue" value="O" onclick="CallFunctionAlpha();" style="background-color:#E3EFFF;"/>
                            <input type="submit" name="avalue" value="P" onclick="CallFunctionAlpha();" style="background-color:#E3EFFF;"/>
                            <input type="submit" name="avalue" value="Q" onclick="CallFunctionAlpha();" style="background-color:#E3EFFF;"/>
                            <input type="submit" name="avalue" value="R" onclick="CallFunctionAlpha();" style="background-color:#E3EFFF;"/>
                            <input type="submit" name="avalue" value="S" onclick="CallFunctionAlpha();" style="background-color:#E3EFFF;"/>
                            <input type="submit" name="avalue" value="T" onclick="CallFunctionAlpha();" style="background-color:#E3EFFF;"/>
                            <input type="submit" name="avalue" value="U" onclick="CallFunctionAlpha();" style="background-color:#E3EFFF;"/>
                            <input type="submit" name="avalue" value="V" onclick="CallFunctionAlpha();" style="background-color:#E3EFFF;"/>
                            <input type="submit" name="avalue" value="W" onclick="CallFunctionAlpha();" style="background-color:#E3EFFF;"/>
                            <input type="submit" name="avalue" value="X" onclick="CallFunctionAlpha();" style="background-color:#E3EFFF;"/>
                            <input type="submit" name="avalue" value="Y" onclick="CallFunctionAlpha();" style="background-color:#E3EFFF;"/>
                            <input type="submit" name="avalue" value="Z" onclick="CallFunctionAlpha();" style="background-color:#E3EFFF;"/>
                        </ul></center>
                </div>

           <!--     <div>
                    <input value="delete" type="submit" id="delete"/>
                </div>  -->



            </div>  <!--wrapper closed-->

            <script type="text/javascript">



                function changeNoOfRecord()
                {

                    // alert('for changeNoOfRecord process');
                    var form1=document.getElementById("form1");
                    // alert('after form id');

                    form1.action="Controller?process=MedicineProcess&action=<c:out value="${action}"/>&noOfRecords=20&pageno=1&alphabit=null";

                    form1.submit();

                }
                function forjumpToPage(){
                    // alert('step 2');
                    var form1=document.getElementById("form1");
                    // alert('kkk111')
                    form1.action="Controller?process=MedicineProcess&action=<c:out value="${action}"/>&alphabit=null&value=fromjump";
                    form1.submit();
                }
                function CallFunctionAlpha()
                {

                    //alert('for list by alphaA');
                    var form1=document.getElementById("form1");
                    form1.action="Controller?process=MedicineProcess&action=<c:out value="${action}"/>&pageno=1";
                    form1.submit();
                }
                function accordingToPageNo(anchor){
                    // alert('here');
                    var value = anchor.getAttribute('value');  // This give you '2'

                    // alert('value is:-'+value);


                    var form1=document.getElementById("form1");
                    // alert("here kusum");
                    form1.action="Controller?process=MedicineProcess&action=<c:out value="${action}"/>&alphabit=null&pageno="+value;
                    form1.submit();


                }
                function accordingToNextPage(){
                    // alert('here');
                    var form1=document.getElementById("form1");
                    form1.action="Controller?process=MedicineProcess&action=<c:out value="${action}"/>&pageno=${currentPage + 1}&alphabit=null";
                    form1.submit();


                }
                function accordingToPreviousPage(){
                    //alert('here');
                    var form1=document.getElementById("form1");
                    form1.action="Controller?process=MedicineProcess&action=<c:out value="${action}"/>&pageno=${currentPage - 1}&alphabit=null";
                    form1.submit();


                }

                function CallFunction()
                {

                    //alert('for changeNoOfRecord process');
                    var form1=document.getElementById("form1");
                    // alert('after form id');

                    form1.action="Controller?process=MedicineProcess&action=viewAllMedicineWithEmptyStocksNoLimit&alphabit=null";

                    form1.submit();

                }



            </script>

        </form>

    </body>
</html>
