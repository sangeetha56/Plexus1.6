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
                $("#advancebilldate").val(getCurrentDate());
                $("#advancebilldate").datepicker();
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

            document.getElementById("investigationnamebill").value=y[x].text;
            document.getElementById("investigationcharges").value=opt;




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
                addAdvanceBill();


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





<%--    var investig=[
            <c:forEach varStatus="status" items="${InvestigationList}" var="investigate">{
                value:'<c:out default="0" value="${investigate.investigationtype}" />',
                price:'<c:out default="0" value="${investigate.investigationcharge}" />',
                id:'<c:out default="0" value="${investigate.investigationid}" />'



            }<c:if test="${!status.last}">,</c:if>
            </c:forEach>
];--%>

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
            var col1="<td class='dataText' width='4%' ><input type='checkbox' class = 'chcktbl' id=medicine_"+rowCount+" /><input type='hidden' class='medicineId' name='investigIDS' id=medicine_id_"+rowCount+" value='' /></td>";
            var col2="<td class='dataText' width='31%'><input class='medicineName' type='text' name='investigNames' id=medicine_name_"+rowCount+" size='30' /></td>";
            var col3="<td class='dataText' width='18%'><input type='text' value='0'  name='investigchargeindis' id=hiddenMedicine_amount_"+rowCount+" size='10'/></td>";
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
                    source: investig,
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
        <form id="form1"  action="" method="POST" >

            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="headerTD"><img align="left" src="images/back1.png" style="cursor: pointer" title="click to close" onclick="backButtton1()" />New Investigation Bill</td>
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
                                <a id="contPopup"  href="javascript:openWin5('Controller?process=PatientProcess&action=viewAllPopUp&patientControllerValue=null&noOfRecords=20&pageno=1&alphabit=null&flag=0',700,300,'propAdd1')"    style="font-size:7pt;" class="anchor" ><input  type="text" name="patientName" id="patientName" style="width: 200px" title="Click here to Select Patient" /></a> <input name="patientID" type="hidden" id="patientID" value="" />
                            </label>
                        </div></td>
                    <td><div align="right" class="style5">Advance Bill Date</div></td>
                    <td><div align="right" class="style5">:</div></td>
                    <td><div align="left">
                            <label>
                                <input type="text" name="advancebilldate" id="advancebilldate" style="width: 100px" />
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
                    <td height="21"><div align="left" >&nbsp;</div></td>
                    <td><div align="left">&nbsp;</div></td>
                    <td><div align="left">&nbsp;</div></td>
                    <td><div align="left">&nbsp;</div></td>
                    <td><div align="left">&nbsp;</div></td>
                    <td><div align="left">&nbsp;</div></td>
                </tr>
                
                
                
                 <tr>
                    <td>
                        <div align="right" class="style5">Advance</div>
                    </td>
                    <td><div align="right" class="style5">:</div></td>
                    <td><div align="left">
                           <label>
                                <input type="text" name="advanceamount" id="advanceamount" style="width: 100px" />
                            </label>

                        </div></td>
                    <td><div align="right" class="style5">Total Amount</div></td>
                    <td><div align="right" class="style5">:</div></td>
                    <td><div align="left" id="state">

                           <label>
                                <input type="text" name="totalbill" id="totalbill" style="width: 100px" />
                            </label>

                        </div></td>
                </tr>
                <tr >
                     <td height="21"><div align="left" >&nbsp;</div></td>
                    <td><div align="left">&nbsp;</div></td>
                    <td><div align="left">&nbsp;</div></td>
                    <td><div align="left">&nbsp;</div></td>
                    <td><div align="left">&nbsp;</div></td>
                    <td><div align="left">&nbsp;</div></td>
                </tr>
 <tr>
                    <td>
                        <div align="right" class="style5">Balance Amount</div>
                    </td>
                    <td><div align="right" class="style5">:</div></td>
                    <td><div align="left">
                           <label>
                                <input type="text" name="paid" id="paid" style="width: 100px" />
                            </label>

                        </div></td>
 </tr>
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

        <script type="text/javascript">

    function addAdvanceBill(){
        //alert('Hi for adding');
        var form1=document.getElementById("form1");
        form1.action="Controller?process=AdvanceProcess&action=add";
        form1.submit();
    }

        </script>

    </body>
</html>