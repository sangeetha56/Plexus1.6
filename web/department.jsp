<%-- 
    Document   : department
    Created on : Feb 11, 2016, 5:03:12 PM
    Author     : kamal
--%>

<%@page import="java.sql.*"%>
<html>
    <head>
        <script language="javascript" type="text/javascript">
            var xmlHttp
            var xmlHttp
            function showState(str){
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

            function showCity(str){
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
                var url="city.jsp";
                url +="?count=" +str;
                xmlHttp.onreadystatechange = stateChange1;
                xmlHttp.open("GET", url, true);
                xmlHttp.send(null);
            }
            function stateChange1(){
                if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
                    document.getElementById("city").innerHTML=xmlHttp.responseText
                }
            }
        </script>
    </head>
    <body>
        <select name='country' onchange="showState(this.value)">
            <option value="none">Select</option>
            <%
                        Class.forName("org.postgresql.Driver").newInstance();
                        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5433/plexus_version1", "postgres", "plexus");
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("Select * from departmentname");
                        while (rs.next()) {
            %>
            <option onclick="showCountryOptn(this.label)"  label="<%=rs.getString(2)%>" value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
            <%
                        }
            %>
        </select>
        <br>
        <div id='state'>
            <select name='state' >
                <option value='-1'></option>
            </select>
        </div>

        
    </body>
</html>