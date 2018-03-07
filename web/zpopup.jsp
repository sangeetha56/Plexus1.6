<%-- 
    Document   : zpopup
    Created on : Mar 11, 2016, 5:46:29 PM
    Author     : kamal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <%
                    response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
                    response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
                    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
                    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Appointment</title>
        <link rel="stylesheet" href="css/datePicker/jquery-ui-1.8.18.custom.css">
        <link rel="stylesheet" href="css/datePicker/demos.css">


        <script type="text/javascript" src="js/datePicker/jquery-1.7.1.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery-ui-1.8.17.custom.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.dialog.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.core.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.widget.js"></script>
        <script src="js/watermark/watermark.js" type="text/javascript" ></script>


        <style type="text/css" >
            <!--


            .headerText {
                width: 10px;
                font-family:Tahoma;
                font-size: 12px;
                background-color: #4b6a84;
                color: #FFFFFF;
                font-weight: normal;
                width: auto
            }
            .dataText {
                font-family: arial, Helvetica,sans-serif;
                color: #3C5468;
                font-size: 13px;
                letter-spacing: normal;
                text-align: center;

            }
            .dataTextName {
                font-family: arial, Helvetica,sans-serif;
                color: #3C5468;
                font-size: 13px;
                letter-spacing: normal;
                text-align: center;
                text-decoration: underline;
                cursor: pointer;
            }
            .search {
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 11px;
                letter-spacing: normal;
                text-align: left;
                font-weight: bold;
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

            -->
        </style>



        <script type="text/javascript">
            function filter2 (phrase, _id)
            {
                var words = phrase.value.toLowerCase().split(" ");
                var table = document.getElementById(_id);
                var ele;
                var dd=table.rows.length;
                var aa=dd/2;
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
            function openPopup(){
                $( "#dialog" ).dialog( "open" );
            }
            function selectName(name,id){
                var patientName=document.getElementById('patientName');
                var patientId=document.getElementById("patientID");
                patientName.value=name;
                patientId.value=id;
                $( "#dialog" ).dialog( "close" );

            }
        </script>

        <script type="text/javascript">

            $(function() {

                $( "#dialog" ).dialog({
                    autoOpen: false,
                    height: 400,
                    width: 600,
                    modal: true,
                    buttons: {
                        Cancel: function() {
                            $( this ).dialog( "close" );
                        }

                    }
                });
            });


        </script>
        <script type="text/javascript">
            jQuery(function($){
                $("#patientName").Watermark("Click here to select Patient");

            });
        </script>

    </head>

    <body  onload="initPage();dateString();">
        <form id="form1" name="form1" method="post">

            <div id="dialog" title="Select Lead">
                <table>
                    <tr>
                        <td class="search">Search</td>
                        <td><input type="text" name="search"  height="20" align="right" id="search"  title="enter keywords"  onkeyup="filter2(this,'myTable')"></td>
                    </tr>
                </table>
                <table  width="100%"  border="1"   style="border-color:#4b6a84"  id="myTable">

                    <thead>
                        <tr class="headerText" >

                            <th >Card No </th>
                            <th  >Name</th>
                            <th >Age </th>
                            <th >Sex</th>

                            <th >Telephone No</th>
                        </tr>
                    </thead>

                    <tbody >

                        <c:forEach items="${patientList}" var="patient">
                            <tr style="border-color:#000000" border="1"  cellpadding="1"  cellspacing="1" >
                                <td  class="dataTextName" onclick="selectName('<c:out value="${patient.name}"/>','<c:out value="${patient.id}"/>')"><c:out value="${patient.cardno}"/></td>
                                <td  class="dataTextName" onclick="selectName('<c:out value="${patient.name}"/>','<c:out value="${patient.id}"/>')"><c:out value="${patient.name}"/></td>
                                <td  class="dataText"><c:out value="${patient.age}"/></td>
                                <td  class="dataText"><c:out value="${patient.sex}"/></td>

                                <td  class="dataText"><c:out value="${patient.telephoneno}"/></td>


                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
                    <table width="100%" style="border-top: solid 1px #4b6a84;">
                        <tr>
                        <div><center>
                                <ul class="pagination">
                                    <input type="submit" name="avalue"  value="All" onclick="CallFunction();" style="background-color:#E3EFFF;"/>

                                    <input type="submit" name="avalue" id="avalue"  value="A" onclick="CallFunctionAlpha(this);" size="1" style="background-color:#E3EFFF;"/>
                                    <input type="submit" name="avalue" id="avalue" value="B" onclick="CallFunctionAlpha(this);" style="background-color:#E3EFFF;"/>
                                    <input type="submit" name="avalue" id="avalue" value="C" onclick="CallFunctionAlpha(this);" style="background-color:#E3EFFF;"/>
                                    <input type="submit" name="avalue" id="avalue" value="D" onclick="CallFunctionAlpha(this);" style="background-color:#E3EFFF;"/>
                                    <input type="submit" name="avalue" id="avalue" value="E" onclick="CallFunctionAlpha(this);" style="background-color:#E3EFFF;"/>
                                    <input type="submit" name="avalue" id="avalue" value="F" onclick="CallFunctionAlpha(this);" style="background-color:#E3EFFF;"/>
                                    <input type="submit" name="avalue" id="avalue" value="G" onclick="CallFunctionAlpha(this);" style="background-color:#E3EFFF;"/>
                                    <input type="submit" name="avalue" id="avalue" value="H" onclick="CallFunctionAlpha(this);" style="background-color:#E3EFFF;"/>
                                    <input type="submit" name="avalue" id="avalue" value="I" onclick="CallFunctionAlpha(this);" style="background-color:#E3EFFF;"/>
                                    <input type="submit" name="avalue" id="avalue" value="J" onclick="CallFunctionAlpha(this);" style="background-color:#E3EFFF;"/>
                                    <input type="submit" name="avalue" id="avalue" value="K" onclick="CallFunctionAlpha(this);" style="background-color:#E3EFFF;"/>
                                    <input type="submit" name="avalue" id="avalue" value="L" onclick="CallFunctionAlpha(this);" style="background-color:#E3EFFF;"/>
                                    <input type="submit" name="avalue" id="avalue" value="M" onclick="CallFunctionAlpha(this);" style="background-color:#E3EFFF;"/>
                                    <input type="submit" name="avalue" id="avalue" value="N" onclick="CallFunctionAlpha(this);" style="background-color:#E3EFFF;"/>
                                    <input type="submit" name="avalue" id="avalue" value="O" onclick="CallFunctionAlpha(this);" style="background-color:#E3EFFF;"/>
                                    <input type="submit" name="avalue" id="avalue" value="P" onclick="CallFunctionAlpha(this);" style="background-color:#E3EFFF;"/>
                                    <input type="submit" name="avalue" id="avalue" value="Q" onclick="CallFunctionAlpha(this);" style="background-color:#E3EFFF;"/>
                                    <input type="submit" name="avalue" id="avalue" value="R" onclick="CallFunctionAlpha(this);" style="background-color:#E3EFFF;"/>
                                    <input type="submit" name="avalue" id="avalue" value="S" onclick="CallFunctionAlpha(this);" style="background-color:#E3EFFF;"/>
                                    <input type="submit" name="avalue" id="avalue" value="T" onclick="CallFunctionAlpha(this);" style="background-color:#E3EFFF;"/>
                                    <input type="submit" name="avalue" id="avalue" value="U" onclick="CallFunctionAlpha(this);" style="background-color:#E3EFFF;"/>
                                    <input type="submit" name="avalue" id="avalue" value="V" onclick="CallFunctionAlpha(this);" style="background-color:#E3EFFF;"/>
                                    <input type="submit" name="avalue" id="avalue" value="W" onclick="CallFunctionAlpha(this);" style="background-color:#E3EFFF;"/>
                                    <input type="submit" name="avalue" id="avalue" value="X" onclick="CallFunctionAlpha(this);" style="background-color:#E3EFFF;"/>
                                    <input type="submit" name="avalue" id="avalue" value="Y" onclick="CallFunctionAlpha(this);" style="background-color:#E3EFFF;"/>
                                    <input type="submit" name="avalue" id="avalue" value="Z" onclick="CallFunctionAlpha(this);" style="background-color:#E3EFFF;"/>
                                </ul></center>
                        </div></tr>
                    </table>
                    <script type="text/javascript">
                        function CallFunctionAlpha(val)
                        {

                            alert('for ajax calling:-');

                            var temp=val;
                            alert('alpahabit is:-'+temp.value);
                            if (typeof XMLHttpRequest != "undefined") {
                                xMLHttpRequest = new XMLHttpRequest();
                            } else if (window.ActiveXObject) {
                                xMLHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
                            }
                            xMLHttpRequest.onreadystatechange = postSaveVisit;
                            xMLHttpRequest.open("POST", "PatientController?process=PatientProcess&action=patientLoadListAjax&alphabit="+temp.value,false);


                            xMLHttpRequest.send(null);
                            
                        }
                        function postSaveVisit(){
                            if (xMLHttpRequest.readyState==4){
                                if (xMLHttpRequest.status==200){
                                    openPopup();
                                    
                                }
                                   
                            }
                           
                        }

                    </script>
                    <script type="text/javascript">

                        function CallFunctionAlphaa(val)
                        {

                            alert('for list by alphaA');
                            var form1=document.getElementById("form1");
                            var temp=val;
                            alert('alpahabit is:-'+temp.value);
                            form1.action="Controller?process=PatientProcess&action=viewPatientForPopup&pageno=1&alphabit="+temp.value;
                            form1.submit();
                        }

                        function CallFunction()
                        {

                            alert('for changeNoOfRecord process');
                            var form1=document.getElementById("form1");
                            // alert('after form id');

                            form1.action="Controller?process=PatientProcess&action=viewAllPatient&alphabit=null";

                            form1.submit();

                        }



                    </script>
                </table>
            </div>

            <table width="100%">

                <tr>
                    <td colspan="3"  align="left" class="labelCss">Patient Name&nbsp;&nbsp;<input id="patientName" type="text" name="patientName"  readonly onclick="openPopup()"  value='${patient.name}'  size="20" style="width:1px"  /></td>
                </tr>
                <tr>
                    <td colspan="3"  align="left" class="labelCss"><input  type="text"    onclick="openPopup()"  id="patientID" name="patientID" value='${patient.id}'  size="20"   /></td>
                </tr>



            </table>


        </form>

    </body>
</html>
