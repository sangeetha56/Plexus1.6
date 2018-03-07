<%-- 
    Document   : scheduler
    Created on : Jan 19, 2012, 5:59:34 PM
    Author     : Mayur
--%>
<%--
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.sql.*"%>
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

        <script type="text/javascript" src="js/calender/calendar.js"></script>
        <script type="text/javascript" src="js/calender/dateTypes.js"></script>
        <script type="text/javascript" src="js/datePicker/jquery-1.7.1.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery-ui-1.8.17.custom.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.dialog.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.core.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.widget.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.datepicker.js"></script>
        <script  type="text/javascript" src="js/datePicker/ui/jquery.ui.position.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.mouse.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.draggable.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.resizable.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.button.js"></script>
        <script src="js/watermark/watermark.js" type="text/javascript" ></script>


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
        <style type="text/css">
            <!--
            .style1 {
                font-family: Tahoma;
                font-size: 12px;
            }
            .labelCss {
                font-family: Tahoma;
                font-size: 11px;
                font-weight: bold;
            }
            .remove{
                cursor: pointer;
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
                width: 100%;

                height: 22px;
            }
            .headerTD1{
                background-color:#4b6a84;
                color: #FFFFFF;
                font-family: Tahoma;
                font-size: 13px;
                text-transform: uppercase;
                text-align: center;
                font-weight: bold;

            }
            -->
            /* css for timepicker */
            .ui-timepicker-div .ui-widget-header { margin-bottom: 8px; }
            .ui-timepicker-div dl { text-align: left; }
            .ui-timepicker-div dl dt { height: 25px; margin-bottom: -25px; }
            .ui-timepicker-div dl dd { margin: 0 10px 10px 65px; }
            .ui-timepicker-div td { font-size: 90%; }
            .ui-tpicker-grid-label { background: none; border: none; margin: 0; padding: 0; }

            #calendar {
                height:500px;
                width:60px;
                float:none;
            }

            #theday {
                -moz-border-radius:5px;
                background-color:#36387B;
                color:#FFFFFF;
                float:left;
                font-size:40px;
                height:40px;
                line-height:50px;
                margin-top:30px;
                padding:60px;
                text-shadow:0 0 5px #DDDDDD;
                width:50px;
            }

            #theday span {
                display:block;
                font-size:6px;
                text-align:center;
            }
            #highlight {
                background-color: red;
                border: 1px blue solid;
            }
            .divCSS {
                font-family: Tahoma;
                font-size: 10px;
                font-weight: bold;
                background-color: #F0F8F9;
            }
            .divCSSOCUPPIED {
                font-family: Tahoma;
                font-size: 10px;
                font-weight: bold;
                background-color: #E2FCC7;
                border-bottom-style: solid;
                border: 1px;
                border-color:  black;
            }
            .linkCSS {
                font-family: Tahoma;
                font-size: 14px;
                font-weight: bold;
                text-transform: capitalize;
                color: #4b6a84;

            }


        </style>
        <style type="text/css">
            .ui-timepicker-div .ui-widget-header { margin-bottom: 8px; }
            .ui-timepicker-div dl { text-align: left; }
            .ui-timepicker-div dl dt { height: 25px; margin-bottom: -25px; }
            .ui-timepicker-div dl dd { margin: 0 10px 10px 65px; }
            .ui-timepicker-div td { font-size: 90%; }
            .ui-tpicker-grid-label { background: none; border: none; margin: 0; padding: 0; }
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
            var get;
            var xMLHttpRequest;
            var selectedDate;
            var skip=false;
            var digits=new Array("0","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23");            
            var appointmentCount=new Array(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
            function clearTable() {
                
                var data;
                var id=7;
                for(id=7;id<24;id++){
                    
                    data=document.getElementById(digits[id]);
                    appointmentCount[id]=0;
                    data.innerHTML="";
                }
            }
            function paint() {
                var dataTD;
                for(id=7;id<24;id++){
                    dataTD=document.getElementById('td'+id);
                    data=document.getElementById(digits[id]);
                    if(appointmentCount[id]!=0){
                        dataTD.className="divCSSOCUPPIED";
                        data.className="divCSSOCUPPIED";
                    }
                    else if(appointmentCount[id]==0){
                        dataTD.className="divCSS";
                        data.className="divCSS";
                    }
                }
            }
            function saveVisit(){                
                var visitDate1=document.getElementById('appointmentDate');
                var visitTime1=document.getElementById('time');
                var visitDateTime=visitDate1.value+" "+visitTime1.value;
                var patientID1=document.getElementById('patientID');
                var remarks1=document.getElementById('remarks');
                var departmnt=document.getElementById('countryID');
                var doctr=document.getElementById('state');
                var consultnttype=document.getElementById('consultntid');
                //  alert('department name:-'+departmnt.value+'-:doctor name:-'+doctr.value+'-:consultancy type:'+consultnttype.value)
                jQuery(function($){
                    $("#patientName").Watermark("Click here to select patient");

                });
                if (typeof XMLHttpRequest != "undefined") {
                    xMLHttpRequest = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    xMLHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
                }                
                xMLHttpRequest.onreadystatechange = postSaveVisit;
                xMLHttpRequest.open("POST", "AjaxController?process=VisitProcess&action=addAjaxVisit&patientID="+patientID1.value+"&appointmentDate="+visitDateTime.toString()+"&remarks="+remarks1.value+"&departmentname="+departmnt.value+"&doctorname="+doctr.value+"&consultancytype="+consultnttype.value,false);
                
                
                xMLHttpRequest.send(null);
            }
            function postSaveVisit(){
                if (xMLHttpRequest.readyState==4){
                    if (xMLHttpRequest.status==200){
                        var output=xMLHttpRequest.responseXML.getElementsByTagName("output")[0];
                        var successTagElem = output.getElementsByTagName("success")[0].firstChild.nodeValue;
                        var monthTagElem = output.getElementsByTagName("month")[0].firstChild.nodeValue;
                        var dayTagElem = output.getElementsByTagName("day")[0].firstChild.nodeValue;
                        var yearTagElem = output.getElementsByTagName("year")[0].firstChild.nodeValue;
                        var appointmentDateString=monthTagElem.toString()+"/"+dayTagElem.toString()+"/"+yearTagElem.toString();
                        //alert(successTagElem.toString()+" "+monthTagElem.toString()+" "+dayTagElem.toString()+" "+yearTagElem.toString());
                        var intMonthTagElem,intDayTagElem,intYearTagElem;
                        intMonthTagElem=parseInt(monthTagElem)-1;
                        intDayTagElem=parseInt(dayTagElem);
                        intYearTagElem=parseInt(yearTagElem);
                        var appointmentDate=new Date(intYearTagElem, intMonthTagElem, intDayTagElem);
                        $( "#datePicker" ).datepicker("destroy" );
                        $( "#datePicker" ).datepicker({
                            changeMonth: true,
                            changeYear: true,
                            numberOfMonths:[2, 1],
                            defaultDate: appointmentDate,
                            yearRange: '1900:2050',
                            onSelect: function(date) {
                                getdata(date.toString());
                            }
                        });
                        getdata(appointmentDateString.toString()); 
                    }
                } 
            }
            function getdata(visitDate) {
                
                clearTable();
                
                var selected=document.getElementById('selected');
                var appointmentDate=document.getElementById('appointmentDate');
                selected.value=visitDate.toString();
                appointmentDate.value=visitDate.toString();
                //alert(selected.value);
                if (typeof XMLHttpRequest != "undefined") {
                    get = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    get = new ActiveXObject("Microsoft.XMLHTTP");
                }
                get.onreadystatechange = processdata;
                get.open("POST", "VisitController?visitDay="+visitDate.toString(),false);
                get.send(null);
            }
            function processdata() {
                var link="";
                var data;
                var intID;
                var id,hourID,patientID,reminderTime,visitTime,rating,name,complaint;
                if (get.readyState==4)
                {
                    if (get.status==200){
                        clearTable();
                        var visits = get.responseXML.getElementsByTagName("Visits")[0];
                        var visitNodes = visits.getElementsByTagName("Visit");
                            
                        for (var i = 0 ; i < visitNodes.length ; i++) {
                            
                            
                            var visit = visitNodes[i];
                            
                            hourID=visit.getElementsByTagName("HourID")[0].firstChild.nodeValue;
                           
                            patientID=visit.getElementsByTagName("PatientID")[0].firstChild.nodeValue;
                             
                            reminderTime=visit.getElementsByTagName("ReminderTime")[0].firstChild.nodeValue;
                            visitTime=visit.getElementsByTagName("VisitTime")[0].firstChild.nodeValue;
                            rating=visit.getElementsByTagName("Rating")[0].firstChild.nodeValue;
                            id=visit.getElementsByTagName("ID")[0].firstChild.nodeValue;
                            name=visit.getElementsByTagName("PatientName")[0].firstChild.nodeValue;
                            
                            //complaint=visit.getElementsByTagName("PatientComplaint")[0].firstChild.nodeValue;st
                            
                            link="<a class='linkCSS' href='Controller?process=PatientProcess&action=viewDetails&id="+patientID+"'>";
                            intID=parseInt(hourID);
                            data=document.getElementById(digits[intID]);
                            appointmentCount[intID]++;
                            data.innerHTML=data.innerHTML+link+name+'</a>'+"<span class='remove' onclick='deleteVisit(\""+id+"\")'> Remove</span>"+'<br/>';
                            
                            
                        }
                        paint(); 
                    }
                }
            }



            function deleteVisit(id)
            {
                var confirmBox=confirm("Confirm Delete!");
                if(confirmBox==true){
                    var visitID=id;

                    if (typeof XMLHttpRequest != "undefined") {
                        xMLHttpRequest = new XMLHttpRequest();
                    } else if (window.ActiveXObject) {
                        xMLHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    xMLHttpRequest.onreadystatechange = postDeleteVisit;
                    
                    xMLHttpRequest.open("POST", "AjaxController?process=VisitProcess&action=deleteAppointment&visitid="+visitID,false);
                    xMLHttpRequest.send(null);
                    
                }else{

                }
                
            }

            function postDeleteVisit()
            {
                if (xMLHttpRequest.readyState==4){
                    if (xMLHttpRequest.status==200){

                        //alert( $("#datePicker").val());
                        
                        getdata($("#datePicker").val());
                    }

                } 

            }

        </script>
        <script type="text/javascript">
            function redirect(hour){
                var selected=document.getElementById('selected');
                var form1=document.getElementById("form1");
                form1.action="Controller?process=VisitProcess&action=addAppointmentForExistingPatient&date="+selected.value+"&hour="+hour;
                form1.submit();
            }
            function addPatient(){
                
                var form1=document.getElementById("form1");
                form1.action="addPatientForAppointment.jsp";
                form1.submit();
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
                $("#patientName").Watermark("Click here to select patient");

            });
        </script>
        <script type="text/javascript">
            $(function() {
                $( "#appointmentDate" ).datepicker();
                $( "#set" )
                .button()
                .click(function() {
                    // saveVisit();

                    saveVisitClick();
                    return false;

                });
                $( "#add" )
                .button()
                .click(function() {
                    addPatient();
                    

                });

                $(".remove" )
                .button()
                .click(function() {
                    deleteVisit();


                });

            });


        </script>

        <script type="text/javascript">
            function initPage(){  
                $( "#datePicker" ).datepicker({
                    changeMonth: true,
                    changeYear: true,
                    numberOfMonths:[2, 1],
                    defaultDate: new Date(),
                    yearRange: '1900:2050',
                    onSelect: function(date) {
                        
                        getdata(date.toString());
                    }
                });
                var data,id;
                var date=new Date();
                var hourDigit=new Array("0","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23");
            <c:forEach var="visit" items="${visits}">
                    date.setDate('${visit.visittime}');
                    id=<fmt:formatDate type="both" value="${visit.visittime}" pattern="HH" />
                    var intID=parseInt(id);
                    link="<a class='linkCSS' href='Controller?process=PatientProcess&action=viewDetails&id="+<c:out value="${visit.patient.id}"/>+"'>";
                    appointmentCount[intID]++;
                    data=document.getElementById(hourDigit[id]);
                    var functionName="alert('"+<c:out value="${visit.id}" />+"')"
                    data.innerHTML=data.innerHTML+link+'<c:out value="${visit.patient.name}" />'+'</a>'+"&nbsp;<span class='remove' onclick='deleteVisit(\""+<c:out value="${visit.id}"/>+"\")'> Remove</span>"+'<br/>';
            </c:forEach>
                    paint();

                  
                
                }
                

        </script>
        <script type="text/javascript">
            function dateString(){
                var selected=document.getElementById('selected');
                var date=new Date();
                var day=date.getDate();
                if(day.toString().length==1){
                    day='0'+day;
                }
                else if(day.toString().length==2){
                    day=day;
                }
                var month=date.getMonth()+1;
                if(month.toString().length==1){
                    month='0'+month;
                }
                else if(month.toString().length==2){
                    month=month;
                }
                var year=date.getFullYear();

                selected.value=month+'/'+day+'/'+year;
                appointmentDate.value=month+'/'+day+'/'+year;
            }
        </script>
        <!-- for adding doctor name and department -->

        <script language="javascript" type="text/javascript">
            var xmlHttp
            var xmlHttp
            function showState(str){


                //  alert(a.innerHTML);
                if (typeof XMLHttpRequest != "undefined"){
                    xmlHttp= new XMLHttpRequest();
                }
                else if (window.ActiveXObject){
                    xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
                }
                if (xmlHttp==null){
                    alert("Browser does not support XMLHTTP Request")
                    return;
                }
                var url="doctor.jsp";
                url +="?count=" +str;
                xmlHttp.onreadystatechange = stateChange;
                xmlHttp.open("GET", url, true);
                xmlHttp.send(null);
            }

            function stateChange(){
                if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
                    document.getElementById("state").innerHTML=xmlHttp.responseText


                }
            }
        </script>
        <script>
            function showCountryOptn(opt)
            {

                document.getElementById("countrynameTxt").value=opt;
                //alert('depart ment name is:-'+document.getElementById("countryID").value)



            }

            function showStateOptn(opt)
            {

                document.getElementById("statenameTxt").value=opt;
                //alert('doctor name is:-'+document.getElementById("state").value);



            }

        </script>

        <script type="text/javascript">
            function saveVisitTest()
            {

              
                var form1=document.getElementById("form1");
               

                form1.action="Controller?process=VisitProcess&action=test";

                form1.submit();

            }

            function saveVisitClick()
            {

              
                var visitDate1=document.getElementById('appointmentDate');
                var visitTime1=document.getElementById('time');
                var visitDateTime=visitDate1.value+" "+visitTime1.value;
                var patientID1=document.getElementById('patientID');
                var remarks1=document.getElementById('remarks');
                var departmnt=document.getElementById('countryID');
                var doctr=document.getElementById('state');
                var consultnttype=document.getElementById('consultntid');
                var form1=document.getElementById("form1");
              

                form1.action="Controller?process=VisitProcess&action=saveVisitWithoutAjax&patientID="+patientID1.value+"&appointmentDate="+visitDateTime.toString()+"&remarks="+remarks1.value+"&departmentname="+departmnt.value+"&doctorname="+doctr.value+"&consultancytype="+consultnttype.value;

                form1.submit();

            }
        </script>

        <script type="text/javascript">
            //*********************NEWLY ADDED FOR PropertyAdd.jsp:-For "title=select Contact" POPUP Window BY GIRIJA...****************

            var winChild5=null;
            var fName = null;

            function openWin5(pName,winWidth,winHeight,fieldName) {
                // alert("kusum still :")

                fName=fieldName;

                X = (screen.width/2) - (winWidth/2);
                Y = (screen.height/2) - (winHeight/2);

                if(winChild5 == null) {
                    winChild5=document.getElementById("contPopup");        //To accept 'id=seekHist' from menu-owner's History
                    winChild5= window.open(pName,'','width = '+ winWidth +',height = '+ winHeight +',left = '+ X +',top = '+ Y +',resizable=1,status=1,toolbar=no,scrollbar = 1');
                }
                else if(winChild5.closed){
                    winChild5=document.getElementById("contPopup");        //To accept 'id=seekHist' from menu-owner's History
                    winChild5= window.open(pName,'','width = '+ winWidth +',height = '+ winHeight +',left = '+ X +',top = '+ Y +',resizable=1,status=1,toolbar=no,scrollbar = 1');
                }
                else if(winChild5==""){winChild5.focus();}
                else  winChild5.focus();
            }

            //-----------------------------------------END----------------------------------------------------------------

        </script>


    </head>

    <body  onload="initPage();dateString();">
        <form id="form1" name="form1" method="post">

            <%--   <div id="dialog" title="Select Patient">
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
                            <th  >Age</th>
                            <th >Sex</th>
                            <th >Nationality</th>
                            <th >Telephone No</th>

                        </tr>
                    </thead>

                    <tbody >

                        <c:forEach items="${patientList}" var="patient">
                            <tr style="border-color:#000000" border="1"  cellpadding="1"  cellspacing="1" >
                                <td  class="dataTextName" onclick="selectName('<c:out value="${patient.name}"/>','<c:out value="${patient.id}"/>')"><c:out value="${patient.cardno}"/></td>
                                <td  class="dataTextName" onclick="selectName('<c:out value="${patient.name}"/>','<c:out value="${patient.id}"/>')"><c:out value="${patient.name}"/></td>
                                <td class="dataText"><c:out value="${patient.age}"/></td>                               
                                <td  class="dataText"><c:out value="${patient.sex}"/></td>
                                <td class="dataText"><c:out value="${patient.nationality}"/></td>
                                <td  class="dataText"><c:out value="${patient.telephoneno}"/></td>


                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>  --%>
            <input type="hidden" id="selected" name="selected"  value=""/>
            <input type="hidden" id="patientID" name="patientID" value='${patient.id}' />
            <div style="border-radius:10px;border-width: 1px;border-style: solid;border-color: black">

                <table width="100%">
                    <tr>
                        <td colspan="3"   class="headerTD">Set  Appointment</td>
                    </tr>
                    <tr></tr><tr></tr>
                    <tr>
                        <td colspan="3"  align="left" class="labelCss">Patient Name&nbsp;&nbsp;<a id="contPopup"  href="javascript:openWin5('Controller?process=PatientProcess&action=viewAllPopUp&patientControllerValue=null&noOfRecords=20&pageno=1&alphabit=null&flag=0',700,300,'propAdd1')"    style="font-size:7pt;" class="anchor" ><input id="patientName" type="text" name="patientName"  readonly  value='${patient.name}'  size="20"  /></a>


                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button id="add">New Patient</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Appointment Date&nbsp;&nbsp;&nbsp;&nbsp;<input id="appointmentDate"   readonly type="text" name="appointmentDate"   />

                            <select name="time" id="time" >

                                <option value="07:00" >07:00 AM</option>
                                <option value="07:15" >07:15 AM</option>
                                <option value="07:30" >07:30 AM</option>
                                <option value="07:45" >07:45 AM</option>
                                <option value="08:00" >08:00 AM</option>
                                <option value="08:15" >08:15 AM</option>
                                <option value="08:30" >08:30 AM</option>
                                <option value="08:45" >08:45 AM</option>
                                <option value="09:00" selected>09:00 AM</option>
                                <option value="09:15" >09:15 AM</option>
                                <option value="09:30" >09:30 AM</option>
                                <option value="09:45" >09:45 AM</option>
                                <option value="10:00" >10:00 AM</option>
                                <option value="10:15" >10:15 AM</option>
                                <option value="10:30" >10:30 AM</option>
                                <option value="10:45" >10:45 AM</option>
                                <option value="11:00" >11:00 AM</option>
                                <option value="11:15" >11:15 AM</option>
                                <option value="11:30" >11:30 AM</option>
                                <option value="11:45" >11:45 AM</option>
                                <option value="12:00" >12:00 PM</option>
                                <option value="12:15" >12:15 PM</option>
                                <option value="12:30" >12:30 PM</option>
                                <option value="12:45" >12:45 PM</option>
                                <option value="13:00" >01:00 PM</option>
                                <option value="13:15" >01:15 PM</option>
                                <option value="13:30" >01:30 PM</option>
                                <option value="13:45" >01:45 PM</option>
                                <option value="14:00" >02:00 PM</option>
                                <option value="14:15" >02:15 PM</option>
                                <option value="14:30" >02:30 PM</option>
                                <option value="14:45" >02:45 PM</option>
                                <option value="15:00" >03:00 PM</option>
                                <option value="15:15" >03:15 PM</option>
                                <option value="15:30" >03:30 PM</option>
                                <option value="15:45" >03:45 PM</option>
                                <option value="16:00" >04:00 PM</option>
                                <option value="16:15" >04:15 PM</option>
                                <option value="16:30" >04:30 PM</option>
                                <option value="16:45" >04:45 PM</option>
                                <option value="17:00" >05:00 PM</option>
                                <option value="17:15" >05:15 PM</option>
                                <option value="17:30" >05:30 PM</option>
                                <option value="17:45" >05:45 PM</option>
                                <option value="18:00" >06:00 PM</option>
                                <option value="18:15" >06:15 PM</option>
                                <option value="18:30" >06:30 PM</option>
                                <option value="18:45" >06:45 PM</option>
                                <option value="19:00" >07:00 PM</option>
                                <option value="19:15" >07:15 PM</option>
                                <option value="19:30" >07:30 PM</option>
                                <option value="19:45" >07:45 PM</option>
                                <option value="20:00" >08:00 PM</option>
                                <option value="20:15" >08:15 PM</option>
                                <option value="20:30" >08:30 PM</option>
                                <option value="20:45" >08:45 PM</option>
                                <option value="21:00" >09:00 PM</option>
                                <option value="21:15" >09:15 PM</option>
                                <option value="21:30" >09:30 PM</option>
                                <option value="21:45" >09:45 PM</option>

                            </select>
                        </td>
                        <td></td>
                    </tr>
                    <tr>

                    </tr>
                    <tr>

                    </tr>
                    <tr>
                        <td><div align="left"></div></td>
                    </tr>
                    <tr>
                        <td colspan="2"><div align="left">
                                <table width="100%" border=0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="11%" class="labelCss"><div align="left">Department</div></td>
                                        <td width="1%" class="labelCss"><div align="left">:</div></td>
                                        <td width="15%"><div align="left">
                                                <label>
                                                    <select style="width: 150px" class="textField" name='countryID' id="countryID"  onchange="showState(this.value)">
                                                        <option  value="none" >Select</option>
                                                        <%
                                                                    Class.forName("org.postgresql.Driver").newInstance();
                                                                    Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5433/plexus_version1", "postgres", "plexus");

                                                                    Statement stmt = con.createStatement();
                                                                    ResultSet rs = stmt.executeQuery("Select * from departmentname");
                                                                    while (rs.next()) {
                                                        %>
                                                        <option onclick="showCountryOptn(this.label)" label="<%=rs.getString(2)%>" value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
                                                        <%
                                                                    }
                                                        %>
                                                    </select>
                                                </label>

                                            </div></td>
                                        <td width="12%" class="labelCss"><div align="left" >Doctor </div></td>
                                        <td width="1%" class="labelCss"><div align="left">:</div></td>
                                        <td width="18%"><div align="left" name="state" id="state">

                                                <label>
                                                    <select style="width: 100px" class="textField" name=''>
                                                        <option  value="-1" ></option>
                                                    </select>
                                                </label>

                                            </div></td>
                                        <td width="17%" class="labelCss"><div align="left">Consultancy Type</div></td>
                                        <td width="1%" class="labelCss"><div align="left">:</div></td>
                                        <td width="24%"><div align="left"><label>
                                                    <select style="width: 150px" class="textField" name='consultntid' id="consultntid"  ><!-- onchange="showState1(this.value)" -->
                                                        <option  value="none" >Select</option>
                                                        <%
                                                                    Class.forName("org.postgresql.Driver").newInstance();
                                                                    con = DriverManager.getConnection("jdbc:postgresql://localhost:5433/plexus_version1", "postgres", "plexus");

                                                                    stmt = con.createStatement();
                                                                    rs = stmt.executeQuery("Select * from consultancytype");
                                                                    while (rs.next()) {
                                                        %>
                                                        <option onclick="showConsultancyOptn(this.label)" label="<%=rs.getString(2)%>" value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>
                                                        <%
                                                                    }
                                                        %>
                                                    </select>
                                                </label></div></td>
                                    </tr>
                                </table>
                            </div></td>

                    </tr>

                    <input type="hidden" name="statenameTxt" id="statenameTxt" value="null" size="10" />
                    <input type="hidden" name="consultanttype" id="consultanttype" value="null" size="10" />
                    <tr>
                        <td><div align="left"></div></td>
                    </tr>
                    <%--           <tr>


                                <td  class="labelCss"><div align="right"><span class="">Department Name :</span></div></td>

                                <td><div align="left">

                                          <select style="width: 100px" class="textField" name='countryID' id="countryID"  onchange="showState(this.value)">
                                            <option  value="none" >Select</option>
                                           <%
                                            Class.forName("org.postgresql.Driver").newInstance();
                                            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5433/plexus_version1", "postgres", "plexus");

                                            Statement stmt = con.createStatement();
                                            ResultSet rs = stmt.executeQuery("Select * from departmentname");
                                            while (rs.next()) {
                                %>
                                            <option onclick="showCountryOptn(this.label)" label="<%=rs.getString(2)%>" value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
                                <%
                                            }
                                %>
                                        </select>


                                <br/>
                                <br/>

                                    </div></td>
                                    <td></td>
                    </tr>
                    <tr>
                                 <td  class="labelCss" ><div align="right"><span class="">Doctor Name :</span></div></td>

                                <td><div align="left" id='state'>
                                         <select style="width: 100px" class="textField" name='state'>
                                            <option  value="-1" ></option>
                                        </select>


                                <br/>
                                <br/>

                                    </div></td>
                                    <td></td>

                            </tr>

                            <tr>


                                <td  class="labelCss"><div align="right"><span class="">Consultancy Type :</span></div></td>

                                <td><div align="left">

                                          <select style="width: 100px" class="textField" name='consultntid' id="consultntid"  ><!-- onchange="showState1(this.value)" -->
                                            <option  value="none" >Select</option>
                                           <%
                                            Class.forName("org.postgresql.Driver").newInstance();
                                             con = DriverManager.getConnection("jdbc:postgresql://localhost:5433/plexus_version1", "postgres", "plexus");

                                             stmt = con.createStatement();
                                             rs = stmt.executeQuery("Select * from consultancytype");
                                            while (rs.next()) {
                                %>
                                            <option onclick="showConsultancyOptn(this.label)" label="<%=rs.getString(2)%>" value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
                                <%
                                            }
                                %>
                                        </select>


                                <br/>
                                <br/>

                                    </div></td>
                                    <td></td>
                    </tr>
                    <tr>
                    <input type="hidden" name="countrynameTxt" id="countrynameTxt" value="null" size="10" />
                           <input type="hidden" name="statenameTxt" id="statenameTxt" value="null" size="10" />
                            <input type="hidden" name="consultanttype" id="consultanttype" value="null" size="10" />
                    </tr>
                    --%>

                    <tr><td align="left" valign="top"  class="labelCss">Remarks</td>
                        <td  align="left" >
                            &nbsp;&nbsp;<textarea id="remarks"  name="remarks" cols="81" rows="2"></textarea>
                        </td >
                        <td  align="left" valign="bottom"><button id="set">Set</button>
                        </td>

                    </tr>
                    <tr></tr><tr></tr>

                </table>
            </div>
            <table width="100%">

                <tr>
                    <td  class="headerTD">View  Appointment</td>
                </tr>

            </table>
            <table width="100%" border="0" >
                <tr><td width="80%">
                        <table width="100%" style="color: #006699" border="0" >


                            <tr>
                                <th      bgcolor="e3efff" scope="row"><div class="style1">7<sup>am</sup></div></th>
                                <td id="td7"><div class="divCSS" id="07"> </div></td>
                            </tr> <tr>
                                <th      bgcolor="e3efff" scope="row"><div class="style1">8<sup>am</sup></div></th>
                                <td id="td8"><div class="divCSS" id="08"> </div></td>
                            </tr>
                            <tr>
                                <th      bgcolor="e3efff" scope="row"><div class="style1">9<sup>am</sup></div></th>
                                <td id="td9"><div class="divCSS" id="09"> </div></td>
                            </tr> <tr>
                                <th      bgcolor="e3efff" scope="row"><div class="style1">10<sup>am</sup></div></th>
                                <td id="td10"><div class="divCSS" id="10"> </div></td>
                            </tr>
                            <tr>
                                <th      bgcolor="e3efff" scope="row"><div class="style1">11<sup>am</sup></div></th>
                                <td id="td11" ><div class="divCSS" id="11"> </div></td>
                            </tr> <tr>
                                <th      bgcolor="e3efff" scope="row"><div class="style1">12<sup>pm</sup></div></th>
                                <td id="td12"><div class="divCSS" id="12"> </div></td>
                            </tr>
                            <tr>
                                <th      bgcolor="e3efff" scope="row"><div class="style1">1<sup>pm</sup></div></th>
                                <td id="td13" ><div class="divCSS" id="13"> </div></td>
                            </tr> <tr>
                                <th      bgcolor="e3efff" scope="row"><div class="style1">2<sup>pm</sup></div></th>
                                <td  id="td14"><div class="divCSS" id="14"> </div></td>
                            </tr>
                            <tr>
                                <th      bgcolor="e3efff" scope="row"><div class="style1">3<sup>pm</sup></div></th>
                                <td id="td15"><div class="divCSS" id="15"> </div></td>
                            </tr> <tr>
                                <th      bgcolor="e3efff" scope="row"><div class="style1">4<sup>pm</sup></div></th>
                                <td  id="td16"><div class="divCSS" id="16"> </div></td>
                            </tr>
                            <tr>
                                <th      bgcolor="e3efff" scope="row"><div class="style1">5<sup>pm</sup></div></th>
                                <td id="td17"><div class="divCSS" id="17"> </div></td>
                            </tr> <tr>
                                <th      bgcolor="e3efff" scope="row"><div class="style1">6<sup>pm</sup></div></th>
                                <td id="td18"><div class="divCSS" id="18"> </div></td>
                            </tr>
                            <tr>
                                <th      bgcolor="e3efff" scope="row"><div class="style1">7<sup>pm</sup></div></th>
                                <td id="td19"><div class="divCSS" id="19"> </div></td>
                            </tr>
                            <th      bgcolor="e3efff" scope="row"><div class="style1">8<sup>pm</sup></div></th>
                            <td id="td20"><div class="divCSS" id="20"> </div></td>
                </tr>
                <tr>
                    <th      bgcolor="e3efff" scope="row"><div class="style1">9<sup>pm</sup></div></th>
                    <td id="td21"><div class="divCSS" id="21"> </div></td>
                </tr>
                <tr>
                    <th      bgcolor="e3efff" scope="row"><div class="style1">10<sup>pm</sup></div></th>
                    <td id="td22" ><div class="divCSS" id="22"> </div></td>
                </tr>
                <tr>
                    <th      bgcolor="e3efff" scope="row"><div class="style1">11<sup>pm</sup></div></th>
                    <td id="td23"><div class="divCSS" id="23"> </div></td>
                </tr>
            </table>
        </td>
        <td align="left" valign="top">
            <input type="hidden" id="visitDay"  />
            <div  id="datePicker" ></div>


        </td>



    </tr>

</table>           


</form>

</body>
</html>
