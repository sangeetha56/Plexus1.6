<%-- 
    Document   : operationbillDetailToAddMore
    Created on : 7 Sep, 2017, 4:31:11 PM
    Author     : Lifecell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import=" java.math.*;" %>
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
            .style5 {
                font-size: 15px;
                font-family: Tahoma;

                color: black;
            }

            .dataText {
                border-radius:3px;
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 12px;
                letter-spacing: normal;
                text-align: center;
                vertical-align: middle;
                background-color: #E3EFFF;

            }


            -->
        </style>
        <script type="text/javascript">
            /**
             * Comment
             *
             */


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


            });


        </script>

        <script>
        $(function() {

            $(document).ready(function() {
                $("#operationbilldate").val(getCurrentDate());
                $("#operationbilldate").datepicker();
            });
        });

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


        </script>

        <script>
        function showProductCatOptn(opt)
        {
            // var a=document.getElementById("optContryID");
            // document.getElementById("countrynameTxt").value=a.innerHTML;
            // document.getElementById("investigationnamebill").value=opt;
            var x = document.getElementById("doctid").selectedIndex;
            var y = document.getElementById("doctid").options;

            document.getElementById("operationnamebill").value=y[x].text;
            document.getElementById("operationcharges").value=opt;




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

        <script language="Javascript">
        function validateButton()
        {
            if( document.getElementById("patientName").value.length==0 )

            {
                document.getElementById("patientName").style.background='red';

                alert("Enter the Patient  name");

            }

            /*      else if( document.getElementById("investigationnamebill").value.length==0 )

                {
                    document.getElementById("investigationnamebill").style.background='red';

                    alert("Please Select the Investigation Type  ");

                }

                else if( document.getElementById("investigationcharges").value.length==0 )

                {
                    document.getElementById("investigationcharges").style.background='';

                    alert("Please Enter the Investigation Charge  ");

                }   */



        }
        </script>

        <script language="Javascript">


        function valueExistsChangeColor()
        {
            if( document.getElementById("patientName").value.length!=0)

            {
                document.getElementById("patientName").style.background='white';

            }



            /*      else if( document.getElementById("investigationcharges").value.length!=0)

                {
                    document.getElementById("investigationcharges").style.background='white';

                }  */


        }
        </script>

        <script type="text/javascript">
        $(function() {


            $( "#save" )
            .button()
            .click(function() {
                addOperationBillChild();


            });
            $( "#reset" )
            .button()
            .click(function() {
            });

        });


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

                $( "#adjustAdvance" )
                .button()
                .click(function() {
                    //alert('hhhh');
                    adjustAdvanceBill();

                });



            });

             function adjustAdvanceBill()
             {
                 //alert('hiii');
                 document.getElementById("advancebillshow").style.display="";
                 document.getElementById("hospitaltopay").style.display="";
                 var totalbill=document.getElementById("totalvalue").value;
                 var advanceamount=document.getElementById("advancedreceived").value;
                 var patpayed=document.getElementById("receivedamount").value;
                 var finalsattlement=0;
                 //alert('toatl bill:-'+totalbill);
                 //alert('toatl advance-'+advanceamount);
                // alert('toatl receivedamount-'+patpayed);
                 //var tot=parseInt(patpayed)+parseInt(totalbill);
                // alert('toatl tot-'+tot);

                 finalsattlement=parseInt(totalbill)-parseInt(advanceamount)-parseInt(patpayed);

                 //alert('toatl finalsattlement-'+finalsattlement);
                 document.getElementById("totalduevalue").value=finalsattlement;
                 
                 if(finalsattlement<0)
                     {
                         var finalvalue=finalsattlement*-1;
                        document.getElementById("hoapitaltopayamount").value=finalvalue; 
                     }


                 //calculateGrandTotal();

             }



        </script>

        <script type="text/javascript">
        /**
         * Comment  to clculate grand total ammount
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



            $("#dataTable").keyup(function(){
                // var consultation=parseFloat($("#consultationamount").val());
                //var miscellanous=parseFloat($("#miscellanousamount").val());
                var discount=parseFloat($("#discountparcent").val());
                var advancedreceived=parseFloat($("#advancedreceived").val());
                var receivedamount=parseFloat($("#receivedamount").val());
                var previousdue=parseFloat($("#previousdue").val());


                var sum = 0.0;
                var taxsum = 0.0;
                var totalSum=0.0;
                var totalvalueafterdiscount=0.0;
                var discountedamount=0.0;
                var totalpayafteradvanced=0.0;
                var totaldue=0.0;
                var column2 = $('.medicineAmount')
                jQuery.each(column2,function(){
                    sum += parseFloat($(this).val());
                });


                totalSum=sum;//totalSum=sum+miscellanous+consultation;
                totalpayafteradvanced=sum+previousdue;
                discountedamount=(totalpayafteradvanced*discount/100);
                //totaltax=(totalSum*cgst/100)+(totalSum*sgst/100)+(totalSum*igst/100);

                //alert('total tax value value:-'+totaltax);
                //alert('discount value:-'+discount);
                //gst=cgst+sgst+igst;
                totalvalueafterdiscount=totalpayafteradvanced-discountedamount+taxsum;
                totaldue=totalvalueafterdiscount-receivedamount;
                $('#medicineTotalAmount').val(sum.toPrecision(6));
                $('#grandTotalAmount').val(totalSum.toPrecision(6));
                $('#discountamount').val(discountedamount.toPrecision(6));
                $('#totalvalue').val(totalvalueafterdiscount.toPrecision(6));
                $('#totaltaxvalue').val(taxsum.toPrecision(6));
                $('#totalamounttopay').val(totalpayafteradvanced.toPrecision(6));
                $('#totalduevalue').val(totaldue.toPrecision(6));
                //$('#gst').val(gst);
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





        var operatig=[
            <c:forEach varStatus="status" items="${operationList}" var="operate">{
                value:'<c:out default="0" value="${operate.operationtype}" />',
                price:'<c:out default="0" value="${operate.operationtypecharge}" />',
                id:'<c:out default="0" value="${operate.operationtypeid}" />'



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
            //var final1=document.getElementById("hiddenMedicine_amount_"+value2);
            // final1.value=(final1).toPrecision(6);




        }
        function addRow() {
            //alert('kk-1');
            var rowCount = document.getElementById('dataTable').rows.length;
            var col1="<td class='dataText' width='4%' ><input type='checkbox' class = 'chcktbl' id=medicine_"+rowCount+" /><input type='hidden' class='medicineId' name='operatigIDS' id=medicine_id_"+rowCount+" value='' /></td>";
            var col2="<td class='dataText' width='31%'><input class='medicineName' type='text' name='operatigNames' id=medicine_name_"+rowCount+" size='30' /></td>";
            var col3="<td class='dataText' width='18%'><input class='medicineAmount' type='text' value='0'  name='operatigchargeindis' id=hiddenMedicine_amount_"+rowCount+" size='10'/></td>";
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
                    source: operatig,
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


                        // calculate(rowCount);

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



        <script src="js/print/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script src="js/print/jquery.printPage.js" type="text/javascript"></script>
        <link rel="stylesheet" href="css/datePicker/jquery-ui-1.8.18.custom.css">
        <link rel="stylesheet" href="css/datePicker/demos.css">

        <script src="js/print/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery-ui-1.8.17.custom.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.datepicker.js"></script>
        <script src="js/print/jquery.printPage.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.button.js"></script>


        <title>.....</title>
        <script type="text/javascript">
    $(function() {
        $( "#print" )
        .button()
        .click(function() {
            //alert('hhhh');
            //CallPrint();

        });

    });
        </script>
        <script type="text/javascript">
    $(function() {

        $( "#printprop" )
        .button()
        .click(function() {

        });



    });



        </script>


        <script language="javascript" type="text/javascript">

    function CallPrint()
    {

        //alert('gdfgdf');
        //window.print();

        //Get the HTML of div
        var divElements = document.getElementById('printData').innerHTML;
        //Get the HTML of whole page
        var oldPage = document.body.innerHTML;

        //Reset the page's HTML with div's HTML only
        document.body.innerHTML =
            "<html><head><title></title></head><body>" +
            divElements + "</body>";

        //Print Page
        window.print();

        //Restore orignal HTML
        document.body.innerHTML = oldPage;


        /*
var DocumentContainer = document.getElementById('printData');
var WindowObject = window.open('', 'PrintWindow', 'width=750,height=650,top=50,left=50,toolbars=no,scrollbars=yes,status=no,resizable=yes');
var strHtml = "<html>\n<head>\n <link rel=\"stylesheet\" type=\"text/css\" href=\"test.css\">\n</head><body><div style=\"testStyle\">\n"
+ DocumentContainer.innerHTML + "\n</div>\n</body>\n</html>";
WindowObject.document.writeln(strHtml);
WindowObject.document.close();
WindowObject.focus();
WindowObject.print();
WindowObject.close();
         */

    }

    function CallPrintFunction()
    {
        alert('CallPrintFunction');

        document.getElementById("hide1").style.display='';

        CallPrint();
    }
        </script>
        <script >
    function backButtton1()
    {

        window.history.back();

    }
        </script>

    </head>
    <body>
        <form id="form1"  action="" method="POST" >



            <table width="100%">
                <tr>
                    <td height="32" background="images/header-bg.png" style="background-repeat:repeat-x"><img src="images/back1.png" style="cursor: pointer" title="click to close" onclick="backButtton1()" /></td>


                </tr>
            </table>
            <div id="printData">
                <table  width="100%">
                    <thead>
                        <tr  >

                            <td colspan="3" class="headerText" style="color:#000">Hospitality Bill Charges Details </td>


                        </tr>
                        <tr  >

                            <td colspan="3" class="headerText" style="color:#000">Patient Details</td>


                        </tr>

                    </thead>
                    <tbody>
                        <tr><td class="dataText" style="width: 45%">Invoice No: <c:out value="${operationbill.operationbillid}"/></td></tr>

                        <tr>
                            <td class="dataText" style="width: 45%">Patient Name: <c:out value="${operationbill.patient.name}" /></td>
                            <td class="dataText" style="width: 20%">Contact No:  <c:out value="${operationbill.patient.telephoneno}" /></td>
                            <td class="dataText">Visit Date: <fmt:formatDate pattern="dd MMMM yyyy " value="${operationbill.operationbilldate}" /> </td>

                        </tr>


                        <tr>
                            <td class="dataText" style="width: 45%">Card No: <c:out value="${operationbill.patient.cardno}" /></td>
                            <td class="dataText" style="width: 30%">Doctor: <c:out value="${operationbill.doctorinfo.doctname}"/></td><!-- dispense.dispensedmedicinebills.doctordepartment -->
                            <td class="dataText">Department :  <c:out value="${operationbill.doctorinfo.departmentname.dptname}"/></td>

                        </tr>



                    </tbody>
                </table>
                <table width="100%">
                    <thead>
                        <tr style="display: none" >

                            <td  class="headerText">Operation Bill Charges Details</td>


                        </tr>

                    </thead>

                </table>
                <TABLE id="" width="100%" border="1" >
                    <thead>
                        <tr >

                            <td class="headerText" style="color:#000">Sl No</td>
                            <td class="headerText" style="color:#000">Bill Type</td>
                            <td class="headerText" style="color:#000">Bill Charges</td>
                            <td class="headerText" style="color:#000">Amount</td>

                        </tr>
                    </thead>
                    <tbody>
                        <%
                                    int i = 1;
                        %>

                        <c:forEach items="${operationbill.detailsoperationbills}" var="operat">

                            <tr>
                                <td class="dataText" align="center"><%=i%></td>

                                <td class="dataText" align="center"><c:out value="${operat.operationtype.operationtype}" /></td>
                                <td class="dataText" align="center"><c:out value="${operat.detailsoperationbillcharges}" /></td>
                                <td class="dataText" align="center"><c:out value="${operat.detailsoperationbillcharges}" /></td>


                            </tr>
                            <%
                                        i++;
                            %>
                        </c:forEach>



                    </tbody>
                    <tfoot>

                        <c:if test = "${operationbill.operationbillcharges > 0}">
                            <tr>

                                <td></td>

                                <td class="dataTextLeft" colspan="2" align="right">Total</td>
                                <td class="dataText" align="center"><c:out value="${operationbill.operationbillcharges}" /></td>
                            </tr>
                        </c:if>


                        <tr>
                            <td></td>
                            <td class="dataTextLeft" colspan="2" align="right">Advance Received</td>
                            <td class="dataText" align="center"><c:out value="${operationbill.advance}" /></td>
                        </tr>

                        <c:if test = "${operationbill.topay > 0}">
                            <tr>
                            <td></td>
                            <td class="dataTextLeft" colspan="2" align="right">To Pay</td>
                            <td class="dataText" align="center"><c:out value="${operationbill.topay}" /></td>
                        </tr>
                        </c:if>
                        

                        <c:if test = "${operationbill.discountparcentage > 0}">
                           <tr>
                            <td></td>
                            <td class="dataTextLeft" colspan="2" align="right">Discount(%)</td>
                            <td class="dataText" align="center"><c:out value="${operationbill.discountparcentage}" /></td>
                        </tr>
                        </c:if>

                        <c:if test = "${operationbill.discountamount > 0}">
                          <tr>
                            <td></td>
                            <td class="dataTextLeft" colspan="2" align="right">Discount Amount(-)</td>
                            <td class="dataText" align="center"><c:out value="${operationbill.discountamount}" /></td>
                        </tr>
                        </c:if>
                        

                        <c:if test = "${operationbill.totalpayable > 0}">
                          <tr>
                            <td></td>
                            <td class="dataTextLeft" colspan="2" align="right">Total Payable</td>
                            <td class="dataText" align="center"><c:out value="${operationbill.totalpayable}" /></td>
                        </tr>
                        </c:if>

                        <c:if test = "${operationbill.receivedamount > 0}">
                          <tr>
                            <td></td>
                            <td class="dataTextLeft" colspan="2" align="right">Amount Received </td>
                            <td class="dataText" align="center"><c:out value="${operationbill.receivedamount}" /></td>
                        </tr>
                        </c:if>

                   <%--     <c:if test = "${operationbill.totaldue > 0}">
                          <tr>
                            <td></td>
                            <td class="dataTextLeft" colspan="2" align="right">Total Due</td>
                            <td class="dataText" align="center"><c:out value="${operationbill.totaldue}" /></td>
                        </tr>

                        </c:if>
