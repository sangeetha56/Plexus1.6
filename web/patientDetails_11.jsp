<%-- 
  Document   : patientDetails
  Created on : Jan 13, 2012, 12:21:03 PM
  Author     : Mayur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import=" java.math.*;" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                vertical-align: center;
                text-decoration:none;
            }
            .dataText {
                border-radius:1px;
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 12px;
                font-weight: bold;
                letter-spacing: normal;
                text-align: left;
                vertical-align: center;
                text-decoration:none;
            }
            .dataContent {

                font-size: 12px;

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
                font-size: 12px;
                font-style: normal;
                text-transform: capitalize;
                color: #325F6D;
                text-align: right;
                vertical-align: middle;
                font-weight: bold;
            }
            .alignLeft {
                font-family: Tahoma;
                font-size: 12px;
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

            function updatePatient(){
                //alert('2nd');
                var form1=document.getElementById("form1");
                form1.action="Controller?process=PatientProcess&action=updatePatientDetails&id=<c:out  value='${patient.id}'/>";
                form1.submit();
            }
            function fullSummary(){
                var form1=document.getElementById("form1");
                form1.action="patientFullSummary.jsp";
                form1.submit();
            }
            function addPrescription(visitId){
                updateVisitByID(visitId);
                var form1=document.getElementById("form1");
                var rowIdString=document.getElementById('rowIdString');
                var rowMedicineIdString=document.getElementById('rowMedicineIdString');
                var rowMedicineNatureString=document.getElementById('rowMedicineNatureString');
                var rowMedicineStrengthString=document.getElementById('rowMedicineStrengthString');
                var rowMedicineDurationString=document.getElementById('rowMedicineDurationString');
                var rowMedicineDosingString=document.getElementById('rowMedicineDosingString');
                var rowMedicineRemarkString=document.getElementById('rowMedicineRemarkString');
                form1.action="Controller?process=PrescriptionProcess&action=add&visitId="+visitId+"&rowIdString="+rowIdString.value+"&rowMedicineIdString="+rowMedicineIdString.value+"&rowMedicineNatureString="+rowMedicineNatureString.value+"&rowMedicineStrengthString="+rowMedicineStrengthString.value+"&rowMedicineDurationString="+rowMedicineDurationString.value+"&rowMedicineDosingString="+rowMedicineDosingString.value+"&rowMedicineRemarkString="+rowMedicineRemarkString.value;
                form1.submit();
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
            <%--
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
            --%>

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
                xMLHttpRequest.open("POST", "AjaxController?process=VisitProcess&action=updateAjaxVisit&visitid="+visitId.value+"&remarks="+remarks.value+"&diagnosis="+diagnosis.value+"&investigations="+investigations.value+"&treatment="+treatment.value+"&bp="+bp.value+"&pulse="+pulse.value+"&rr="+rr.value+"&patientrating="+rating.value,false);
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
            function updateVisitByID(visitID){
                alert('confusion :-');

                var xMLHttpRequest;
                if (typeof XMLHttpRequest != "undefined") {
                    xMLHttpRequest = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    xMLHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
                }

                var visitId=document.getElementById('visitId'+visitID);
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

                var therapyname=document.getElementById('therapynamebill');
                var therapyvalue=document.getElementById('therapychargebill');
                var investigationname=document.getElementById('investigationnamebill');
                var investigationvalue=document.getElementById('investigationchargebill');

                var patient_id=document.getElementById('paientid');
                var therapy_id=document.getElementById('therapytypeid');
                var investigation_id=document.getElementById('investigationtypeid');
                var therapyarray_id=document.getElementByName('personalIDs');

                alert('confusion id are:-'+therapyarray_id.value);



                //alert('patient id is:-'+patient_id.value+':-Therapy id is:-'+therapy_id.value+':-Investigation id is:-'+investigation_id.value);
                // alert('patient id is:-'+patient_id.value+':-Therapy id is:-'+therapy_id.value+':-Investigation id is:-'+investigation_id.value+'therapyname:-'+therapyname.value+':-therapyvalue:-'+therapyvalue.value+';-investigationname:-'+investigationname.value+';-investigationvalue:-'+investigationvalue.value);

                xMLHttpRequest.onreadystatechange = postUpdateVisit;
                xMLHttpRequest.open("POST", "AjaxController?process=VisitProcess&action=updateAjaxVisit&visitid="+visitId.value+"&remarks="+remarks.value+"&diagnosis="+diagnosis.value+"&investigations="+investigations.value+"&treatment="+treatment.value+"&bp="+bp.value+"&pulse="+pulse.value+"&rr="+rr.value+"&patientrating="+rating.value+"&finalDiagnosis="+finalDiagnosis.value+"&consultationCharges="+consultationCharges.value+"&therapyName="+therapyname.value+"&therapyVal="+therapyvalue.value+"&investigationName="+investigationname.value+"&investigationVal="+investigationvalue.value+"&patient_id="+patient_id.value+"&therapy_id="+therapy_id.value+"&investigation_id="+investigation_id.value,false);//+"&therapyaaray_id="+therapyarray_id.value
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

               window.location='Controller?process=PatientProcess&action=viewAll&patientControllerValue=null&noOfRecords=20&pageno=1&alphabit=null'
                // window.location='viewALLPatientNew.jsp'
             // window.history.back();

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
                $( "#reptdate" ).datepicker({changeYear: true, changeMonth: true});
                $( "#anim" ).change(function() {
                    $( "#reptdate" ).datepicker( "option", "showAnim", $( this ).val() );
                });
            });
        </script>

        <script>
            function showTherapyOptn(opt,val)
            {
                var x = document.getElementById("therapytypeid").selectedIndex;
                var y = document.getElementById("therapytypeid").options;

                document.getElementById("therapynamebill").value=y[x].text;
                document.getElementById("therapychargebill").value=opt;



            }
        </script>
        <script>
            function showInvestigationTypeOptn(opt,val)
            {

                var x1 = document.getElementById("investigationtypeid").selectedIndex;
                var y1 = document.getElementById("investigationtypeid").options;

                document.getElementById("investigationnamebill").value=y1[x1].text;
                document.getElementById("investigationchargebill").value=opt;



            }
        </script>

        <script>
            function myFunction()
            {
                var x = document.getElementById("therapytypeid").selectedIndex;
                var y = document.getElementById("therapytypeid").options;
                alert("Index: " + y[x].index + " is " + y[x].text);
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

        <script type="text/javascript">
            $(function() {


                $( "#newsubmit" )
                .button()
                .click(function() {

                    UpdateNewStyle();


                });

            });


        </script>

        <script type="text/javascript">
            /**
             * Comment
             */


            /**
             * Comment
             */
            /**
             * Comment
             */
            /**
             * Comment
             */




            function selectAllRow(tableID){
                var table = document.getElementById(tableID);
                var rowCount = table.rows.length;
                //alert('table row count:-'+rowCount);
                if(rowCount==1){
                    var row = table.rows[0];
                    var chkbox = row.cells[0].childNodes[0];
                    chkbox.checked=false;
                    alert('No records to select');
                }
                for(var i=1; i<rowCount; i++) {
                    //alert('inside:-')
                    var row = table.rows[i];
                    var chkbox = row.cells[0].childNodes[0];
                    chkbox.checked=true;
                }
            }





            var therapy=[
            <c:forEach varStatus="status" items="${TherapyList}" var="therapy">{
                    value:'<c:out default="0" value="${therapy.theraphytype}" />',
                    price:'<c:out default="0" value="${therapy.theraphycharge}" />',
                    id:'<c:out default="0" value="${therapy.therphyid}" />'



                }<c:if test="${!status.last}">,</c:if>
            </c:forEach>
            ];

            $(function() {

                var addDossageButtonID="#addDossage";
                var removeDossageButtonID="#removeDossage";
                $( addDossageButtonID )
                .button({
                    icons: {
                        primary: "ui-icon-plus"
                    }
                })
                .click(function() {
                    addRow();
                    return false;
                });
                $(removeDossageButtonID)
                .button({
                    icons: {
                        primary: "ui-icon-minus"
                    }
                })
                .click(function() {
                    deleteRow('dataTable');
                    return false;
                });

            });









            /**
             *
             */
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
                    // calculateGrandTotal();
                    //$('#grandTotalAmount').val(0);
                }catch(e) {
                    alert(e);
                }
            }
            function calculate(value2) {

            }
            function addRow() {
                //alert('kk-1');
                var rowCount = document.getElementById('dataTable').rows.length;
                var col1="<td class='dataText' width='4%' ><input type='checkbox' class = 'chcktbl' id=medicine_"+rowCount+" /><input type='hidden' class='medicineId' name='therapyIDS' id=medicine_id_"+rowCount+" value='' /></td>";
                var col2="<td class='dataText' width='31%'><input class='medicineName' type='text' name='therapyNames' id=medicine_name_"+rowCount+" size='30' /></td>";
                var col3="<td class='dataText' width='18%'><input type='text' value='0'  name='therapychargeindis' id=hiddenMedicine_amount_"+rowCount+" size='10'/></td>";
                var col4="<td  width='28%'></td>";
                var col5="<td  width='13%'></td>";
                var col6="<td  width='6%'></td>";


                //var col8="<td class='dataTextInActive' ><input class='' type='text' value='0' readonly name='medivat' id=Medicine_vat_"+rowCount+" size='5'/></td>";
                //var col5="<td class='dataTextInActive' ><input class='medicineAmount' type='text' value='0' readonly name='medicineAmounts' id=medicine_amount_"+rowCount+" size='10'/></td>";
                // var col9="<td class='dataTextInActive' ><input type='text' class='medicineId' name='medicineIDS' id=medicine_id_"+rowCount+" value='' /></td>";


                //alert('kk-2');
                var newRow = $("<tr class='trClass'>"+col1+col2+col3+col4+col5+col6+"</tr>");//col9+ +col8+col5
                $(function() {
                    $("#dataTable").find('tbody').append(newRow);
                });
                $(function() {
                    $("#medicine_name_"+rowCount).autocomplete({
                        source: therapy,
                        minLength: 1,
                        change:function(event,ui){

                            $( "#medicine_name_"+rowCount).val( ui.item.value );
                            $( "#medicine_id_"+rowCount ).val( ui.item.id );
                            $( "#hiddenMedicine_amount_"+rowCount).val( ui.item.price );


                            //calculate(rowCount);

                        },
                        focus: function( event, ui ) {
                            $( "#medicine_name_"+rowCount).val( ui.item.value );
                            $( "#medicine_id_"+rowCount ).val( ui.item.id );
                            $( "#hiddenMedicine_amount_"+rowCount).val( ui.item.price );


                            //calculate(rowCount);

                            return true;
                        },
                        select: function( event, ui ) {
                            $( "#medicine_name_"+rowCount).val( ui.item.value );
                            $( "#medicine_id_"+rowCount ).val( ui.item.id );
                            $( "#hiddenMedicine_amount_"+rowCount).val( ui.item.price );


                            //calculate(rowCount);
                            return true;
                        }
                    }).data( "autocomplete" )._renderItem = function( ul, item ) {
                        return $( "<li></li>" )
                        .data( "item.autocomplete", item )
                        .append( "<a><b> " + item.value +":-</b> <b> "+item.price +"</b></a>" )
                        .appendTo( ul );
                    };

                });



            }




        </script>


        <script language="Javascript">
        function validateConsultationCharge()
        {
            //alert('ggfgfg');

            if(document.getElementById("consultationCharges").value.length==0)
            {
                alert('Please Enter The Consultation Charge ');
            }

        }
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
                            <%--<button id="set">Set Appointment</button>--%>
                            <button id="updatePatient">Edit</button>
                            <%--<button id="fullSummary">Full Summary</button>--%>
                            <script type="text/javascript">
                            $(function() {

                                $( "#set" )
                                .button()
                                .click(function() {
                                    setAppointment();

                                });

                                $( "#updatePatient" )
                                .button()
                                .click(function() {
                                    //alert('1st');
                                    updatePatient();

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
                    <td  class="headerTD">PATIENT DETAILS: &nbsp;<c:out value="${patient.name}" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(CARD NO:<c:out value="${patient.cardno}" />)
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
                    <li><a href="#tab2">Reports</a></li>
                    <li><a href="#tab3">Specific</a></li>
                    <%-- <li><a href="#tab4">Appointment History</a></li>--%>

                    <c:forEach varStatus="status"   items="${patient.visits}" var="visit"  >
                        <fmt:formatDate var="visitDate" type="date" value="${visit.visittime}" />
                        <c:choose >
                            <c:when test="${visit.status}">

                                <c:choose>
                                    <c:when test="${visitDate eq today}">

                                        <li><a href="#tab5">Today's Appointment</a></li>
                                    </c:when>
                                    <c:otherwise>



                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                            <c:otherwise >
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                </ul>

                <div class="tabcontent">
                    <div id="tab1" class="tab">
                        <div>
                            <table width="100%"  id="table1" align="center">
                                <tr >
                                    <td width="25%"  class="alignLeft" >Name</td>
                                    <td width="25%" class="dataContent">
                                        <c:out value="${patient.name}" />
                                    </td>
                                    <td width="25%"   class="alignLeft" >Contact No</td>
                                    <td width="25%"  class="dataContent">
                                        <c:out default="" value="${patient.telephoneno}" />
                                    </td>
                                 <%--   <td width="25%"  class="alignLeft" >Nationality
                                    </td>
                                    <td width="25%" class="dataContent">
                                        <c:out default="" value="${patient.nationality}" />
                                    </td>--%>
                                </tr>
                                <tr>
                                    <td width="25%"  class="alignLeft" >Age</td>
                                    <td width="25%" class="dataContent" >
                                        <c:out default="" value="${patient.age}" />
                                    </td>
                                    <td width="25%"  class="alignLeft">Blood Group
                                    </td>
                                    <td  width="25%" class="dataContent">
                                        <c:out default="" value="${patient.bloodgroup}" />
                                    </td>
                                </tr>
                                <tr>
                                    <td width="25%"  class="alignLeft" >Sex </td>
                                    <td  width="25%" class="dataContent">
                                        <c:out default="" value="${patient.sex}" />
                                    </td>
                                    <td width="25%"  class="alignLeft">Married
                                    </td>
                                    <td width="25%" class="dataContent">
                                        <c:out default="" value="${patient.married}" />
                                    </td>
                                </tr>
                                
                                    
                                    <%--  <td width="25%"  class="alignLeft">Referenced By</td>
                                    <td  width="25%" class="dataContent">
                                        <c:out default="" value="${patient.refferedby}" />
                                    </td>
                                </tr>
                                <tr>
                                    <td width="25%"   class="alignLeft" >Address</td>
                                    <td colspan="3"  class="dataContent">
                                        <c:out default="" value="${patient.address}" />
                                    </td>
                                </tr>
                                <tr>

                                     <td  width="25%"  class="alignLeft" >Chief Complaints
                                    </td>
                                    <td colspan="3" class="dataContent">
                                        <c:out default="" value="${patient.chiefcomplaints}" />
                                    </td>--%>
                               
                            </table>
                        </div>
                    </div>
                </div>

                <div id="tab2" class="tab">
                    <div>
                        <button id="add">Add New Report</button>

                        <div id="effect" class="ui-widget-content ui-corner-all">


                            <br>

                            <table id="table3" width="100%" border="0" align="center" >

                                <tr>
                                    <td width="16%"  class="alignRight" >Report Name : &nbsp;  </td>
                                    <td width="28%" class="dataContent">
                                        <label>
                                            <input name="reptname" type="text" class="textField" id="reptname" size="30" data-validate="validate(required)"  >
                                        </label>
                                    </td>
                                </tr>


                                <tr><td><br/></td></tr>

                                <tr>
                                    <td width="16%"  class="alignRight" > Report Date : &nbsp;  </td>
                                    <td width="28%" class="dataContent">
                                        <label>
                                            <input name="reptdate" type="text" class="textField" id="reptdate" size="30" data-validate="validate(required)"  >
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
                                    <td width="28%" class="dataContent">
                                        <label>
                                            <textarea name="reportremarks" cols="30" rows="5"  id="reportremarks"></textarea>
                                            <!--   <input name="reportremarks" type="text" class="textField" id="reportremarks" size="30" data-validate="validate(required)"  >  -->
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
                                        <label class="dataContent">
                                            <textarea name="reportobservation" cols="30" rows="5"  id="reportobservation"></textarea>
                                            <!-- <input name="reportobservation" type="text" class="textField" id="reportobservation" size="30" data-validate="validate(required)"  >  -->
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
                                    <td width="35%"  class="alignRight" >Attach Images : &nbsp;  </td>

                                    <td align="left" class="dataContent">
                                        <label>

                                            <input type="file" id="reportfile" name="reportfile" accept="image/*"  multiple="muliple" /><br>

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



                            <table id="table2" width="100%" border="0" align="center"  >

                                <tr>
                                    <td align="center">
                                        <button id="saveReport">Save</button>

                                    </td>
                                </tr>


                            </table>

                        </div>




                        <%--      <table width="100%"  id="table1" align="center">


                   <thead>
                        <tr>
                            <th title="click to sort" class="headerText" width="5%">Sl No</th>

                            <th title="click to sort" class="headerText" width="10%">Report Name</th>
                            <th title="click to sort" class="headerText" width="5%">Report Date</th>
                            <th title="click to sort" class="headerText" width="20%">Remarks</th>
                            <th title="click to sort" class="headerText" width="20%">Observation</th>
                            <th title="click to sort" class="headerText" width="40%">Images</th>

                        </tr>
                    </thead>
                    <tbody>
                        <%
                        int i=1;
                        %>

                        <c:forEach items="${patient.reports}" var="report">
                            <c:set var="string" value="${00}"/>
                            <tr class="gradeA"  >

                                <td  class="dataTextInActive"><%=i %></td>
                                <td  class="dataTextInActive"><a class="dataTextInActive" href="Controller?process=ReportProcess&action=showindividualRepot&reportID=<c:out value="${report.reportid}"/>"><c:out value="${report.reportname}"/></a></td>
                                <td class="dataText"><c:out value="${report.reportdate}"/></td>
                                <td  class="dataText"><c:out value="${report.remarks}"/></td>
                                <td class="dataText"><c:out  value="${report.observation}"/></td>
                                <td  class="dataText"><img src="<c:out value="${report.epmty}"/>" width="5%" height="10%" /></td>

                            </tr>
                            <%
                                        i++;
                            %>
                        </c:forEach>
                    </tbody>

                    </table> --%>
                        <table  width="100%" border="1" cellspacing="0" cellpadding="0" align="center">


                            <thead>
                                <tr>
                                    <td class="headerText" width="6%">SL No</td>
                                    <td class="headerText" width="20%">Report Name</td>
                                    <td class="headerText" width="10%">Report Date</td>
                                    <td class="headerText" width="25%">Remark</td>
                                    <td class="headerText" width="25%">Observation</td>
                                    <td class="headerText" width="14%">Attachment</td>

                                </tr>
                            </thead>
                            <tbody>
                                <%
                                            int i = 1;
                                %>

                                <c:forEach items="${patient.reports}" var="report">
                                    <c:set var="string" value="${00}"/>
                                    <tr class="gradeA"  >

                                        <td  class="dataTextInActive" width="6%"><%=i%></td>
                                        <td  class="dataTextInActive" width="20%"><a class="dataTextInActive" href="Controller?process=ReportProcess&action=showindividualRepot&reportID=<c:out value="${report.reportid}"/>"><c:out value="${report.reportname}"/></a></td>
                                        <td class="dataText" width="10%"><c:out value="${report.reportdate}"/></td>
                                        <td  class="dataText" width="25%" height=""><c:out value="${report.remarks}"/></td>
                                        <td class="dataText" width="25%"><c:out  value="${report.observation}"/></td>
                                        <c:set var="myTest" value="${report.epmty}"/>
                                        <%
                                                    String temp = (String) pageContext.getAttribute("myTest");
                                                  //  System.out.println("for image kamal last try-" + temp);
                                                    String revtemp = "";
                                                    StringBuffer buffer = new StringBuffer(temp);
                                                    buffer.reverse();

                                                    for (int j = 0; j < buffer.length(); j++) {


                                                       // System.out.println("Kamal  string-" + buffer.charAt(j));
                                                        revtemp = revtemp + buffer.charAt(j);
                                                        if (buffer.charAt(j) == '.') {
                                                            break;
                                                        }

                                                    }

                                                   // System.out.println("Kamal in trouble for   reverse string-" + revtemp);
                                                    StringBuffer buffer1 = new StringBuffer(revtemp);
                                                    buffer1.reverse();
                                                    String finalfiletype = null;
                                                    finalfiletype = buffer1.toString();

                                                  //  System.out.println("Kamal in trouble for   pateint:-" + buffer1.toString());
                                                   // System.out.println("Kamal:-" + finalfiletype);

                                                    if (finalfiletype.equalsIgnoreCase(".jpeg") || finalfiletype.equalsIgnoreCase(".png") || finalfiletype.equalsIgnoreCase(".jpg") || finalfiletype.equalsIgnoreCase(".bmp") || finalfiletype.equalsIgnoreCase(".gif") || finalfiletype.equalsIgnoreCase(".png") || finalfiletype.equalsIgnoreCase(".psd") || finalfiletype.equalsIgnoreCase(".thm") || finalfiletype.equalsIgnoreCase(".tif")) {



                                        %>
                                        <td  class="dataText" width="14%"><a href="<c:out value="${report.epmty}"/>"><img src="<c:out value="${report.epmty}"/>" width="100%" height="25%" /></a></td>

                                        <%

                                                                                             //   System.out.println("Kamal Kumar:-");
                                                                                            } else {

                                        %>

                                        <td  class="dataText" width="14%"><a href="<c:out value="${report.epmty}"/>"><%=finalfiletype%></a></td>

                                        <%

                                                      //  System.out.println("MK Sharma:-");
                                                    }
                                        %>
                                    </tr>
                                    <%
                                                i++;
                                    %>
                                </c:forEach>
                            </tbody>

                        </table>
                    </div>
                </div>


                <div id="tab3" class="tab">
                    <div >
                        <table id="table2" width="90%"  align="center"  >
                            <tr>
                                <td width="14%" height="30"  class="alignLeft" >History of Present Illness  &nbsp;</td>
                                <td width="35%" class="dataContent">
                                    <label>
                                        <c:out default="" value="${patient.historyofpresentillness}" />

                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td width="14%"  class="alignLeft" >Past History &nbsp;  </td>
                                <td class="dataContent">
                                    <label>
                                        <c:out default="" value="${patient.pasthistory}" />
                                    </label>
                                </td>
                            </tr>
                            <tr>
                            </tr>
                            <tr>
                                <td width="14%"  class="alignLeft" >Personal History &nbsp;  </td>
                                <td class="dataContent">
                                    <label>
                                        <c:out default="" value="${patient.personalhistory}" />
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td width="14%" valign="top"  class="alignLeft" >Family History  &nbsp;</td>
                                <td class="dataContent">
                                    <label>
                                        <c:out default="" value="${patient.familyhistory}" />
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td width="14%"  class="alignLeft" >Drug Allergies  &nbsp;</td>
                                <td class="dataContent">
                                    <label>
                                        <c:out default="" value="${patient.drugallergies}" />
                                    </label>
                                </td>
                            </tr>
                            <tr></tr>
                            <tr>
                            </tr>
                        </table>
                    </div>
                </div>

                <div id="tab4" class="tab">


                    <div >
                        <table id="table3"  width="50%"  align="left"  >

                            <tr>
                                <td class="smallheaderTD"><b>Closed Appointments summary</b></td>
                            </tr>
                            <c:forEach varStatus="status"   items="${patient.visits}" var="visit"  >
                                <c:choose >
                                    <c:when test="${!visit.status}">
                                        <c:choose>
                                            <c:when test="${status.first}">
                                                <tr>
                                                    <td style="cursor: pointer"   onclick="openPopup('#'+<c:out value="${visit.id}"/>)"  ><u><b><fmt:formatDate pattern="dd MMMM yyyy " value="${visit.visittime}" /> at <fmt:formatDate pattern="hh:mm a" value="${visit.visittime}" /></b></u></td>
                                                    <td>
                                                        <div id="<c:out value="${visit.id}"/>" title="Details of Appointment">
                                                            <table id="table3" width="100%" border="0" cellpadding="1" cellspacing="1" align="center"   >
                                                                <tr>
                                                                    <td class="alignLeft"><b>Remarks</b></td>
                                                                    <td class="dataContent">
                                                                        <textarea  class="dataContent" readonly name="remarks" cols="120" rows="3"    id="remarks"><c:out default=" " value="${visit.remarks}" /></textarea>
                                                                    </td>
                                                                </tr>
                                                                <tr><td style="font-size: 4px"><br/></td></tr>
                                                                <tr>
                                                                    <td  class="alignLeft" >Diagnosis  &nbsp;</td>
                                                                    <td class="dataContent">
                                                                        <label>
                                                                            <textarea class="dataContent" readonly name="diagnosis" cols="120" rows="3"  id="diagnosis"><c:out default=" " value="${visit.diagnosis}" /></textarea>
                                                                        </label>
                                                                    </td>
                                                                </tr>
                                                                <tr><td style="font-size: 4px"><br/></td></tr>
                                                                <tr>
                                                                    <td   class="alignLeft" >Investigation  &nbsp;</td>
                                                                    <td class="dataContent">
                                                                        <label >
                                                                            <textarea class="dataContent" readonly name="investigations" cols="120" rows="3"  id="investigations"><c:out default=" " value="${visit.investigation}" /></textarea>
                                                                        </label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="font-size: 4px"><br/></td>
                                                                </tr>
                                                                <tr>
                                                                    <td   class="alignLeft" >Treatment  &nbsp;</td>
                                                                    <td class="dataContent">
                                                                        <label class="dataContent">
                                                                            <textarea class="dataContent" readonly name="treatment" cols="120" rows="3"  id="treatment"><c:out default=" " value="${visit.treatment}" /></textarea>
                                                                        </label>
                                                                    </td>
                                                                </tr>

                                                                <tr><td style="font-size: 4px"><br/></td></tr>
                                                                <tr>
                                                                    <td class="alignLeft">Examination &nbsp;</td>
                                                                    <td  colspan="3" class="dataContent"><span class="alignLeft">Pulse/min</span>
                                                                        <input readonly name="pulse" type="text" class="textFieldFixedWidth" id="pulse" value="<c:out default=" " value="${visit.pulse}" />"  />
                                                                        &nbsp;&nbsp;<span class="alignLeft">Blood Pressure in mmHg</span>
                                                                        <input readonly name="bp" type="text" class="textFieldFixedWidth" id="bp" value="<c:out default=" " value="${visit.bp}" />" />
                                                                        &nbsp;&nbsp;<span class="alignLeft">Respiratory Rate/min</span>
                                                                        <input readonly name="rr" type="text" class="textFieldFixedWidth" id="rr" value="<c:out default=" " value="${visit.rr}" />" />
                                                                        &nbsp;&nbsp;&nbsp;<span class="alignLeft">Rating</span>
                                                                        <input readonly name="rating" type="text" class="textFieldFixedWidth" id="rating" value="<c:out default=" " value="${visit.patientrating}" />" />
                                                                    </td>
                                                                </tr>
                                                                <tr><td><br/></td></tr>
                                                            </table>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>

                                                    <td class="dataContent">&nbsp;<b>Remarks:</b><br/>
                                                        &nbsp;&nbsp;&nbsp;<c:out value="${visit.remarks}"/>
                                                    </td>

                                                </tr>
                                                <tr>

                                                    <td class="dataContent">&nbsp;<b>Diagnosis</b><br/>
                                                        &nbsp;&nbsp;&nbsp;<c:out value="${visit.diagnosis}"/>
                                                    </td>

                                                </tr>
                                                <tr>

                                                    <td class="dataContent">&nbsp;<b>Investigation</b><br/>
                                                        &nbsp;&nbsp;&nbsp;<c:out value="${visit.investigation}"/>
                                                    </td>

                                                </tr>
                                                <tr>

                                                    <td class="dataContent">&nbsp;<b>Final Diagnosis:</b><br/>
                                                        &nbsp;&nbsp;&nbsp;<c:out value="${visit.finaldiagnosis}"/>
                                                    </td>

                                                </tr>
                                                <script type="text/javascript">
                                                $(function() {
                                                    var divId="#"+<c:out value="${visit.id}"/>;
                                                    $(divId).dialog({
                                                        autoOpen: false,
                                                        height: 450,
                                                        width: 800,
                                                        modal: true,
                                                        buttons: {
                                                            Cancel: function() {
                                                                $( this ).dialog( "close" );
                                                            }
                                                        }
                                                    });
                                                });
                                                </script>

                                            </c:when>
                                            <c:otherwise>
                                                <tr>
                                                    <td style="cursor: pointer"   onclick="openPopup('#'+<c:out value="${visit.id}"/>)"  ><u><b><fmt:formatDate pattern="dd MMMM yyyy " value="${visit.visittime}" /> at <fmt:formatDate pattern="hh:mm a" value="${visit.visittime}" /></b></u></td>
                                                    <td>
                                                        <div id="<c:out value="${visit.id}"/>" title="Details of Appointment">
                                                            <table id="table3" width="100%" border="0" cellpadding="1" cellspacing="1" align="center"   >
                                                                <tr>
                                                                    <td class="alignLeft"><b>Remarks</b></td>
                                                                    <td class="dataContent">
                                                                        <textarea class="dataContent" class="dataContent"  readonly name="remarks" cols="120" rows="3"    id="remarks"><c:out default=" " value="${visit.remarks}" /></textarea>
                                                                    </td>
                                                                </tr>
                                                                <tr><td style="font-size: 4px"><br/></td></tr>
                                                                <tr>
                                                                    <td  class="alignLeft" >Diagnosis  &nbsp;</td>
                                                                    <td class="dataContent">
                                                                        <label>
                                                                            <textarea class="dataContent"  readonly name="diagnosis" cols="120" rows="3"  id="diagnosis"><c:out default=" " value="${visit.diagnosis}" /></textarea>
                                                                        </label>
                                                                    </td>
                                                                </tr>
                                                                <tr><td style="font-size: 4px"><br/></td></tr>
                                                                <tr>
                                                                    <td   class="alignLeft" >Investigation  &nbsp;</td>
                                                                    <td class="dataContent">
                                                                        <label>
                                                                            <textarea class="dataContent" readonly name="investigations" cols="120" rows="3"  id="investigations"><c:out default=" " value="${visit.investigation}" /></textarea>
                                                                        </label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="font-size: 4px"><br/></td>
                                                                </tr>
                                                                <tr>
                                                                    <td   class="alignLeft" >Treatment  &nbsp;</td>
                                                                    <td class="dataContent">
                                                                        <label>
                                                                            <textarea class="dataContent" readonly name="treatment" cols="120" rows="3"  id="treatment"><c:out default=" " value="${visit.treatment}" /></textarea>
                                                                        </label>
                                                                    </td>
                                                                </tr>

                                                                <tr><td style="font-size: 4px"><br/></td></tr>
                                                                <tr>
                                                                    <td class="alignLeft">Examination &nbsp;</td>
                                                                    <td  colspan="3" class="dataContent"><span class="alignLeft">Pulse/min</span>
                                                                        <input readonly name="pulse" type="text" class="textFieldFixedWidth" id="pulse" value="<c:out default=" " value="${visit.pulse}" />"  />
                                                                        &nbsp;&nbsp;<span class="alignLeft">Blood Pressure in mmHg</span>
                                                                        <input readonly name="bp" type="text" class="textFieldFixedWidth" id="bp" value="<c:out default=" " value="${visit.bp}" />" />
                                                                        &nbsp;&nbsp;<span class="alignLeft">Respiratory Rate/min</span>
                                                                        <input readonly name="rr" type="text" class="textFieldFixedWidth" id="rr" value="<c:out default=" " value="${visit.rr}" />" />
                                                                        &nbsp;&nbsp;&nbsp;<span class="alignLeft">Rating</span>
                                                                        <input readonly name="rating" type="text" class="textFieldFixedWidth" id="rating" value="<c:out default=" " value="${visit.patientrating}" />" />
                                                                    </td>
                                                                </tr>
                                                                <tr><td><br/></td></tr>
                                                            </table>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>

                                                    <td class="dataContent">&nbsp;<b>Remarks:</b><br/>
                                                        &nbsp;&nbsp;&nbsp;<c:out value="${visit.remarks}"/>
                                                    </td>

                                                </tr>
                                                <tr>

                                                    <td class="dataContent">&nbsp;<b>Treatment</b><br/>
                                                        &nbsp;&nbsp;&nbsp;<c:out value="${visit.treatment}"/>
                                                    </td>

                                                </tr>

                                                <script type="text/javascript">
                                                $(function() {
                                                    var divId="#"+<c:out value="${visit.id}"/>;
                                                    $(divId).dialog({
                                                        autoOpen: false,
                                                        height: 450,
                                                        width: 800,
                                                        modal: true,
                                                        buttons: {
                                                            Cancel: function() {
                                                                $( this ).dialog( "close" );
                                                            }
                                                        }
                                                    });
                                                });
                                                </script>

                                            </c:otherwise>
                                        </c:choose>


                                    </c:when>
                                    <c:otherwise>

                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>
                            <tr>
                                <td class="smallheaderTD">Missed Appointments</td>
                            </tr>
                            <c:forEach   items="${patient.visits}" var="visit"  >


                                <c:choose >
                                    <c:when test="${visit.status &&  visit.visittime lt now}">
                                        <tr>
                                            <td title="click to reschedule" style="cursor: pointer"  onclick="openPopup('#'+<c:out value="${visit.id}"/>)"  ><u><b><fmt:formatDate pattern="EEEE, dd MMMM yyyy " value="${visit.visittime}" /> at <fmt:formatDate pattern="hh:mm a" value="${visit.visittime}" /></b></u></td>
                                            <td>
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
                                                </div>
                                            </td>
                                        </tr>
                                        <script type="text/javascript">
                                        $(function() {
                                            var divId="#"+<c:out value="${visit.id}"/>;
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
                                    </c:when>
                                    <c:otherwise>

                                    </c:otherwise>
                                </c:choose>



                            </c:forEach>
                            <tr>
                                <td>
                                    <br/>
                                </td>
                            </tr>
                            <tr>

                                <td class="smallheaderTD">Upcoming Appointments </td>
                            </tr>
                            <c:forEach   items="${patient.visits}" var="visit"  >
                                <c:choose >
                                    <c:when test="${visit.status  &&  visit.visittime gt now }">
                                        <tr>
                                            <td title="click to reschedule" style="cursor: pointer"  onclick="openPopup('#'+<c:out value="${visit.id}"/>)"  ><u><b><fmt:formatDate pattern="EEEE, dd MMMM yyyy " value="${visit.visittime}" /> at <fmt:formatDate pattern="hh:mm a" value="${visit.visittime}" /></b></u></td>
                                            <td>
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
                                                            <%-- <td  align="left" valign="bottom"><button id="reschedule<c:out default="" value="${visit.id}"/>">Reschedule</button>
                                                             </td>--%>

                                                        </tr>
                                                        <tr></tr><tr></tr>

                                                    </table>
                                                    <script type="text/javascript" >
                                                    $(function(){
                                                        var appointmentDate="#appointmentDate"+<c:out default="" value="${visit.id}"/>;
                                                        $( appointmentDate ).val(getCurrentDate());
                                                        $( appointmentDate ).datepicker();
                                                        <%--var rescheduleButtonId="#reschedule"+<c:out default='' value="${visit.id}"/>;
                                                        $(rescheduleButtonId)
                                                        .button()
                                                        .click(function() {
                                                            rescheduleVisitByID('<c:out default='' value="${visit.id}"/>');

                                                    });--%>
                                                    })
                                                    </script>
                                                </div>
                                            </td>
                                        </tr>
                                        <script type="text/javascript">
                                        $(function() {
                                            var divId="#"+<c:out value="${visit.id}"/>;
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
                                    </c:when>
                                    <c:otherwise>

                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </table>

                    </div>
                </div>
                <div id="tab5" class="tab">



                    <c:forEach varStatus="status"   items="${patient.visits}" var="visit"  >
                        <fmt:formatDate var="visitDate" type="date" value="${visit.visittime}" />
                        <c:choose >
                            <c:when test="${visit.status}">

                                <c:choose>
                                    <c:when test="${visitDate eq today}">
                                        <h3><a href="#" id="slide">Today's Appointment on <fmt:formatDate pattern="EEEE, dd MMMM yyyy " value="${visit.visittime}" /> at <fmt:formatDate pattern="hh:mm a" value="${visit.visittime}" /> </a></h3>

                                        <div  id="slidedown" style="display: none;">
                                            <input type="hidden" id="visitId<c:out default='' value="${visit.id}"/>" name="visitid" value="${visit.id}" />
                                            <c:choose>
                                                <c:when test="${status.first}">
                                                    <table id="table3" width="100%" border="0" cellpadding="1" cellspacing="1" align="center"   >

                                                        <tr>
                                                            <td class="alignLeft"><b>Doctor Name</b></td>
                                                            <td  class="dataContent"><textarea   name="doctname" cols="120" rows="3"    id="doctname" readonly><c:out default="" value="${visit.doctorname}" /></textarea></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="alignLeft"><b>Department</b></td>
                                                            <td  class="dataContent"><textarea   name="dept" cols="120" rows="3"    id="dept" readonly><c:out default="" value="${visit.departmenttype}" /></textarea></td>
                                                        </tr>

                                                        <tr>
                                                            <td class="alignLeft"><b>Remarks</b></td>
                                                            <td  class="dataContent"><textarea   name="remarks" cols="120" rows="3"    id="remarks<c:out default='' value="${visit.id}"/>"><c:out default="" value="${visit.remarks}" /></textarea></td>
                                                        </tr>
                                                        <tr><td style="font-size: 4px"><br/></td></tr>
                                                        <tr>
                                                            <td  class="alignLeft" >Diagnosis  &nbsp;</td>
                                                            <td class="dataContent">
                                                                <label>
                                                                    <textarea  name="diagnosis" cols="120" rows="3"  id="diagnosis<c:out default='' value="${visit.id}"/>"></textarea>
                                                                </label>
                                                            </td>
                                                        </tr>
                                                        <tr><td style="font-size: 4px"><br/></td></tr>
                                                        <tr>
                                                            <td   class="alignLeft" >Investigation  &nbsp;</td>
                                                            <td class="dataContent">
                                                                <label>
                                                                    <textarea name="investigations" cols="120" rows="3"  id="investigations<c:out default='' value="${visit.id}"/>"></textarea>
                                                                </label>
                                                            </td>
                                                        </tr>
                                                        <tr><td style="font-size: 4px"><br/></td></tr>
                                                        <tr>
                                                            <td   class="alignLeft" >Treatment  &nbsp;</td>
                                                            <td class="dataContent">
                                                                <label>
                                                                    <textarea name="treatment" cols="120" rows="3"  id="treatment<c:out default='' value="${visit.id}"/>"></textarea>
                                                                </label>
                                                            </td>
                                                        </tr>
                                                        <tr><td style="font-size: 4px"><br/></td></tr>
                                                        <tr>
                                                            <td   class="alignLeft" >Final Diagnosis  &nbsp;</td>
                                                            <td class="dataContent">
                                                                <input name="finalDiagnosis" type="text"  id="finalDiagnosis<c:out default='' value="${visit.id}"/>" />
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="alignLeft" style="display: none">Consultation Charges</span>  &nbsp;
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%-- <input name="consultationCharges<c:out default='' value="${visit.id}"/>" type="text"  id="consultationCharges<c:out default='' value="${visit.id}"/>" />  --%>

                                                            </td>

                                                        </tr>
                                                        <tr><td style="font-size: 4px"><br/></td></tr>
                                                        <tr>
                                                            <td class="alignLeft">Examination &nbsp;</td>
                                                            <td  colspan="3" class="dataContent"><span class="alignLeft">Pulse/min</span>
                                                                <input name="pulse" type="text" class="textFieldFixedWidth" id="pulse<c:out default='' value="${visit.id}"/>" />
                                                                &nbsp;&nbsp;<span class="alignLeft">Blood Pressure in mmHg</span>
                                                                <input name="bp" type="text" class="textFieldFixedWidth" id="bp<c:out default='' value="${visit.id}"/>" />
                                                                &nbsp;&nbsp;<span class="alignLeft">Respiratory Rate/min</span>
                                                                <input name="rr" type="text" class="textFieldFixedWidth" id="rr<c:out default='' value="${visit.id}"/>" />
                                                                &nbsp;&nbsp;&nbsp;<span class="alignLeft">Rating</span>
                                                                <input name="rating" type="text" class="textFieldFixedWidth" id="rating<c:out default='' value="${visit.id}"/>" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td><br/></td>
                                                        </tr>
                                                    </table>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <%--   <tr>
                                                            <td width="17%"><div class="alignLeft">&nbsp;Consultation Charges</div></td>
                                                            <td width="1%"><div class="alignLeft">&nbsp;:</div></td>
                                                            <td width="30%"><div class="alignLeft">&nbsp;
                                                                    <label>
                                                                        <input name="consultationCharges" type="text"  id="consultationCharges" />
                                                                    </label>
                                                                </div></td>
                                                            <td width="16%"><div>&nbsp;</div></td>
                                                            <td width="1%"><div>&nbsp;</div></td>
                                                            <td width="35%"><div>&nbsp;</div></td>
                                                        </tr>
                                                        <tr>
                                                            <td><div>&nbsp;</div></td>
                                                            <td><div>&nbsp;</div></td>
                                                            <td><div>&nbsp;</div></td>
                                                            <td><div>&nbsp;</div></td>
                                                            <td><div>&nbsp;</div></td>
                                                            <td><div>&nbsp;</div></td>
                                                        </tr>

                                                        --%>
                                                        <tr style="display: none">
                                                            <td><div class="alignLeft">&nbsp;Consultancy Type</div></td>
                                                            <td><div class="alignLeft">&nbsp;:</div></td>
                                                            <td><div>&nbsp;
                                                                    <label>
                                                                        <select style="width: 180px" class="textField" name='therapytypeid' id="therapytypeid"  >
                                                                            <option  value="" >Select</option>
                                                                            <%
                                                                                        Class.forName("org.postgresql.Driver").newInstance();
                                                                                        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5433/plexus_version1", "postgres", "plexus");

                                                                                        Statement stmt = con.createStatement();
                                                                                        ResultSet rs = stmt.executeQuery("Select * from theraphy");
                                                                                        while (rs.next()) {
                                                                            %>
                                                                            <option onclick="showTherapyOptn(this.label,this.value)" label="<%=rs.getString(3)%>" value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
                                                                            <%
                                                                                        }
                                                                            %>
                                                                        </select>
                                                                    </label>
                                                                    <br>
                                                                    <input style="display: none"  type="text" id="therapynamebill" name="therapynamebill" /><!-- style="display: none" -->
                                                                </div></td>
                                                            <td><div class="alignLeft">&nbsp;Consultation Charges</div></td>
                                                            <td><div class="alignLeft">&nbsp;:</div></td>
                                                            <td><div>&nbsp;
                                                                    <label>
                                                                        <input  type="text" name="therapychargebill" id="therapychargebill" style="width: 180px" />
                                                                    </label>
                                                                </div></td>
                                                        </tr>
                                                        <tr>
                                                            <td><div>&nbsp;</div></td>
                                                            <td><div>&nbsp;</div></td>
                                                            <td><div>&nbsp;</div></td>
                                                            <td><div>&nbsp;</div></td>
                                                            <td><div>&nbsp;</div></td>
                                                            <td><div>&nbsp;</div></td>
                                                        </tr>
                                                        <tr style="display: none">
                                                            <td><div class="alignLeft">&nbsp;Investigation Type</div></td>
                                                            <td><div class="alignLeft">&nbsp;:</div></td>
                                                            <td><div>&nbsp;
                                                                    <label>
                                                                        <select style="width: 180px" name="investigationtypeid" id="investigationtypeid"  class="style7">
                                                                            <option  value="">Select</option>
                                                                            <%
                                                                                        Class.forName("org.postgresql.Driver").newInstance();
                                                                                        con = DriverManager.getConnection("jdbc:postgresql://localhost:5433/plexus_version1", "postgres", "plexus");

                                                                                        stmt = con.createStatement();
                                                                                        rs = stmt.executeQuery("Select * from investigation");
                                                                                        while (rs.next()) {
                                                                            %>
                                                                            <option  onclick="showInvestigationTypeOptn(this.label,this.value)"  label="<%=rs.getString(3)%>" value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
                                                                            <%
                                                                                        }
                                                                            %>
                                                                        </select>
                                                                    </label>
                                                                    <br/>
                                                                    <input style="display: none"  type="text" id="investigationnamebill" name="investigationnamebill"/><!-- style="display: none" -->
                                                                </div></td>
                                                            <td><div class="alignLeft">&nbsp;Investigation Charges</div></td>
                                                            <td><div class="alignLeft">&nbsp;:</div></td>
                                                            <td><div>&nbsp;
                                                                    <label>
                                                                        <input type="text" name="investigationchargebill" id="investigationchargebill" style="width: 180px" />
                                                                    </label>
                                                                </div></td>
                                                        </tr>
                                                        <tr>
                                                            <td><div><input style="display:none " type="text" name="paientid" id="paientid" value="<c:out default="" value="${patient.id}"/>" style="width: 18px" /></div></td>
                                                            <td><div></div></td>
                                                            <td><div></div></td>
                                                            <td><div>&nbsp;</div></td>
                                                            <td><div>&nbsp;</div></td>
                                                            <td><div>&nbsp;</div></td>
                                                        </tr>
                                                    </table>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="16%"><div align="left"><button id="addDossage">Add Consultancy</button></div></td>
                                                            <td width="1%"><div align="left"></div></td>
                                                            <td width="28%"><div align="left"></div></td>
                                                            <td width="13%"><div align="left"></div></td>
                                                            <td width="1%"><div align="left"></div></td>
                                                            <td width="41%"><div align="left">
                                                                    <label>

                                                                    </label>
                                                                </div></td>
                                                        </tr>
                                                    </table>

                                                    <TABLE id="dataTable" width="100%" border="0" >
                                                        <thead>
                                                            <tr >
                                                                <td class="headerText" width="4%"><INPUT type="checkbox" id="selectAll"  name="selectAll" onclick="selectAllRow('dataTable')" /></td>
                                                                <td class="headerText" width="31%">Consultancy Type&nbsp;</td>
                                                                <td class="headerText" width="18%">Consultation Charges&nbsp;</td>
                                                                <td  width="28%">&nbsp;&nbsp;</td>
                                                                <td  width="13%">&nbsp;</td>
                                                                <td  width="6%">&nbsp;</td>
                                                                <!--     <td class="headerText" style="width: 5%">VAT</td>
                                                                    <td class="headerText" style="width: 15%">Amount</td>
                                                                        <td class="headerText" style="width: 15%">Medicine ID</td>  -->

                                                            </tr>
                                                        </thead>
                                                        <tbody>

                                                        </tbody>
                                                        <tfoot >

                                                        </tfoot>

                                                    </TABLE>
                                                    <table id="dataTable" width="100%" border="0">
                                                        <tr>
                                                            <td >
                                                                <button id="removeDossage" style="position: left">Remove</button>
                                                            </td>


                                                        </tr>

                                                    </table>

                                                    <%--    <table width="100%" border="0"  style="border-color:#4b6a84;" id="myTable">
                                                            <thead>
                                                                <tr >
                                                                    <th  width="28%" >&nbsp;&nbsp;</th>
                                                                    <th class="headerText" width="4%" ><input  type="checkbox" id = "chckHead" />&nbsp;</th>
                                                                    <th class="headerText" width="31%">Therapy Type&nbsp;</th>
                                                                    <th class="headerText" width="18%">Therapy Charges&nbsp;</th>
                                                                    <th  width="13%">&nbsp;</th>
                                                                    <th  width="6%">&nbsp;</th>

                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${TherapyList}" var="therapy">

                                                            <tr class="trClass" style="border-color:#000000" border="1"  cellpadding="1"  cellspacing="1">
                                                                <td  width="28%">&nbsp;</td>
                                                                <td  class="dataText" width="4%"><input type="checkbox" id = "<c:out value="${therapy.therphyid}"/>" class = "chcktbl"  name="personalIDs"  value="<c:out value="${therapy.therphyid}"/>"/></td> <!-- onclick="kkkk()"  -->
                                                                <td  class="dataText" width="31%"><c:out value="${therapy.theraphytype}"/></td>
                                                                <td  class="dataText" width="18%"><input type="text"  id = "therapychargesdiff"  name="therapychargesdiff" class = "chcktbl"   value="<c:out value="${therapy.theraphycharge}"/>"/></td>
                                                                <td  width="13%">&nbsp;</td>
                                                                <td  width="6%">&nbsp;</td>
                                                            </tr>
                                                        </c:forEach>

                                                    </tbody>

                                                </table>  --%>
                                                    <table id="table3" width="100%" border="0" cellpadding="1" cellspacing="1" align="center"   >
                                                        <tr>
                                                            <td colspan="4" align="center">

                                                                <button id="newsubmit" onmouseover="validateConsultationCharge();">Submit</button> <!--  set<c:out default="" value="${visit.id}"/>  -->
                                                                <button id="addPrescription<c:out default='' value="${visit.id}"/>" style="display: none">Proceed to prescription</button>&nbsp;&nbsp;<button id="reschedule<c:out default='' value="${visit.id}"/>">Reschedule</button></td>
                                                        </tr>
                                                    </table>
                                                </c:when>
                                                <c:otherwise>
                                                    <table id="table3" width="100%" border="0" cellpadding="1" cellspacing="1" align="center"   >

                                                        <tr>
                                                            <td class="alignLeft"><b>Doctor Name</b></td>
                                                            <td  class="dataContent"><textarea   name="doctname" cols="120" rows="3"    id="doctname"><c:out default="" value="${visit.doctorname}" /></textarea></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="alignLeft"><b>Department</b></td>
                                                            <td  class="dataContent"><textarea   name="dept" cols="120" rows="3"    id="dept"><c:out default="" value="${visit.departmenttype}" /></textarea></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="alignLeft"><b>Remarks</b></td>
                                                            <td  class="dataContent"><textarea   name="remarks" cols="120" rows="3"    id="remarks<c:out default='' value="${visit.id}"/>"><c:out default="" value="${visit.remarks}" /></textarea></td>
                                                        </tr>
                                                        <tr><td style="font-size: 4px"><br/></td></tr>
                                                        <tr style="display: none">
                                                            <td  class="alignLeft" >Diagnosis  &nbsp;</td>
                                                            <td class="dataContent">
                                                                <label>
                                                                    <textarea style="display: none" name="diagnosis" cols="120" rows="3"  id="diagnosis<c:out default='' value="${visit.id}"/>"></textarea>
                                                                </label>
                                                            </td>
                                                        </tr>
                                                        <tr><td style="font-size: 4px"><br/></td></tr>
                                                        <tr style="display: none">
                                                            <td   class="alignLeft" >Investigation  &nbsp;</td>
                                                            <td class="dataContent">
                                                                <label>
                                                                    <textarea  name="investigations" cols="120" rows="3"  id="investigations<c:out default='' value="${visit.id}"/>"></textarea>
                                                                </label>
                                                            </td>
                                                        </tr>
                                                        <tr><td style="font-size: 4px"><br/></td></tr>
                                                        <tr >
                                                            <td   class="alignLeft" >Treatment  &nbsp;</td>
                                                            <td class="dataContent">
                                                                <label>
                                                                    <textarea   name="treatment" cols="120" rows="3"  id="treatment<c:out default='' value="${visit.id}"/>"></textarea>
                                                                </label>
                                                            </td>
                                                        </tr>
                                                        <tr><td style="font-size: 4px"><br/></td></tr>
                                                        <tr>
                                                            <td  style="display: none"  class="alignLeft" >Final Diagnosis  &nbsp;</td><td    class="alignLeft"  style="display: none">Consultation Charges&nbsp;</td>
                                                            <td class="dataContent">
                                                                <input  style="display: none" name="finalDiagnosis" type="text"  id="finalDiagnosis<c:out default='' value="${visit.id}"/>" />
                                                                <%--   <input name="consultationCharges<c:out default='' value="${visit.id}"/>" type="text"  id="consultationCharges<c:out default='' value="${visit.id}"/>" />  --%>
                                                                &nbsp;&nbsp;&nbsp;<span class="alignLeft">Rating</span>
                                                                <input name="rating" type="text" class="textFieldFixedWidth" id="rating<c:out default='' value="${visit.id}"/>" />
                                                            </td>

                                                        </tr>
                                                        <tr><td style="font-size: 4px"><br/></td></tr>
                                                        <tr  style="display: none">
                                                            <td class="alignLeft">Examination &nbsp;</td>
                                                            <td  colspan="3" ><span class="alignLeft">Pulse/min</span>
                                                                <input name="pulse" type="text" class="textFieldFixedWidth" id="pulse<c:out default='' value="${visit.id}"/>" />
                                                                &nbsp;&nbsp;<span class="alignLeft">Blood Pressure in mmHg</span>
                                                                <input name="bp" type="text" class="textFieldFixedWidth" id="bp<c:out default='' value="${visit.id}"/>" />
                                                                &nbsp;&nbsp;<span class="alignLeft">Respiratory Rate/min</span>
                                                                <input name="rr" type="text" class="textFieldFixedWidth" id="rr<c:out default='' value="${visit.id}"/>" />

                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td><br/></td>
                                                        </tr>
                                                    </table>
                                                    <table id="table3" width="100%" border="0" cellspacing="0" cellpadding="0" >
                                                        <%--  <tr>
                                                            <td width="17%"><div class="alignLeft">&nbsp;Consultation Charges</div></td>
                                                            <td width="1%"><div class="alignLeft">&nbsp;:</div></td>
                                                            <td width="30%"><div class="alignLeft">&nbsp;
                                                                    <label>
                                                                        <input name="consultationCharges" type="text"  id="consultationCharges" />
                                                                    </label>
                                                                </div></td>
                                                            <td width="16%"><div>&nbsp;</div></td>
                                                            <td width="1%"><div>&nbsp;</div></td>
                                                            <td width="35%"><div>&nbsp;</div></td>
                                                        </tr>
                                                        <tr>
                                                            <td><div>&nbsp;</div></td>
                                                            <td><div>&nbsp;</div></td>
                                                            <td><div>&nbsp;</div></td>
                                                            <td><div>&nbsp;</div></td>
                                                            <td><div>&nbsp;</div></td>
                                                            <td><div>&nbsp;</div></td>
                                                        </tr> --%>
                                                        <tr style="display: none">
                                                            <td><div class="alignLeft">&nbsp;Consultancy Type</div></td>
                                                            <td><div class="alignLeft">&nbsp;:</div></td>
                                                            <td><div>&nbsp;
                                                                    <label>
                                                                        <select style="width: 180px" class="textField" name='therapytypeid' id="therapytypeid"  >
                                                                            <option value=""   >Select</option>
                                                                            <%
                                                                                        Class.forName("org.postgresql.Driver").newInstance();
                                                                                        Connection con1 = DriverManager.getConnection("jdbc:postgresql://localhost:5433/plexus_version1", "postgres", "plexus");

                                                                                        Statement stmt1 = con1.createStatement();
                                                                                        ResultSet rs1 = stmt1.executeQuery("Select * from theraphy");
                                                                                        while (rs1.next()) {
                                                                            %>
                                                                            <option onclick="showTherapyOptn(this.label,this.value)" label="<%=rs1.getString(3)%>"  value="<%=rs1.getString(1)%>" ><%=rs1.getString(2)%></option>
                                                                            <%
                                                                                        }
                                                                            %>
                                                                        </select>

                                                                    </label>
                                                                    <br>
                                                                    <input style="display: none"  type="text" id="therapynamebill" name="therapynamebill" /><!-- style="display: none" -->
                                                                </div></td>
                                                            <td><div class="alignLeft">&nbsp;Consultation Charges</div></td>
                                                            <td><div class="alignLeft">&nbsp;:</div></td>
                                                            <td><div>&nbsp;
                                                                    <label>
                                                                        <input  type="text" name="therapychargebill" id="therapychargebill" style="width: 180px" />
                                                                    </label>
                                                                </div></td>
                                                        </tr>
                                                        <tr>
                                                            <td><div>&nbsp;</div></td>
                                                            <td><div>&nbsp;</div></td>
                                                            <td><div>&nbsp;</div></td>
                                                            <td><div>&nbsp;</div></td>
                                                            <td><div>&nbsp;</div></td>
                                                            <td><div>&nbsp;</div></td>
                                                        </tr>
                                                        <tr style="display: none">
                                                            <td><div class="alignLeft">&nbsp;Investigation Type</div></td>
                                                            <td><div class="alignLeft">&nbsp;:</div></td>
                                                            <td><div>&nbsp;
                                                                    <label>
                                                                        <select style="width: 180px" name="investigationtypeid" id="investigationtypeid"  class="style7">
                                                                            <option  value="">Select</option>
                                                                            <%
                                                                                        Class.forName("org.postgresql.Driver").newInstance();
                                                                                        con1 = DriverManager.getConnection("jdbc:postgresql://localhost:5433/plexus_version1", "postgres", "plexus");

                                                                                        stmt1 = con1.createStatement();
                                                                                        rs1 = stmt1.executeQuery("Select * from investigation");
                                                                                        while (rs1.next()) {
                                                                            %>
                                                                            <option  onclick="showInvestigationTypeOptn(this.label,this.value)"  label="<%=rs1.getString(3)%>" value="<%=rs1.getString(1)%>"><%=rs1.getString(2)%></option>
                                                                            <%
                                                                                        }
                                                                            %>
                                                                        </select>

                                                                    </label>
                                                                    <br/>
                                                                    <input style="display: none"  type="text" id="investigationnamebill" name="investigationnamebill"/><!-- style="display: none" -->
                                                                </div></td>
                                                            <td><div class="alignLeft">&nbsp;Investigation Charges</div></td>
                                                            <td><div class="alignLeft">&nbsp;:</div></td>
                                                            <td><div>&nbsp;
                                                                    <label>
                                                                        <input type="text" name="investigationchargebill" id="investigationchargebill" style="width: 180px" />
                                                                    </label>
                                                                </div></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="17%"><div><input style="display:none " type="text" name="paientid" id="paientid" value="<c:out default="" value="${patient.id}"/>" style="width: 18px" /></div></td>
                                                            <td width="1%"><div></div></td>
                                                            <td width="30%"><div></div></td>
                                                            <td width="16%"><div>&nbsp;</div></td>
                                                            <td width="1%"><div>&nbsp;</div></td>
                                                            <td width="35%"><div></div></td>
                                                        </tr>
                                                    </table>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="16%"><div align="left"><button id="addDossage">Add Consultancy</button></div></td>
                                                            <td width="1%"><div align="left"></div></td>
                                                            <td width="28%"><div align="left"></div></td>
                                                            <td width="13%"><div align="left"></div></td>
                                                            <td width="1%"><div align="left"></div></td>
                                                            <td width="41%"><div align="left">
                                                                    <label>

                                                                    </label>
                                                                </div></td>
                                                        </tr>
                                                    </table>

                                                    <TABLE id="dataTable" width="100%" border="0" >
                                                        <thead>
                                                            <tr >
                                                                <td class="headerText" width="4%"><INPUT type="checkbox" id="selectAll"  name="selectAll" onclick="selectAllRow('dataTable')" /></td>
                                                                <td class="headerText" width="31%">Consultancy Type&nbsp;</td>
                                                                <td class="headerText" width="18%">Consultation Charges&nbsp;</td>
                                                                <td  width="28%">&nbsp;&nbsp;</td>
                                                                <td  width="13%">&nbsp;</td>
                                                                <td  width="6%">&nbsp;</td>
                                                                <!--     <td class="headerText" style="width: 5%">VAT</td>
                                                                    <td class="headerText" style="width: 15%">Amount</td>
                                                                        <td class="headerText" style="width: 15%">Medicine ID</td>  -->

                                                            </tr>
                                                        </thead>
                                                        <tbody>

                                                        </tbody>
                                                        <tfoot >

                                                        </tfoot>

                                                    </TABLE>
                                                    <table id="dataTable" width="100%" border="0">
                                                        <tr>
                                                            <td >
                                                                <button id="removeDossage" style="position: left">Remove</button>
                                                            </td>


                                                        </tr>

                                                    </table>
                                                    <%--    <table width="100%" border="0"  style="border-color:#4b6a84;" id="myTable">
                                                            <thead>
                                                                <tr >
                                                                    <th  width="28%" >&nbsp;&nbsp;</th>
                                                                    <th class="headerText" width="4%" ><input  type="checkbox" id = "chckHead" />&nbsp;</th>
                                                                    <th class="headerText" width="31%">Therapy Type&nbsp;</th>
                                                                    <th class="headerText" width="18%">Therapy Charges&nbsp;</th>
                                                                    <th  width="13%">&nbsp;</th>
                                                                    <th  width="6%">&nbsp;</th>

                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${TherapyList}" var="therapy">

                                                            <tr class="trClass" style="border-color:#000000" border="1"  cellpadding="1"  cellspacing="1">
                                                                <td  width="28%">&nbsp;</td>
                                                                <td  class="dataText" width="4%"><input type="checkbox" id = "<c:out value="${therapy.therphyid}"/>" class = "chcktbl"  name="personalIDs"  value="<c:out value="${therapy.therphyid}"/>"/></td> <!-- onclick="kkkk()"  -->
                                                                <td  class="dataText" width="31%"><c:out value="${therapy.theraphytype}"/></td>
                                                                <td  class="dataText" width="18%"><input type="text"  id = "therapychargesdiff"  name="therapychargesdiff" class = "chcktbl"   value="<c:out value="${therapy.theraphycharge}"/>"/></td>
                                                                <td  width="13%">&nbsp;</td>
                                                                <td  width="6%">&nbsp;</td>
                                                            </tr>
                                                        </c:forEach>

                                                    </tbody>

                                                </table>  --%>
                                                    <table id="table3" width="100%" border="0" cellpadding="1" cellspacing="1" align="center"   >
                                                        <tr>
                                                            <td colspan="4" align="center">

                                                                <button id="newsubmit" onmouseover="validateTherapyCharge();">Submit</button> <!-- set<c:out default="" value="${visit.id}"/>   -->
                                                                <button id="addPrescription<c:out default='' value="${visit.id}"/>" style="display: none">Proceed to prescription</button>&nbsp;&nbsp;<button id="reschedule<c:out default='' value="${visit.id}"/>">Reschedule</button></td>
                                                        </tr>
                                                    </table>
                                                </c:otherwise>

                                            </c:choose>


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
                                                        <td  align="left" >
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
                                                        if(validateConsultationCharges('<c:out default='' value="${visit.id}"/>')){
                                                            alert('confusion id :-');
                                                            updateVisitByID('<c:out default='' value="${visit.id}"/>');
                                                        }
                                                        else{
                                                            return false;
                                                        }


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

                                    </c:when>
                                    <c:otherwise>



                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                            <c:otherwise >
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
            </div>



            <div>
                <br/>
                <table width="100%">
                    <tr>
                        <td  class="headerTD">PATIENT IMPROVEMENT GRAPH</td>
                    </tr>

                </table>


            </div>
            
            <c:forEach    items="${patient.visits}" var="visit"  >

                <c:set var="visitid"  value="${visit.id}"/>
                

            </c:forEach>
                                    <c:choose>
                    <c:when test="${visitid >0}">

                        <div style="border-radius:10px;border-width: 1px;border-style: solid;border-color: blue" align="center">
                <div id="chartdiv"   style="height:400px;width:95%; text-align: center"></div>
                <script type="text/javascript">
                $(document).ready(function() {
                    var data=[<c:forEach  varStatus="status" items="${patient.visits}" var="visit">['<fmt:formatDate pattern="yyyy-M-dd hh:mm a" value="${visit.visittime}" />',<c:out default="0" value="${visit.patientrating}" />]<c:if test="${!status.last}">,</c:if></c:forEach>];
                    var showTick=true;
                    if(data.length==1){
                        var tDate = new Date();

                        var year,month,day,hours,min,sec;
                        year=tDate.getFullYear();
                        month=tDate.getMonth()+1;
                        day=tDate.getDate();
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

                        data.push([year+"-"+month+"-"+day+" "+hours+":"+min,0]);
                        showTick=false;
                        //data=[[year+"-"+day+"-"+month+" 00:00",0],[year+"-"+day+"-"+month+" "+hours+":"+min,0]];
                    }
                    var line1=[['2012-08-12 4:00PM',10], ['2008-09-12 4:00PM',6.5], ['2008-10-12 4:00PM',5.7], ['2008-11-12 4:00PM',9], ['2008-12-12 4:00PM',8.2]];
                    var plot2 = $.jqplot('chartdiv', [data], {

                        axes:{
                            xaxis:{
                                renderer:$.jqplot.DateAxisRenderer,
                                tickOptions:{labelPosition: 'outside',formatString:'%#d %b %Y%n%I %p',fontFamily:'Helvetica',
                                    fontSize: '8pt',show:showTick},
                                label:'Timeline',
                                labelOptions:{
                                    fontFamily:'Helvetica',
                                    fontSize: '12pt'
                                },labelRenderer: $.jqplot.CanvasAxisLabelRenderer
                            },
                            yaxis:{
                                tickOptions:{fontFamily:'Helvetica',fontSize: '8pt'},
                                label:'Rating',
                                labelOptions:{
                                    fontFamily:'Helvetica',
                                    fontSize: '12pt'
                                }
                            }
                        },
                        series:[{lineWidth:1, markerOptions:{style:'filledCircle'}}],
                        highlighter: {
                            show: true,
                            sizeAdjust: 8,
                            useAxesFormatters: true
                        },
                        cursor: {
                            show: true
                        }
                    });
                })
                </script>
            </div>
                    </c:when>
                    <c:otherwise>



                    </c:otherwise>
                </c:choose>
            
            <script type="text/javascript">
            $(function() {
                $( "#popup" ).dialog({
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


        </form>

        <script type="text/javascript">
        function addNewReport(){
            // alert('patient id is:-'+<c:out value="${patient.id}"/>);

            var form1=document.getElementById("form1");

            form1.action="Controller?process=ReportProcess&action=addNewReport&parentID=<c:out value="${patient.id}"/>";
            form1.submit();

        }

        function UpdateNewStyle(){
            //alert('kamal');

            var form1=document.getElementById("form1");

            form1.action="Controller?process=PatientProcess&action=updateNewRequirement";
            form1.submit();

        }

        </script>
    </body>
</html>
