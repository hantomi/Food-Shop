<%-- 
    Document   : product-view
    Created on : Jan 19, 2021, 11:14:45 AM
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
        <link rel="stylesheet" href="css/select2.min.css">
        <!--responsive css-->
        <link rel="stylesheet" href="css/responsive.css">
    </head>

    <body>
        <header id="header" class="top-head">
            <!-- Static navbar -->
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-4 col-sm-12 left-rs">
                            <div class="navbar-header">
                                <button type="button" id="top-menu" class="navbar-toggle collapsed" data-toggle="collapse"
                                        data-target="#navbar" aria-expanded="false">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a href="index.html" class="navbar-brand"><img src="images/logo.png" alt="" /></a>
                            </div>
                            <form class="navbar-form navbar-left web-sh">
                                <div class="form">
                                    <input type="text" class="form-control" placeholder="Search for products or companies">
                                </div>
                            </form>
                        </div>
                        <div class="col-md-8 col-sm-12">
                            <div class="right-nav">
                                <div class="login-sr">
                                    <div class="login-signup">
                                        <ul>
                                            <li><a href="#">${applicationScope.UserName}</a></li>
                                            <li><a class="custom-b" href="/J3.L.P0013/LogDataController">Logout</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="help-r hidden-xs">
                                    <div class="help-box">
                                        <ul>
                                            <li> <a data-toggle="modal" data-target="#myModal" href="#"> <span>Change</span> <img
                                                        src="images/flag.png" alt="" /> </a> </li>
                                            <li> <a href="#"><img class="h-i" src="images/help-icon.png" alt="" /> Help </a> </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="nav-b hidden-xs">
                                    <div class="nav-box">
                                        <ul>
                                            <li><a href="howitworks.html">How it works</a></li>
                                            <li><a href="about-us.html">Chamb for Business</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/.container-fluid -->
            </nav>
        </header>
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
        <div id="sidebar" class="top-nav">
            <ul id="sidebar-nav" class="sidebar-nav">
                <li><a href="#">Help</a></li>
                <li><a href="#">How it works</a></li>
                <li><a href="#">Chamb for Business</a></li>
            </ul>
        </div>
        <form action="/J3.L.P0013/DeleteAndUpdateController?productID=${requestScope.SelectedProduct.id}" method="POST">
            <div class="product-page-main">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="prod-page-title">
                                <a href="/J3.L.P0013/AdminLogProductController">Back to Previous Page</a>
                                <h2><input type="text" name="txtName" value="${requestScope.SelectedProduct.name}" placeholder="Product's Name" /></h2>
                                <p>From <span>Hanna Shop</span></p>
                                <font color="red">
                                <h4>${requestScope.MSG}</h4>
                                </font>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 col-sm-4">
                            <div class="left-profile-box-m prod-page">
                                <div class="pof-text">
                                    <h3>Approved</h3>
                                    <div class="check-box"></div>
                                </div>
                                <a href="#">Visit store</a>
                            </div>
                        </div>
                        <div class="col-md-7 col-sm-8">
                            <div class="md-prod-page">
                                <div class="md-prod-page-in">
                                    <div class="page-preview">
                                        <div class="preview">
                                            <div class="preview-pic tab-content">
                                                <div class="tab-pane active" id="pic-1"><img src="images/product/${requestScope.SelectedProduct.img}" alt="#" /></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="btn-dit-list clearfix">
                                        <div class="left-dit-p">
                                            <div class="prod-btn">
                                                <a href="#"><i class="fa fa-star" aria-hidden="true"></i> Save to wishlist</a>
                                                <a href="#"><i class="fa fa-thumbs-up" aria-hidden="true"></i> Like this</a>
                                                <p>23 likes</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="description-box">
                                    <div class="dex-a">
                                        <h4>Description</h4>
                                        <p>
                                            <textarea type="text" name="txtDescription" placeholder="Description" cols="100" rows="4">${requestScope.SelectedProduct.desc}</textarea>
                                        </p>
                                        <br>
                                    </div>
                                    <div class="spe-a">
                                        <h4>Specifications</h4>
                                        <ul>
                                            <li class="clearfix">
                                                <div class="col-md-4">
                                                    <h5>Stock</h5>
                                                </div>
                                                <div class="col-md-8">
                                                    <p><input type="text" value="${requestScope.SelectedProduct.stock}" name="txtStock"
                                                              onkeypress="return isNumberKey(event)" required="" /></p>
                                                </div>
                                            </li>
                                            <li class="clearfix">
                                                <div class="col-md-4">
                                                    <h5>Size</h5>
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="text" value="${requestScope.SelectedProduct.size}" name="txtSize" required=""/>
                                                </div>
                                            </li>
                                            <li class="clearfix">
                                                <div class="col-md-4">
                                                    <h5>Shipping</h5>
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="text" value="${requestScope.SelectedProduct.shipping}" name="txtShipping" required="" />
                                                </div>
                                            </li>
                                            <li class="clearfix">
                                                <div class="col-md-4">
                                                    <h5>Delivery</h5>
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="text" value="${requestScope.SelectedProduct.delivery}" name="txtDelivery" required="" />
                                                </div>
                                            </li>
                                            <br />
                                            <br />
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-12">
                            <div class="price-box-right">
                                <input type="hidden" name="txtID" value="${requestScope.SelectedProduct.id}" />
                                <h4>Price</h4>
                                <h3><input type="text" name="txtPrice" value="${requestScope.SelectedProduct.price}" required="">$</h3>
                                <p>Category <span>${requestScope.currCategory}</span></p>
                                <button name="action" value="Update">Update Product</button>
                                <button class="delete-btn" name="action" value="Delete">Delete Product</button>
                                <h5><i class="fa fa-clock-o" aria-hidden="true"></i> <strong><input type="text" value="${requestScope.SelectedProduct.deliveryTime}"
                                                                                                    name="txtDeliveryTime" /></strong> avg. delivery time</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <footer>
            <div class="main-footer">
                <div class="container">
                    <div class="row">
                        <div class="footer-top clearfix">
                            <div class="col-md-2 col-sm-6">
                                <h2>Start a free
                                    account today
                                </h2>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-box">
                                    <input type="text" placeholder="Enter yopur e-mail" />
                                    <button>Continue</button>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-12">
                                <div class="help-box-f">
                                    <h4>Question? Call us on 12 34 56 78 for help</h4>
                                    <p>Easy setup - no payment fees - up to 100 products for free</p>
                                </div>
                            </div>
                        </div>
                        <div class="footer-link-box clearfix">
                            <div class="col-md-6 col-sm-6">
                                <div class="left-f-box">
                                    <div class="col-sm-4">
                                        <h2>SELL ON chamb</h2>
                                        <ul>
                                            <li><a href="#">Create account</a></li>
                                            <li><a href="howitworks.html">How it works suppliers</a></li>
                                            <li><a href="pricing.html">Pricing</a></li>
                                            <li><a href="#">FAQ for Suppliers</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-4">
                                        <h2>BUY ON chamb</h2>
                                        <ul>
                                            <li><a href="#">Create account</a></li>
                                            <li><a href="#">How it works buyers</a></li>
                                            <li><a href="#">Categories</a></li>
                                            <li><a href="#">FAQ for buyers</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-4">
                                        <h2>COMPANY</h2>
                                        <ul>
                                            <li><a href="about-us.html">About chamb</a></li>
                                            <li><a href="#">Contact us</a></li>
                                            <li><a href="#">Press</a></li>
                                            <li><a href="#">Careers</a></li>
                                            <li><a href="#">Terms of use</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="right-f-box">
                                    <h2>INDUSTRIES</h2>
                                    <ul class="col-sm-4">
                                        <li><a href="#">Textiles</a></li>
                                        <li><a href="#">Furniture</a></li>
                                        <li><a href="#">Leather</a></li>
                                        <li><a href="#">Agriculture</a></li>
                                        <li><a href="#">Food & drinks</a></li>
                                    </ul>
                                    <ul class="col-sm-4">
                                        <li><a href="#">Office</a></li>
                                        <li><a href="#">Decoratives</a></li>
                                        <li><a href="#">Electronics</a></li>
                                        <li><a href="#">Machines</a></li>
                                        <li><a href="#">Building</a></li>
                                    </ul>
                                    <ul class="col-sm-4">
                                        <li><a href="#">Cosmetics</a></li>
                                        <li><a href="#">Health</a></li>
                                        <li><a href="#">Jewelry</a></li>
                                        <li><a href="#">See all here</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="copyright">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8">
                            <p><img width="90" src="images/logo.png" alt="#" style="margin-top: -5px;" /> All Rights Reserved.
                                Company Name © 2018</p>
                        </div>
                        <div class="col-md-4">
                            <ul class="list-inline socials">
                                <li>
                                    <a href="">
                                        <i class="fa fa-facebook" aria-hidden="true"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <i class="fa fa-twitter" aria-hidden="true"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <i class="fa fa-instagram" aria-hidden="true"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fa fa-linkedin" aria-hidden="true"></i>
                                    </a>
                                </li>
                            </ul>
                            <ul class="right-flag">
                                <li><a href="#"><img src="images/flag.png" alt="" /> <span>Change</span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!--main js-->
        <script src="js/jquery-1.12.4.min.js"></script>
        <!--bootstrap js-->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-select.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/select2.full.min.js"></script>
        <script src="js/wow.min.js"></script>
        <!--custom js-->
        <script src="js/custom.js"></script>
        <script>
                                                                  function isNumberKey(evt) {
                                                                      var charCode = (evt.which) ? evt.which : evt.keyCode
                                                                      if (charCode > 31 && (charCode < 48 || charCode > 57))
                                                                          return false;
                                                                      return true;
                                                                  }

        </script>
    </body>

</html>