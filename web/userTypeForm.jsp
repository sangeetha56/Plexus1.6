<%-- 
    Document   : userTypeForm
    Created on : Jun 14, 2016, 12:59:50 PM
    Author     : INTEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<head>

    <meta charset="utf-8">

    <title>Login Form Tutorial | Design Modo | Valeriu Timbuc</title>

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


</head>

<body bgcolor="#E6EEF4">

    <form id="form1"  action="" method="POST" >

        <div class="login-form" style="background-color: #cad8e3;width:50%;border: ridge" >
            <table width="100%" align="center">
                <tr>
                    <td align="center">
                        <h1 style="color: black;font-family:Agency FB;font-size: 20px"><b>Create-User</b></h1>
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
                        <input type="text" name="loginname" id="loginname" placeholder="Login-Name" onkeypress="valueExistsChangeColor()">
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <input type="password" id="password" name="password" placeholder="Password" onkeypress="valueExistsChangeColor()">
                    </td>
                </tr>

                <tr>
                    <td align="center">
                        <input type="password" name="confirm-password" id="confirm-password" placeholder="Confirm Password"  onkeypress="valueExistsChangeColor()">
                    </td>
                </tr>


                <tr>
                    <td align="center">
                        <select class="select" title="Select one"  name="usertype" id="usertype" placeholder="Select User-Type" style="width: 175px" required>
                            <option value="">Select</option>
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

                        <button id="save"  onmouseover="validateButton();">Save</button>
                        <button id="reset" type="reset" value="Cancel" name="Cancel">Cancel</button>

                    </td>
                </tr>
            </table>
        </div>
    </form>

    <script type="text/javascript">
        function addUser()
        {
            var form1=document.getElementById("form1");
            //    var a=document.getElementByName("country");
            //    alert(a.innerHTML);
            form1.action=action="Controller?process=UserProcess&action=addUser";
            form1.submit();
        }
    </script>
</body>
</html>