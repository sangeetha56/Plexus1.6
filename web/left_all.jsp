<%-- 
    Document   : left_all
    Created on : Jun 13, 2016, 5:31:37 PM
    Author     : kamal
--%>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%--
Document   : left
Created on : Jan 4, 2012, 3:41:11 PM
Author     : Mayur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Left</title>
        <script language="JavaScript" src="js/motionpack.js"></script>
        <link rel="stylesheet" href="css/datePicker/jquery-ui-1.8.18.custom.css">
        <link rel="stylesheet" href="css/datePicker/demos.css">

        <script type="text/javascript" src="js/datePicker/jquery-1.7.1.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.core.js"></script>
        <script src="js/datePicker/ui/jquery.ui.widget.js"></script>
        <script src="js/datePicker/ui/jquery.ui.datepicker.js"></script>
        <script src="js/datePicker/ui/jquery.ui.accordion.js"></script>
        <script src="js/datePicker/ui/sliderAccess.js"></script>
        <script src="js/datePicker/ui/jquery-ui-timepicker-addon.js"></script>
        <link href="css/notification/jquery.jnotify.css" rel="stylesheet" type="text/css" />
        <script src="js/notification/jquery.jnotify.js" type="text/javascript"></script>

        <script type="text/javascript">
            var get;
            function getdata() {
                var startHour,startMin;
                var tDate = new Date();
                startHour=tDate.getHours();
                startMin=tDate.getMinutes();

                if (typeof XMLHttpRequest != "undefined") {
                    get = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    get = new ActiveXObject("Microsoft.XMLHTTP");
                }


                get.onreadystatechange = processdata;
                get.open("POST", "AjaxController?process=VisitProcess&action=getAJaxNextVisit&startHour="+startHour+"&startMin="+startMin,true);
                get.send(null);

            }

            function processdata() {
                var id,hourID,patientID,reminderTime,visitTime,rating,name,complaint,link;
                if (get.readyState==4)
                {
                    if (get.status==200){
                        var visits = get.responseXML.getElementsByTagName("Visits")[0];
                        var visitNodes = visits.getElementsByTagName("Visit");
                        for (var i = 0 ; i < visitNodes.length ; i++) {
                            var visit = visitNodes[i];

                            patientID=visit.getElementsByTagName("PatientID")[0].firstChild.nodeValue;
                            visitTime=visit.getElementsByTagName("VisitTime")[0].firstChild.nodeValue;
                            name=visit.getElementsByTagName("PatientName")[0].firstChild.nodeValue;
                            link="<a target='mainFrame' href='Controller?process=PatientProcess&action=viewDetails&id="+patientID+"'>"+name+"   "+visitTime+"</a>";

                            $(function() {
                                $('#Notification').jnotifyAddMessage({
                                    text: link,
                                    permanent: false,
                                    disappearTime: 30000
                                });

                            });

                        }


                        //setTimeout('getdata();', 60000);


                    }
                }

            }
            /**
             * Comment
             */
            var getExpiringStockCount;
            function getExpiringStock(){
                if (typeof XMLHttpRequest != "undefined") {
                    getExpiringStockCount = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    getExpiringStockCount = new ActiveXObject("Microsoft.XMLHTTP");
                }


                getExpiringStockCount.onreadystatechange = processExpiringStockData;
                getExpiringStockCount.open("POST", "AjaxController?process=StockProcess&action=getExpiringStock",true);
                getExpiringStockCount.send(null);

            }
            function processExpiringStockData() {

                if (getExpiringStockCount.readyState==4)
                {
                    if (getExpiringStockCount.status==200){
                        var count = getExpiringStockCount.responseXML.getElementsByTagName("ExpiringStockCount")[0];
                        var expiringStockCount=count.childNodes[0].nodeValue;
                        var expiringStock = document.getElementById("expiringStock");
                        expiringStock.innerHTML=" "+expiringStockCount;

                        //setTimeout('getExpiringStock();', 60000);


                    }
                }

            }

            var getDepletingStockCount;
            function getDepletingStock(){
                if (typeof XMLHttpRequest != "undefined") {
                    getDepletingStockCount = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    getDepletingStockCount = new ActiveXObject("Microsoft.XMLHTTP");
                }


                getDepletingStockCount.onreadystatechange = processDepletingStockData;
                getDepletingStockCount.open("POST", "AjaxController?process=StockProcess&action=getDepletingStock",true);
                getDepletingStockCount.send(null);

            }
            function processDepletingStockData() {

                if (getDepletingStockCount.readyState==4)
                {
                    if (getDepletingStockCount.status==200){
                        var count = getDepletingStockCount.responseXML.getElementsByTagName("DepletingStockCount")[0];
                        var depletingStockCount=count.childNodes[0].nodeValue;
                        var depletingStock = document.getElementById("depletingStock");
                        depletingStock.innerHTML=" "+depletingStockCount;
                        //setTimeout('getDepletingStock();', 60000);


                    }
                }

            }

            var getRareMedicineCount;
            function getRareMedicineStock(){
                if (typeof XMLHttpRequest != "undefined") {
                    getRareMedicineCount = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    getRareMedicineCount = new ActiveXObject("Microsoft.XMLHTTP");
                }


                getRareMedicineCount.onreadystatechange = processRareMedicineData;
                getRareMedicineCount.open("POST", "AjaxController?process=StockProcess&action=getRareMedicineS",true);
                getRareMedicineCount.send(null);

            }
            function processRareMedicineData() {

                if (getRareMedicineCount.readyState==4)
                {
                    if (getRareMedicineCount.status==200){
                        var count = getRareMedicineCount.responseXML.getElementsByTagName("MedicineRareCount")[0];
                        var RareMedicineCount=count.childNodes[0].nodeValue;
                        var RareMedicineStock = document.getElementById("raremedicine");
                        RareMedicineStock.innerHTML=" "+RareMedicineCount;
                        //setTimeout('getDepletingStock();', 60000);


                    }
                }

            }

        </script>
        <script type="text/javascript">
            var req;


            function count() {

                var idField = document.getElementById("userid");
                var url = "AppointmentController";
                if (typeof XMLHttpRequest != "undefined") {
                    req = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    req = new ActiveXObject("Microsoft.XMLHTTP");
                }
                reload(req);
                //req.open("POST", url, true);

                //req.send();
                /*req.onreadystatechange = function()
                {
                    if (req.readyState==4)
                    {
                        if (req.status==200){

                            var count = req.responseXML.getElementsByTagName("count")[0];
                            var childCount=count.childNodes[0].nodeValue;
                            var mdiv = document.getElementById("n1");
                            mdiv.innerHTML=childCount;
                            mdiv.style.visible='block';

                        }
                    }
                }*/



            }
            function handleRequest(){
                if (req.readyState==4)
                {
                    if (req.status==200){

                        var count = req.responseXML.getElementsByTagName("count")[0];
                        var childCount=count.childNodes[0].nodeValue;
                        var mdiv = document.getElementById("n1");
                        mdiv.innerHTML=childCount;
                        mdiv.style.visible='block';

                    }
                }
                //setTimeout(function(){ reload(req);}, 100);
            }
            function reload(req){
                alert();
                var url = "AppointmentController";
                if (req.readyState == 4 || req.readyState == 0) {
                    req.open("POST", url, true);
                    req.onreadystatechange()=handleRequest();
                    req.send(null);
                }

            }



        </script>
        <style>

            .noti_Container {
                position:relative;
                border:1px solid blue; /* This is just to show you where the container ends */
                width:16px;
                height:16px;
                cursor: pointer;
                overflow-x: hidden;
            }
            .noti_bubble {
                position:absolute;
                font-size: 12px;
                top: 450px;
                left: 0px;
                padding-right:2px;
                background-color:transparent;
                color:black;
                font-weight:bold;

                z-index: 2;
                width: 100%;
                height: 16px;
            }
        </style>
        <style>
            body{
                margin:0;
                padding:0;
                background:#FFFFFF;
                font:80% Tahoma;
                color:#555;
                line-height:150%;
                text-align:left;

            }
            /*body{
                margin:0;
                padding:0;
                background:#E6EEF4;
                font:80% Tahoma;
                color:#555;
                line-height:150%;
                text-align:left;

            }*/
            a{
                text-decoration:none;

                color:#cfe0ea;;
            }
            a:hover{
                text-decoration:none;
                color:red;
            }
            h1{
                font-size:140%;
                margin:0 20px;
                line-height:80px;
            }

            #content{margin:0 0px;}
            p{
                margin:0 auto;
                width:700px;
                padding:1em 0;
            }


            .noti_Container {
                position:relative;
                border:1px solid blue; /* This is just to show you where the container ends */
                width:16px;
                height:16px;
                cursor: pointer;
                overflow-x: hidden;
            }
            .headerTD{
                border-radius:1px;
                background-color:#4b6a84;
                background-image: url("images/ui-bg_diagonals-small_50_466580_40x40.png");
                color: #FFFFFF;
                font-family: Tahoma;
                font-size: 12px;
                text-transform: uppercase;
                text-align: center;
                font-weight: bold;
                height: 22px;
            }


}



        </style>

        <script>
            function f1()
            {
                document.getElementById("n1").style.visibility='hidden';
            }
        </script>
        <script type="text/javascript">
            var req;


            function count() {

                var idField = document.getElementById("userid");
                var url = "AppointmentController";
                if (typeof XMLHttpRequest != "undefined") {
                    req = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    req = new ActiveXObject("Microsoft.XMLHTTP");
                }
                var url = "AppointmentController";
                req.open("POST", url, true);



                //req.open("POST", url, true);

                req.send();
                req.onreadystatechange = function()
                {
                    if (req.readyState==4)
                    {
                        if (req.status==200){

                            var count = req.responseXML.getElementsByTagName("count")[0];
                            var childCount=count.childNodes[0].nodeValue;
                            var mdiv = document.getElementById("n1");
                            mdiv.innerHTML=childCount;
                            mdiv.style.visible='block';

                        }
                    }
                }



            }


            var timer = null;
            function auto_reload()
            {   alert();
                window.location = 'notication.jsp';
            }

        </script>
        <script language="JavaScript">
            var clockID = 0;
            function UpdateClock() {
                if(clockID) {
                    clearTimeout(clockID);
                    clockID  = 0;
                }
                var months=["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
                var tDate = new Date();
                var clockDiv=document.getElementById('clock');
                var hours,min,sec;
                var shortHand;
                if(tDate.getHours()<10) {
                    hours="0"+tDate.getHours();
                     shortHand=" AM"
                }
                else  if(tDate.getHours()>12) {
                    hours="0"+(tDate.getHours()-12);
                    shortHand=" PM"

                }

                if(tDate.getMinutes()<10){
                    min="0"+tDate.getMinutes();

                }
                else {
                    min=tDate.getMinutes();
                }
                if(tDate.getSeconds()<10){
                    sec="0"+tDate.getSeconds();

                }
                else {
                    sec=tDate.getSeconds();
                }
                clockDiv.innerHTML=" "+ months[tDate.getMonth()]+" "+tDate.getDate()+" "+tDate.getFullYear()+" ["
                    + hours + ":"
                    + min + ":"
                    + sec+shortHand+"]";;

                clockID = setTimeout("UpdateClock()", 1000);
            }
            function StartClock() {
                clockID = setTimeout("UpdateClock()", 1);
            }
            function KillClock() {
                if(clockID) {
                    clearTimeout(clockID);
                    clockID  = 0;
                }

            }
            function change(id,image){
                var img=document.getElementById(id);
                img.src="images/"+image;

            }
        </script>

        <script>
            $(function() {


                $( "#container" ).accordion({
                    collapsible: true,
                    active: false,
                    autoHeight: false,
                    navigation: true
                });


            });
        </script>
    </head>
    <body onload="StartClock()" onunload="KillClock()">
        <form name="theClock">

            <div id="clock" class="headerTD"></div>
        </form>

        <div id="container" style="width: 100%" >
            <h5 style="font-size: 12px"><a href="#">Patient</a></h5>
            <div>

                <a target="mainFrame" href="Controller?process=PatientProcess&action=viewAll&patientControllerValue=null&noOfRecords=20&pageno=1&alphabit=null" >View All</a><br/>
                 <hr>
                <a target="mainFrame" href="addPatient.jsp">Add Patient</a><br/>
                 <hr>
                <a target="mainFrame" href="Controller?process=PatientProcess&action=patientSearch">Search</a><br/><!-- patientContactSearch.jsp -->
                 <hr>
                <a target="mainFrame" href="Controller?process=PatientProcess&action=viewAllManage&patientControllerValue=null&noOfRecords=20&pageno=1&alphabit=null">Manage Patient</a><br/>

            </div>


             <h5 style="font-size: 12px"><a href="#">In-Patient</a></h5>
            <div>

                <a target="mainFrame" href="Controller?process=InPatientProcess&action=viewAll&patientControllerValue=null&noOfRecords=20&pageno=1&alphabit=null" >View All</a><br/>
                 <hr>
                <a target="mainFrame" href="Controller?process=InPatientProcess&action=patientSearch">Search</a><br/><!-- inpatientContactSearch.jsp -->
                 <hr>
                <a target="mainFrame" href="Controller?process=InPatientProcess&action=viewAllDischarge&patientControllerValue=null&noOfRecords=20&pageno=1&alphabit=null" >Discharge List</a><br/>
                     <hr>
                     <a target="mainFrame" href="Controller?process=InPatientProcess&action=viewAllManage&patientControllerValue=null&noOfRecords=20&pageno=1&alphabit=null" >Manage In-Patient</a><br/>

            </div>

            <h5 style="font-size: 12px"><a href="#" >Appointment</a></h5>
            <div>

                <a target="mainFrame" href="Controller?process=VisitProcess&action=viewTodaysAppointment&isPatientSelected=no">View Appointment</a>

            </div>
            <h5 style="font-size: 12px"><a href="#" >Pharmacy</a></h5>
            <div>
                <a target="mainFrame" href="Controller?process=MedicineProcess&action=viewAllMedicine&medicineControllerValue=null&noOfRecords=20&pageno=1&alphabit=null">Medicine</a>
                 <hr>
                <a target="mainFrame" href="Controller?process=MedicineProcess&action=viewAllMedicineWithEmptyStocks&medicineControllerValue=null&noOfRecords=20&pageno=1&alphabit=null">Initial Stock</a>
                 <hr>
                <a target="mainFrame" href="Controller?process=StockProcess&action=CurrentStocks&medicineControllerValue=null&noOfRecords=20&pageno=1&alphabit=null">Current Stock</a>
                 <hr>
                <a target="mainFrame" href="Controller?process=MedicineProcess&action=dispensePrescribedMedicinePatient">Dispense Medicine Patient</a> <%-- <a target="mainFrame" href="Controller?process=MedicineProcess&action=dispensePrescribedMedicine">Dispense Medicine</a><br/>  --%>
                 <hr>
                <a target="mainFrame" href="Controller?process=MedicineProcess&action=dispensePrescribedMedicineInPatient">Dispense Medicine inPatient</a>
                <hr>
                <a target="mainFrame" href="Controller?process=MedicineProcess&action=searchMedicine">Search</a><br/><!-- MedicineSearch.jsp  -->
                <hr>
                <a target="mainFrame" href="Controller?process=MedicineProcess&action=viewAllMedicineManage&medicineControllerValue=null&noOfRecords=20&pageno=1&alphabit=null">Manage Medicine</a>
                  <hr>
             <%--  <a target="mainFrame" href="Controller?process=MedicineProcess&action=dispensePrescribedMedicine">Dispense Medicine</a><br/>


                <a target="mainFrame" href="Controller?process=MedicineProcess&action=dispensePrescribedMedicine">Dispense Medicine Test</a><br/>  --%>

                <a target="mainFrame" href="Controller?process=StockProcess&action=medicineForPopUp&medicineControllerValue=null&noOfRecords=20&pageno=1&alphabit=null">Dispense Medicine Availablity</a><br/>

            </div>
            <h5 style="font-size: 12px"><a href="#" >PharmaContact</a></h5>
            <div>
                <a target="mainFrame" href="Controller?process=CompanyProcess&action=viewAllCompany">Manufacturer</a><br/>
                <hr>
                <a target="mainFrame" href="Controller?process=VendorProcess&action=viewAllVendor">Vendor</a><br/>

            </div>
            <h5 style="font-size: 12px"><a href="#" >Billing & Accounts</a></h5>
            <div>
                <hr>
                <a target="mainFrame" href="Controller?process=BillProcess&action=showTodaysBills">Consultation</a><br/>

                <hr>
                <a target="mainFrame" href="Controller?process=DispenseProcess&action=showTodaysDispensedBills">Pharmacy outPatient</a><br/>
                <hr>
                <a target="mainFrame" href="Controller?process=inDispenseProcess&action=showTodaysDispensedBills">Pharmacy In Patient</a><br/>
                 <hr>

                <a target="mainFrame" href="Controller?process=TherapyBillProcess&action=showTodaysTherapyBills">Therapy</a><br/>
                 <hr>

                <a target="mainFrame" href="Controller?process=InvestigationBillProcess&action=showTodaysInvestigationBills">Investigation</a><br/>
                 <hr>
                <a target="mainFrame" href="Controller?process=DailySalesProcess&action=showTodaysSalesReport">Daily Sales Report</a><br/>
            </div>

            <h5 style="font-size: 12px"><a href="#" >Therapy</a></h5>
            <div>
                <hr>
                <a target="mainFrame" href="Controller?process=TherapyBillProcess&action=addThreapyPage">Add New(Therapy Bill)</a><br/> <!-- addtherapyBill.jsp  "Controller?process=TherapyBillProcess&action=addThreapyPage" -->

                <hr>
                <a target="mainFrame" href="Controller?process=TherapyBillProcess&action=showTodaysTherapyBills">View Therapy</a><br/>

           <!--     <a target="mainFrame" href="manageTherapy.jsp">Manage Therapy</a><br/>  -->

            </div>

            <h5 style="font-size: 12px"><a href="#" >Investigation</a></h5>
            <div>
                <hr>
                <a target="mainFrame" href="Controller?process=InvestigationBillProcess&action=addInvestigationPage">Add New(Investigation Bill)</a><br/>  <!-- Controller?process=InvestigationBillProcess&action=addInvestigationPage     addinvestigationBill.jsp  -->

                <hr>
                <a target="mainFrame" href="Controller?process=InvestigationBillProcess&action=showTodaysInvestigationBills">View Investigation</a><br/>

            <!--    <a target="mainFrame" href="manageInvestigation.jsp">Manage Investigation</a><br/>  -->

            </div>

            <h5 style="font-size: 12px"><a href="#" >Tools</a></h5>
            <div>
           <!--     <a target="mainFrame" href="consultancyTab.jsp">Consultancy Type</a><br/> <!-- manageConsultancyType.jsp  -->

                   <a target="mainFrame" href="consultancyTab.jsp">Consultancy</a><br/>
            <%--     <a target="mainFrame" href="Controller?process=ConsultancyProcess&action=viewAll">View All Consultancy Type</a><br/> <!-- manageConsultancyType.jsp  -->
                 <hr>
                 <a target="mainFrame" href="addConsultancy.jsp">Add Consultancy Type</a><br/>--%>
                 <hr>
                <a target="mainFrame" href="DepartmentTab.jsp">Department</a><br/>
              <%--  <a target="mainFrame" href="manageDepartment.jsp">Department Type</a><br/> --%>
                <hr>
                <a target="mainFrame" href="doctorTab.jsp">Doctor</a><br/>
                 <hr>
                 <%-- <a target="mainFrame" href="addTherapyType.jsp">Add Therapy Type</a><br/>
                <hr>
                <a target="mainFrame" href="Controller?process=TherapyProcess&action=viewAll">View Therapy Type</a><br/>--%>
                 <a target="mainFrame" href="therapy.jsp">Therapy</a><br/>
                <hr>
                 <a target="mainFrame" href="InvestigationTab.jsp">Investigation</a><br/>
              <%--  <a target="mainFrame" href="addInvestigationType.jsp">Add Investigation Type</a><br/>
                <hr>
                <a target="mainFrame" href="Controller?process=InvestigationProcess&action=viewAll">View Investigation Type</a><br/>--%>

            </div>
            <h5 style="font-size: 12px"><a href="#" >Licence Information</a></h5>
            <div>
                <a target="mainFrame" href="Controller?process=LicenceProcess&action=checkRequest">Licence Information</a><br/>
                 <hr>
         <!--       <a target="mainFrame" href="addLicenceInfo.jsp">Add Info</a><br/>
                 <hr>
                 <a target="mainFrame" href="Controller?process=LicenceProcess&action=viewLicence">View Licence</a><br/>
                 <hr>  -->


            </div>


        </div>

        <div id="Notification" >

        </div>
        <script type="text/javascript">
            $(document).ready(function() {

                // For jNotify Inizialization
                // Parameter:
                // oneAtTime : true if you want show only one message for time
                // appendType: 'prepend' if you want to add message on the top of stack, 'append' otherwise

                $('#Notification')
                .jnotifyInizialize({
                    oneAtTime: false,
                    appendType: 'append'

                })
                .css({ 'position': 'absolute',
                    'marginTop': '200px',
                    'left': '0px',
                    'width': '175px',
                    'height': '40px',
                    'z-index': '9999'
                });
                // --------------------------------------------------------------------------

                // For add a notification on button click
                // Parameter:
                // text: Html do you want to show
                // type: 'message' or 'error'
                // permanent: True if you want to make a message permanent
                // disappearTime: Time spent before closing message




                // -----------------------------------------------------
            });
        </script>


        <div id="n1" class="">
            <table width="100%" border="1">

                <tr>
                    <td  style="font-size:18x;background-color: white;border-radius:3px;" colspan="3" align="center">Drug Status</td>
                </tr>


                <tr>
                    <td  style="font-size:10px;width:25%;background-color:green;border-radius:3px;"><a href="Controller?process=StockProcess&action=viewExpiringStock&expiringStockControllerValue=null&noOfRecords=20&pageno=1&alphabit=null" target="mainFrame">Expiring<span id="expiringStock"></span></a></td><!-- Controller?process=StockProcess&action=viewExpiringStock -->
                    <td style="font-size: 10px;width:25%;background-color: orange;border-radius:3px;"><a href="Controller?process=StockProcess&action=viewDepletingStock&depletingStockControllerValue=null&noOfRecords=20&pageno=1&alphabit=null" target="mainFrame">Depleting<span id="depletingStock"></span></a></td><!-- Controller?process=StockProcess&action=viewDepletingStock  -->
                    <td style="font-size: 10px;width:25%;background-color: blue;border-radius:3px;"><a href="Controller?process=StockProcess&action=viewAllRareMedicine&rareStockControllerValue=null&noOfRecords=20&pageno=1&alphabit=null" target="mainFrame">Rarely Used<span id="raremedicine"></span></a></td> <!-- Controller?process=StockProcess&action=viewAllRareMedicine  -->
                </tr>


            </table>

        </div>

        <script>
            getdata();
            getExpiringStock();
            getDepletingStock();
            getRareMedicineStock();
        </script>
    </body>

</html>
