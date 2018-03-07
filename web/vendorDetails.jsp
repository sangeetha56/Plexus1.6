<%-- 
    Document   : ${name}
    Created on : ${date}, ${time}
    Author     : ${user}
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vendor Details</title>
        <link rel="stylesheet" href="css/datePicker/jquery-ui-1.8.18.custom.css">
        <link rel="stylesheet" href="css/datePicker/demos.css">
        <link rel="stylesheet" href="css/basic/basic.css" />
        <link rel="stylesheet" href="css/validation/jquery.ketchup.css">
        <script type="text/javascript" src="js/datePicker/jquery-1.7.1.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery-ui-1.8.17.custom.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.core.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.widget.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.datepicker.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.tabs.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/sliderAccess.js"></script>

        <script type="text/javascript" src="js/validation/jquery.ketchup.all.min.js"></script>
        <script type="text/javascript" src="js/datePicker/ui/jquery.ui.button.js"></script>
    </head>
    <body>
        <script type="text/javascript">
            $(function() {
                $("#update").button().click(function(){
                    
                });
                $( "#edit" )
                .button()
                .click(function() {
                    $("#vendorName").show();
                    $("#representativeName").show();
                    $("#vendorContactNo").show();
                    $("#vendorAddress").show();
                    $("#name").hide();
                    $("#representative").hide();
                    $("#contactNo").hide();
                    $("#address").hide();
                    $("#update").show();
                    $( "#cancel" ).show();
                    $("#edit").hide();
                    return false;

                });
                $( "#cancel" )
                .button()
                .click(function() {
                    $("#vendorName").hide();
                    $("#representativeName").hide();
                    $("#vendorContactNo").hide();
                    $("#vendorAddress").hide();
                    $("#update").hide();
                    $("#name").show();
                    $("#representative").show();
                    $("#contactNo").show();
                    $("#address").show();
                    $("#update").hide();
                    $( "#cancel" ).hide();
                    $("#edit").show();
                    return false;

                });
                $( "#tabs" ).tabs();
                $("#vendorName").hide();
                $("#representativeName").hide();
                $("#vendorContactNo").hide();
                $("#vendorAddress").hide();
                $("#update").hide();
                $( "#cancel" ).hide();
            });
        </script>
        <form id="form1"  action="Controller?process=VendorProcess&action=update" method="POST">

            <div >

                <div >
                    <div id="effect" class="ui-widget-content ui-corner-all">
                        <div id="tabs">
                            <ul>

                                <li><a href="#tabs-1">Details</a></li>
                            </ul>

                            <div id="tabs-1">
                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="table1" style="display: block">
                                    <tr>
                                        <td width="5%"  class="alignRight" >Name &nbsp;  </td>
                                        <td width="35%"  >

                                            <label>
                                                <span id="name"><c:out default="" value="${vendor.name}" /></span>
                                                <input name="vendorName" type="text" class="textField" value="<c:out default="" value="${vendor.name}" />" id="vendorName" size="30"   >
                                            </label>
                                        </td>
                                    </tr>
                                    <tr><td><br/></td></tr>
                                    <tr>
                                        <td width="10%"  class="alignRight" >Representative Name &nbsp;  </td>
                                        <td width="35%"  >

                                            <label>
                                                <span id="representative"><c:out default="" value="${vendor.representativename}" /></span>
                                                <input name="representativeName" value="<c:out default="" value="${vendor.representativename}" />" type="text" class="textField" id="representativeName" size="30"   >
                                            </label>
                                        </td>
                                    </tr>
                                    <tr><td><br/></td></tr>
                                    <tr></tr>
                                    <tr>
                                        <td width="5%"  class="alignRight" >Contact No &nbsp;  </td>
                                        <td width="35%"  >

                                            <label>
                                                <span id="contactNo"><c:out default="" value="${vendor.contactno}" /></span>
                                                <input name="vendorContactNo" value="<c:out default="" value="${vendor.contactno}" />" type="text" class="textField" id="vendorContactNo" size="30"   >
                                            </label>
                                        </td>
                                    </tr>
                                    <tr><td><br/></td></tr>
                                    <tr></tr>
                                    <tr>
                                        <td width="5%" class="alignRight" >Address &nbsp;
                                        </td>
                                        <td width="35%" colspan="3" >

                                            <label>
                                                <span style="width:120px" id="address"><c:out default="" value="${vendor.address}" /></span>
                                                <textarea name="vendorAddress" cols="120" rows="5"  id="vendorAddress"><c:out default="" value="${vendor.address}" /></textarea>
                                            </label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <table id="table2" width="100%" border="0" align="center"  >

                                <tr>
                                    <td align="center">
                                        <button id="edit">Edit</button>&nbsp;&nbsp;<button id="update">Update</button>&nbsp;&nbsp;<button id="cancel">Cancel</button> 

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
                        <td  class="headerTD">Medicine List</td>
                    </tr>
                </table>
                <table   width="100%"  border="0" style="border-color:#4b6a84;"  id="myTable">

                    <thead >
                        <tr>
                            <th title="click to sort" class="headerText">Name<img  alt=" "  style="position:relative; top: 4px;  " src="images/sort_both.png" /></th>
                            <%--<th title="click to sort" class="headerText">Representative Name<img  alt=" "  style="position:relative; top: 4px;  " src="images/sort_both.png" /></th>
                            <th title="click to sort" class="headerText">Contact No<img  alt=" "  style="position:relative; top: 4px;  " src="images/sort_both.png" />&nbsp;&nbsp;</th>

                            <th title="click to sort" class="headerText">Address<img  alt=" "  style="position:relative; top: 4px;  " src="images/sort_both.png" /></th>--%>
                        </tr>
                    </thead>

                    <tbody  >
                        <c:forEach items="${vendor.medicines}" var="medicine">

                            <tr style="border-color:#000000" border="1"  cellpadding="1"  cellspacing="1" >
                                <td  class="dataTextInActive" width="20%"><c:out value="${medicine.name}"/></td>
                                <%--<td  class="dataTextInActive" width="20%"><c:out value="${vendor.representativename}"/></td>
                                <td  class="dataTextInActive" width="20%"><c:out value="${vendor.contactno}"/></td>
                                <td class="dataText"><c:out value="${vendor.address}"/></td>--%>

                            </tr>
                        </c:forEach>

                    </tbody>
                </table>

            </div>

        </form>
    </body>
</html>
