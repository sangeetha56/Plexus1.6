<%-- 
    Document   : userDetails
    Created on : Jun 15, 2016, 3:59:03 PM
    Author     : kamal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<head>

    <meta charset="utf-8">

    <title>User Information</title>

    <link rel="stylesheet" href="userTypeFormCSS/css/login-form.css" media="screen">

    <script src="js/datePicker/jquery-1.7.1.js"></script>
    <script src="js/datePicker/ui/jquery.ui.core.js"></script>
    <script src="js/datePicker/ui/jquery.ui.widget.js"></script>
    <script src="js/datePicker/ui/jquery.ui.datepicker.js"></script>
    <script src="js/datePicker/ui/jquery.ui.tabs.js"></script>
    <script src="js/datePicker/ui/sliderAccess.js"></script>
    <script src="js/datePicker/ui/jquery-ui-timepicker-addon.js"></script>
    <script src="js/validation/jquery.ketchup.all.min.js"></script>



    <script type="text/javascript" src="js/datePicker/ui/jquery-ui-1.8.17.custom.js"></script>

    <link rel="stylesheet" href="css/login.css">

    <link rel="stylesheet" href="css/datePicker/jquery-ui-1.8.18.custom.css">
    <link rel="stylesheet" href="css/validation/jquery.ketchup.css">


    <script type="text/javascript" src="js/datePicker/ui/jquery.ui.button.js"></script>
    <script type="text/javascript" src="js/datePicker/ui/jquery.ui.dialog.js"></script>
    <link rel="stylesheet" href="css/datePicker/demos.css">

    <script>

        function confirmPassword()
        {
            var Pwd = document.getElementById("password");
            var confPwd = document.getElementById("confirm-password");

            /* Your validation code. */

            if(Pwd.value!=confPwd.value) {
                alert('Password and Confirm passwords do not match');
                confPwd.focus();
                return false;
            }
            return true;
        }

    </script>




    <style>.login-form{margin: 120px auto;}</style>
    <meta name="robots" content="noindex,follow" />

    <script type="text/javascript">
        $(function() {


            $( "#save" )
            .button()
            .click(function() {
                addUser();
            });

            $( "#reset" )
            .button()
            .click(function() {
            });
        });


    </script>

    <script language="Javascript">
        function validateButton()
        {
            if( document.getElementById("loginname").value.length==0 )

            {
                document.getElementById("loginname").style.background='yellow';

                alert("Enter login name");

            }

            if( document.getElementById("password").value.length==0)

            {
                document.getElementById("password").style.background='yellow';
                alert("Enter password ");

            }

            if( document.getElementById("confirm-password").value.length==0)

            {
                document.getElementById("confirm-password").style.background='yellow';
                alert("Enter confirm-password ");

            }

            if( document.getElementById("usertype").value== "")

            {
                document.getElementById("usertype").style.background='';
                alert("Enter usertype ");

            }
            confirmPassword();


        }
    </script>

    <script language="Javascript">


        function valueExistsChangeColor()
        {
            if( document.getElementById("loginname").value.length!=0)

            {
                document.getElementById("loginname").style.background='white';

            }

            if( document.getElementById("password").value.length!=0)

            {
                document.getElementById("password").style.background='white';

            }

            if( document.getElementById("confirm-password").value.length!=0)

            {
                document.getElementById("confirm-password").style.background='white';

            }

            if( document.getElementById("usertype").value!="")

            {
                document.getElementById("usertype").style.background='white';

            }




        }
    </script>
    <script type="text/javascript">
            $(function() {


                $( "#update" )
                .button()
                .click(function() {
                    updateUserType();

                });


                $( "#edit" )
                .button()
                .click(function() {
                   
                    editable();
                    //disableHRF();

                });

                $( "#cancel" )
                .button()
                .click(function() {
                    window.location='userDetails.jsp'
                });

                $( "#delete" )
                .button()
                .click(function() {
                    deleteUserType();


                });
                $( "#back" )
                .button()
                .click(function() {
                   // backButttonn();
                    //window.location='consultancyTab.jsp';
                    window.location='Controller?process=UserProcess&action=viewAllUsers';

                });

            });



        </script>
     <script>
            function editable()
            {
               
                document.getElementById("update").style.display='';
                document.getElementById("cancel").style.display='';
                document.getElementById("delete").style.display='';
                document.getElementById("edit").style.display='none';
                document.getElementById("back").style.display='none';
                 

            }
        </script>


</head>

<body bgcolor="#E6EEF4">

    <form id="form1"  action="" method="POST" >

        <div class="login-form" style="background-color: #cad8e3;width:50%;border: ridge" >
            <table width="100%" align="center">
                <tr>
                    <td align="center">
                        <h1 style="color: black;font-family:Agency FB;font-size: 20px"><b>Manage-User</b></h1>
                    </td>
                </tr>

                <tr>
                    <td>
                        <hr>
                    </td>
                </tr>

            </table>

            <table width="50%" align="center">


                <tr>
                    <td align="center">
                     Login-Name: <input type="text" name="loginname" id="loginname" placeholder="Login-Name" onkeypress="valueExistsChangeColor()" value="${userList.loginname}">
                    </td>
                </tr>
                <tr>
                    <td align="center">
                      Password: <input type="text" id="password" name="password" placeholder="Password" onkeypress="valueExistsChangeColor()" value="${userList.password}">
                    </td>
                </tr>

                <tr>
                    <td align="center">
                       Confirm-Password: <input type="text" name="confirm-password" id="confirm-password" placeholder="Confirm Password"  onkeypress="valueExistsChangeColor()" value="${userList.password}">
                    </td>
                </tr>


                <tr>
                    <td align="center">
                      User-Type: <select class="select" title="Select one"  name="usertype" id="usertype" placeholder="Select User-Type" style="width: 175px" >
                            <option value="">${userList.type}</option>
                            <option value="admin">Admin</option>
                            <option value="doctor">Doctor</option>
                            <option value="reception">Reception</option>
                            <option value="pharmacy">Pharmacy</option>
                            <option value="medical">Medical</option>
                            <option value="account">Account</option>
                            <option value="lab">lab</option>

                        </select>
                    </td>
                </tr>

                <tr>
                    <td>
                        <br/>
                    </td>
                </tr>


                <tr>
                    <td align="center">

                        <span id="edit">Manage</span>
                        <span id="update" style="display: none">Update</span>
                        <span id="delete" style="display: none">DELETE</span>
                        <span style="display: none" id="cancel">Cancel</span>
                        <span id="back">Back</span>


                    </td>
                    
            </table>
        </div>
    </form>

    <script type="text/javascript">

            function deleteUserType(){
                var con=false
                con=confirm('Do You Want To Delete Selected user Type');
                if(!con)
                {
                    form1.action="userDetails.jsp";
                }
                else
                    {
                        var form1=document.getElementById("form1");
                        form1.action="Controller?process=UserProcess&action=deleteUser&userid=<c:out value="${userList.id}"/>";
                        form1.submit();

                    }

            }


            function updateUserType(){
                var con=false
                con=confirm('Do You Want To Edit Selected User Type');
                if(!con)
                {
                    form1.action="userDetails.jsp";
                }
                else
                    {
                        var form1=document.getElementById("form1");
                        form1.action="Controller?process=UserProcess&action=updateUser&id=<c:out value="${userList.id}"/>";
                        form1.submit();

                    }

            }
        </script>
</body>
</html>
