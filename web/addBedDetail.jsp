<%-- 
    Document   : addBedDetail
    Created on : Jul 17, 2016, 5:30:00 AM
    Author     : kamal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

        <title>Untitled Document</title>
        <link rel="stylesheet" href="css/datePicker/jquery-ui-1.8.18.custom.css">
            <link rel="stylesheet" href="css/datePicker/demos.css">


                <script type="text/javascript" src="js/datePicker/jquery-1.7.1.js"></script>
                <script type="text/javascript" src="js/datePicker/ui/jquery-ui-1.8.17.custom.js"></script>
                <script type="text/javascript" src="js/datePicker/ui/jquery.ui.dialog.js"></script>
                <script type="text/javascript" src="js/datePicker/ui/jquery.ui.core.js"></script>
                <script type="text/javascript" src="js/datePicker/ui/jquery.ui.widget.js"></script>
                <script src="js/watermark/watermark.js" type="text/javascript" ></script>


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
                        text-transform: none;
                    }
                    .style8 {
                        color: black;
                    }
                    -->
                </style>

                <script type="text/javascript">
                    $(function() {


                        $( "#save" )
                        .button()
                        .click(function() {
                            // addBedSetup();

                            editDisableTrue();


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
                        //alert('button');
                        //window.location='consultancyTab.jsp';
                        window.location='bedmanagementTab.jsp';

                    }
                </script>

                <script language="Javascript">
                    function validateButton()
                    {
                        if( document.getElementById("bedno").value.length==0 )

                        {
                            document.getElementById("bedno").style.background='red';

                            alert("Enter Bed No");

                        }



                    }
                </script>
                <script language="Javascript">


                    function valueExistsChangeColor()
                    {
                        if( document.getElementById("bedno").value.length!=0)

                        {
                            document.getElementById("bedno").style.background='white';

                        }


                    }
                </script>

                <script>
                    function displayAllHidden()
                    {
                        document.getElementById("tr1").style.display='';
                        document.getElementById("tr2").style.display='';
                        document.getElementById("tr3").style.display='';
                        document.getElementById("tr4").style.display='';
                        document.getElementById("tr5").style.display='';

                        openPopup();

                
                    }
                    
                    function editDisableTrue()
                    {
                        document.getElementById("buildingblock").disabled=false;
                        document.getElementById("floorno").disabled=false;
                        document.getElementById("roomno").disabled=false;
                        document.getElementById("roomtypevalue").disabled=false;
                        document.getElementById("roomcharge").disabled=false;
                        document.getElementById("roomcode").disabled=false;
                        document.getElementById("noofbeds").disabled=false;
                        document.getElementById("roomNdBedid").disabled=false;
                        

                        addBedSetup();

                
                    }


                </script>

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
                    function selectName(bblock,fno,rno,rtype,rcharge,rcode,rndbedid,nbedno){
                        var buildingblock=document.getElementById('buildingblock');
                        var floorno=document.getElementById("floorno");
                        var roomno=document.getElementById("roomno");

                        var roomtypevalue=document.getElementById("roomtypevalue");
                        var roomcharge=document.getElementById("roomcharge");
                        var roomcode=document.getElementById("roomcode");
                        var roomNdBedid=document.getElementById("roomNdBedid");
                        var noofbeds=document.getElementById("noofbeds");
                        buildingblock.value=bblock;
                        floorno.value=fno;
                        
                        roomno.value=rno;

                        roomtypevalue.value=rtype;
                        roomcharge.value=rcharge;
                        roomcode.value=rcode;
                        roomNdBedid.value=rndbedid;
                        noofbeds.value=nbedno;

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
                        $("#roomcode").Watermark("Click here to select Room");

                    });
                </script>
                </head >

                <body >

                    <div id="dialog" title="Select Room">
                        <table>
                            <tr>
                                <td class="search">Search</td>
                                <td><input type="text" name="search"  height="20" align="right" id="search"  title="enter keywords"  onkeyup="filter2(this,'myTable')"></td>
                            </tr>
                        </table>
                        <table  width="100%"  border="1"   style="border-color:#4b6a84"  id="myTable">

                            <thead>
                                <tr class="headerText" >

                                    <th >Room Code</th>
                                    <th  >Floor No</th>
                                    <th  >Room No</th>
                                    <th  >Building Block</th>
                                    <th  >Room Type</th>
                                    <th  >No of Bed</th>

                                </tr>
                            </thead>

                            <tbody >

                                <c:forEach items="${roomndBedSetUpList}" var="roomNdBed">
                                    <tr style="border-color:#000000" border="1"  cellpadding="1"  cellspacing="1" >
                                        <td  class="dataTextName"  style="cursor: pointer;" title="click to Select Room" onclick="selectName('<c:out value="${roomNdBed.roomsetup.buildingtypesetup.buildingblock}"/>','<c:out value="${roomNdBed.roomsetup.floorno}"/>','<c:out value="${roomNdBed.roomno}"/>','<c:out value="${roomNdBed.roomtype.roomtype}"/>','<c:out value="${roomNdBed.roomtype.roomcharges}"/>','<c:out value="${roomNdBed.roomcode}"/>','<c:out value="${roomNdBed.roomndbedsetupid}"/>','<c:out value="${roomNdBed.noofbeds}"/>')"><c:out value="${roomNdBed.roomcode}"/></td>
                                        <td  class="dataTextName" style="cursor: pointer;" title="click to Select Room" onclick="selectName('<c:out value="${roomNdBed.roomsetup.buildingtypesetup.buildingblock}"/>','<c:out value="${roomNdBed.roomsetup.floorno}"/>','<c:out value="${roomNdBed.roomno}"/>','<c:out value="${roomNdBed.roomtype.roomtype}"/>','<c:out value="${roomNdBed.roomtype.roomcharges}"/>','<c:out value="${roomNdBed.roomcode}"/>','<c:out value="${roomNdBed.roomndbedsetupid}"/>','<c:out value="${roomNdBed.noofbeds}"/>')"><c:out value="${roomNdBed.roomsetup.floorno}"/></td>
                                        <td  class="dataTextName" style="cursor: pointer;" title="click to Select Room" onclick="selectName('<c:out value="${roomNdBed.roomsetup.buildingtypesetup.buildingblock}"/>','<c:out value="${roomNdBed.roomsetup.floorno}"/>','<c:out value="${roomNdBed.roomno}"/>','<c:out value="${roomNdBed.roomtype.roomtype}"/>','<c:out value="${roomNdBed.roomtype.roomcharges}"/>','<c:out value="${roomNdBed.roomcode}"/>','<c:out value="${roomNdBed.roomndbedsetupid}"/>','<c:out value="${roomNdBed.noofbeds}"/>')"><c:out value="${roomNdBed.roomno}"/></td>
                                        <td  class="dataTextName" style="cursor: pointer;" title="click to Select Room" onclick="selectName('<c:out value="${roomNdBed.roomsetup.buildingtypesetup.buildingblock}"/>','<c:out value="${roomNdBed.roomsetup.floorno}"/>','<c:out value="${roomNdBed.roomno}"/>','<c:out value="${roomNdBed.roomtype.roomtype}"/>','<c:out value="${roomNdBed.roomtype.roomcharges}"/>','<c:out value="${roomNdBed.roomcode}"/>','<c:out value="${roomNdBed.roomndbedsetupid}"/>','<c:out value="${roomNdBed.noofbeds}"/>')"><c:out value="${roomNdBed.roomsetup.buildingtypesetup.buildingblock}"/></td>
                                        <td  class="dataTextName" style="cursor: pointer;" title="click to Select Room" onclick="selectName('<c:out value="${roomNdBed.roomsetup.buildingtypesetup.buildingblock}"/>','<c:out value="${roomNdBed.roomsetup.floorno}"/>','<c:out value="${roomNdBed.roomno}"/>','<c:out value="${roomNdBed.roomtype.roomtype}"/>','<c:out value="${roomNdBed.roomtype.roomcharges}"/>','<c:out value="${roomNdBed.roomcode}"/>','<c:out value="${roomNdBed.roomndbedsetupid}"/>','<c:out value="${roomNdBed.noofbeds}"/>')"><c:out value="${roomNdBed.roomtype.roomtype}"/></td>
                                        <td  class="dataTextName" style="cursor: pointer;" title="click to Select Room" onclick="selectName('<c:out value="${roomNdBed.roomsetup.buildingtypesetup.buildingblock}"/>','<c:out value="${roomNdBed.roomsetup.floorno}"/>','<c:out value="${roomNdBed.roomno}"/>','<c:out value="${roomNdBed.roomtype.roomtype}"/>','<c:out value="${roomNdBed.roomtype.roomcharges}"/>','<c:out value="${roomNdBed.roomcode}"/>','<c:out value="${roomNdBed.roomndbedsetupid}"/>','<c:out value="${roomNdBed.noofbeds}"/>')"><c:out value="${roomNdBed.noofbeds}"/></td>




                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div  id="bord" >


                        <form id="form1"  action="" method="POST" >

                            <table width="100%" height="29" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td height="32" background="images/header-bg.png" style="background-repeat:repeat-x"><img src="images/back1.png" style="cursor: pointer" title="click to close" onclick="backButtton1()" /></td>
                                    <td height="29" valign="top" background="images/header-bg.png" style="background-repeat:repeat-x"><div align="center"><span class="style3"></span></div></td>
                                </tr>
                            </table>
                            <table width="100%" height="29" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td height="29" valign="top" background="images/header-bg.png" style="background-repeat:repeat-x"><div align="center"><span class="style3">Add Bed Details</span></div></td>
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

                                            <tr id="tr1" style="display: none">
                                                <td height="44"><div align="right"><span class="style1">Building Block</span></div></td>
                                                <td>&nbsp;</td>
                                                <td>:</td>
                                                <td><div align="left">
                                                        <input type="text" name="buildingblock" id="buildingblock"  disabled="true"  style="width:180px" class="style7" />

                                                    </div>
                                                </td>
                                                <td colspan="3">&nbsp;</td>
                                            </tr>

                                            <tr id="tr2" style="display: none">
                                                <td height="44"><div align="right"><span class="style1">Floor No</span></div></td>
                                                <td>&nbsp;</td>
                                                <td>:</td>
                                                <td><div align="left">

                                                        <input type="text" name="floorno" id="floorno"  disabled="true"    style="width:180px" class="style7" />
                                                    </div></td>
                                                <td colspan="3">&nbsp;</td>
                                            </tr>


                                            <tr id="tr3" style="display: none">
                                                <td height="44"><div align="right"><span class="style1">Room No</span></div></td>
                                                <td>&nbsp;</td>
                                                <td>:</td>
                                                <td><div align="left">
                                                        <input type="text" name="roomno" id="roomno"  disabled="true"    style="width:180px" class="style7" />


                                                    </div></td>
                                                <td colspan="3">&nbsp;</td>
                                            </tr>

                                            <tr id="tr4" style="display: none">
                                                <td height="44"><div align="right"><span class="style1">Room Type</span></div></td>
                                                <td>&nbsp;</td>
                                                <td>:</td>
                                                <td><div align="left">
                                                        <input type="text" name="roomtypevalue" id="roomtypevalue"  disabled="true"    style="width:180px" class="style7" />
                                                    </div></td>
                                                <td colspan="3">&nbsp;</td>
                                            </tr>
                                            <tr id="tr5" style="display: none">
                                                <td height="44"><div align="right"><span class="style1">Room Charges</span></div></td>
                                                <td>&nbsp;</td>
                                                <td>:</td>
                                                <td><div align="left">

                                                        <input type="text" name="roomcharge" id="roomcharge"   disabled="true"  style="width:180px" class="style7" />

                                                    </div></td>
                                                <td colspan="3">&nbsp;</td>
                                            </tr>

                                            <tr>
                                                <td height="44"><div align="right"><span class="style1">Room Code</span></div></td>
                                                <td>&nbsp;</td>
                                                <td>:</td>
                                                <td><div align="left">

                                                        <input type="text" name="roomcode" id="roomcode" onclick="displayAllHidden();"     style="width:180px" class="style7" />

                                                    </div></td>
                                                <td colspan="3">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td height="44"><div align="right"><span class="style1">No of Bed</span></div></td>
                                                <td>&nbsp;</td>
                                                <td>:</td>
                                                <td><div align="left">

                                                        <input type="text" name="noofbeds" id="noofbeds" disabled="true"    style="width:180px" class="style7" />

                                                    </div></td>
                                                <td colspan="3">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td height="44"><div align="right"><span class="style1">Bed No</span></div></td>
                                                <td>&nbsp;</td>
                                                <td>:</td>
                                                <td><div align="left">

                                                        <input type="text" name="bedno" id="bedno" onkeypress="valueExistsChangeColor();"    style="width:180px" class="style7" />

                                                    </div></td>
                                                <td colspan="3">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td height="44"><div align="right"><span class="style1">Bed Code</span></div></td>
                                                <td>&nbsp;</td>
                                                <td>:</td>
                                                <td><div align="left">

                                                        <input type="text" name="bedcode" id="bedcode"     style="width:180px" class="style7" />

                                                    </div></td>
                                                <td colspan="3">&nbsp;</td>
                                            </tr>

                                            <tr>
                                                <td height="44"><div align="right"><span class="style1">Room ND Bed ID</span></div></td>
                                                <td>&nbsp;</td>
                                                <td>:</td>
                                                <td><div align="left">

                                                        <input type="text" name="roomNdBedid" id="roomNdBedid"   disabled="true"  style="width:180px" class="style7" />

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

                                        </form>



                                        </div>

                                        <script type="text/javascript">

                                            function addBedSetup(){
                                                var form1=document.getElementById("form1");

                                                form1.action="Controller?process=BedManagement&action=addBedSetup";
                                                form1.submit();

                                            }

            
                                        </script>

                                        </body>
                                        </html>
