<%-- 
    Document   : viewAllLicence
    Created on : May 20, 2014, 12:19:20 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html >
    <head >

        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" type="image/ico" href="http://www.datatables.net/media/images/favicon.ico" />
        <title>DataTables example</title>
        <style type="text/css" title="currentStyle">
            @import "media/css/demo_page.css";
            @import "media/css/demo_table.css";
        </style>
        <script type="text/javascript" language="javascript" src="media/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="media/js/jquery.dataTables.js"></script>
        <script type="text/javascript" charset="utf-8">
            (function($) {
                /*
                 * Function: fnGetColumnData
                 * Purpose:  Return an array of table values from a particular column.
                 * Returns:  array string: 1d data array
                 * Inputs:   object:oSettings - dataTable settings object. This is always the last argument past to the function
                 *           int:iColumn - the id of the column to extract the data from
                 *           bool:bUnique - optional - if set to false duplicated values are not filtered out
                 *           bool:bFiltered - optional - if set to false all the table data is used (not only the filtered)
                 *           bool:bIgnoreEmpty - optional - if set to false empty values are not filtered from the result array
                 * Author:   Benedikt Forchhammer <b.forchhammer /AT\ mind2.de>
                 */
                $.fn.dataTableExt.oApi.fnGetColumnData = function ( oSettings, iColumn, bUnique, bFiltered, bIgnoreEmpty ) {
                    // check that we have a column id
                    if ( typeof iColumn == "undefined" ) return new Array();

                    // by default we only want unique data
                    if ( typeof bUnique == "undefined" ) bUnique = true;

                    // by default we do want to only look at filtered data
                    if ( typeof bFiltered == "undefined" ) bFiltered = true;

                    // by default we do not want to include empty values
                    if ( typeof bIgnoreEmpty == "undefined" ) bIgnoreEmpty = true;

                    // list of rows which we're going to loop through
                    var aiRows;

                    // use only filtered rows
                    if (bFiltered == true) aiRows = oSettings.aiDisplay;
                    // use all rows
                    else aiRows = oSettings.aiDisplayMaster; // all row numbers

                    // set up data array
                    var asResultData = new Array();

                    for (var i=0,c=aiRows.length; i<c; i++) {
                        iRow = aiRows[i];
                        var aData = this.fnGetData(iRow);
                        var sValue = aData[iColumn];

                        // ignore empty values?
                        if (bIgnoreEmpty == true && sValue.length == 0) continue;

                        // ignore unique values?
                        else if (bUnique == true && jQuery.inArray(sValue, asResultData) > -1) continue;

                        // else push the value onto the result data array
                        else asResultData.push(sValue);
                    }

                    return asResultData;
                }}(jQuery));


            function fnCreateSelect( aData )
            {

                var r='<select><option value="" >Select</option>', i, iLen=aData.length;
                for ( i=0 ; i<iLen ; i++ )
                {
                    r += '<option >'+aData[i]+'</option>';
                }
                return r+'</select>';


            }


            $(document).ready(function() {
                /* Initialise the DataTable */
                var oTable = $('#example').dataTable( {
                    "oLanguage": {
                        "sSearch": "Search :"

                    },
                     "sPaginationType": "full_numbers",
                "bJQueryUI": false,
                "iDisplayLength": 15,
                "aLengthMenu": [[15, 25, 50, -1], [15, 25, 50, "All"]]



                } );


                /* Add a select menu for each TH element in the table footer */
                $("tfoot th").each( function ( i ) {

                    this.innerHTML = fnCreateSelect( oTable.fnGetColumnData(i) );
                    $('select', this).change( function () {
                        oTable.fnFilter( $(this).val(), i );
                    } );

 //var element = document.createElement('hr');
//document.body.appendChild(element);



                } );



            } );
        </script>

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
                border-radius:3px;
                width: 10px;
                font-family: Tahoma;
                font-size: 12px;
                background-color: #4b6a84;
                color: #FFFFFF;
                font-weight: normal;
                width: auto ;
                height: 22px;
                vertical-align: middle;
                text-align: center;

            }
            .dataText {
                border-radius:3px;
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 13px;
                letter-spacing: normal;
                text-align: center;


            }
            .dataTextInActive {
                border-radius:3px;
                font-family: Tahoma;
                color: #4b6a84;
                font-size: 12px;
                font-weight: bold;
                letter-spacing: normal;
                text-align: left;

                text-decoration:none;
                text-transform: capitalize;
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
            .footerTD{
                border-radius:6px;
                background-color:#4b6a84;


                text-align: left;


            }
            -->
        </style>
        <script language="Javascript">
              function goTo(id1)
              {
                  //window.location='kk.jsp';
                  //alert(id1);
                  window.location='Controller?process=LicenceProcess&action=viewLicenceDetails&id='+id1;
              }
        </script>



    </head>
    <body bgcolor="#E6EEF4">

        <form name="form1" action="" method="post">
            <div style="overflow: hidden" >
                <table width="100%" background="images/ui-bg_diagonals-small_50_466580_40x40.png">
                    <tr>
                        <td  class="headerTD">Licence Info All</td>
                    </tr>


                </table>
                <table     width="100%" cellpadding="0" cellspacing="0" border="0" class="display"  id="example">

                    <thead >
                        <tr  >

                            <th style="width: 30px" title="click to sort" class="headerText" >Clinic/Hospital Name</th>
                            <th title="click to sort" class="headerText">CMD Name</th>
                            <th title="click to sort" class="headerText">CMD Mob No</th>
                            <th title="click to sort" class="headerText">CMD Email ID</th>
                            <th title="click to sort" class="headerText">Website</th>

                            <th style="display:  none" title="click to sort" class="headerText">CMD Contact NO</th>
                             <th style="display: none" title="click to sort" class="headerText">Emailid 1</th>
                              <th style="display: none" title="click to sort" class="headerText">address1</th>
                               <th style="display: none" title="click to sort" class="headerText">address2</th>
                                <th style="display: none" title="click to sort" class="headerText">address3</th>
                                <th style="display:  none" title="click to sort" class="headerText">address4</th>

                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${LicenceList}" var="licence">

                            <tr class="gradeA"  >



                                <td onclick="goTo(<c:out  value='${licence.licenceid}'/>);" title="click to Select"  class="dataTextInActive"><a  class="dataTextInActive"  href="Controller?process=LicenceProcess&action=viewLicenceDetails&id=<c:out  value='${licence.licenceid}'/>"><c:out value="${licence.clientname}"/></a></td>

                                <td  class="dataText"><c:out value="${licence.chiefmdname}"/></td>
                                <td class="dataText"><c:out  value="${licence.cmdmobno}"/></td>
                                 <td  class="dataText"><c:out value="${licence.cmdemailid}"/></td>
                                 <td class="dataText"><c:out  value="${licence.webaddress}"/></td>
                                <td style="display:  none" class="dataText"><c:out value="${licence.cmdcontno}"/></td>

                                 <td style="display:  none" class="dataText"><c:out value="${licence.emailid}"/></td>
                                 <td  style="display:  none" class="dataText"><c:out value="${licence.addressline1}"/></td>
                                  <td  style="display:  none" class="dataText"><c:out value="${licence.addressline2}"/></td>
                                   <td  style="display:  none" class="dataText"><c:out value="${licence.addressline3}"/></td>
                                    <td  style="display:  none" class="dataText"><c:out value="${licence.addressline4}"/></td>
                                    

                            </tr>

                        </c:forEach>
                    </tbody>

                   <tfoot>
                        <tr>

                            <th style="visibility: hidden"></th>
                            <th style="visibility: hidden"></th>
                            <th style="visibility: hidden"></th>
                            <th style="visibility: hidden"></th>
                            <th style="visibility: hidden"></th>
                            

                        </tr>

                    </tfoot>




                </table>

 <div>
                <table width="100%">
                    <tr  align="left">   <hr/></tr>
                </table>
                </div>



            </div>
             <div>
                <table width="100%">
                    <tr  align="left">   <hr/></tr>
                </table>
                </div>
        </form>
    </body>
</html>
