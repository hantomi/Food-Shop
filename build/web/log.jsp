<%-- 
    Document   : log
    Created on : Jan 13, 2021, 4:07:09 PM
    Author     : redra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Chamb - Responsive E-commerce HTML5 Template</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!--enable mobile device-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--fontawesome css-->
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!--bootstrap css-->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!--animate css-->
        <link rel="stylesheet" href="css/animate-wow.css">
        <!--main css-->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/bootstrap-select.min.css">
        <link rel="stylesheet" href="css/slick.min.css">
        <!--responsive css-->
        <link rel="stylesheet" href="css/responsive.css">
    </head>

    <body>
        <div class="cooming-soon-box">
            <div class="soon-gradient">
                <div class="map"></div>
                <div class="container">
                    <div class="row">
                        <p id="log-msg">${requestScope.MSG}</p>
                        <div class="col-lg-6 col-lg-offset-3">
                            <div class="top-soon clearfix">
                                <div class="col-md-6 col-sm-6 col-xs-6">
                                    <div class="cooming-logo">
                                        <a href="LogDataController"><img width="100px" src="images/logo_w.png" alt="" /></a>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-6">
                                    <ul class="right-flag">
                                        <li><a data-toggle="modal" data-target="#myModal" href="#"><span>Change</span> <img
                                                    src="images/flag.png" alt="" /></a></li>
                                    </ul>
                                </div>
                            </div>
                            <form action="LoginController" method="POST">
                                <div class="expand">
                                    <h4>${requestScope.MSG}</h4>
                                    <h2>Login</h2>
                                    <div class="inputBox">
                                        <input type="text" name="txtLoginUsername" value="" required="" />
                                        <label class="username">Username</label>
                                    </div>
                                    <div class="inputBox">
                                        <input type="password" name="txtLoginPassword" value="" required="" />
                                        <label>Password</label>
                                    </div>
                                </div>
                                <div class="expand">
                                    <button class="btn btn-primary">Login</button>
                                </div>
                                    <font color="red"><p>${requestScope.ERROR}</p></font>
                                    <font color="green"><p>${requestScope.MSG}</p></font>
                            </form>
                        </div>
                        <div class="col-md-12">
                            <div class="cooming-pc-box wow fadeIn">
                                <img src="images/cooming-pc.png" alt="" />
                            </div>
                        </div>
                        <div class="col-lg-6 col-lg-offset-3">
                            <form name="RegForm" action="RegisterController" method="POST">
                                <div class="expand">
                                    <h2>or Register</h2>
                                    <div class="inputBox">
                                        <input type="text" name="txtNewUsername" value="" required="" id="register_username" />
                                        <label class="username">Username</label>
                                    </div>
                                    <div class="inputBox">
                                        <input type="password" name="txtNewPassword" value="" required="" id="register_password"/>
                                        <label>Password</label>
                                    </div>
                                    <div class="inputBox">
                                        <input type="password" name="txtConfirm" value="" required="" id="register_confirm" />
                                        <label>Confirm</label>
                                    </div>
                                    <div class="inputBox">
                                        <input type="text" name="txtNewName" value="" required="" id="register_name" />
                                        <label>Full Name</label>
                                    </div>
                                    <div class="inputBox">
                                        <input type="email" name="txtNewEmail" value="" required="" id="register_email" onclick="register_validation()" />
                                        <label>Email</label>
                                    </div>
                                </div>
                                <div class="expand">
                                    <p id="register_message"></p>
                                </div>
                                <div class="expand">
                                    <button class="btn btn-primary">Register</button>
                                </div>
                                <div class="expand">
                                    <br/><br/><br/><br/><br/><br/>
                                </div>
                            </form>
                        </div>
                        <div class="bot-box">
                            <p>All Rights Reserved. Hantomi © 2021 | redragon12371@gmail.com</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade lug" id="myModal" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Change</h4>
                </div>
                <div class="modal-body">
                    <ul>
                        <li><a href="#"><img src="images/flag-up-1.png" alt="" /> United States</a></li>
                        <li><a href="#"><img src="images/flag-up-2.png" alt="" /> France </a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--main js-->
    <script src="js/jquery-1.12.4.min.js"></script>
    <!--bootstrap js-->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-select.min.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/wow.min.js"></script>
    <!--custom js-->
    <script src="js/custom.js"></script>
    <script>
                                    var password = document.getElementById("register_password")
                                            , confirm_password = document.getElementById("register_confirm");

                                    function validatePassword() {
                                        if (password.value != confirm_password.value) {
                                            confirm_password.setCustomValidity("Passwords Don't Match");
                                        } else {
                                            confirm_password.setCustomValidity('');
                                        }
                                    }

                                    password.onchange = validatePassword;
                                    confirm_password.onkeyup = validatePassword;
    </script>
</body>

</html>