--%>
                        


                        


                        

                        

                        

                        <tr id="hide1" style="display: none">
                            <td colspan="6"  align="center"  height="15px" valign="middle" align="center" style="font-family:verdana; font-weight:bold; font-size:10px; background-image:url(images/bar2.jpg); color:#FFFFCC">©Powered By Jeevan Jyoti Hospital</td>


                        </tr>



                    </tfoot>
                </TABLE>


                <c:forEach items="${operationbill.operationbillchilds}" var="operationchild">
                    <table width="100%">
                        <thead>
                            <tr style="display: none" >

                                <td  class="headerText">Operation Bill Charges Details</td>


                            </tr>

                        </thead>

                    </table>


                    <table  width="100%">
                        <thead>
                            <tr  >

                                <td colspan="3" class="headerText" style="color:#000">Hospitality Bill Charges Details </td>


                            </tr>
                            <tr  >

                                <td colspan="3" class="headerText" style="color:#000">Patient Details</td>


                            </tr>

                        </thead>
                        <tbody>
                            <tr><td class="dataText" style="width: 45%">Invoice No: <c:out value="${operationbill.operationbillid}"/></td></tr>

                            <tr>
                                <td class="dataText" style="width: 45%">Patient Name: <c:out value="${operationbill.patient.name}" /></td>
                                <td class="dataText" style="width: 20%">Contact No:  <c:out value="${operationbill.patient.telephoneno}" /></td>
                                <td class="dataText">Visit Date: <fmt:formatDate pattern="dd MMMM yyyy " value="${operationchild.operationbilldatechild}" /> </td>

                            </tr>


                            <tr>
                                <td class="dataText" style="width: 45%">Card No: <c:out value="${operationbill.patient.cardno}" /></td>
                                <td class="dataText" style="width: 30%">Doctor: <c:out value="${operationbill.doctorinfo.doctname}"/></td><!-- dispense.dispensedmedicinebills.doctordepartment -->
                                <td class="dataText">Department :  <c:out value="${operationbill.doctorinfo.departmentname.dptname}"/></td>

                            </tr>



                        </tbody>
                    </table>



                    <TABLE id="" width="100%" border="1" >
                        <thead>
                            <tr >

                                <td class="headerText" style="color:#000">Sl No</td>
                                <td class="headerText" style="color:#000">Bill Type</td>
                                <td class="headerText" style="color:#000">Bill Charges</td>
                                <td class="headerText" style="color:#000">Amount</td>

                            </tr>
                        </thead>
                        <tbody>
                            <%
                                        int j = 1;
                            %>

                            <c:forEach items="${operationchild.detailsoperationbillchilds}" var="detailschild">

                                <tr>
                                    <td class="dataText" align="center"><%=j%></td>
                                    <td class="dataText" align="center"><c:out value="${detailschild.operationtype.operationtype}" /></td>
                                    <td class="dataText" align="center"><c:out value="${detailschild.detailsoperationbillchargeschild}" /></td>
                                    <td class="dataText" align="center"><c:out value="${detailschild.detailsoperationbillchargeschild}" /></td>


                                </tr>
                                <%
                                            j++;
                                %>
                            </c:forEach>



                        </tbody>
                        <tfoot>

                            <tr>

                                <td></td>

                                <td class="dataTextLeft" colspan="2" align="right">Total</td>
                                <td class="dataText" align="center"><c:out value="${operationchild.operationbillchargeschild}" /></td>
                            </tr>

                            <tr>
                                <td></td>
                                <td class="dataTextLeft" colspan="2" align="right">Advance Received</td>
                                <td class="dataText" align="center"><c:out value="${operationchild.advancechild}" /></td>
                            </tr>

                            <tr>
                                <td></td>
                                <td class="dataTextLeft" colspan="2" align="right">To Pay</td>
                                <td class="dataText" align="center"><c:out value="${operationchild.topaychild}" /></td>
                            </tr>

                            <tr>
                                <td></td>
                                <td class="dataTextLeft" colspan="2" align="right">Discount(%)</td>
                                <td class="dataText" align="center"><c:out value="${operationchild.discountparcentagechild}" /></td>
                            </tr>



                            <tr>
                                <td></td>
                                <td class="dataTextLeft" colspan="2" align="right">Discount Amount(-)</td>
                                <td class="dataText" align="center"><c:out value="${operationchild.discountamountchild}" /></td>
                            </tr>


                            <tr>
                                <td></td>
                                <td class="dataTextLeft" colspan="2" align="right">Total Payable</td>
                                <td class="dataText" align="center"><c:out value="${operationchild.totalpayablechild}" /></td>
                            </tr>

                            <tr>
                                <td></td>
                                <td class="dataTextLeft" colspan="2" align="right">Amount Received </td>
                                <td class="dataText" align="center"><c:out value="${operationchild.receivedamountchild}" /></td>
                            </tr>

                            <tr>
                                <td></td>
                                <td class="dataTextLeft" colspan="2" align="right">Total Due</td>
                                <td class="dataText" align="center"><c:out value="${operationchild.totalduechild}" /></td>
                            </tr>

                            <c:if test = "${operationchild.totalduechild < 0}">
                            <tr>
                                <td></td>
                                <td class="dataTextLeft" colspan="2" align="right">Hospital to Pay</td>
                                <c:set var="returnpay" value="${operationchild.totalduechild}"/>
                                <%

                                            BigDecimal operationtemp = (BigDecimal) pageContext.getAttribute("returnpay");
                                            System.out.println("operation in sales-" + operationtemp);
                                            operationtemp=operationtemp.multiply(new BigDecimal(-1));
                                            


                                %>
                                <td class="dataText" align="center"><%=operationtemp%></td>
                            </tr>
                            </c:if>





                            <tr id="hide1" style="display: none">
                                <td colspan="6"  align="center"  height="15px" valign="middle" align="center" style="font-family:verdana; font-weight:bold; font-size:10px; background-image:url(images/bar2.jpg); color:#FFFFCC">©Powered By Jeevan Jyoti Hospital</td>


                            </tr>



                        </tfoot>
                    </TABLE>
                </c:forEach>

            </div>
            <table id="" width="100%" border="0">
                <tr>
                    <td align="center" >
                        <%--  <a id="print" href="Controller?process=BillProcess&action=printConsultationCharge&id=<c:out value="${bill.id}"/>">Print</a>
                        --%>
                        <!--<input id="sub" type="submit" value="Print"  /> -->
                        <input type="button" id="print" value="Print" onclick="CallPrintFunction();" />
                    </td>


                </tr>

            </table>

            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="headerTD"><img align="left" src="images/back1.png" style="cursor: pointer" title="click to close" onclick="backButtton1()" />New Operation Bill</td>
                </tr>

            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" >
                <tr>
                    <td width="20%" ><div align="left">&nbsp;</div></td>
                    <td width="1%" ><div align="left">&nbsp;</div></td>
                    <td width="29%" ><div align="left">&nbsp;</div></td>
                    <td width="23%" ><div align="left">&nbsp;</div></td>
                    <td width="1%" ><div align="left">&nbsp;</div></td>
                    <td width="26%" ><div align="left">&nbsp;</div></td>
                </tr>
                <tr>
                    <td height="28"><div align="right" class="style5">Patient Name</div></td>
                    <td><div align="right" class="style5">:</div></td>
                    <td><div align="left">
                            <label>
                                <input  type="text" name="patientName" id="patientName" value="<c:out value="${operationbill.patient.name}" />" style="width: 200px"  /><input  type="hidden" name="operationbillid" id="operationbillid" value="<c:out value="${operationbill.operationbillid}"/>" style="width: 200px"  />
                            </label>
                        </div></td>
                    <td><div align="right" class="style5">Bill Date</div></td>
                    <td><div align="right" class="style5">:</div></td>
                    <td><div align="left">
                            <label>
                                <input type="text" name="operationbilldate" id="operationbilldate" style="width: 100px" />
                            </label>
                        </div></td>
                </tr>

                <tr>
                    <td><div align="left">
                            <div align="left">&nbsp;</div>
                        </div></td>
                    <td><div align="left">&nbsp;</div></td>
                    <td><div align="left">&nbsp;</div></td>
                    <td><div align="left">&nbsp;</div></td>
                    <td><div align="left">&nbsp;</div></td>
                    <td><div align="left">&nbsp;</div></td>
                </tr>
                <tr>
                    <td>
                        <div align="right" class="style5">Department</div>
                    </td>
                    <td><div align="right" class="style5">:</div></td>
                    <td><div align="left">
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
                    <td><div align="right" class="style5">Doctor</div></td>
                    <td><div align="right" class="style5">:</div></td>
                    <td><div align="left" id="state">

                            <label>
                                <select style="width: 100px" class="textField" name='state'>
                                    <option  value="-1" ></option>
                                </select>
                            </label>

                        </div></td>
                </tr>
                <tr >
                    <td height="21"><div align="left" style="border-bottom:solid thin">&nbsp;</div></td>
                    <td><div align="left" style="border-bottom:solid thin">&nbsp;</div></td>
                    <td><div align="left" style="border-bottom:solid thin">&nbsp;</div></td>
                    <td><div align="left" style="border-bottom:solid thin">&nbsp;</div></td>
                    <td><div align="left" style="border-bottom:solid thin">&nbsp;</div></td>
                    <td><div align="left" style="border-bottom:solid thin">&nbsp;</div></td>
                </tr>
            </table>

            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="16%"><div align="left"><button id="addDossage">Add Bill</button></div></td>
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
                        <td class="headerText" width="60%">Bill Type&nbsp;</td>
                        <td class="headerText" width="36%">Bill Charges&nbsp;</td>

                        <!--     <td class="headerText" style="width: 5%">VAT</td>
                            <td class="headerText" style="width: 15%">Amount</td>
                                <td class="headerText" style="width: 15%">Medicine ID</td>  -->

                    </tr>
                </thead>
                <tbody>

                </tbody>
                <tfoot >
                    <%--   <tr>
                           <td colspan="1" width="4%" height="26" style="border:hidden">&nbsp;</td>
                           <td width="60%" align="right"><b>Bed Charge&nbsp;&nbsp;</b></td>
                           <td align="center"  width="36%"><input type="text" name="bedcharge" id="bedcharge" value="0" readonly /></td>
                       </tr>
                       <tr>
                           <td colspan="1" height="24" style="border:hidden">&nbsp;</td>
                           <td height="24" align="right"><b>Treatment Charge&nbsp;&nbsp;</b></td>
                           <td height="24" align="center" style="width: 15%"><b><input type="text" name="treatmentcharge" id="treatmentcharge" value="0" readonly /></b></td>
                       </tr>

                    <tr>
                        <td colspan="1" width="4%" height="26" style="border:hidden">&nbsp;</td>
                        <td width="60%" align="right"><b>Recovery Charge&nbsp;&nbsp;</b></td>
                        <td align="center"  width="36%"><input type="text" name="recoverycharge" id="recoverycharge" value="0" readonly /></td>
                    </tr>
                    <tr>
                        <td colspan="1" height="24" style="border:hidden">&nbsp;</td>
                        <td height="24" align="right"><b>Operation Charge&nbsp;&nbsp;</b></td>
                        <td height="24" align="center" style="width: 15%"><b><input type="text" name="operationcharge" id="operationcharge" value="0" readonly /></b></td>
                    </tr>  --%>

                    <tr>
                        <td colspan="1" height="24" style="border:hidden">&nbsp;</td>
                        <td height="24" align="right"><b>Total Bill Value&nbsp;&nbsp;</b></td>
                        <td height="24" align="center" style="width: 15%"><b><input type="text" name="grandTotalAmount" id="grandTotalAmount" value="0" readonly /></b></td>
                    </tr>

                
                     <tr id="advancebillshow" style="display: none;">
                        <td colspan="1" height="24" style="border:hidden">&nbsp;</td>
                        <td height="24" align="right"><b>Advance Received&nbsp;&nbsp;</b></td>
                        <td height="24" align="center" style="width: 15%"><b><input type="text" name="advancedreceived" id="advancedreceived" value="<c:out value="${operationbill.advance}" />"  /></b></td>
                    </tr>
               
                   

                    <tr >
                        <td colspan="1" height="24" style="border:hidden">&nbsp;</td>
                        <td height="24" align="right"><b>Previous Due&nbsp;&nbsp;</b></td>
                        <td height="24" align="center" style="width: 15%"><b><input type="text" name="previousdue" id="previousdue" value="<c:out value="${previousdue}" />"  /></b></td>
                    </tr>

                    <tr>
                        <td colspan="1" height="24" style="border:hidden">&nbsp;</td>
                        <td height="24" align="right"><b>To Pay&nbsp;&nbsp;</b></td>
                        <td height="24" align="center" style="width: 15%"><b><input type="text" name="totalamounttopay" id="totalamounttopay" value="0" readonly /></b></td>
                    </tr>

                    <tr>
                        <td colspan="1" height="22" style="border:hidden">&nbsp;</td>
                        <td height="22" align="right"><b>Discount(%)</b></td>
                        <td height="22" align="center" style="width: 15%"><b><input type="text" name="discountparcent" id="discountparcent" value="0" /></b></td>
                    </tr>
                    <tr>
                        <td colspan="1" height="27" style="border:hidden">&nbsp;</td>
                        <td height="27" align="right"><b>Discount Amount(-)&nbsp;</b></td>
                        <td height="27" align="center" style="width: 15%"><b><input type="text" name="discountamount" id="discountamount" value="0"  /></b></td>
                    </tr>
                    <tr>
                        <td colspan="1" height="27" style="border:hidden">&nbsp;</td>
                        <td height="27" align="right"><b>Total Payable&nbsp;&nbsp;</b></td>
                        <td height="27" align="center" style="width: 15%"><b><input type="text" name="totalvalue" id="totalvalue" value="0" readonly /></b></td>
                    </tr>

                    <tr>
                        <td colspan="1" height="27" style="border:hidden">&nbsp;</td>
                        <td height="27" align="right"><b>Amount Received &nbsp;&nbsp;</b></td>
                        <td height="27" align="center" style="width: 15%"><b><input type="text" name="receivedamount" id="receivedamount"  value="0"  /></b></td><!-- onmouseout="adjustAdvanceBill()" -->
                    </tr>

                    <tr>
                        <td colspan="1" height="27" style="border:hidden">&nbsp;</td>
                        <td height="27" align="right"><b>Total Due&nbsp;&nbsp;</b></td>
                        <td height="27" align="center" style="width: 15%"><b><input type="text" name="totalduevalue" id="totalduevalue" value="0" readonly /></b></td>
                    </tr>

                    <tr id="hospitaltopay" style="display: none;">
                        <td colspan="1" height="24" style="border:hidden">&nbsp;</td>
                        <td height="24" align="right"><b>Hospital To pay&nbsp;&nbsp;</b></td>
                        <td height="24" align="center" style="width: 15%"><b><input type="text" name="hoapitaltopayamount" id="hoapitaltopayamount"   /></b></td>
                    </tr>

                    <tr>
                        <td colspan="1" height="27" style="border:hidden">&nbsp;</td>
                        <td height="27" align="right"><b>&nbsp;</b></td>
                        <td height="27" align="center" style="width: 15%"><b><span id="adjustAdvance" style="position: left">Adjust Advance</span></b></td>
                    </tr>

                </tfoot>

            </TABLE>
            <table id="dataTable" width="100%" border="0">
                <tr>
                    <td >
                        <button id="removeDossage" style="position: left">Remove</button>
                    </td>


                </tr>

            </table>

            <%--     <table width="100%" border="0"  style="border-color:#4b6a84;" id="myTable">
                     <thead>
                         <tr >
                             <th  width="28%" >&nbsp;&nbsp;</th>
                             <th class="headerText" width="4%" ><input  type="checkbox" id = "chckHead" />&nbsp;</th>
                             <th class="headerText" width="31%">Investigation Type&nbsp;</th>
                             <th class="headerText" width="18%">Investigation Charges&nbsp;</th>
                             <th  width="13%">&nbsp;</th>
                             <th  width="6%">&nbsp;</th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${InvestigationList}" var="invest">

                        <tr class="trClass" style="border-color:#000000" border="1"  cellpadding="1"  cellspacing="1">
                            <td  width="28%">&nbsp;</td>
                            <td  class="dataText" width="4%"><input type="checkbox" id = "<c:out value="${invest.investigationid}"/>" class = "chcktbl"  name="personalIDs"  value="<c:out value="${invest.investigationid}"/>"/></td> <!-- onclick="kkkk()"  -->
                            <td  class="dataText" width="31%"><c:out value="${invest.investigationtype}"/></td>
                            <td  class="dataText" width="18%"><input type="text"  id = "therapychargesdiff"  name="therapychargesdiff" class = "chcktbl"   value="<c:out value="${invest.investigationcharge}"/>"/></td>
                            <td  width="13%">&nbsp;</td>
                            <td  width="6%">&nbsp;</td>
                        </tr>
                    </c:forEach>

                </tbody>

            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="36%" ><div>&nbsp;</div></td>
                    <td width="1%"><div>&nbsp;</div></td>
                    <td width="39%"><div>&nbsp;</div></td>
                    <td width="24%"><div>&nbsp;</div></td>
                </tr>
                <tr style="display: none">
                    <td><div align="right" class="style5">Investigation Type</div></td>
                    <td><div align="right" class="style5">:</div></td>
                    <td><div class="style5">
                            <label>
                                <select style="width: 180px" name="doctid" id="doctid"  class="style7">
                                    <option  value="none">Select</option>
                                    <%
                                                Class.forName("org.postgresql.Driver").newInstance();
                                                con = DriverManager.getConnection("jdbc:postgresql://localhost:5433/plexus_version1", "postgres", "plexus");

                                                stmt = con.createStatement();
                                                rs = stmt.executeQuery("Select * from investigation");
                                                while (rs.next()) {
                                    %>
                                    <option  onclick="showProductCatOptn(this.label,this.value)"  label="<%=rs.getString(3)%>" value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>

                                    <%
                                                }
                                    %>
                                </select>
                                <br/>
                                <input  type="text" id="investigationnamebill" name="investigationnamebill"/><!-- style="display: none" -->

                            </label>
                        </div></td>
                    <td><div>&nbsp;</div></td>
                </tr>
                <tr>
                    <td><div>&nbsp;</div></td>
                    <td><div>&nbsp;</div></td>
                    <td><div>&nbsp;</div></td>
                    <td><div>&nbsp;</div></td>
                </tr>
                <tr style="display: none">
                    <td><div align="right" class="style5">Investigation charges</div></td>
                    <td><div align="right" class="style5">:</div></td>
                    <td><div>
                            <input onkeypress="valueExistsChangeColor()" type="text" name="investigationcharges" id="investigationcharges" style="width: 180px" />
                        </div></td>
                    <td><div>&nbsp;</div></td>
                </tr>
                <tr>
                    <td><div>&nbsp;</div></td>
                    <td><div>&nbsp;</div></td>
                    <td><div>&nbsp;</div></td>
                    <td><div>&nbsp;</div></td>
                </tr>
                <tr>
                    <td><div align="right" class="style5">Remarks</div></td>
                    <td><div align="right" class="style5">:</div></td>
                    <td><div>
                            <textarea name="investigationremarks" cols="30" rows="5"  id="investigationremarks"></textarea>
                        </div></td>
                    <td><div>&nbsp;</div></td>
                </tr>
                <tr>
                    <td><div>&nbsp;</div></td>
                    <td><div>&nbsp;</div></td>
                    <td><div>&nbsp;</div></td>
                    <td><div>&nbsp;</div></td>
                </tr>
                <tr>
                    <td><div>&nbsp;</div></td>
                    <td><div>&nbsp;</div></td>
                    <td><div>&nbsp;</div></td>
                    <td><div>&nbsp;</div></td>
                </tr>
            </table>    --%>
            <table id="table2" width="100%" border="0" align="center"  >

                <tr>
                    <td align="center">
                        <button id="save" onmouseover="validateButton();">Save</button>
                        <button id="reset" type="reset" >Cancel</button>

                    </td>
                </tr>


            </table>

        </form>

        <script type="text/javascript">

    function addOperationBillChild(){
        //alert('Hi for adding');
        var form1=document.getElementById("form1");
        form1.action="Controller?process=OperationBillProcess&action=addOperationBillChild";
        form1.submit();
    }

        </script>

    </body>
</html>

