<%-- 
    Document   : savedTherapy
    Created on : Feb 12, 2016, 3:26:19 PM
    Author     : INTEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
<!--
.divCSS {
	height: 40px;
	width: 200px;
	border: 1px solid #305876;

}
.tableCSS {
	background-position: center center;
	vertical-align: middle;
	height: 140px;
	width: 100%;
}
.style1 {
	font-family: Tahoma;
	font-weight: bold;
	color: #5E87B0;
}
.style2 {
	font-size: 12px;
	color: #000000;
}
-->
        </style>

        <script type="text/javascript">

            function ViewAll(){
                var form1=document.getElementById("form1");
               // form1.action="Controller?process=ConsultancyProcess&action=viewAll";
                  form1.action="therapy.jsp";
                form1.submit();
            }

            function addNew(){
                var form1=document.getElementById("form1");
                form1.action="addTherapyType.jsp";
                form1.submit();
            }
        </script>
</head>
    <body background="images/bg.jpg" >
        <form id="form1" method="post">
    <table height="462" class="tableCSS"  >
      <tr>
        <td height="250" align="center" valign="middle"><p class="style1">Consultancy Type Saved Successfully</p>
        <p class="style1">

          <input type="button"  value="View All " onClick="ViewAll()">
          <input type="button" value="Add New " onClick="addNew()">
        </p></td>
      </tr>
    </table>
            </form>
    </body>
</html>

