<%-- 
    Document   : left_sale
    Created on : Sep 15, 2014, 11:03:56 PM
    Author     : KAMAL
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

        <script type="text/javascript">
            var get;
            function getdata() {

                if (typeof XMLHttpRequest != "undefined") {
                    get = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    get = new ActiveXObject("Microsoft.XMLHTTP");
                }


                get.onreadystatechange = processdata;
                get.open("POST", "AppointmentController",true);
                get.send(null);

            }

            function processdata() {
                if (get.readyState==4)
                {
                    if (get.status==200){

                        var count = get.responseXML.getElementsByTagName("count")[0];
                        var childCount=count.childNodes[0].nodeValue;
                        var mdiv = document.getElementById("n1");
                        mdiv.innerHTML=childCount;
                        mdiv.style.visible='block';
                        setTimeout('getdata();', 60000);


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
                setTimeout(function(){ reload(req);}, 100);
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
            }
            .noti_bubble {
                position:relative;
                font-size: 12px;
                top: -44px;
                left: 30px;
                padding-right:2px;
                background-color:red;
                color:white;
                font-weight:bold;

                z-index: 2;
                width: 10px;
                height: 16px;
                border-radius:2px;
                box-shadow:1px 1px 1px gray;
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
                color:#FFFFFF;
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
            }
            .noti_bubble {
                position:relative;
                font-size: 12px;
                top: -44px;
                left: 30px;
                padding-right:2px;
                background-color:red;
                color:white;
                font-weight:bold;

                z-index: 2;
                width: 10px;
                height: 16px;
                border-radius:2px;
                box-shadow:1px 1px 1px gray;
            }
            .headerTD{
                border-radius:1px;
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
                if(tDate.getHours()<10){
                    hours="0"+tDate.getHours();

                }
                else {
                    hours=tDate.getHours();
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
                clockDiv.innerHTML=" "+ months[tDate.getMonth()]+" "+tDate.getDate()+" "+tDate.getFullYear()+" "
                    + hours + ":"
                    + min + ":"
                    + sec;

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
            
            
          
            <h5 style="font-size: 12px"><a href="#" >Consultancy</a></h5>
            <div>
                <hr>
                <a target="mainFrame" href="Controller?process=TherapyBillProcess&action=addThreapyPage">Add New(Consultancy Bill)</a><br/> <!-- addtherapyBill.jsp  "Controller?process=TherapyBillProcess&action=addThreapyPage" -->

                <hr>
                <a target="mainFrame" href="Controller?process=TherapyBillProcess&action=showTodaysTherapyBills">View Consultancy</a><br/>
                <hr>
             <!--  <a target="mainFrame" href="manageTherapy.jsp">Manage Therapy</a><br/>  -->

            </div>

            <h5 style="font-size: 12px"><a href="#" >Investigation</a></h5>
            <div>

                <hr>
                <a target="mainFrame" href="Controller?process=InvestigationBillProcess&action=addInvestigationPage">Add New(Investigation Bill)</a><br/>  <!-- Controller?process=InvestigationBillProcess&action=addInvestigationPage     addinvestigationBill.jsp  -->

                <hr>
                <a target="mainFrame" href="Controller?process=InvestigationBillProcess&action=showTodaysInvestigationBills">View Investigation</a><br/>
                <hr>
           <!--     <a target="mainFrame" href="manageInvestigation.jsp">Manage Investigation</a><br/>  -->

            </div>
            <%--  <h5 style="font-size: 12px"><a href="#" >Consutancy</a></h5>
            <div>
                  <hr>
                <a target="mainFrame" href="Controller?process=ConsultancyProcess&action=viewAll">View Consultancy Type</a><br/>

                <hr>
                <a target="mainFrame" href="addConsultancy.jsp">Add Consultancy Type</a><br/>
                <hr>
                
            </div> --%>

            <h5 style="font-size: 12px"><a href="#" >Hospitalcharges</a></h5>
            <div>

                <hr>
                <a target="mainFrame" href="Controller?process=OperationBillProcess&action=addOperationPage">Add New(Hospital Bill)</a><br/>  <!-- Controller?process=InvestigationBillProcess&action=addInvestigationPage     addinvestigationBill.jsp  -->

                <hr>
                <a target="mainFrame" href="Controller?process=OperationBillProcess&action=showTodaysOperationBills">View Hospital Bill</a><br/>
                <hr>
           <!--     <a target="mainFrame" href="manageInvestigation.jsp">Manage Investigation</a><br/>  -->

            </div>
            <%--  <h5 style="font-size: 12px"><a href="#" >Advance</a></h5>
            <div>

                <hr>
                <a target="mainFrame" href="Controller?process=AdvanceProcess&action=addAdvancePage">Add New(Advance Bill)</a><br/>  <!-- Controller?process=InvestigationBillProcess&action=addInvestigationPage     addinvestigationBill.jsp  -->

                <hr>
                <a target="mainFrame" href="Controller?process=AdvanceProcess&action=showTodaysAdvanceBills">View Advance</a><br/>
                <hr>
           <!--     <a target="mainFrame" href="manageInvestigation.jsp">Manage Investigation</a><br/>  -->

            </div> --%>

            

        </div>
        
    </body>
</html>
</html>