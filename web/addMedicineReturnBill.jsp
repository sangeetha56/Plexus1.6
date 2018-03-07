<%-- 
    Document   : addMedicineReturnBill
    Created on : 8 Aug, 2017, 11:01:42 PM
    Author     : Lifecell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.button.js"></script>
        <script src="js/watermark/watermark.js" type="text/javascript" ></script>
        <style type="text/css">
            <!--
            .labelCss {
                font-family: Tahoma;
                font-size: 11px;
                font-weight: bold;
            }
            .dataTextInActive {
                border-radius:1px;
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 12px;
                font-weight: bold;
                letter-spacing: normal;
                text-align: center;
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
            -->
        </style>
        <script type="text/javascript">
            /**
             * Comment
             */
            function calculateGrandTotal() {
                var sum = 0.0;
                var column2 = $('.medicineAmount')
                jQuery.each(column2,function(){
                    sum += parseFloat($(this).val());
                });
                $('#grandTotalAmount').val(sum.toPrecision(6));

            }
            $(document).ready(function() {
                $("#dispenseDate").val(getCurrentDate());
                $("#dispenseDate").datepicker();

                /*       $("#consultationamount").keyup(function(){
                    var consultation=parseFloat($("#consultationamount").val());
                    var miscellanous=parseFloat($("#miscellanousamount").val());
                    var sum = 0.0;
                    var totalSum=0.0;
                    var column2 = $('.medicineAmount')
                    jQuery.each(column2,function(){
                        sum += parseFloat($(this).val());
                    });
                    totalSum=sum+miscellanous+consultation;
                    $('#grandTotalAmount').val(totalSum.toPrecision(6));

                });
                 */
                $("#miscellanousamount").keyup(function(){
                    //var consultation=parseFloat($("#consultationamount").val());
                    var miscellanous=parseFloat($("#miscellanousamount").val());
                    var sum = 0.0;
                    var totalSum=0.0;
                    var column2 = $('.medicineAmount')
                    jQuery.each(column2,function(){
                        sum += parseFloat($(this).val());
                    });
                    totalSum=sum+miscellanous;//+consultation;
                    $('#grandTotalAmount').val(totalSum.toPrecision(6));
                });
                $("#dataTable").keyup(function(){
                    // var consultation=parseFloat($("#consultationamount").val());
                    var miscellanous=parseFloat($("#miscellanousamount").val());
                    var discount=parseFloat($("#discountparcent").val());

                    var cgst=parseFloat($("#cgst").val());
                    var sgst=parseFloat($("#sgst").val());
                    var igst=parseFloat($("#igst").val());
                    var gst=parseFloat($("#gst").val());
                    //alert('cgst value:-'+cgst+';;;  sgst:-'+sgst+';;;  igst:-'+igst);
                    var sum = 0.0;
                    var taxsum = 0.0;
                    var totalSum=0.0;
                    var totalvalueafterdiscount=0.0;
                    var discountedamount=0.0;
                    var totaltax=0.0;
                    var column2 = $('.medicineAmount')
                    jQuery.each(column2,function(){
                        sum += parseFloat($(this).val());
                    });

                    var column2Tax = $('.medicineAmountsTax')
                    jQuery.each(column2Tax,function(){
                        taxsum += parseFloat($(this).val());
                    });
                    totalSum=sum+miscellanous;//totalSum=sum+miscellanous+consultation;
                    discountedamount=(totalSum*discount/100);
                    totaltax=(totalSum*cgst/100)+(totalSum*sgst/100)+(totalSum*igst/100);

                    //alert('total tax value value:-'+totaltax);
                    //alert('discount value:-'+discount);
                    gst=cgst+sgst+igst;
                    totalvalueafterdiscount=totalSum-discountedamount+taxsum;
                    $('#medicineTotalAmount').val(sum.toPrecision(6));
                    $('#grandTotalAmount').val(totalSum.toPrecision(6));
                    $('#discountamount').val(discountedamount.toPrecision(6));
                    $('#totalvalue').val(totalvalueafterdiscount.toPrecision(6));
                    $('#totaltaxvalue').val(taxsum.toPrecision(6));
                    $('#gst').val(gst);
                });


            });
            /**
             * Comment
             */
            /**
             * Comment
             */
            /**
             * Comment
             */
            function validate() {
                if(validatePatient() & validateMedicine()){
                    return true;
                }
                else{
                    return false;
                }

            }
            function validatePatient() {
                if($("#patientId").val()==""){
                    alert("Select Patient");
                    return false;

                }
                else{
                    return true;
                }

            }
            function validateMedicine() {
                var count = 0;
                var idColumn = $('.medicineStatus')

                if(idColumn.length==0){
                    alert("Add Medicine");
                    return false;
                }else{
                    jQuery.each(idColumn,function(){

                        if($(this).val()=="not set"){

                            count++;
                        }
                    });
                    if(count >0){
                        alert("Add Medicine");
                        return false;
                    }
                    else{
                        return true;
                    }

                }

            }

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
                    alert('inside:-')
                    var row = table.rows[i];
                    var chkbox = row.cells[0].childNodes[0];
                    chkbox.checked=true;
                }
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


            <%--var medicines=[
                <c:forEach varStatus="status" items="${allMedicines}" var="medicine">{
                        value:'<c:out default="0" value="${medicine.medicineName}" />',
                        availableStock:'<c:out default="0" value="${medicine.availableStock}" />',
                        strength:'<c:out default="0" value="${medicine.medicineStrength}" />',
                        price:'<c:out default="0" value="${medicine.price}" />',
                        id:'<c:out default="0" value="${medicine.id}" />',
                        nature:'<c:out default="0" value="${medicine.medicineNature}" />'}<c:if test="${!status.last}">,</c:if>
            </c:forEach>
            ];--%>
                var medicines=[
            <c:forEach varStatus="status" items="${allMedicines}" var="medicine">{
                    value:'<c:out default="0" value="${medicine.name}" />',
                    availableStock:'<c:out default="0" value="${medicine.availableTotalStock}" />',
                    strength:'<c:out default="0" value="${medicine.strength}" />',
                    price:'<c:out default="0" value="${medicine.price}" />',
                    id:'<c:out default="0" value="${medicine.id}" />',
                    nature:'<c:out default="0" value="${medicine.nature}" />',
                    batchno:'<c:out default="0" value="${medicine.batchno}" />',
                    vat:'<c:out default="0" value="${medicine.vat}" />',
                    cgst:'<c:out default="0" value="${medicine.cgst}" />',
                    igst:'<c:out default="0" value="${medicine.igst}" />',
                    sgst:'<c:out default="0" value="${medicine.sgst}" />',
                    gst:'<c:out default="0" value="${medicine.gst}" />',
                    expiry:'<c:out default="0" value="${medicine.expirydate}" />'


                }<c:if test="${!status.last}">,</c:if>
            </c:forEach>
            ];
            var patients = [
            <c:forEach varStatus="status" items="${patientList}" var="patient">{
                value:'<c:out default="0" value="${patient.name}" />',
                id:'<c:out default="0" value="${patient.id}" />',
                cardno:'<c:out default="0" value="${patient.cardno}" />'
            }<c:if test="${!status.last}">,</c:if>
            </c:forEach>
        ];
        $(function() {
            $( "#patientName").autocomplete({
                source: patients,
                minLength: 1,
                change:function(event,ui){
                    $( "#patientId").val( ui.item.id );
                },
                focus: function( event, ui ) {
                    $( "#patientId").val( ui.item.id );
                    return true;
                },
                select: function( event, ui ) {
                    $( "#patientId").val( ui.item.id );
                    return true;
                }
            }).data( "autocomplete" )._renderItem = function( ul, item ) {
                return $( "<li></li>" )
                .data( "item.autocomplete", item )
                .append( "<a><b> " + item.value +", </b> <b>Card No: "+item.cardno +"</b></a>" )
                .appendTo( ul );
            };
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








        $('#selectAll').click(function () {
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
                for(var i=1; i<rowCount-1; i++) {
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
                calculateGrandTotal();
                //$('#grandTotalAmount').val(0);
            }catch(e) {
                alert(e);
            }
        }
        function calculate(value2) {
            //var val1=value1.value;
            var actualQuantity=document.getElementById("hiddenMedicine_quantity_"+value2).value;
            var val1=document.getElementById("medicine_quantity_"+value2).value;
            var val2=document.getElementById("hiddenMedicine_amount_"+value2).value;
            var final1=document.getElementById("medicine_amount_"+value2);
            //var vat1=document.getElementById("Medicine_vat_"+value2).value;
            var cgst1=document.getElementById("Medicine_cgst_"+value2).value;
            var sgst1=document.getElementById("Medicine_sgst_"+value2).value;
            var igst1=document.getElementById("Medicine_igst_"+value2).value;
             var gst1=document.getElementById("Medicine_gst_"+value2).value;
             var totaltax=document.getElementById("medicine_amount_tax"+value2);
            //alert('vat valu is:-'+parseFloat(vat1));
            var temp;
            var temptax;
            //var totaltax;
            if(parseInt(val1) > parseInt(actualQuantity) ){
                final1.value=0;
                document.getElementById("medicine_quantity_"+value2).value=0;
                alert("Available quantity is "+actualQuantity+", Enter value less or equal to available quantity ");
            }
            /*if(val1 > actualQuantity ){
                final1.value=0;
                alert("Available quantity is "+actualQuantity+", Enter value less or equal to available quantity ");
            }*/
            else{
                temp=(val1*val2);//(val1*val2)+(val1*val2*vat1/100);
                temptax=(val1*val2*gst1)/100;
                final1.value=(temp).toPrecision(6);
                totaltax.value=(temptax).toPrecision(6);
            }
        }
        function addRow() {
            //alert('kk-1');
            var rowCount = document.getElementById('dataTable').rows.length;
            var col1="<td class='dataTextInActive' ><input type='checkbox' class = 'chcktbl' id=medicine_"+rowCount+" /><input type='hidden' class='medicineStatus' name='medicineStatuses' id=medicine_status_"+rowCount+" value='not set' /><input type='hidden' class='medicineId' name='medicineIDS' id=medicine_id_"+rowCount+" value='' /></td>";
            var col2="<td class='dataTextInActive' ><input class='medicineName' type='text' name='medicineNames' id=medicine_name_"+rowCount+" size='20' /></td>";
            var col6="<td class='dataTextInActive' ><input class='' type='text' value='0' readonly name='medicenebatchno' id=medicine_batchno_"+rowCount+" size='10' /></td>";
            var col7="<td class='dataTextInActive' ><input class='' type='text' value='0' readonly name='expdate' id=Medicine_expiry_"+rowCount+" size='12'/></td>";
            var col4="<td class='dataTextInActive' ><input type='text' value='0' onclick='calculate("+rowCount+")'  onkeyup='calculate("+rowCount+")' name='medicineQuantities' id=medicine_quantity_"+rowCount+" size='5'/><input type='hidden'   id=hiddenMedicine_quantity_"+rowCount+" value='' size='5'/></td>";
            var col3="<td class='dataTextInActive' ><input type='text' value='0' readonly  id=hiddenMedicine_amount_"+rowCount+" size='10'/></td>";
            var col8="<td class='dataTextInActive' ><input class='' type='text' value='0' readonly name='medivat' id=Medicine_vat_"+rowCount+" size='5'/></td>";
            var col9="<td class='dataTextInActive' ><input class='' type='text' value='0' readonly name='medicgst' id=Medicine_cgst_"+rowCount+" size='5'/></td>";
            var col10="<td class='dataTextInActive' ><input class='' type='text' value='0' readonly name='mediigst' id=Medicine_igst_"+rowCount+" size='5'/></td>";
            var col11="<td class='dataTextInActive' ><input class='' type='text' value='0' readonly name='medisgst' id=Medicine_sgst_"+rowCount+" size='5'/></td>";
            var col12="<td class='dataTextInActive' ><input class='' type='text' value='0' readonly name='medigst' id=Medicine_gst_"+rowCount+" size='5'/></td>";
            var col5="<td class='dataTextInActive' ><input class='medicineAmount' type='text' value='0' readonly name='medicineAmounts' id=medicine_amount_"+rowCount+" size='10'/></td>";
            var col13="<td class='dataTextInActive' ><input class='medicineAmountsTax' type='text' value='0' readonly name='medicineAmountsTax' id=medicine_amount_tax"+rowCount+" size='10'/></td>";
            // var col9="<td class='dataTextInActive' ><input type='text' class='medicineId' name='medicineIDS' id=medicine_id_"+rowCount+" value='' /></td>";


            //alert('kk-2');
            var newRow = $("<tr class='trClass'>"+col1+col2+col6+col7+col4+col3+col9+col11+col10+col12+col5+col13+"</tr>");//col9+
            $(function() {
                $("#dataTable").find('tbody').append(newRow);
            });
            $(function() {
                $("#medicine_name_"+rowCount).autocomplete({
                    source: medicines,
                    minLength: 1,
                    change:function(event,ui){

                        $("#medicine_id_"+rowCount ).val( ui.item.id );
                        $( "#medicine_status_"+rowCount ).val("set");
                        $("#hiddenMedicine_amount_"+rowCount).val( ui.item.price );
                        $("#hiddenMedicine_quantity_"+rowCount).val( ui.item.availableStock );
                        $( "#medicine_batchno_"+rowCount ).val(ui.item.batchno);
                       // $("#Medicine_vat_"+rowCount).val( ui.item.vat );
                        $("#Medicine_cgst_"+rowCount).val( ui.item.cgst );
                        $("#Medicine_igst_"+rowCount).val( ui.item.igst );
                        $("#Medicine_sgst_"+rowCount).val( ui.item.sgst );
                        $("#Medicine_gst_"+rowCount).val( ui.item.gst );
                        $("#Medicine_expiry_"+rowCount).val( ui.item.expiry );

                        calculate(rowCount);

                    },
                    focus: function( event, ui ) {
                        $( "#medicine_name_"+rowCount).val( ui.item.name );
                        $( "#medicine_status_"+rowCount ).val("not set");
                        $( "#medicine_id_"+rowCount ).val( ui.item.id );
                        $( "#hiddenMedicine_amount_"+rowCount).val( ui.item.price );
                        $("#hiddenMedicine_quantity_"+rowCount).val( ui.item.availableStock );
                        $( "#medicine_batchno_"+rowCount ).val(ui.item.batchno);
                       // $("#Medicine_vat_"+rowCount).val( ui.item.vat );
                        $("#Medicine_cgst_"+rowCount).val( ui.item.cgst );
                        $("#Medicine_igst_"+rowCount).val( ui.item.igst );
                        $("#Medicine_sgst_"+rowCount).val( ui.item.sgst );
                        $("#Medicine_gst_"+rowCount).val( ui.item.gst );
                        $("#Medicine_expiry_"+rowCount).val( ui.item.expiry );

                        calculate(rowCount);

                        return true;
                    },
                    select: function( event, ui ) {
                        $( "#medicine_name_"+rowCount).val( ui.item.value );
                        $( "#medicine_id_"+rowCount ).val( ui.item.id );
                        $( "#medicine_status_"+rowCount ).val("set");
                        $( "#hiddenMedicine_amount_"+rowCount).val( ui.item.price );
                        $("#hiddenMedicine_quantity_"+rowCount).val( ui.item.availableStock );
                        $( "#medicine_batchno_"+rowCount ).val(ui.item.batchno);
                       // $("#Medicine_vat_"+rowCount).val( ui.item.vat );
                       // $("#Medicine_cgst_"+rowCount).val( ui.item.cgst );
                       // $("#Medicine_igst_"+rowCount).val( ui.item.igst );
                       // $("#Medicine_sgst_"+rowCount).val( ui.item.sgst );
                        $("#Medicine_gst_"+rowCount).val( ui.item.gst );
                        $("#Medicine_expiry_"+rowCount).val( ui.item.expiry );

                        calculate(rowCount);
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




        </script>
        <script>
    function showProductCatOptn(opt)
    {
        // var a=document.getElementById("optContryID");
        // document.getElementById("countrynameTxt").value=a.innerHTML;
        document.getElementById("departmentname").value=opt;



    }
        </script>

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
    $(function() {



        $( "#sub" )
        .button()
        .click(function() {
            //alert('hhhh');



        });

    });


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
                <script type="text/javascript">
            jQuery(function($){
                $("#patientName").Watermark("Click here to select patient");

            });
        </script>
    </head>
    <body>
        <form action="Controller?process=RedispenseProcess&action=add" name="form1" id="form1" method="post" onsubmit="return validate()">
            <table  width="100%">
                <thead>
                    <tr>
                        <th colspan="8" class="headerTD"> Medicine Return by Patient</th>

                    </tr>
                </thead>
                <tbody>


                    <%--            <tr>
                                    <td style="width: 45%" align="left">Patient Name: <input  type="text" name="patientName" id="patientName" style="width: 200px" /> <input name="patientId" type="hidden" id="patientId" value="" /> </td>
                                    <td align="right">Dispense Date: <input type="text" name="dispenseDate" id="dispenseDate" /></td>
                                 <!--    <td>Dossage: <button id="addDossage">Add</button>&nbsp;&nbsp;&nbsp;<button id="removeDossage">Remove</button></td>  -->
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                </tr>
                                <tr>

                      <td style="width: 45%;display: none" >Consultation &nbsp;&nbsp;&nbsp;<input  type="text" name="consultationamount" id="consultationamount" style="width: 200px" value="0" />  </td>
                     <td align="left" style="width: 10%"><button id="addDossage">Add Medicine</button>&nbsp;&nbsp;&nbsp;
                         Miscellaneous &nbsp;&nbsp;&nbsp; <input type="text" name="miscellanousamount" id="miscellanousamount" value="0" size="10" /></td>


                                <td><div align="right"><span class="">Department Name</span></div></td>
                                <td>:</td>
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
                                 <td ><div align="right"><span class="">Doctor Name</span></div></td>
                                <td>:</td>
                                <td><div align="right" id='state'>
                                         <select style="width: 100px" class="textField" name='state'>
                                            <option  value="-1" ></option>
                                        </select>


                                <br/>
                                <br/>

                                    </div></td>

                            </tr>
                    <tr>
                           <input type="text" name="countrynameTxt" id="countrynameTxt" value="null" size="10" />
                           <input type="text" name="statenameTxt" id="statenameTxt" value="null" size="10" />
                    </tr>
                    --%>
                    <tr>
                        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="16%" class="style1"><div align="left">Patient Name </div></td>
                                    <td width="1%"><div align="left">
                                            <label></label>
                                        </div></td>
                                    <td width="28%"><div align="left">
                                            <label>
                                                <a id="contPopup"  href="javascript:openWin5('Controller?process=PatientProcess&action=viewAllPopUp&patientControllerValue=null&noOfRecords=20&pageno=1&alphabit=null&flag=0',700,300,'propAdd1')"    style="font-size:7pt;" class="anchor" ><input  type="text" name="patientName" id="patientName" style="width: 200px" title="Click here to Select Patient" /></a> <input name="patientID" type="hidden" id="patientID" value="" />
                                            </label>
                                        </div></td>

                                    <td width="13%" class="style1"><div align="left">Dispense Date </div></td>
                                    <td width="1%"><div align="left"></div></td>
                                    <td width="41%"><div align="left">
                                            <label>
                                                <input type="text" name="dispenseDate" id="dispenseDate" />
                                            </label>
                                        </div></td>
                                </tr>
                            </table></td>
                    </tr>
                    <tr>
                        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="16%"><div align="left"></div></td>
                                    <td width="1%"><div align="left"></div></td>
                                    <td width="28%"><div align="left"></div></td>
                                    <td width="13%"><div align="left"></div></td>
                                    <td width="1%"><div align="left"></div></td>
                                    <td width="41%"><div align="left"></div></td>
                                </tr>
                            </table></td>
                    </tr>
                    <tr>
                        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="16%" class="style1"><div align="left">Department </div></td>
                                    <td width="1%"><div align="left"></div></td>
                                    <td width="28%"><div align="left">
                                            <label>
                                                <select style="width: 180px" class="textField" name='countryID' id="countryID"  onchange="showState(this.value)">
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
                                    <td width="13%" class="style1"><div align="left">Doctor </div></td>
                                    <td width="1%"><div align="left"></div></td>
                                    <td width="41%"><div align="left" id="state">
                                            <label>
                                                <select style="width: 100px" class="textField" name='state'>
                                                    <option  value="-1" ></option>
                                                </select>
                                            </label>
                                        </div></td>
                                </tr>
                            </table></td>
                    </tr>
                    <tr>
                        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="16%"><div align="left"></div></td>
                                    <td width="1%"><div align="left"></div></td>
                                    <td width="28%"><div align="left"></div></td>
                                    <td width="13%"><div align="left"></div></td>
                                    <td width="1%"><div align="left"></div></td>
                                    <td width="41%"><div align="left"></div></td>
                                </tr>
                            </table></td>
                    </tr>
              <%--       <tr>
                        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>

                                   <td width="16%" class="style1"><div align="left">Card No  </div></td>
                                    <td width="1%"><div align="left">
                                            <label></label>
                                        </div></td>
                                    <td width="28%"><div align="left">
                                            <label>
                                                <a id="contPopup"  href="javascript:openWin5('Controller?process=PatientProcess&action=viewAllPopUp&patientControllerValue=null&noOfRecords=20&pageno=1&alphabit=null&flag=0',700,300,'propAdd1')"    style="font-size:7pt;" class="anchor" ><input  type="text" name="cardno" id="cardno" style="width: 200px" title="Click here to Select Patient" /></a> <input name="patientID" type="hidden" id="patientID" value="" />
                                            </label>
                                        </div></td>
                                </tr>
                            </table></td>
</tr>--%>
                    <tr>
                        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="16%"><div align="left"><button id="addDossage">Add Medicine</button></div></td>
                                    <td width="1%"><div align="left"></div></td>
                                    <td width="28%"><div align="left"></div></td>
                                    <td width="13%" class="style1" style="display:none"><div align="left">MISC Amount </div></td>
                                    <td width="1%"><div align="left"></div></td>
                                    <td width="41%"><div align="left">
                                            <label>
                                                <input type="hidden" name="miscellanousamount" id="miscellanousamount" value="0" size="10" />
                                            </label>
                                        </div></td>
                                </tr>
                            </table></td>
                    </tr>
                    <tr>
                        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="16%"><div align="left"></div></td>
                                    <td width="1%"><div align="left"></div></td>
                                    <td width="28%"><div align="left">
                                            <label>
                                                <input type="hidden" name="countrynameTxt" id="countrynameTxt" value="null" size="10" />
                                                <input type="hidden" name="statenameTxt" id="statenameTxt" value="null" size="10" />
                                            </label>
                                        </div></td>
                                    <td width="13%"><div align="left"></div></td>
                                    <td width="1%"><div align="left"></div></td>
                                    <td width="41%"><div align="left"></div></td>
                                </tr>
                            </table></td>
                    </tr>

                </tbody>
            </table>
            <table id="dossageTable">
                <tbody></tbody>

            </table>
            <TABLE id="dataTable" width="100%" border="1" >
                <thead>
                    <tr >
                        <td class="headerText" style="width: 3%"><INPUT type="checkbox" id="selectAll"  name="selectAll" onclick="selectAllRow('dataTable')" /></td>
                        <td class="headerText" style="width: 15%">Medicine Name</td>
                        <td class="headerText" style="width: 15%">Batch No</td>
                        <td class="headerText" style="width: 5%">Expiry Date</td>
                        <td class="headerText" style="width: 5%">Quantity</td>
                        <td class="headerText" style="width: 5%">Unit Amount</td>
                        <td class="headerText" style="width: 5%">CGST</td>
                        <td class="headerText" style="width: 5%">SGST</td>
                        <td class="headerText" style="width: 5%">IGST</td>
                        <td class="headerText" style="width: 5%">GST</td>
                        <td class="headerText" style="width: 15%">Amount</td>
                        <td class="headerText" style="width: 15%">Tax</td>
                        <!--     <td class="headerText" style="width: 15%">Medicine ID</td>  -->

                    </tr>
                </thead>
                <tbody>

                </tbody>
                <tfoot >
                    <%--        <tr>


                        <td colspan="7" align="right">Medicine Total&nbsp;&nbsp;</td>
                        <td align="center" style="width: 15%"><input type="text" name="medicineTotalAmount" id="medicineTotalAmount" value="0" readonly /></td>
                    </tr>
                    <tr>

                        <td colspan="7" align="right"><b>Bill Value&nbsp;&nbsp;</b></td>
                        <td align="center" style="width: 15%"><b><input type="text" name="grandTotalAmount" id="grandTotalAmount" value="0" readonly /></b></td>
                    </tr>
                    <tr>

                        <td colspan="7" align="right"><b>Discount(%)</b></td>
                        <td align="center" style="width: 15%"><b><input type="text" name="discountparcent" id="discountparcent" value="0" /></b></td>
                    </tr>
                    <tr>

                        <td colspan="7" align="right"><b>Discount Amount&nbsp;&nbsp;</b></td>
                        <td align="center" style="width: 15%"><b><input type="text" name="discountamount" id="discountamount" value="0"  /></b></td>
                    </tr>
                    <tr>

                        <td colspan="7" align="right"><b>Total Payable&nbsp;&nbsp;</b></td>
                        <td align="center" style="width: 15%"><b><input type="text" name="totalvalue" id="totalvalue" value="0" readonly /></b></td>
                    </tr>  --%>
                    <tr>
                        <td colspan="10" width="66%" height="26" style="border:hidden">&nbsp;</td>
                        <td width="21%" align="right"><b>Medicine Total&nbsp;&nbsp;</b></td>
                        <td align="center" style="width: 15%"><input type="text" name="medicineTotalAmount" id="medicineTotalAmount" value="0" readonly /></td>
                    </tr>
                    <tr>
                        <td colspan="10" height="24" style="border:hidden">&nbsp;</td>
                        <td height="24" align="right"><b>Bill Value&nbsp;&nbsp;</b></td>
                        <td height="24" align="center" style="width: 15%"><b><input type="text" name="grandTotalAmount" id="grandTotalAmount" value="0" readonly /></b></td>
                    </tr>
                    <tr style="display: none;">
                        <td colspan="10" height="24" style="border:hidden">&nbsp;</td>
                        <td height="24" align="right"><b>CGST&nbsp;&nbsp;</b></td>
                        <td height="24" align="center" style="width: 15%"><b><input type="text" name="cgst" id="cgst" value="0"  /></b></td>
                    </tr>
                    <tr style="display: none;">
                        <td colspan="10" height="24" style="border:hidden">&nbsp;</td>
                        <td height="24" align="right"><b>SGST&nbsp;&nbsp;</b></td>
                        <td height="24" align="center" style="width: 15%"><b><input type="text" name="sgst" id="sgst" value="0"  /></b></td>
                    </tr>
                    <tr style="display: none;">
                        <td colspan="10" height="24" style="border:hidden">&nbsp;</td>
                        <td height="24" align="right"><b>IGST&nbsp;&nbsp;</b></td>
                        <td height="24" align="center" style="width: 15%"><b><input type="text" name="igst" id="igst" value="0"  /></b></td>
                    </tr>
                    <tr style="display: none;">
                        <td colspan="10" height="24" style="border:hidden">&nbsp;</td>
                        <td height="24" align="right"><b>GST&nbsp;&nbsp;</b></td>
                        <td height="24" align="center" style="width: 15%"><b><input type="text" name="gst" id="gst" value="0"  /></b></td>
                    </tr>
                    <tr>
                        <td colspan="10" height="24" style="border:hidden">&nbsp;</td>
                        <td height="24" align="right"><b>Total Tax&nbsp;&nbsp;</b></td>
                        <td height="24" align="center" style="width: 15%"><b><input type="text" name="totaltaxvalue" id="totaltaxvalue" value="0"  /></b></td>
                    </tr>
                    <tr>
                        <td colspan="10" height="22" style="border:hidden">&nbsp;</td>
                        <td height="22" align="right"><b>Discount(%)</b></td>
                        <td height="22" align="center" style="width: 15%"><b><input type="text" name="discountparcent" id="discountparcent" value="0" /></b></td>
                    </tr>
                    <tr>
                        <td colspan="10" height="27" style="border:hidden">&nbsp;</td>
                        <td height="27" align="right"><b>Discount Amount(-)&nbsp;</b></td>
                        <td height="27" align="center" style="width: 15%"><b><input type="text" name="discountamount" id="discountamount" value="0"  /></b></td>
                    </tr>
                    <tr>
                        <td colspan="10" height="27" style="border:hidden">&nbsp;</td>
                        <td height="27" align="right"><b>Total Payable&nbsp;&nbsp;</b></td>
                        <td height="27" align="center" style="width: 15%"><b><input type="text" name="totalvalue" id="totalvalue" value="0" readonly /></b></td>
                    </tr>
                </tfoot>

            </TABLE>
            <table id="dataTable" width="100%" border="0">
                <tr>
                    <td >
                        <button id="removeDossage" style="position: left">Remove</button>
                    </td>

                    <td align="right">
                        <button id="save"  onmouseover="validateButton();">Save </button>









                        <!--    <span id="printprop">Print</span> onclick="CallPrint()" -->
                        <%--
 onclick="myFunction()"
<script>
function myFunction() {
    window.print();
}
</script>

                        --%>
                    </td>
                </tr>

            </table>


        </form>

    </body>
</html>
