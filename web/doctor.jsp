<%-- 
    Document   : doctor
    Created on : Feb 11, 2016, 5:06:09 PM
    Author     : kamal
--%>

<%@page import="java.sql.*"%>
<%
String country=request.getParameter("count");
System.out.println("ggggggggggggggggggggggggggggggggggggggggg:-"+country);

//String buffer="<label  class='alignRight'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;State&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>";
 String buffer="<select style='width: 180px' class='textField' name='state' onchange='showCity(this.value);'><option value='-1'>Select</option>";
 try{
  Class.forName("org.postgresql.Driver").newInstance();
  Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5433/plexus_version1", "postgres", "plexus");
  Statement stmt = con.createStatement();
 ResultSet rs = stmt.executeQuery("Select * from doctorinfo where departmentnameid='"+country+"' ");
   while(rs.next()){
   buffer=buffer+"<option value='"+rs.getString(1)+"'  label='"+rs.getString(2)+"'  onclick='showStateOptn(this.label)'>"+rs.getString(2)+"</option>";
   }
 buffer=buffer+"</select>";
 response.getWriter().println(buffer);
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>

