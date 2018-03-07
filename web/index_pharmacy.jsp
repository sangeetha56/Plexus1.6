<%--
    Document   : index
    Created on : Dec 29, 2011, 5:42:37 PM
    Author     : Mayur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">

            /***********************************************
             * Collapsible Frames script- © Dynamic Drive (www.dynamicdrive.com)
             * This notice must stay intact for use
             * Visit http://www.dynamicdrive.com/ for full source code
             ***********************************************/

            var columntype=""
            var defaultsetting=""

            function getCurrentSetting(){
                if (document.body)
                    return (document.body.cols)? document.body.cols : document.body.rows
            }

            function setframevalue(coltype, settingvalue){
                if (coltype=="rows")
                    document.body.rows=settingvalue
                else if (coltype=="cols")
                    document.body.cols=settingvalue
            }

            function resizeFrame(contractsetting){
                if (getCurrentSetting()!=defaultsetting)
                    setframevalue(columntype, defaultsetting)
                else
                    setframevalue(columntype, contractsetting)
            }

            function init(){
                if (!document.all && !document.getElementById) return
                if (document.body!=null){
                    columntype=(document.body.cols)? "cols" : "rows"
                    defaultsetting=(document.body.cols)? document.body.cols : document.body.rows
                }
                else
                    setTimeout("init()",100)
            }

            setTimeout("init()",100)

        </script>
    </head>

    <frameset    rows="80,*,55"frameborder="0" border="0" framespacing="0"  >
        <frame   src="plexus_h.html"   name="topFrame" scrolling="NO" noresize frameborder="0">

            <frameset  cols="200,*" frameborder="1" border="1" framespacing="0">
                <frame  src="left_pharmacy.jsp" name="leftFrame" scrolling="NO" noresize frameborder="0"   />
                <frame src="Controller?process=MedicineProcess&action=viewAllMedicine&medicineControllerValue=null&noOfRecords=20&pageno=1&alphabit=null" name="mainFrame" scrolling="yes"  />
            </frameset>
            <frame src="footer2.html" scrolling="NO" noresize frameborder="0" name="leftFrame"/>
        </frameset>






    <noframes>
        <body>
        </body>
    </noframes>
</html>
