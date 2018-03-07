<%--
  Document   : patientDetails
  Created on : Jan 13, 2012, 12:21:03 PM
  Author     : Mayur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <script type="text/javascript" language="JavaScript" src="js/motionpack.js"></script>
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
        <script type="text/javascript" src="js/graph/jquery.jqplot.js"></script>
        <script  type="text/javascript" src="js/graph/plugins/jqplot.dateAxisRenderer.min.js"></script>
        <script type="text/javascript" src="js/graph/plugins/jqplot.barRenderer.min.js"></script>
        <script type="text/javascript" src="js/graph/plugins/jqplot.categoryAxisRenderer.min.js"></script>
        <script type="text/javascript" src="js/graph/plugins/jqplot.cursor.min.js"></script>
        <script type="text/javascript" src="js/graph/plugins/jqplot.highlighter.min.js"></script>
        <script type="text/javascript" src="js/graph/plugins/jqplot.dragable.min.js"></script>
        <script type="text/javascript" src="js/graph/plugins/jqplot.trendline.min.js"></script>


        <script src="js/print/jquery.printPage.js" type="text/javascript"></script>

        <script type="text/javascript">
            $(function() {

                $("#print").printPage();
            });
        </script>
        <style type="text/css">
            <!--
            .dataTextInActive {
                border-radius:1px;
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 12px;
                font-weight: bold;
                letter-spacing: normal;
                text-align: left;
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


            .dataContent {

                font-size: 12px;

            }
            -->
        </style>

        <style type="text/css">

            #bord     {
                background-color: white;

            }
            *{font-family: 'Segoe UI';}
            .tabbable .tabs {list-style: none; margin: 0 10px; padding: 0;}
            .tabbable .tabs li {list-style: none; margin: 0; padding: 0; display: inline-block; position: relative; z-index: 1;}
            .tabbable .tabs li a {text-decoration: none; color: #000; border: 1px solid #ccc; padding: 5px; display: inline-block; border-radius: 5px 5px 0 0; background: #82B4CE;}
            .tabbable .tabs li a.active, .tabbable .tabs li a:hover {border-bottom-color: #fff; background: #fff;}
            .tabcontent {border: 1px solid #ccc; margin-top: -1px; padding: 10px;}
        </style>

        <script>
            $(function() {
                $(document).ready(function(){
                    $(".tabbable").find(".tab").hide();
                    $(".tabbable").find(".tab").first().show();
                    $(".tabbable").find(".tabs li").first().find("a").addClass("active");
                    $(".tabbable").find(".tabs").find("a").click(function(){
                        tab = $(this).attr("href");
                        $(".tabbable").find(".tab").hide();
                        $(".tabbable").find(".tabs").find("a").removeClass("active");
                        $(tab).show();
                        $(this).addClass("active");
                        return false;
                    });
                });

            });
        </script>





        <script type="text/javascript">
            function validateConsultationCharges(visitId){
                var consultationCharges="#consultationCharges"+visitId;
                if($(consultationCharges).val()==""){
                    alert("Enter Consultation charges")
                    return false;

                }

                else{
                    return true;
                }
            }

            function setAppointment(){
                var form1=document.getElementById("form1");
                form1.action="Controller?process=VisitProcess&action=viewTodaysAppointment";
                form1.submit();
            }

            function updateInpatient(){
                var form1=document.getElementById("form1");
                form1.action="Controller?process=InPatientProcess&action=updatePatientDetails&id=<c:out  value='${inpatient.id}'/>";
                form1.submit();
            }


            function updateDischargeDate(){
                var form1=document.getElementById("form1");
                form1.action="Controller?process=InPatientProcess&action=update&id=<c:out  value='${inpatient.id}'/>";
                form1.submit();
            }



            function fullSummary(){
                var form1=document.getElementById("form1");
                form1.action="patientFullSummary.jsp";
                form1.submit();
            }
            //   function addPrescription(visitId){
            //      addVisitByID(visitId);
            //      var form1=document.getElementById("form1");

            //      var rowIdString=document.getElementById('rowIdString');
            //      var rowMedicineIdString=document.getElementById('rowMedicineIdString');
            //      var rowMedicineNatureString=document.getElementById('rowMedicineNatureString');
            //      var rowMedicineStrengthString=document.getElementById('rowMedicineStrengthString');
            //      var rowMedicineDurationString=document.getElementById('rowMedicineDurationString');
            //       var rowMedicineDosingString=document.getElementById('rowMedicineDosingString');
            //       var rowMedicineRemarkString=document.getElementById('rowMedicineRemarkString');
            //       form1.action="Controller?process=PrescriptionProcess&action=add&visitId="+visitId+"&rowIdString="+rowIdString.value+"&rowMedicineIdString="+rowMedicineIdString.value+"&rowMedicineNatureString="+rowMedicineNatureString.value+"&rowMedicineStrengthString="+rowMedicineStrengthString.value+"&rowMedicineDurationString="+rowMedicineDurationString.value+"&rowMedicineDosingString="+rowMedicineDosingString.value+"&rowMedicineRemarkString="+rowMedicineRemarkString.value;
            //      form1.submit();
            //   }
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
            var natures=["","Ampoule",
                "Aerosol" ,
                "Caplets" ,
                "Chewable" ,
                "Cream"  ,
                "Capsules" ,
                "Drops"  ,
                "Foam" ,
                "Gel"  ,
                "Inhaler"  ,
                "Injection"   ,
                "Lotion"  ,
                "Lozenges"  ,
                "Ointment"  ,
                "Pills"  ,
                "Powder"  ,
                "suppositories",
                "Syrup"  ,
                "Soap"  ,
                "Solution"  ,
                "Spray"  ,
                "Suspension"  ,
                "Tablets"

            ];

            var medicines=[
            <c:forEach varStatus="status" items="${allMedicines}" var="medicine">{
                    value:'<c:out default="0" value="${medicine.medicineName}" />',
                    availableStock:'<c:out default="0" value="${medicine.availableStock}" />',
                    strength:'<c:out default="0" value="${medicine.medicineStrength}" />',
                    id:'<c:out default="0" value="${medicine.id}" />',
                    nature:'<c:out default="0" value="${medicine.medicineNature}" />'}<c:if test="${!status.last}">,</c:if>
            </c:forEach>
            ];
            var availableTags = [
            <c:forEach varStatus="status" items="${allMedicines}" var="medicine">
                '<c:out default="0" value="${medicine.medicineName}" />',
                <c:if test="${!status.last}"></c:if>
            </c:forEach>
            ];


        </script>

        <script type="text/javascript">
        $(function() {

            $("#accordion").accordion({
                collapsible: true,

                autoHeight: false});
            /*$("#set")
                .button()
                .click(function() {
                    updateVisit();
                });  */
        });
        function openPrescriptionPopup(divID){
            $(divID).dialog( "open" );
        }
        function openPopup(divID){
            $(divID).dialog( "open" );
        }
        function addRow(tableID,visitID) {
            var table = document.getElementById(tableID);
            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);
            var cell1 = row.insertCell(0);
            var dataRowID = document.createElement("input");
            dataRowID.type="hidden";
            dataRowID.id=rowCount;
            dataRowID.value=rowCount;
            var element1 = document.createElement("input");
            element1.id="chk_"+rowCount+"_"+visitID;
            element1.type = "checkbox";
            cell1.appendChild(element1);
            cell1.appendChild(dataRowID);
            var cell2 = row.insertCell(1);
            var element2 = document.createElement("input");
            var medicineIdElement=document.createElement("input");
            medicineIdElement.type="hidden";
            medicineIdElement.id="medicineId_"+rowCount+"_"+visitID;
            element2.id="name_"+rowCount+"_"+visitID;
            element2.type = "text";
            cell2.appendChild(element2);
            cell2.appendChild(medicineIdElement);


            var cell3 = row.insertCell(2);
            /*var element3 = document.createElement("input");
            element3.type = "text";
            element3.id = "nature_"+rowCount+"_"+visitID;*/
            var element3=document.createElement('select');
            element3.id = "nature_"+rowCount+"_"+visitID;
            for (var i in natures) {
                var op = document.createElement("option");
                op.appendChild(document.createTextNode(natures[i]));
                op.value = natures[i];
                element3.appendChild(op);
            }
            cell3.appendChild(element3);

            var cell4 = row.insertCell(3);
            var element4 = document.createElement("input");
            element4.type = "text";
            element4.id = "strength_"+rowCount+"_"+visitID;
            cell4.appendChild(element4);

            var cell5 = row.insertCell(4);
            var element5 = document.createElement("input");
            element5.type = "text";
            element5.id = "duration_"+rowCount+"_"+visitID;
            cell5.appendChild(element5);

            var cell6 = row.insertCell(5);
            var element6= document.createElement('textarea');
            element6.rows=2; //Number of rows
            element6.cols=30;
            element6.id = "dosing_"+rowCount+"_"+visitID;
            cell6.appendChild(element6);

            var cell7 = row.insertCell(6);
            var element7= document.createElement('textarea');
            element7.rows=2; //Number of rows
            element7.cols=30;
            element7.id = "remark_"+rowCount+"_"+visitID;
            cell7.appendChild(element7);

            /* var cell8=row.insertCell(7);
            var dataRowID = document.createElement("input");
            dataRowID.type="hidden";
            dataRowID.id=rowCount;
            dataRowID.value=rowCount;;*/


            $(function() {
                $( "#name_"+rowCount+"_"+visitID ).autocomplete({
                    source: medicines,
                    minLength: 1,

                    change:function(event,ui){

                        $( "medicineId_"+rowCount+"_"+visitID ).val( ui.item.id );
                        $( "#nature_"+rowCount+"_"+visitID ).val( ui.item.nature );
                        $( "#strength_"+rowCount+"_"+visitID ).val( ui.item.strength );

                    },
                    focus: function( event, ui ) {
                        $( "#name_"+rowCount+"_"+visitID).val( ui.item.name );
                        $( "medicineId_"+rowCount+"_"+visitID ).val( ui.item.id );

                        return true;
                    },
                    select: function( event, ui ) {
                        $( "#name_"+rowCount+"_"+visitID ).val( ui.item.value );
                        var medicineId = document.getElementById("medicineId_"+rowCount+"_"+visitID );
                        medicineId.value=ui.item.id;
                        // $( "medicineId_"+rowCount+"_"+visitID ).val( ui.item.id );
                        $( "#nature_"+rowCount+"_"+visitID ).val( ui.item.nature );
                        $( "#test_"+rowCount+"_"+visitID ).val( ui.item.nature );
                        $( "#strength_"+rowCount+"_"+visitID ).val( ui.item.strength );
                        return true;
                    }
                }).data( "autocomplete" )._renderItem = function( ul, item ) {
                    return $( "<li></li>" )
                    .data( "item.autocomplete", item )
                    .append( "<a><b> " + item.value +":-</b> <b> "+item.availableStock +"</b></a>" )
                    .appendTo( ul );
                };

            });


        }
        function deleteRow(tableID) {
            try {
                var table = document.getElementById(tableID);
                var rowCount = table.rows.length;
                if(rowCount==1){
                    alert('No records to delete');
                }
                for(var i=1; i<rowCount; i++) {
                    var row = table.rows[i];
                    var chkbox = row.cells[0].childNodes[0];
                    if(null != chkbox && true == chkbox.checked) {
                        table.deleteRow(i);
                        rowCount--;
                        i--;
                    }
                }
                var row = table.rows[0];
                var chkbox = row.cells[0].childNodes[0];
                chkbox.checked=false;
            }catch(e) {
                alert(e);
            }
        }
        function selectAll(tableID){
            var table = document.getElementById(tableID);
            var rowCount = table.rows.length;
            if(rowCount==1){
                var row = table.rows[0];
                var chkbox = row.cells[0].childNodes[0];
                chkbox.checked=false;
                alert('No records to select');
            }
            for(var i=1; i<rowCount; i++) {
                var row = table.rows[i];
                var chkbox = row.cells[0].childNodes[0];
                chkbox.checked=true;
            }
        }
        function createRowIdString(tableID){
            var table = document.getElementById(tableID);
            var rowIdString=document.getElementById('rowIdString');
            var rowMedicineIdString=document.getElementById('rowMedicineIdString');
            var rowMedicineNatureString=document.getElementById('rowMedicineNatureString');
            var rowMedicineStrengthString=document.getElementById('rowMedicineStrengthString');
            var rowMedicineDurationString=document.getElementById('rowMedicineDurationString');
            var rowMedicineDosingString=document.getElementById('rowMedicineDosingString');
            var rowMedicineRemarkString=document.getElementById('rowMedicineRemarkString');

            rowIdString.value="";
            var rowCount = table.rows.length;
            if(rowCount==1){
                rowIdString.value="";
                rowMedicineIdString.value="";
                rowMedicineNatureString.value="";
                rowMedicineStrengthString.value="";
                rowMedicineDurationString.value="";
                rowMedicineDosingString.value="";
                rowMedicineRemarkString.value="";

            }
            for(var i=1; i<rowCount; i++) {
                var row = table.rows[i];
                var rowId = row.cells[0].childNodes[1];
                var rowMedicineId = row.cells[1].childNodes[1];
                var rowMedicineNature = row.cells[2].childNodes[0];
                var rowMedicineStrength = row.cells[3].childNodes[0];
                var rowMedicineDuration = row.cells[4].childNodes[0];
                if(rowMedicineDuration.value==""){
                    rowMedicineDuration.value="none";
                }
                var rowMedicineDosing = row.cells[5].childNodes[0];
                if(rowMedicineDosing.value==""){
                    rowMedicineDosing.value="none";
                }
                var rowMedicineRemark = row.cells[6].childNodes[0];
                if(rowMedicineRemark.value==""){
                    rowMedicineRemark.value="none";
                }
                //alert(row.cells[0].abbr);
                rowIdString.value=rowIdString.value+","+rowId.value;
                rowMedicineIdString.value=rowMedicineIdString.value+","+rowMedicineId.value;
                rowMedicineNatureString.value=rowMedicineNatureString.value+"|"+rowMedicineNature.value;
                rowMedicineStrengthString.value=rowMedicineStrengthString.value+"|"+rowMedicineStrength.value;
                rowMedicineDurationString.value=rowMedicineDurationString.value+"|"+rowMedicineDuration.value;
                rowMedicineDosingString.value=rowMedicineDosingString.value+"|"+rowMedicineDosing.value;
                rowMedicineRemarkString.value=rowMedicineRemarkString.value+"|"+rowMedicineRemark.value;
            }
        }
        </script>

        <script type="text/javascript">
        function updateVisit(){
            var xMLHttpRequest;
            if (typeof XMLHttpRequest != "undefined") {
                xMLHttpRequest = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                xMLHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
            }
            var visitId=document.getElementById('visitId');
            var remarks=document.getElementById('remarks');
            var diagnosis=document.getElementById('diagnosis');
            var investigations=document.getElementById('investigations');
            var treatment=document.getElementById('treatment');
            var pulse=document.getElementById('pulse');
            var bp=document.getElementById('bp');
            var rr=document.getElementById('rr');
            var rating=document.getElementById('rating');
            xMLHttpRequest.onreadystatechange = postUpdateVisit;
            xMLHttpRequest.open("POST", "AjaxController?process=inVisitProcess&action=updateAjaxVisit&visitid="+visitId.value+"&remarks="+remarks.value+"&diagnosis="+diagnosis.value+"&investigations="+investigations.value+"&treatment="+treatment.value+"&bp="+bp.value+"&pulse="+pulse.value+"&rr="+rr.value+"&patientrating="+rating.value,false);
            xMLHttpRequest.send(null);
        }
        function addPrescriptionForVisit(visitID){
            var xMLHttpRequest;
            if (typeof XMLHttpRequest != "undefined") {
                xMLHttpRequest = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                xMLHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
            }
            var visitId=document.getElementById('visitId'+visitID);
            xMLHttpRequest.onreadystatechange = postAddPrescriptionForVisit;
            xMLHttpRequest.open("POST", "AjaxController?process=PrescriptionProcess&action=addAjaxPrescription&visitid="+visitId.value,false);
            xMLHttpRequest.send(null);
        }
        function addVisitByID(visitID){

            var xMLHttpRequest;
            if (typeof XMLHttpRequest != "undefined") {
                xMLHttpRequest = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                xMLHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
            }
            var countId=document.getElementById('countId'+visitID);
            var patientId=document.getElementById('patientID');
            var visitId=document.getElementById('visitId'+visitID);
            var doctorVisit=document.getElementById('doctorVisit'+visitID);
            var visitTime1=document.getElementById('time'+visitID);
            //  var visitDateTime=doctorVisit.value+" "+visitTime1.value;
            var remarks=document.getElementById('remarks'+visitID);
            var diagnosis=document.getElementById('diagnosis'+visitID);
            var investigations=document.getElementById('investigations'+visitID);
            var treatment=document.getElementById('treatment'+visitID);
            var pulse=document.getElementById('pulse'+visitID);
            var bp=document.getElementById('bp'+visitID);
            var rr=document.getElementById('rr'+visitID);
            var rating=document.getElementById('rating'+visitID);
            var finalDiagnosis=document.getElementById('finalDiagnosis'+visitID);

            var consultationCharges=document.getElementById('consultationCharges'+visitID);
            var managementPlan=document.getElementById('managementPlan'+visitID);
            xMLHttpRequest.onreadystatechange = postUpdateVisit;
            xMLHttpRequest.open("POST", "AjaxController?process=inVisitProcess&action=addAjaxVisit&patientid="+patientId.value+"&visitid="+visitId.value+"&countid="+countId.value+"&doctorvisit="+doctorVisit.value+"&visittime="+visitTime1.value+"&remarks="+remarks.value+"&managementPlan="+managementPlan.value+"&diagnosis="+diagnosis.value+"&investigations="+investigations.value+"&treatment="+treatment.value+"&bp="+bp.value+"&pulse="+pulse.value+"&rr="+rr.value+"&patientrating="+rating.value+"&finalDiagnosis="+finalDiagnosis.value+"&consultationCharges="+consultationCharges.value,false);
            xMLHttpRequest.send(null);
        }



        function updateVisitByIDPrint(visitID){

            var xMLHttpRequest;
            if (typeof XMLHttpRequest != "undefined") {
                xMLHttpRequest = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                xMLHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
            }

            confirm('Do You Want To Upadate The Patient Details ');
            var patientId=document.getElementById('patientIDPrint');
            var visitNo=document.getElementById('doctorVisitNoPrint'+visitID);
            var visitId=document.getElementById('visitIdPrint'+visitID);
            var doctorVisit=document.getElementById('doctorVisitTimePrint'+visitID);
            var visitTime=document.getElementById('timePrint'+visitID);
            var remarks=document.getElementById('remarksPrint'+visitID);
            var diagnosis=document.getElementById('diagnosisPrint'+visitID);
            var investigations=document.getElementById('investigationPrint'+visitID);
            var treatment=document.getElementById('treatmentPrint'+visitID);
            var pulse=document.getElementById('pulsePrint'+visitID);
            var bp=document.getElementById('bpPrint'+visitID);
            var rr=document.getElementById('rrPrint'+visitID);
            var rating=document.getElementById('ratingPrint'+visitID);
            var finalDiagnosis=document.getElementById('finalDiagnosisPrint'+visitID);

            // var consultationCharges=document.getElementById('consultationCharges'+visitID);
            var managementPlan=document.getElementById('managementPlanPrint'+visitID);
            xMLHttpRequest.onreadystatechange = postUpdateVisit;
            xMLHttpRequest.open("POST", "AjaxController?process=inVisitProcess&action=updateAjaxVisit&patientid="+patientId.value+"&visitid="+visitId.value+"&visitno="+visitNo.value+"&doctorvisit="+doctorVisit.value+"&visittime="+visitTime.value+"&remarks="+remarks.value+"&managementplan="+managementPlan.value+"&diagnosis="+diagnosis.value+"&investigations="+investigations.value+"&treatment="+treatment.value+"&bp="+bp.value+"&pulse="+pulse.value+"&rr="+rr.value+"&patientrating="+rating.value+"&finalDiagnosis="+finalDiagnosis.value,false);
            xMLHttpRequest.send(null);
        }




        function deleteByInpatientDoctorVisit(visitID){

            var xMLHttpRequest;
            if (typeof XMLHttpRequest != "undefined") {
                xMLHttpRequest = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                xMLHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
            }

            confirm('Do You Want To Delete This Visit');
            var patientId=document.getElementById('patientIDPrint');

            var visitId=document.getElementById('visitIdPrint'+visitID);
            //  var doctorVisit=document.getElementById('doctorVisitTimePrint'+visitID);
            //   var visitTime=document.getElementById('timePrint'+visitID);
            //   var remarks=document.getElementById('remarksPrint'+visitID);
            //   var diagnosis=document.getElementById('diagnosisPrint'+visitID);
            //   var investigations=document.getElementById('investigationPrint'+visitID);
            //   var treatment=document.getElementById('treatmentPrint'+visitID);
            //   var pulse=document.getElementById('pulsePrint'+visitID);
            //   var bp=document.getElementById('bpPrint'+visitID);
            //   var rr=document.getElementById('rrPrint'+visitID);
            //   var rating=document.getElementById('ratingPrint'+visitID);
            //   var finalDiagnosis=document.getElementById('finalDiagnosisPrint'+visitID);

            // var consultationCharges=document.getElementById('consultationCharges'+visitID);
            //  var managementPlan=document.getElementById('managementPlanPrint'+visitID);
            xMLHttpRequest.onreadystatechange = postDeleteVisit;
            xMLHttpRequest.open("POST", "AjaxController?process=inVisitProcess&action=deleteAjaxVisit&patientid="+patientId.value+"&visitid="+visitId.value,false);
            xMLHttpRequest.send(null);
        }






        function rescheduleVisitByID(visitID){

            var xMLHttpRequest;
            if (typeof XMLHttpRequest != "undefined") {
                xMLHttpRequest = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                xMLHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
            }

            var visitId=document.getElementById('visitId'+visitID);
            var remarks=document.getElementById('remarks'+visitID);
            var visitDate1=document.getElementById('appointmentDate'+visitID);
            var visitTime1=document.getElementById('time'+visitID);
            var visitDateTime=visitDate1.value+" "+visitTime1.value;


            xMLHttpRequest.onreadystatechange = postRescheduleVisit;
            xMLHttpRequest.open("POST", "AjaxController?process=VisitProcess&action=rescheduleAjaxVisit&visitid="+visitId.value+"&remarks="+remarks.value+"&appointmentDate="+visitDateTime.toString(),false);
            xMLHttpRequest.send(null);
        }
        function postUpdateVisit(){
            if (xMLHttpRequest.readyState==4){
                if (xMLHttpRequest.status==200){

                    var output=xMLHttpRequest.responseXML.getElementsByTagName("output")[0];
                    var successTagElem = output.getElementsByTagName("success")[0].firstChild.nodeValue;
                    if(successTagElem.toString()=='true'){
                        alert('not updated');
                    }
                    else{
                    }
                }
            }
        }


        function postDeleteVisit(){
            if (xMLHttpRequest.readyState==4){
                if (xMLHttpRequest.status==200){

                    var output=xMLHttpRequest.responseXML.getElementsByTagName("output")[0];
                    var successTagElem = output.getElementsByTagName("success")[0].firstChild.nodeValue;
                    if(successTagElem.toString()=='true'){
                        alert('not deleted');
                    }
                    else{
                    }
                }
            }
        }




        function postAddPrescriptionForVisit(){

            if (xMLHttpRequest.readyState==4){
                if (xMLHttpRequest.status==200){
                    var prescriptionId=document.getElementById('prescriptionId');
                    var output=xMLHttpRequest.responseXML.getElementsByTagName("output")[0];

                    var PrescriptionId = output.getElementsByTagName("PrescriptionId")[0].firstChild.nodeValue;
                    prescriptionId.value=parseInt(PrescriptionId.toString());
                }
            }
        }
        function postRescheduleVisit(){
            if (xMLHttpRequest.readyState==4){
                if (xMLHttpRequest.status==200){
                    var output=xMLHttpRequest.responseXML.getElementsByTagName("output")[0];
                    var successTagElem = output.getElementsByTagName("success")[0].firstChild.nodeValue;
                    if(successTagElem.toString()=='true'){

                    }
                    else{
                    }
                }
            }
        }
        </script>

        <script >
        function backButtton1()
        {

            //window.history.back();
            window.location='Controller?process=InPatientProcess&action=viewAll&patientControllerValue=null&noOfRecords=20&pageno=1&alphabit=null';

        }
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

        <script type="text/javascript">
        $(function() {
            $( "#add" )
            .button()
            .click(function() {
                runEffect();

            });

            $( "#effect" ).hide();
        });
        </script>

        <script>
        $(function() {
            $( "#inreptdate" ).datepicker({changeYear: true, changeMonth: true});
            $( "#anim" ).change(function() {
                $( "#inreptdate" ).datepicker( "option", "showAnim", $( this ).val() );
            });
        });
        </script>



        <script>
        $(function() {
            $( "#tabs" ).tabs();

        });
        </script>

        <script>
        $(function() {
            $(document).ready(function(){
                $(".tabbable").find(".tab").hide();
                $(".tabbable").find(".tab").first().show();
                $(".tabbable").find(".tabs li").first().find("a").addClass("active");
                $(".tabbable").find(".tabs").find("a").click(function(){
                    tab = $(this).attr("href");
                    $(".tabbable").find(".tab").hide();
                    $(".tabbable").find(".tabs").find("a").removeClass("active");
                    $(tab).show();
                    $(this).addClass("active");
                    return false;
                });
            });

        });
        </script>

        <script>
        $(document).ready(function(){
            $("#slide").click(function(){

                $("#slidedown").slideToggle(1000);

            });            });
        </script>





    </head>
    <body background="images/plexus_bg.jpg">
        <jsp:useBean id="now" class="java.util.Date" />
        <fmt:formatDate var="today" type="date" value="${now}" />
        <form action="" method="post" id="form1" enctype="multipart/form-data">
            <div>
                <table id="table3" width="100%" border="0" cellpadding="1" cellspacing="1" align="center"  >
                    <tr>
                        <td height="32" background="images/header-bg.png" style="background-repeat:repeat-x"><img src="images/back1.png" style="cursor: pointer" title="click to close" onclick="backButtton1()" /></td>


                    </tr>
                    <tr><td >
                            <button style="display: none" id="set">Set Appointment</button>
                            <button id="updateInpatient">Edit</button>
                            <button id="setDischargeDate">Discharge</button>
                            <%--<button id="fullSummary">Full Summary</button>--%>
                            <script type="text/javascript">
                            $(function() {

                                $( "#set" )
                                .button()
                                .click(function() {
                                    setAppointment();

                                });

                                $( "#updateInpatient" )
                                .button()
                                .click(function() {
                                    updateInpatient();

                                });


                                $( "#setDischargeDate" )
                                .button()
                                .click(function() {
                                    var r=confirm("Did You Entered Concluding Summary")
                                    if (r==true)
                                    {
                                        updateDischargeDate();
                                    }
                                    else
                                    {
                                       
                                    }

                                });



                                $( "#fullSummary" )
                                .button()
                                .click(function() {
                                    fullSummary();

                                });

                                $( "#saveReport" )
                                .button()
                                .click(function() {
                                    addNewReport();


                                });
                            });
                            </script>
                        </td></tr>
                </table>
            </div>
 <table width="100%">

                <tr>
                    <td  class="headerTD">IN-PATIENT DETAILS: &nbsp;<c:out value="${inpatient.name}" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(CARD NO:<c:out value="${inpatient.id}" />)
                        <input type="hidden" id="rowIdString" />
                        <input type="hidden" id="rowMedicineIdString" />
                        <input type="hidden" id="rowMedicineNatureString" />
                        <input type="hidden" id="rowMedicineStrengthString" />
                        <input type="hidden" id="rowMedicineDurationString" />
                        <input type="hidden" id="rowMedicineDosingString" />
                        <input type="hidden" id="rowMedicineRemarkString" />
                    </td>
                </tr>

            </table>

            <div class="tabbable">
                <ul class="tabs">
                    <li><a href="#tab1">General</a></li>
                    <li><a href="#tab2">Specific</a></li>
                    <li><a href="#tab3">Diagnosis</a></li>
                    <li><a href="#tab4">Reports</a></li>
                    <li><a href="#tab5">Treatment Summary</a></li>
                </ul>

                <div class="tabcontent">

                    <div id="tab1" class="tab">

                          <div>
                    <table width="100%"  id="table1" align="center">


                        <tr >

                            <td width="25%"  class="alignLeft" >Name</td>
                            <td width="25%" class="dataContent">
                                <c:out value="${inpatient.name}" />
                            </td>
                             <td width="25%"   class="alignLeft" >Contact No</td>
                            <td width="25%"  class="dataContent">
                                <c:out default="" value="${inpatient.telephoneno}" />
                            </td>
                         <%--   <td width="25%"  class="alignLeft" >Nationality
                            </td>
                            <td width="25%" class="dataContent">
                                <c:out default="" value="${inpatient.nationality}" />
                            </td>--%>
                        </tr>
                        <tr>
                            <td width="25%"  class="alignLeft" >Age</td>
                            <td width="25%"  class="dataContent">
                                <c:out default="" value="${inpatient.age}" />
                            </td>
                            <td width="25%"  class="alignLeft">Blood Group
                            </td>
                            <td  width="25%" class="dataContent">
                                <c:out default="" value="${inpatient.bloodgroup}" />
                            </td>
                        </tr>
                        <tr>
                            <td width="25%"  class="alignLeft" >Sex </td>
                            <td  width="25%" class="dataContent">
                                <c:out default="" value="${inpatient.sex}" />
                            </td>
                            <td width="25%"  class="alignLeft">Married
                            </td>
                            <td width="25%" class="dataContent">
                                <c:out default="" value="${inpatient.married}" />
                            </td>
                        </tr>
                    <%--     <tr>
                           
                        <%--    <td width="25%"  class="alignLeft">Referenced By</td>
                            <td  width="25%"class="dataContent" >
                                <c:out default="" value="${inpatient.refferedby}" />
                            </td>
                        </tr>
                        <tr>
                          <td width="25%"   class="alignLeft" >Address</td>
                            <td colspan="3"  class="dataContent">
                                <c:out default="" value="${inpatient.address}" />
                            </td>
                        </tr>
                        <tr>

                            <td  width="25%"  class="alignLeft" >Chief Complaints
                            </td>
                            <td colspan="3" class="dataContent">
                                <c:out default="" value="${inpatient.chiefcomplaints}" />
                            </td>
                        </tr>--%>

                       
                        <tr>

                            <td  width="25%"  class="alignLeft" >Concluding Summary
                            </td>
                            <td width="25%"class="dataContent">
                                <c:out default="" value="${inpatient.concludinghistory}" />
                            </td>
                        
                            <td  width="25%"  class="alignLeft" >Follow Up
                            </td>
                            <td width="25%" class="dataContent">
                                <c:out default="" value="${inpatient.followup}" />
                            </td>
                        </tr>

                    </table>
                </div>
                    </div>

                            <div id="tab2" class="tab">

                                  <div >
                    <table id="table2" width="90%"  align="center"  >
                        <tr>
                            <td width="14%" height="30"  class="alignLeft" >History of Present Illness  &nbsp;</td>
                            <td width="35%" class="dataContent">
                                <label>
                                    <c:out default="" value="${inpatient.historyofpresentillness}" />

                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td width="14%"  class="alignLeft" >Past History &nbsp;  </td>
                            <td class="dataContent">
                                <label>
                                    <c:out default="" value="${inpatient.pasthistory}" />
                                </label>
                            </td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td width="14%"  class="alignLeft" >Personal History &nbsp;  </td>
                            <td class="dataContent">
                                <label>
                                    <c:out default="" value="${inpatient.personalhistory}" />
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td width="14%" valign="top"  class="alignLeft" >Family History  &nbsp;</td>
                            <td class="dataContent">
                                <label>
                                    <c:out default="" value="${inpatient.familyhistory}" />
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td width="14%"  class="alignLeft" >Drug Allergies  &nbsp;</td>
                            <td class="dataContent">
                                <label>
                                    <c:out default="" value="${inpatient.drugallergies}" />
                                </label>
                            </td>
                        </tr>
                        <tr></tr>
                        <tr>
                        </tr>
                    </table>
                </div>
                            </div>

                                <div id="tab3" class="tab">

                                     <c:forEach varStatus="status"   items="${inpatient.invisits}" var="visit" >


                    <c:if test="${status.last}">

                        <div>
                            <input type="hidden" id="countId<c:out default='' value="${visit.id}"/>" value="${fn:length(inpatient.invisits)}" />
                            <input type="hidden" id="visitId<c:out default='' value="${visit.id}"/>" value="${visit.id}" />

                            <table id="table3" width="100%" border="0" cellpadding="1" cellspacing="1" align="center"   >

                                <tr>

                                <label>
                                    <input type="hidden" id="patientID" name="patientID"  value="${inpatient.id}" />
                                </label>



                                <td width="16%" colspan="2" class="alignRight" >First Visit &nbsp;  </td>
                                <td width="2%" class="dataContent">

                                    <input name="firstVisitCheckYes" type="radio" class="textField" id="firstVisitCheckYes" size="30"  onclick="firstVisitCheckBoxYes();" >Yes

                                    &nbsp;&nbsp; <input name="firstVisitCheckNo" type="radio"  checked="true" class="textField" id="firstVisitCheckNo" size="30"  onclick="firstVisitCheckBoxNo();" >No

                                </td>




                                </tr>


                                <script>
                                function firstVisitCheckBoxNo()
                                {

                                    document.getElementById("firstVisitCheckYes").checked=false;
                                    document.getElementById("diagnosisHide").style.display='none';
                                    document.getElementById("investigationsHide").style.display='none';
                                    document.getElementById("managementPlanHide").style.display='';
                                    document.getElementById("examinationHide").style.display='none';
                                    document.getElementById("treatmentHide").style.display='none';
                                    document.getElementById("finalDiagnosisHide").style.display='none';
                                }

                                function firstVisitCheckBoxYes()
                                {

                                    document.getElementById("firstVisitCheckNo").checked=false;

                                    document.getElementById("diagnosisHide").style.display='';
                                    document.getElementById("managementPlanHide").style.display='none';

                                    document.getElementById("investigationsHide").style.display='';
                                    document.getElementById("treatmentHide").style.display='';
                                    document.getElementById("finalDiagnosisHide").style.display='';
                                    document.getElementById("examinationHide").style.display='';



                                }

                                </script>


                                <tr>
                                    <td class="alignLeft"><b>Doctor's Visit</b></td>
                                    <td class="dataContent"><input type="text" name="doctorVisit<c:out default='' value="${visit.id}"/>" id="doctorVisit<c:out default='' value="${visit.id}"/>">
                                        <select name="time<c:out default='' value="${visit.id}"/>" id="time<c:out default='' value="${visit.id}"/>" >

                                            <option value="07:00 AM" >07:00 AM</option>
                                            <option value="07:15 AM" >07:15 AM</option>
                                            <option value="07:30 AM" >07:30 AM</option>
                                            <option value="07:45 AM" >07:45 AM</option>
                                            <option value="08:00 AM" >08:00 AM</option>
                                            <option value="08:15 AM" >08:15 AM</option>
                                            <option value="08:30 AM" >08:30 AM</option>
                                            <option value="08:45 AM" >08:45 AM</option>
                                            <option value="09:00 AM" selected>09:00 AM</option>
                                            <option value="09:15 AM" >09:15 AM</option>
                                            <option value="09:30 AM" >09:30 AM</option>
                                            <option value="09:45 AM" >09:45 AM</option>
                                            <option value="10:00 AM" >10:00 AM</option>
                                            <option value="10:15 AM" >10:15 AM</option>
                                            <option value="10:30 AM" >10:30 AM</option>
                                            <option value="10:45 AM" >10:45 AM</option>
                                            <option value="11:00 AM" >11:00 AM</option>
                                            <option value="11:15 AM" >11:15 AM</option>
                                            <option value="11:30 AM" >11:30 AM</option>
                                            <option value="11:45 AM" >11:45 AM</option>
                                            <option value="12:00 PM" >12:00 PM</option>
                                            <option value="12:15 PM" >12:15 PM</option>
                                            <option value="12:30 PM" >12:30 PM</option>
                                            <option value="12:45 PM" >12:45 PM</option>
                                            <option value="01:00 PM" >01:00 PM</option>
                                            <option value="01:15 PM" >01:15 PM</option>
                                            <option value="01:30 PM" >01:30 PM</option>
                                            <option value="01:45 PM" >01:45 PM</option>
                                            <option value="02:00 PM" >02:00 PM</option>
                                            <option value="02:15 PM" >02:15 PM</option>
                                            <option value="02:30 PM" >02:30 PM</option>
                                            <option value="02:45 PM" >02:45 PM</option>
                                            <option value="03:00 PM" >03:00 PM</option>
                                            <option value="03:15 PM" >03:15 PM</option>
                                            <option value="03:30 PM" >03:30 PM</option>
                                            <option value="03:45 PM" >03:45 PM</option>
                                            <option value="04:00 PM" >04:00 PM</option>
                                            <option value="04:15 PM" >04:15 PM</option>
                                            <option value="04:30 PM" >04:30 PM</option>
                                            <option value="04:45 PM" >04:45 PM</option>
                                            <option value="05:00 PM" >05:00 PM</option>
                                            <option value="05:15 PM" >05:15 PM</option>
                                            <option value="05:30 PM" >05:30 PM</option>
                                            <option value="05:45 PM" >05:45 PM</option>
                                            <option value="06:00 PM" >06:00 PM</option>
                                            <option value="06:15 PM" >06:15 PM</option>
                                            <option value="06:30 PM" >06:30 PM</option>
                                            <option value="06:45 PM" >06:45 PM</option>
                                            <option value="07:00 PM" >07:00 PM</option>
                                            <option value="07:15 PM" >07:15 PM</option>
                                            <option value="07:30 PM" >07:30 PM</option>
                                            <option value="07:45 PM" >07:45 PM</option>
                                            <option value="08:00 PM" >08:00 PM</option>
                                            <option value="08:15 PM" >08:15 PM</option>
                                            <option value="08:30 PM" >08:30 PM</option>
                                            <option value="08:45 PM" >08:45 PM</option>
                                            <option value="09:00 PM" >09:00 PM</option>
                                            <option value="09:15 PM" >09:15 PM</option>
                                            <option value="09:30 PM" >09:30 PM</option>
                                            <option value="09:45 PM" >09:45 PM</option>

                                        </select>

                                </tr>
                                <td><input type="hidden" name="dischargeDate" id="dischargeDate"</td>


                                <script>
                                $(function() {
                                    $( "#doctorVisit<c:out default='' value="${visit.id}"/>").datepicker({changeYear: true, changeMonth: true});
                                    $( "#anim" ).change(function() {
                                        $( "#datepicker" ).datepicker( "option", "showAnim", $( this ).val() );
                                    });
                                });
                                </script>

                                <script type="text/javascript">


                                date = new Date();
                                var month = date.getMonth()+1;
                                var day = date.getDate();
                                var year = date.getFullYear();
                                if(day>=1 && day<10)
                                {
                                    day='0'+day;
                                }


                                if(month>=1 && month<10)
                                {
                                    month='0'+month;
                                }
                                if (document.getElementById('doctorVisit<c:out default='' value="${visit.id}"/>').value == ''){
                                    document.getElementById('doctorVisit<c:out default='' value="${visit.id}"/>').value = month + '/' + day + '/' + year;
                                    document.getElementById('dischargeDate').value = month + '/' + day + '/' + year;
                                }

                                </script>


                                <tr>
                                    <td class="alignLeft"><b>Remarks</b></td>
                                    <td class="dataContent" ><textarea   name="remarks<c:out default='' value="${visit.id}"/>" cols="120" rows="3"    id="remarks<c:out default='' value="${visit.id}"/>"></textarea></td>
                                </tr>
                                <tr><td style="font-size: 4px"><br/></td></tr>


                                <tr id="managementPlanHide">
                                    <td class="alignLeft"><b>Management Plan</b></td>
                                    <td  ><textarea   name="managementPlan<c:out default='' value="${visit.id}"/>" cols="120" rows="3"    id="managementPlan<c:out default='' value="${visit.id}"/>"></textarea></td>
                                </tr>




                                <tr id="diagnosisHide" style="display: none">
                                    <td  class="alignLeft" >Diagnosis  &nbsp;</td>
                                    <td>
                                        <label>
                                            <textarea  name="diagnosis<c:out default='' value="${visit.id}"/>" cols="120" rows="3"  id="diagnosis<c:out default='' value="${visit.id}"/>"></textarea>
                                        </label>
                                    </td>
                                </tr>
                                <tr ><td style="font-size: 4px"><br/></td></tr>
                                <tr id="investigationsHide" style="display: none">
                                    <td   class="alignLeft" >Investigation  &nbsp;</td>
                                    <td>
                                        <label>
                                            <textarea name="investigations<c:out default='' value="${visit.id}"/>" cols="120" rows="3"  id="investigations<c:out default='' value="${visit.id}"/>"></textarea>
                                        </label>
                                    </td>
                                </tr>
                                <tr ><td style="font-size: 4px"><br/></td></tr>
                                <tr id="treatmentHide" style="display: none" >
                                    <td   class="alignLeft" >Treatment  &nbsp;</td>
                                    <td>
                                        <label>
                                            <textarea name="treatment<c:out default='' value="${visit.id}"/>" cols="120" rows="3"  id="treatment<c:out default='' value="${visit.id}"/>"></textarea>
                                        </label>
                                    </td>
                                </tr>
                                <tr><td style="font-size: 4px"><br/></td></tr>
                                <tr id="finalDiagnosisHide" style="display: none">
                                    <td   class="alignLeft" >Final Diagnosis  &nbsp;</td>
                                    <td >
                                        <input name="finalDiagnosis<c:out default='' value="${visit.id}"/>" type="text"  id="finalDiagnosis<c:out default='' value="${visit.id}"/>" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span  style="display: none"class="alignLeft">Consultation Charges</span>  &nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input style="display: none" name="consultationCharges<c:out default='' value="${visit.id}"/>" type="text"  id="consultationCharges<c:out default='' value="${visit.id}"/>" />

                                    </td>

                                </tr>
                                <tr><td style="font-size: 4px"><br/></td></tr>
                                <tr id="examinationHide" style="display: none">
                                    <td class="alignLeft">Examination &nbsp;</td>
                                    <td  colspan="3" ><span class="alignLeft">Pulse/min</span>
                                        <input name="pulse<c:out default='' value="${visit.id}"/>" type="text" class="textFieldFixedWidth" id="pulse<c:out default='' value="${visit.id}"/>" />
                                        &nbsp;&nbsp;<span class="alignLeft">Blood Pressure in mmHg</span>
                                        <input name="bp<c:out default='' value="${visit.id}"/>" type="text" class="textFieldFixedWidth" id="bp<c:out default='' value="${visit.id}"/>" />
                                        &nbsp;&nbsp;<span class="alignLeft">Respiratory Rate/min</span>
                                        <input name="rr<c:out default='' value="${visit.id}"/>" type="text" class="textFieldFixedWidth" id="rr<c:out default='' value="${visit.id}"/>" />

                                    </td>
                                </tr>


                                <tr>
                                    <td class="alignLeft">
                                        &nbsp;Rating </td>
                                    <td class="dataContent"><input name="rating<c:out default='' value="${visit.id}"/>" type="text" class="textFieldFixedWidth" id="rating<c:out default='' value="${visit.id}"/>" />

                                    </td>
                                </tr>

                                <tr>
                                    <td><br/></td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="center" class="dataContent">

                                        <button id="set<c:out default="" value="${visit.id}"/>">Submit</button>
                                        <button  style="display: none" id="addPrescription<c:out default='' value="${visit.id}"/>">Proceed to prescription</button>&nbsp;&nbsp;<button style="display: none"id="reschedule<c:out default='' value="${visit.id}"/>">Reschedule</button></td>
                                </tr>
                            </table>



                            <div id="<c:out value="${visit.id}"/>" title="Details of Appointment">
                                <input type="hidden" id="visitId<c:out default='' value="${visit.id}"/>" value="${visit.id}" />
                                <table width="100%">
                                    <tr>
                                        <td colspan="3"  align="left" class="alignLeft">
                                            Appointment Date&nbsp;&nbsp;&nbsp;&nbsp;<input id="appointmentDate<c:out default="" value="${visit.id}"/>"   readonly type="text" name="appointmentDate<c:out default="" value="${visit.id}"/>"   />
                                            <select name="time<c:out default="" value="${visit.id}"/>" id="time<c:out default="" value="${visit.id}"/>" >

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
                                    <tr></tr><tr></tr>
                                    <tr><td align="left" valign="top"  class="alignLeft">Remarks</td>
                                        <td  align="left" class="dataContent">
                                            &nbsp;&nbsp;<textarea id="remarks<c:out default="" value="${visit.id}"/>"  name="remarks" cols="81" rows="2"></textarea>
                                        </td >
                                        <%--<td  align="left" valign="bottom"><button id="reschedule<c:out default="" value="${visit.id}"/>">Reschedule</button>
                                        </td>--%>

                                    </tr>
                                    <tr></tr><tr></tr>

                                </table>
                                <script type="text/javascript" >
                                $(function(){
                                    var appointmentDate="#appointmentDate"+<c:out default="" value="${visit.id}"/>;
                                    $( appointmentDate ).val(getCurrentDate());
                                    $( appointmentDate ).datepicker();
                                    <%-- var rescheduleButtonId="#reschedule"+<c:out default='' value="${visit.id}"/>;
                                     $(rescheduleButtonId)
                                     .button()
                                     .click(function() {
                                         rescheduleVisitByID('<c:out default='' value="${visit.id}"/>');

                                                    });--%>
                                                    })
                                </script>
                                <script type="text/javascript">
                                $(function() {
                                    var divId="#"+<c:out value="${visit.id}"/>;
                                    var buttonID="#reschedule"+<c:out default='' value="${visit.id}"/>;
                                    $( buttonID )
                                    .button()
                                    .click(function() {
                                        $(divId).dialog( "open" );
                                        return false;
                                    });

                                    $(divId).dialog({
                                        autoOpen: false,
                                        height: 200,
                                        width: 800,
                                        modal: true,
                                        buttons: {
                                            Cancel: function() {
                                                $( this ).dialog( "close" );
                                            },
                                            "Reschedule": function() {
                                                rescheduleVisitByID('<c:out default='' value="${visit.id}"/>');
                                                $( this ).dialog( "close" );
                                                location.reload();

                                            }
                                        }
                                    });
                                });
                                </script>

                            </div>
                            <div id="prescription<c:out default='' value="${visit.id}"/>" title="Prescription for Appointment on <fmt:formatDate pattern="EEEE, dd MMMM yyyy " value="${visit.visittime}" /> at <fmt:formatDate pattern="hh:mm a" value="${visit.visittime}" /> ">
                                <input type="hidden" id="visitIdForPrescription" value="${visit.id}" />

                                <button id="addDossage<c:out default='' value="${visit.id}"/>">Add</button>&nbsp;&nbsp;&nbsp;<button id="removeDossage<c:out default='' value="${visit.id}"/>">Remove</button>
                                <TABLE id="dataTable<c:out default='' value="${visit.id}"/>" width="100%" >
                                    <tr >
                                        <td class="headerText"><INPUT type="checkbox"  name="chk" onclick="selectAll('dataTable<c:out default='' value="${visit.id}"/>');"/></td>
                                        <td class="headerText">Name</td>
                                        <td class="headerText">Type</td>
                                        <td class="headerText">Strength</td>
                                        <td class="headerText">Duration</td>
                                        <td class="headerText">Dosing</td>
                                        <td class="headerText">Remarks</td>
                                    </tr>
                                </TABLE>

                            </div>
                            <script type="text/javascript">
                            $(function() {

                                var divPrescription="#prescription"+<c:out default='' value="${visit.id}"/>;
                                $( divPrescription).dialog({
                                    autoOpen: false,
                                    height: screen.height/2,
                                    width: screen.width/1.3,
                                    modal: true,
                                    buttons: {
                                        "Clear Prescription": function(){
                                            selectAll('dataTable<c:out default='' value="${visit.id}"/>');
                                            deleteRow('dataTable<c:out default='' value="${visit.id}"/>');

                                        },
                                        Cancel: function() {
                                            $( this ).dialog( "close" );
                                        },
                                        "Save": function() {
                                <%--updateVisitByID('<c:out default='' value="${visit.id}"/>');--%>
                                                createRowIdString('dataTable<c:out default='' value="${visit.id}"/>');
                                                addPrescription('<c:out default='' value="${visit.id}"/>');
                                <%--addPrescriptionForVisit('<c:out default='' value="${visit.id}"/>');--%>
                                                $( this ).dialog( "close" );
                                                //location.reload();

                                            }


                                        }
                                    });

                                    var setButtonID="#set"+<c:out default='' value="${visit.id}"/>;
                                    $(setButtonID)
                                    .button()
                                    .click(function() {
                                        //  if(validateConsultationCharges('<c:out default='' value="${visit.id}"/>')){
                                        addVisitByID('<c:out default='' value="${visit.id}"/>');
                                        //  }
                                        //   else{
                                        //       return false;
                                        //    }


                                    });
                                    var buttonID="#addPrescription"+<c:out default='' value="${visit.id}"/>;
                                    $( buttonID )
                                    .button({
                                        icons: {
                                            primary: "ui-icon-plusthick"
                                        }
                                    })
                                    .click(function() {
                                        $(divPrescription).dialog( "open" );
                                        return false;
                                    });
                                    var tableId="dataTable"+<c:out default='' value="${visit.id}"/>;
                                    var addDossageButtonID="#addDossage"+<c:out default='' value="${visit.id}"/>;
                                    var removeDossageButtonID="#removeDossage"+<c:out default='' value="${visit.id}"/>;
                                    $( addDossageButtonID )
                                    .button({
                                        icons: {
                                            primary: "ui-icon-plus"
                                        }
                                    })
                                    .click(function() {
                                        addRow(tableId,"<c:out default='' value="${visit.id}"/>");
                                        return false;
                                    });
                                    $(removeDossageButtonID)
                                    .button({
                                        icons: {
                                            primary: "ui-icon-minus"
                                        }
                                    })
                                    .click(function() {
                                        deleteRow(tableId);
                                        return false;
                                    });
                                });
                            </script>

                        </div>
                    </c:if>
                </c:forEach>
                                </div>

                                <div id="tab4" class="tab">

                                       <div>
                    <button id="add">Add New Report</button>

                    <div id="effect" class="ui-widget-content ui-corner-all">


                        <br>

                        <table id="table3" width="100%" border="0" align="center" >

                            <tr>
                                <td width="16%"  class="alignRight" >Report Name : &nbsp;  </td>
                                <td width="28%" class="dataContent">
                                    <label>
                                        <input name="inreptname" type="text" class="textField" id="inreptname" size="30" data-validate="validate(required)"  >
                                    </label>
                                </td>
                            </tr>


                            <tr><td><br/></td></tr>

                            <tr>
                                <td width="16%"  class="alignRight" > Report Date : &nbsp;  </td>
                                <td width="28%" class="dataContent">
                                    <label>
                                        <input name="inreptdate" type="text" class="textField" id="inreptdate" size="30" data-validate="validate(required)"  >
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
                                <td width="28%" class="dataContent">
                                    <label>
                                        <textarea  name="inreportremarks" cols="30" rows="3"  id="inreportremarks"></textarea>
                                        <!--   <input name="inreportremarks" type="text" class="textField" id="inreportremarks" size="30" data-validate="validate(required)"  >  -->
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
                                <td width="28%" class="dataContent">
                                    <label>
                                        <textarea  name="inreportobservation" cols="30" rows="3"  id="inreportobservation"></textarea>
                                        <!--   <input name="inreportobservation" type="text" class="textField" id="inreportobservation" size="30" data-validate="validate(required)"  >  -->
                                    </label>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>

                            <tr>
                                <td width="35%"  class="alignRight" >Attach Images : &nbsp;  </td>

                                <td align="left" class="dataContent">
                                    <label>

                                        <input type="file" id="inreportfile" name="inreportfile" accept="image/*"  multiple="muliple" /><br>

                                    </label>
                                </td>
                            </tr>


                            <tr></tr>
                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>


                        </table>



                        <table id="table2" width="100%" border="0" align="center"  >

                            <tr>
                                <td align="center">
                                    <button id="saveReport">Save</button>

                                </td>
                            </tr>


                        </table>

                    </div>





                    <table  width="100%" border="1" cellspacing="0" cellpadding="0" align="center">


                        <thead>
                            <tr>
                                <td class="headerText" width="6%">SL No</td>
                                <td class="headerText" width="20%">Report Name</td>
                                <td class="headerText" width="10%">Report Date</td>
                                <td class="headerText" width="25%">Remark</td>
                                <td class="headerText" width="25%">Observation</td>
                                <td class="headerText" width="14%">Image</td>

                            </tr>
                        </thead>
                        <tbody>
                            <%
                                        int i = 1;
                            %>

                            <c:forEach items="${inpatient.inreports}" var="inreport">
                                <c:set var="string" value="${00}"/>
                                <tr class="gradeA"  >

                                    <td  class="dataTextInActive" width="6%"><%=i%></td>
                                    <td  class="dataTextInActive" width="20%"><a class="dataTextInActive" href="Controller?process=InReportProcess&action=showindividualRepot&reportID=<c:out value="${inreport.inreportid}"/>"><c:out value="${inreport.inreportname}"/></a></td>
                                    <td class="dataText" width="10%"><c:out value="${inreport.inreportdate}"/></td>
                                    <td  class="dataText" width="25%" ><c:out value="${inreport.inremarks}"/></td>
                                    <td class="dataText" width="25%"><c:out  value="${inreport.inobservation}"/></td>
                                    <td  class="dataText" width="14%"><a href="<c:out value="${inreport.reportimage}"/>"><img src="<c:out value="${inreport.reportimage}"/>" width="30%" height="30%" /></a></td>

                                </tr>
                                <%
                                            i++;
                                %>
                            </c:forEach>
                        </tbody>

                    </table>
                </div>

                                </div>

                            <div id="tab5" class="tab">

                                 <c:forEach varStatus="status"   items="${inpatient.invisits}" var="visit" >
                    <c:if test="${visit.visittime!=null}">
                        <div>
                            <table  style="border-style: ridge" width="100%"  id="table1" align="center">


                                <tr>

                                    <td>     <input type="hidden" id="visitIdPrint<c:out default='' value="${visit.id}"/>" value="${visit.id}" /></td>



                                    <td>  <input type="hidden" id="patientIDPrint" name="patientID"  value="${inpatient.id}" /></td>

                                    <td>  <input type="hidden" id="inPatientName<c:out default='' value="${visit.id}"/>" name="inPatientName"  value="${inpatient.name}" /></td>
                                    <td >

                                        <textarea  style="display: none" name="inpatientRemarks<c:out default='' value="${visit.id}"/>" cols="40" rows="2" id="inpatientRemarks<c:out default='' value="${visit.id}"/>"> <c:out default='' value="${visit.remarks}"/> </textarea>





                                        <textarea   style="display: none" name="inpatientMngmntPlan<c:out default='' value="${visit.id}"/>" cols="40" rows="2" id="inpatientMngmntPlan<c:out default='' value="${visit.id}"/>"> <c:out default='' value="${visit.managementplan}"/> </textarea>

                                    </td>

                                </tr>

                                <tr>
                                    <td colspan="2"></td>
                                    <td width="25%" class="alignLeft" style="font-size: medium">Visit No:


                                        <input type="text" size="1px" style="background-color:#E6EEF4;color: #325F6D;font-weight: bold;border-style: none" value="${visit.countid}" id="doctorVisitNoPrint<c:out default="" value="${visit.id}"/>">

                                    </td>
                                </tr>

                                <tr>
                                    <td width="25%"  class="alignLeft" >Doctor's Visit Time</td>
                                    <td width="25%">
                                        <input  readonly="doctorVisitTimePrint<c:out default='' value="${visit.id}"/>" type="text" name="doctorVisitTimePrint<c:out default="" value="${visit.id}"/>" id="doctorVisitTimePrint<c:out default="" value="${visit.id}"/>" value="${visit.visittime}" />



                                        <select readonly="timePrint<c:out default='' value="${visit.id}"/>" name="timePrint<c:out default='' value="${visit.id}"/>" id="timePrint<c:out default='' value="${visit.id}"/>" >
                                            <option selected><c:out default="" value="${visit.time}"/></option>
                                            <option value="07:00 AM" >07:00 AM</option>
                                            <option value="07:15 AM" >07:15 AM</option>
                                            <option value="07:30 AM" >07:30 AM</option>
                                            <option value="07:45 AM" >07:45 AM</option>
                                            <option value="08:00 AM" >08:00 AM</option>
                                            <option value="08:15 AM" >08:15 AM</option>
                                            <option value="08:30 AM" >08:30 AM</option>
                                            <option value="08:45 AM" >08:45 AM</option>
                                            <option value="09:00 AM" >09:00 AM</option>
                                            <option value="09:15 AM" >09:15 AM</option>
                                            <option value="09:30 AM" >09:30 AM</option>
                                            <option value="09:45 AM" >09:45 AM</option>
                                            <option value="10:00 AM" >10:00 AM</option>
                                            <option value="10:15 AM" >10:15 AM</option>
                                            <option value="10:30 AM" >10:30 AM</option>
                                            <option value="10:45 AM" >10:45 AM</option>
                                            <option value="11:00 AM" >11:00 AM</option>
                                            <option value="11:15 AM" >11:15 AM</option>
                                            <option value="11:30 AM" >11:30 AM</option>
                                            <option value="11:45 AM" >11:45 AM</option>
                                            <option value="12:00 PM" >12:00 PM</option>
                                            <option value="12:15 PM" >12:15 PM</option>
                                            <option value="12:30 PM" >12:30 PM</option>
                                            <option value="12:45 PM" >12:45 PM</option>
                                            <option value="01:00 PM" >01:00 PM</option>
                                            <option value="01:15 PM" >01:15 PM</option>
                                            <option value="01:30 PM" >01:30 PM</option>
                                            <option value="01:45 PM" >01:45 PM</option>
                                            <option value="02:00 PM" >02:00 PM</option>
                                            <option value="02:15 PM" >02:15 PM</option>
                                            <option value="02:30 PM" >02:30 PM</option>
                                            <option value="02:45 PM" >02:45 PM</option>
                                            <option value="03:00 PM" >03:00 PM</option>
                                            <option value="03:15 PM" >03:15 PM</option>
                                            <option value="03:30 PM" >03:30 PM</option>
                                            <option value="03:45 PM" >03:45 PM</option>
                                            <option value="04:00 PM" >04:00 PM</option>
                                            <option value="04:15 PM" >04:15 PM</option>
                                            <option value="04:30 PM" >04:30 PM</option>
                                            <option value="04:45 PM" >04:45 PM</option>
                                            <option value="05:00 PM" >05:00 PM</option>
                                            <option value="05:15 PM" >05:15 PM</option>
                                            <option value="05:30 PM" >05:30 PM</option>
                                            <option value="05:45 PM" >05:45 PM</option>
                                            <option value="06:00 PM" >06:00 PM</option>
                                            <option value="06:15 PM" >06:15 PM</option>
                                            <option value="06:30 PM" >06:30 PM</option>
                                            <option value="06:45 PM" >06:45 PM</option>
                                            <option value="07:00 PM" >07:00 PM</option>
                                            <option value="07:15 PM" >07:15 PM</option>
                                            <option value="07:30 PM" >07:30 PM</option>
                                            <option value="07:45 PM" >07:45 PM</option>
                                            <option value="08:00 PM" >08:00 PM</option>
                                            <option value="08:15 PM" >08:15 PM</option>
                                            <option value="08:30 PM" >08:30 PM</option>
                                            <option value="08:45 PM" >08:45 PM</option>
                                            <option value="09:00 PM" >09:00 PM</option>
                                            <option value="09:15 PM" >09:15 PM</option>
                                            <option value="09:30 PM" >09:30 PM</option>
                                            <option value="09:45 PM" >09:45 PM</option>

                                        </select>

                                    </td>




                                </tr>

                                <tr>
                                    <td width="25%" class="alignLeft" >Remarks</td>
                                    <td width="25%"  class="dataContent">

                                        <textarea   readonly="remarksPrint<c:out default='' value="${visit.id}"/>" name="remarksPrint<c:out default='' value="${visit.id}"/>" cols="60" rows="4" id="remarksPrint<c:out default='' value="${visit.id}"/>"> <c:out default='' value="${visit.remarks}"/> </textarea>

                                    </td>

                                    <td width="25%"  class="alignRight" >Management Plan</td>
                                    <td width="25%"  class="dataContent">
                                        <textarea  readonly="managementPlanPrint<c:out default='' value="${visit.id}"/>"  name="managementPlanPrint<c:out default='' value="${visit.id}"/>" cols="60" rows="4" id="managementPlanPrint<c:out default='' value="${visit.id}"/>"> <c:out default='' value="${visit.managementplan}"/> </textarea>


                                    </td>



                                </tr>

                                <tr>

                                    <td width="25%"  class="alignLeft" >Diagnosis</td>
                                    <td width="25%"  class="dataContent">
                                        <textarea   readonly="diagnosisPrint<c:out default='' value="${visit.id}"/>" name="diagnosisPrint<c:out default='' value="${visit.id}"/>" cols="60" rows="4" id="diagnosisPrint<c:out default='' value="${visit.id}"/>"> <c:out default='' value="${visit.diagnosis}"/> </textarea>

                                    </td>


                                    <td width="25%"  class="alignRight" >Investigation</td>
                                    <td width="25%" class="dataContent" >

                                        <textarea   readonly="investigationPrint<c:out default='' value="${visit.id}"/>" name="investigationPrint<c:out default='' value="${visit.id}"/>" cols="60" rows="4" id="investigationPrint<c:out default='' value="${visit.id}"/>"> <c:out default='' value="${visit.investigation}"/> </textarea>


                                    </td>



                                </tr>


                                <tr>

                                    <td width="25%"  class="alignLeft" >Treatment</td>
                                    <td width="25%" class="dataContent" >
                                        <textarea   readonly="treatmentPrint<c:out default='' value="${visit.id}"/>" name="treatmentPrint<c:out default='' value="${visit.id}"/>" cols="60" rows="4" id="treatmentPrint<c:out default='' value="${visit.id}"/>"> <c:out default='' value="${visit.treatment}"/> </textarea>


                                    </td>


                                    <td width="25%"  class="alignRight" >Final Diagnosis</td>
                                    <td width="25%"  class="dataContent">

                                        <input type="text" readonly="finalDiagnosisPrint<c:out default='' value="${visit.id}"/>" id="finalDiagnosisPrint<c:out default="" value="${visit.id}"/>" value="${visit.finaldiagnosis}" />

                                    </td>



                                </tr>

                                <tr>
                                    <td>
                                        <br/>
                                    </td>
                                </tr>

                                <tr>
                                    <td width="25%"  class="alignLeft" ><b><u>Examination</u></b></td>
                                </tr>
                                <tr>


                                    <td width="25%"  class="alignLeft"  colspan="4">Pulse/min


                                        <input size="10px" type="text" readonly="pulsePrint<c:out default='' value="${visit.id}"/>" id="pulsePrint<c:out default="" value="${visit.id}"/>" value="${visit.pulse}" />


                                        &nbsp;  &nbsp;    Blood Pressure in mmHg


                                        <input size="10px" type="text" readonly="bpPrint<c:out default='' value="${visit.id}"/>" id="bpPrint<c:out default="" value="${visit.id}"/>" value="${visit.bp}" />

                                        &nbsp;  &nbsp;     Respiratory Rate/min

                                        <input size="10px" type="text" readonly="rrPrint<c:out default='' value="${visit.id}"/>" id="rrPrint<c:out default="" value="${visit.id}"/>" value="${visit.rr}" />

                                        &nbsp;  &nbsp;      Rating


                                        <input size="10px" type="text" readonly="ratingPrint<c:out default='' value="${visit.id}"/>" id="ratingPrint<c:out default="" value="${visit.id}"/>" value="${visit.patientrating}" />

                                        &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <span id="writableControllers<c:out default='' value="${visit.id}"/>" style="color:black;cursor: pointer;border-style: ridge"  onclick="writableControllersByModify<c:out default='' value="${visit.id}"/>();">&nbsp;Modify&nbsp;</span>
                                        <span style="display: none;color:black;cursor: pointer;border-style: ridge" onclick="updateInpatientDetails<c:out default='' value="${visit.id}"/>();"id="updateControllers<c:out default='' value="${visit.id}"/>">&nbsp;Update&nbsp;</span>
                                        <span style="color:black;cursor: pointer;border-style: ridge" onclick="deleteDoctorVisitDetail<c:out default='' value="${visit.id}"/>();"id="deleteDoctorVisit<c:out default='' value="${visit.id}"/>">&nbsp;Delete&nbsp;</span>

                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <a onclick="printManagementPlan<c:out default='' value="${visit.id}"/>();"<span style="border-style: ridge;cursor: pointer">&nbsp;print&nbsp;</span></a>
                                    </td>
                                </tr>


                                <script>


                                function printManagementPlan<c:out default='' value="${visit.id}"/>()
                                {

                                    var form1=document.getElementById('form1');

                                    var inPatientName=document.getElementById('inPatientName<c:out default='' value="${visit.id}"/>');
                                    var inpatientRemarks=document.getElementById('inpatientRemarks<c:out default='' value="${visit.id}"/>');
                                    var inpatientManagementPlan=document.getElementById('inpatientMngmntPlan<c:out default='' value="${visit.id}"/>');

                                    //     var inpatientRemarks=document.getElementById('inpatientRemarks'+visitID);
                                    //    var inpatientManagementPlan=document.getElementById('inpatientMngmntPlan'+visitID);
                                    form1.action="previewManagementPlan.jsp?inPatientName="+inPatientName.value+"&inpatientRemarks="+inpatientRemarks.value+"&managementPlan="+inpatientManagementPlan.value;
                                    form1.submit();
                                }

                                </script>
                                <script>
                                function writableControllersByModify<c:out default='' value="${visit.id}"/>()
                                {


                                    document.getElementById("updateControllers<c:out default='' value="${visit.id}"/>").style.display=''
                                    document.getElementById("doctorVisitTimePrint<c:out default='' value="${visit.id}"/>").removeAttribute('readonly');
                                    document.getElementById("remarksPrint<c:out default='' value="${visit.id}"/>").removeAttribute('readonly');
                                    document.getElementById("managementPlanPrint<c:out default='' value="${visit.id}"/>").removeAttribute('readonly');

                                    document.getElementById("diagnosisPrint<c:out default='' value="${visit.id}"/>").removeAttribute('readonly');

                                    document.getElementById("investigationPrint<c:out default='' value="${visit.id}"/>").removeAttribute('readonly');

                                    document.getElementById("treatmentPrint<c:out default='' value="${visit.id}"/>").removeAttribute('readonly');
                                    document.getElementById("finalDiagnosisPrint<c:out default='' value="${visit.id}"/>").removeAttribute('readonly');
                                    document.getElementById("pulsePrint<c:out default='' value="${visit.id}"/>").removeAttribute('readonly');
                                    document.getElementById("bpPrint<c:out default='' value="${visit.id}"/>").removeAttribute('readonly');
                                    document.getElementById("rrPrint<c:out default='' value="${visit.id}"/>").removeAttribute('readonly');
                                    document.getElementById("ratingPrint<c:out default='' value="${visit.id}"/>").removeAttribute('readonly');






                                    document.getElementById("remarksPrint<c:out default='' value="${visit.id}"/>").focus();
                                }
                                </script>



                                <script>



                                if(document.getElementById("doctorVisitTimePrint<c:out default="" value="${visit.id}"/>"))
                                {
                                    var dateF=document.getElementById("doctorVisitTimePrint<c:out default="" value="${visit.id}"/>");
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



                                </script>
                            </table>

                            <script type="text/javascript">

                            function updateInpatientDetails<c:out default="" value="${visit.id}"/>()
                            {

                                //  if(validateConsultationCharges('<c:out default='' value="${visit.id}"/>')){
                                updateVisitByIDPrint('<c:out default='' value="${visit.id}"/>');
                                //  }
                                //   else{
                                //       return false;
                            }




                            function deleteDoctorVisitDetail<c:out default="" value="${visit.id}"/>()
                            {

                                //  if(validateConsultationCharges('<c:out default='' value="${visit.id}"/>')){
                                deleteByInpatientDoctorVisit('<c:out default='' value="${visit.id}"/>');
                                //  }
                                //   else{
                                //       return false;
                            }




                            </script>




                        </c:if>
                    </c:forEach>
                            </div>

                </div>
            </div>



           
           
            <div>

                <br/>



            </div>


        </form>
        <script type="text/javascript">
                        function addNewReport(){
                            //alert('patient id is:-'+<c:out value="${inpatient.id}"/>);

                            var form1=document.getElementById("form1");

                            form1.action="Controller?process=InReportProcess&action=addNewReport&parentID=<c:out value="${inpatient.id}"/>";
                            form1.submit();

                        }

        </script>
    </body>
</html>
