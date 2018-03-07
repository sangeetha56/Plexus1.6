<%--
    Document   : MedicineDetails
    Created on : Jul 25, 2012, 4:10:56 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/datePicker/jquery-ui-1.8.18.custom.css">
        <script type="text/javascript" src="js/datePicker/jquery-1.7.1.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery-ui-1.8.17.custom.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.core.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.widget.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.datepicker.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.tabs.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.button.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.accordion.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.effects.core.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.accordion.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.effects.slide.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.effects.bounce.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.effects.clip.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.effects.transfer.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.effects.blind.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/sliderAccess.js"></script>
        <script type="text/javascript" language="javascript" src="js/dataTable/jquery.dataTables.js"></script>
        <link rel="stylesheet" href="css/datePicker/demos.css">
        <style type="text/css">
            <!--
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
                border-width:1;
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
                border-radius:3px;
                width: 10px;
                font-family: Tahoma;
                font-size: 12px;
                background-color: #4b6a84;
                color: #FFFFFF;
                font-weight: normal;
                width: auto ;
                height: 27px;
                vertical-align:text-top;
                text-align: center;
                background-image: url("images/ui-bg_diagonals-small_50_466580_40x40.png");
            }
            .dataText {
                border-radius:3px;
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 13px;
                letter-spacing: normal;
                text-align: center;
                background-color: #E3EFFF;

            }
            .dataTextInActive {
                border-radius:3px;
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 12px;
                font-weight: bold;
                letter-spacing: normal;
                text-align: center;
                background-color: #E3EFFF;
                text-decoration:none;
            }
            .dataTextActive {
                border-radius:3px;
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 12px;
                font-weight: bold;
                letter-spacing: normal;
                text-align: center;
                background-color: #E3EFFF;
                text-decoration: underline;
            }
            .dataTextHidden {
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 13px;
                letter-spacing: normal;
                text-align: center;
                background-color: #E3EFFF;
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
                height: 22px;
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

        </style>

        <script type="text/javascript">
            function redirectUrl(){
                var form1=document.getElementById("form1");
                form1.action="Controller?process=PatientProcess&action=addWithAppointment";
                form1.submit();
            }
            function addMedicine(){
                var form1=document.getElementById("form1");
                form1.action="Controller?process=MedicineProcess&action=addMedicine";
                form1.submit();
            }
            function addPatient(){
                var form1=document.getElementById("form1");
                form1.action="Controller?process=PatientProcess&action=add";
                form1.submit();
            }
            function addPatientWithAppointment(){
                var form1=document.getElementById("form1");
                form1.action="Controller?process=PatientProcess&action=addWithAppointment";
                form1.submit();
            }
            function validateEmptyField(elementName){
                var txtBox=document.getElementById(elementName);
                if(txtBox.value==""){
                    txtBox.className="emptyFieldSet";
                }
                else if(txtBox.value!=""){
                    txtBox.className="textField";
                }
            }
            function notEmptyField(elementName){
                alert(elementName);
                var txtBox=document.getElementById(elementName);
                if(txtBox.value!=""){
                    txtBox.className="textField";
                }
                else if(txtBox.value==""){
                    txtBox.className="emptyFieldSet";
                }
            }
        </script>
        <script type="text/javascript" charset="utf-8">
            $(document).ready(function() {
                $("#medicineName").show();
                $("#name").hide();
                $("#medicineStrength").show();
                $("#strength").hide();
                $("#medicineNature").show();
                $("#nature").hide();
                $("#medicineUnitType").show();
                $("#unitType").hide();
                $("#medicinePrice").show();
                $("#price").hide();
                $("#medicineUnitQuantity").show();
                $("#unitQuantity").hide();
                $("#medicineBatchNo").show();
                $("#batchNo").hide();
                $("#medicineUnitPrice").show();
                $("#unitPrice").hide();
                $("#medicineCompanyName").show();
                $("#companyName").hide();
                $("#medicineVendorName").show();
                $("#vendorName").hide();
                $("#medicineRemarks").show();
                $("#remarks").hide();
                $("#vatt").show();
                $("#vat").hide();
                $("#vattt").show();
                $("#cgstt").show();
                    $("#cgst").hide();
                    $("#cgsttt").show();
                    $("#sgstt").show();
                    $("#sgst").hide();
                    $("#sgsttt").show();
                    $("#igstt").show();
                    $("#igst").hide();
                    $("#igsttt").show();

                $("#par").hide();
                $("#parr").hide();
                    $("#para").hide();
                    $("#parj").hide();
                $("#lastdate").show();
                $("#lastdatee").hide();
                $("#update").hide();
                $("#usableornot").hide();
                $( "#cancel" ).hide();
                $('#myTable').dataTable( {
                    "sScrollY": "380px",
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": true,
                    "bSort": true,
                    "bInfo": false,
                    "bAutoWidth": false
                } );
            } );
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
        <script type="text/javascript" src="js/datetimepicker_css.js"></script>
        <script type="text/javascript">
            $(function() {
                $("#update").button()
                .click(function(){

                    updateMedicine();

                });
                $( "#edit" )
                .button()
                .click(function() {
                    $("#medicineName").hide();
                    $("#name").show();
                    $("#medicineStrength").hide();
                    $("#strength").show();
                    $("#medicineNature").hide();
                    $("#nature").show();
                    $("#medicineUnitType").hide();
                    $("#unitType").show();
                    $("#medicinePrice").hide();
                    $("#price").show();
                    $("#medicineUnitQuantity").hide();
                    $("#unitQuantity").show();
                    $("#medicineBatchNo").hide();
                    $("#batchNo").show();
                    $("#medicineUnitPrice").hide();
                    $("#unitPrice").show();
                    $("#medicineCompanyName").hide();
                    $("#companyName").show();
                    $("#medicineVendorName").hide();
                    $("#vendorName").show();
                    $("#medicineRemarks").hide();
                    $("#remarks").show();
                    $("#vatt").hide();
                    $("#vat").show();
                    $("#vattt").hide();
                    $("#cgstt").hide();
                    $("#cgst").show();
                    $("#cgsttt").hide();
                    $("#sgstt").hide();
                    $("#sgst").show();
                    $("#sgsttt").hide();
                    $("#igstt").hide();
                    $("#igst").show();
                    $("#igsttt").hide();
                    $("#par").show();
                    $("#parr").show();
                    $("#para").show();
                    $("#parj").show();
                    $("#lastdate").hide();
                    $("#lastdatee").show();
                    $("#update").show();
                    $("#usableornot").show();
                    $( "#cancel" ).show();
                    $("#edit").hide();
                    return false;

                });
                $( "#cancel" )
                .button()
                .click(function() {
                    $("#medicineName").show();
                    $("#name").hide();
                    $("#medicineStrength").show();
                    $("#strength").hide();
                    $("#medicineNature").show();
                    $("#nature").hide();
                    $("#medicineUnitType").show();
                    $("#unitType").hide();
                    $("#medicinePrice").show();
                    $("#price").hide();
                    $("#medicineUnitQuantity").show();
                    $("#unitQuantity").hide();
                    $("#medicineBatchNo").show();
                    $("#batchNo").hide();
                    $("#medicineUnitPrice").show();
                    $("#unitPrice").hide();
                    $("#medicineCompanyName").show();
                    $("#companyName").hide();
                    $("#medicineVendorName").show();
                    $("#vendorName").hide();
                    $("#medicineRemarks").show();
                    $("#remarks").hide();
                    $("#vatt").show();
                    $("#vat").hide();
                    $("#vattt").show();

                    $("#cgstt").show();
                    $("#cgst").hide();
                    $("#cgsttt").show();
                    $("#sgstt").show();
                    $("#sgst").hide();
                    $("#sgsttt").show();
                    $("#igstt").show();
                    $("#igst").hide();
                    $("#igsttt").show();

                    $("#par").hide();
                    $("#parr").hide();
                    $("#para").hide();
                    $("#parj").hide();
                    $("#update").hide();
                    $("#usableornot").hide();
                    $( "#cancel" ).hide();
                    $("#edit").show();
                    return false;

                });

                $( "#usableornot" )
                .button()
                .click(function() {
                    usableOrNot();

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
                $( "#save" )
                .button()
                .click(function() {
                    addMedicine();

                });
                $( "#back" )
                .button()
                .click(function() {

                });
                //$( "#effect" ).hide();
            });
        </script>
        <script type="text/javascript">
            $(function() {
                $( "#tabs" ).tabs();
            });
        </script>


        <script type="text/javascript">
            function openPopup(){
                $( "#dialog" ).dialog( "open" );
            }
            function selectVendor(name,id){
                var vendorName=document.getElementById('vendorName');
                var vendorID=document.getElementById("vendorID");
                vendorName.value=name;
                vendorID.value=id;
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
            function openPopup1(){
                $( "#dialog1" ).dialog( "open" );
            }
            function selectCompany(name,id){
                var companyName=document.getElementById('companyName');
                var companyId=document.getElementById("companyID");
                companyName.value=name;
                companyId.value=id;
                $( "#dialog1" ).dialog( "close" );

            }
        </script>


        <script type="text/javascript">

            $(function() {
                $( "#dialog1" ).dialog({
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
            function filter2 (phrase, _id)
            {
                var words = phrase.value.toLowerCase().split(" ");
                var table = document.getElementById(_id);
                var ele;
                var dd=table.rows.length;
                //var aa=dd/2;
                var aa=dd-1;
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
            /**
             * Comment
             */
            function calculateUnitPrice() {
                var price=document.getElementById('price').value;//$('#price').val();
                var quantity=document.getElementById('unitQuantity').value;//$('#unitQuantity').val();

                $("#unitPrice").val( (price/quantity).toPrecision(3));

            }
            function filter3 (phrase, _id)
            {
                var words = phrase.value.toLowerCase().split(" ");
                var table = document.getElementById(_id);
                var ele;
                var dd=table.rows.length;
                //var aa=dd/2;
                var aa=dd-1;
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

        <script >
            function backButtton1()
            {

                window.location='Controller?process=MedicineProcess&action=viewAllMedicine&medicineControllerValue=null&noOfRecords=20&pageno=1&alphabit=null';

            }
        </script>
        <script>
            function reformatDate() {
                //alert('kk');

                if(document.getElementById("lastdatee").value!='')
                {


                    var dateF=document.getElementById("lastdatee");
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
            }


        </script>



    </head>
    <body onload="reformatDate();">
        <form id="form1"  action="" method="POST">

            <table width="100%">
                <tr>
                    <td height="32" background="images/header-bg.png" style="background-repeat:repeat-x"><img src="images/back1.png" style="cursor: pointer" title="click to close" onclick="backButtton1()" /></td>


               </tr>
            </table>
            <div id="dialog" title="Vendor's Details">
                <table>
                    <tr>
                        <td class="search">Search</td>
                        <td><input type="text" name="search"  height="20" align="right" id="search"  title="enter keywords"  onkeyup="filter3(this,'vd')"></td>
                    </tr>
                </table>
                <table  width="100%"  border="1"   style="border-color:#4b6a84"  id="vd">

                    <thead>
                        <tr class="headerText" >
                            <th >Name</th>
                            <th  >Contact No</th>
                            <th  >Address</th>


                        </tr>
                    </thead>

                    <tbody >


                        <c:forEach items="${vendors}" var="vendor">
                            <tr style="border-color:#000000" border="1"  cellpadding="1"  cellspacing="1" >
                                <td  class="dataTextName" onclick="selectVendor('<c:out value="${vendor.name}"/>','<c:out value="${vendor.id}"/>')"><c:out value="${vendor.name}"/></td>
                                <td  class="dataText" ><c:out value="${vendor.contactno}"/></td>
                                <td class="dataText"><c:out value="${vendor.address}"/></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>






            <div id="dialog1" title="Manufacturer's details">
                <table>
                    <tr></tr>
                    <tr>
                        <td class="search">Search</td>
                        <td><input type="text" name="search"  height="20" align="right" id="search"  title="enter keywords"  onkeyup="filter2(this,'mf')"></td>
                    </tr>
                </table>
                <table  width="100%"  border="1"   style="border-color:#4b6a84"  id="mf">

                    <thead>
                        <tr class="headerText" >

                            <th  >Name</th>
                            <th  >Address</th>

                        </tr>
                    </thead>

                    <tbody >

                        <c:forEach items="${companies}" var="company">
                            <tr style="border-color:#000000" border="1"  cellpadding="1"  cellspacing="1" >

                                <td class="dataTextName" onclick="selectCompany('<c:out value="${company.name}"/>','<c:out value="${company.id}"/>')"><c:out value="${company.name}"/></td>
                                <td  class="dataText"><c:out value="${company.address}"/></td>


                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div >

                <div class="toggler">
                    <div id="effect" class="ui-widget-content ui-corner-all">
                        <div id="tabs">
                            <ul>
                                <li><a href="#tabs- 1">Medicine Details</a></li>
                                <%--   <li><a href="#tabs-2">Manufacturer Details</a></li>
                                <li><a href="#tabs-3">Vendor Details</a></li>   --%>
                            </ul>
                            <br>
                            <div id="tabs-1">
                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="table1" style="display: block">
                                    <tr>
                                        <td width="16%"  class="alignRight" >medicine Name &nbsp;  </td>
                                        <td width="28%"  >
                                            <label>
                                                <input  name="medicineID" type="hidden"  id="medicineID" value="<c:out value="${medicine.id}" />" >
                                                <span  id="medicineName"><c:out default="Not Specified" value="${medicine.name}" /></span>
                                                <input name="name" type="text" class="textField" id="name" size="30"   value="<c:out value="${medicine.name}" />"  >
                                            </label>
                                        </td>
                                        <td width="16%"  class="alignRight" >Strength &nbsp;  </td>
                                        <td width="28%"  >
                                            <label>
                                                <span  id="medicineStrength"><c:out default="Not Specified" value="${medicine.strength}" /></span>
                                                <input name="strength" type="text" class="textField" id="strength" size="30"  value="<c:out value="${medicine.strength}" />"  >
                                            </label>
                                        </td>
                                    </tr>

                                    <tr><td><br/></td></tr>
                                    <tr></tr>

                                    <tr>
                                        <td width="20%" class="alignRight" >Nature &nbsp;
                                        </td>
                                        <td width="45%"  >
                                            <label>
                                                <span  id="medicineNature"><c:out value="${medicine.nature}" /></span>
                                                <script >
                                                    $(function(){
                                                        $("#nature").val( '<c:out value="${medicine.nature}" />' ).attr('selected',true);
                                                        $("#unitType").val( '<c:out value="${medicine.unittype}" />' ).attr('selected',true);
                                                    });


                                                </script>
                                                <select name="nature" id="nature"  style="width: 170px" >
                                                    <option value="" selected></option>
                                                    <option value="Ampoule">Ampoule</option>
                                                    <option value="Aerosol">Aaerosol</option>
                                                    <option value="Caplets">Caplets</option>
                                                    <option value="Chewable">Chewable</option>
                                                    <option value="Cream">Cream</option>
                                                    <option value="Capsules">Capsules</option>
                                                    <option value="Drops">Drops</option>
                                                    <option value="Foam">Foam</option>
                                                    <option value="Gel">Gel</option>
                                                    <option value="Inhaler">Inhaler</option>
                                                    <option value="Injection" >Injection</option>
                                                    <option value="Lotion">Lotion</option>
                                                    <option value="Lozenges">Lozenges</option>
                                                    <option value="Ointment">Ointment</option>
                                                    <option value="Pill(s)">Pill(s)</option>
                                                    <option value="Powder">Powder</option>
                                                    <option value="Suppositories">Suppositories</option>
                                                    <option value="Syrup">Syrup</option>
                                                    <option value="Soap">Soap</option>
                                                    <option value="Solution">Solution</option>
                                                    <option value="Spray">Spray</option>
                                                    <option value="Suspension">Suspension</option>
                                                    <option value="Tablets" >Tablets</option>

                                                </select>
                                            </label>
                                        </td>
                                        <td width="20%" class="alignRight" >Package Type &nbsp;
                                        </td>
                                        <td width="45%"  >
                                            <label>
                                                <span  id="medicineUnitType"><c:out value="${medicine.unittype}" /></span>
                                                <select name="unitType" id="unitType"  style="width: 170px" >
                                                    <option value="" selected></option>
                                                    <option value="Blister Packaging">blister packaging</option>
                                                    <option value="Bottle">Bottle</option>
                                                    <option value="Canister">Canister</option>
                                                    <option value="Carton">Carton</option>
                                                    <option value="Container">Container</option>
                                                    <option value="Form Fill Seal">Form Fill Seal</option>
                                                    <option value="Jar">Jar</option>
                                                    <option value="Liquid Filling">Liquid Filling</option>
                                                    <option value="Sachet">Sachet</option>
                                                    <option value="Tube">Tube</option>
                                                    <option value="Vial">Vial</option>
                                                    <option value="Strip">Strip</option>
                                                    <option value="Stick Pack Pouching">Stick Pack Pouching</option>
                                                </select>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <br/>
                                        </td>
                                    </tr>
                                    <tr>

                                    </tr>

                                    <tr>
                                        <td width="16%" height="30"  class="alignRight" >Package Price &nbsp;
                                        </td>
                                        <td>
                                            <label>
                                                <span  id="medicinePrice"><c:out default="Not Specified" value="${medicine.price}" /></span>
                                                <input name="price" type="text" class="textField" id="price" size="30" value="<c:out value="${medicine.price}" />" >
                                            </label>
                                        </td>

                                        <td width="16%" height="30"  class="alignRight" >Unit Quantity/Package &nbsp;
                                        </td>
                                        <td>
                                            <label>
                                                <span  id="medicineUnitQuantity"><c:out default="Not Specified" value="${medicine.unitquantity}" /></span>
                                                <input  name="unitQuantity" type="text" class="textField" id="unitQuantity" size="30"  onblur="calculateUnitPrice();" value="<c:out value="${medicine.unitquantity}" />">
                                            </label>
                                        </td>
                                    </tr>

                                    <tr><td><br/></td></tr>
                                    <tr></tr>
                                    <tr>
                                        <td class="alignRight">Batch No&nbsp;
                                        </td>
                                        <td>
                                            <label>
                                                <span  id="medicineBatchNo"><c:out default="Not Specified" value="${medicine.batchno}" /></span>
                                                <input  name="batchNo" type="text" class="textField" id="batchNo" size="30"  value="<c:out value="${medicine.batchno}" />">
                                            </label>
                                        </td>
                                        <td width="16%" height="30"  class="alignRight" >Unit Price &nbsp;
                                        </td>
                                        <td>
                                            <label>
                                                <span  id="medicineUnitPrice"><c:out value="${medicine.unitprice}" /></span>
                                                <input readonly name="unitPrice" type="text" class="textField" id="unitPrice" size="30" value="<c:out value="${medicine.unitprice}" />">
                                            </label>

                                        </td>

                                    </tr>
                                    <tr>
                                        
                                        <td class="alignRight">CGST&nbsp;
                                        </td>
                                        <td>
                                            <label>
                                                <span  id="cgstt"><c:out value="${medicine.cgst}" /></span>
                                                <span  id="cgsttt">%</span>
                                                <input  name="cgst" id="cgst" type="text" value="<c:out value="${medicine.cgst}" />" class="textField"  size="28" >
                                                <input readonly disabled="true" name="parr" id="parr" type="text" class="textField" value="%"  size="2" >
                                            </label>
                                        </td>
                                        <td class="alignRight">SGST&nbsp;
                                        </td>
                                        <td>
                                            <label>
                                                <span  id="sgstt"><c:out value="${medicine.sgst}" /></span>
                                                <span  id="sgsttt">%</span>
                                                <input  name="sgst" id="sgst" type="text" value="<c:out value="${medicine.sgst}" />" class="textField"  size="28" >
                                                <input readonly disabled="true" name="para" id="para" type="text" class="textField" value="%"  size="2" >
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        
                                        <td class="alignRight">IGST&nbsp;
                                        </td>
                                        <td>
                                            <label>
                                                <span  id="igstt"><c:out value="${medicine.igst}" /></span>
                                                <span  id="igsttt">%</span>
                                                <input  name="igst" id="igst" type="text" value="<c:out value="${medicine.igst}" />" class="textField"  size="28" >
                                                <input readonly disabled="true" name="parj" id="parj" type="text" class="textField" value="%"  size="2" >
                                            </label>
                                        </td>
                                       <td class="alignRight">GST&nbsp;
                                        </td>
                                        <td>
                                            <label>
                                                <span  id="vatt"><c:out value="${medicine.vat}" /></span>
                                                <span  id="vattt">%</span>
                                                <input  name="vat" id="vat" type="text" value="<c:out value="${medicine.vat}" />" class="textField"  size="28" >
                                                <input readonly disabled="true" name="par" id="par" type="text" class="textField" value="%"  size="2" >
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>

                                    </tr>

                                    <tr><td><br/></td></tr>
                                    <tr>
                                        <td class="alignRight">Manufacturer's Name&nbsp;
                                        </td>
                                        <td>
                                            <label>
                                                <span  id="medicineCompanyName"><c:out default="Not Specified" value="${medicine.company.name}" /></span>
                                                <input  name="companyName" type="text" class="textField" id="companyName" readonly onclick="openPopup1()"  size="30" value="<c:out value="${medicine.company.name}" />">
                                                <input  name="companyID" type="hidden"  id="companyID" <c:out value="${medicine.company.id}" />  >
                                            </label>
                                        </td>

                                        <td width="16%" height="30"  class="alignRight" >Vendor's Name &nbsp;
                                        </td>
                                        <td>
                                            <label>
                                                <span  id="medicineVendorName"><c:out default="Not Specified" value="${medicine.vendor.name}" /></span>
                                                <input  name="vendorName" type="text" class="textField" id="vendorName" readonly onclick="openPopup()"   size="30" value="<c:out value="${medicine.vendor.name}" />" >
                                                <input  name="vendorID" type="hidden"  id="vendorID" value="<c:out value="${medicine.vendor.id}" />" >
                                            </label>
                                        </td>

                                    </tr>
                                    <tr><td><br/></td></tr>
                                    <tr>

                                        <td width="16%" height="30"  class="alignRight" >Remarks &nbsp;
                                        </td>
                                        <td colspan="4">
                                            <label>
                                                <span  id="medicineRemarks"><c:out default="Not Specified" value="${medicine.remarks}" /></span>
                                                <textarea name="remarks" cols="120" rows="4"  id="remarks"><c:out value="${medicine.remarks}" /></textarea>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr style="display: none">
                                        <td class="alignRight">Last Access Date
                                        </td>
                                        <td>
                                            <label>
                                                <span  id="lastdate"><c:out value="${medicine.lastaccessdate}" /></span>

                                                <input  name="lastdatee" id="lastdatee" type="text" value="<c:out value="${medicine.lastaccessdate}" />" class="textField"  size="10" >

                                            </label>
                                        </td>
                                        <td width="16%" height="30"  class="alignRight" > &nbsp;
                                        </td>
                                        <td>
                                            <label>

                                            </label>

                                        </td>

                                    </tr>

                                </table>

                            </div>
                            <table id="table2" width="25%" border="0" align="center"  >

                                <tr>
                                    <td align="center">
                                        <a id="back" href="Controller?process=MedicineProcess&action=viewAllMedicine&medicineControllerValue=null&noOfRecords=20&pageno=1&alphabit=null">Back</a>
                                    </td>
                                    <td align="center">
                                        <button id="edit">Edit</button>&nbsp;&nbsp;&nbsp;&nbsp;

                                    </td>
                                    <td align="center">
                                        <button id="update">Update</button>

                                    </td>

                                    <td align="center">
                                        <button id="usableornot">NONUSABLE</button>

                                    </td>
                                    <td>
                                        <button id="cancel">Cancel</button>

                                    </td>

                                </tr>


                            </table>

                        </div>
                    </div>
                </div>
            </div>


            <div style="overflow:scroll;height: 600px">
                <table width="100%">
                    <tr>
                        <td  class="headerTD">View All Medicine Stocks</td>
                    </tr>
                </table>
                <table   width="100%"  border="0" style="border-color:#4b6a84;"  id="myTable">

                    <thead >
                        <tr>
                            <th title="click to sort" class="headerText">Sr No<img  alt=" "  style="position:relative; top: 4px;  " src="images/sort_both.png" /></th>
                            <th title="click to sort" class="headerText">Creation Date<img  alt=" "  style="position:relative; top: 4px;  " src="images/sort_both.png" />&nbsp;&nbsp;</th>
                            <th title="click to sort" class="headerText">Manufacturer Date<img  alt=" "  style="position:relative; top: 4px;  " src="images/sort_both.png" /></th>
                            <th title="click to sort" class="headerText">Expiry Date<img  alt=" "  style="position:relative; top: 4px;  " src="images/sort_both.png" /></th>
                            <th title="click to sort" class="headerText">Available Stock<img  alt=" "  style="position:relative; top: 4px;  " src="images/sort_both.png" /></th>
                            <th title="click to sort" class="headerText">Batch No<img  alt=" "  style="position:relative; top: 4px;  " src="images/sort_both.png" /></th>
                            <th class="headerText"></th>
                        </tr>
                    </thead>

                    <tbody  >
                        <c:forEach varStatus="count" items="${medicine.stocks}" var="stock"  >

                            <tr style="border-color:#000000" border="1"  cellpadding="1"  cellspacing="1" >
                                <td  class="dataText"><c:out value="${count.count}"/></td>
                                <td  class="dataText"><fmt:formatDate pattern="dd MMMM yyyy" value="${stock.creationdate}" /></td>
                                <td class="dataText"><fmt:formatDate pattern="MMMM yyyy" value="${stock.manufacturedate}" /></td>
                                <td  class="dataText"><fmt:formatDate pattern="MMMM yyyy" value="${stock.expirydate}" /></td>
                                <td  class="dataText"><c:out value="${stock.availablestock}"/></td>
                                <td class="dataText"><c:out value="${stock.batchno}"/></td>
                                <td class="dataText"><a href="Controller?process=StockProcess&action=viewStock&stockId=<c:out value="${stock.id}" />"> Edit</a> &nbsp;<a href="Controller?process=StockProcess&action=deleteStock&stockId=<c:out value="${stock.id}" />&medicineId=<c:out value="${medicine.id}" />"> Delete</a></td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>

            </div>


        </form>

       <script language="Javascript">


            function usableOrNot()
            {
                alert('usableOrNot');
                var form1=document.getElementById("form1");
                form1.action="Controller?process=MedicineProcess&action=updateMedicineUsableorNot";
                form1.submit();

            }

            function updateMedicine()
            {
                alert('updateMedicine');
                var form1=document.getElementById("form1");
                form1.action="Controller?process=MedicineProcess&action=updateMedicine";
                form1.submit();

            }
        </script>

    </body>
</html>
