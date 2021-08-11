<%-- 
    Document   : admin-index
    Created on : Jan 13, 2021, 4:11:47 PM
    Author     : redra
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <header id="header" class="top-head">
            <!-- Static navbar -->
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-4 col-sm-12 left-rs">
                            <div class="navbar-header">
                                <button type="button" id="top-menu" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false"> 
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
                                            <li> <a data-toggle="modal" data-target="#myModal" href="#"> <span>Change</span> <img src="images/flag.png" alt="" /> </a> </li>
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
                <li><a href="howitworks.html">How it works</a></li>
                <li><a href="#">chamb for Business</a></li>
            </ul>
        </div>
        <div class="page-content-product">
            <div class="main-product">
                <div class="container">
                    <div class="row clearfix">
                        <form action="/J3.L.P0013/AdminSearchController" method="POST">
                            <div class="find-box">
                                <h1>Live healthy, Eat healthy</h1>
                                <h4>It has never been easier.</h4>
                                <div class="product-sh">
                                    <div class="col-sm-6">
                                        <div class="form-sh">
                                            <input type="text" placeholder="Search something you love" name="txtProductSearch" >
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-sh">
                                            <select class="selectpicker" name="cbbCategory">
                                                <option>none</option>
                                                <c:forEach var="cateDTO" items="${applicationScope.listCate}">
                                                    <option>${cateDTO.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-sh"> <button class="search-btn">Search</button> </div>
                                    </div>
                                    <br/>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="row clearfix">
                        <!--1 product-->
                        <c:forEach var="dto" items="${applicationScope.listProduct}">
                            <div class="col-lg-3 col-sm-6 col-md-3">
                                <a href="/J3.L.P0013/AdminProductLogController?productID=${dto.id}">
                                    <div class="box-img">
                                        <h4>${dto.name}</h4>
                                        <img src="images/product/${dto.img}" alt="" />
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                        <!--end of a product-->
                        <div class="categories_link">
                            <a href="/J3.L.P0013/AddProductLogController">Add New Product</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="products">
            <div class="main-products">
                <h2>TRENDING PRODUCTS</h2>
                <div class="product-slidr">
                    <div class="slider">
                        <div>
                            <div class="prod-box">
                                <div class="prod-i">
                                    <img src="images/product/Air-fryer-hamburgers.png" alt="#" />
                                </div>
                                <div class="prod-dit clearfix">
                                    <div class="dit-t clearfix">
                                        <div class="left-ti">
                                            <h4>Hamburger</h4>
                                            <p>By <span>Hanna Shop</span></p>
                                        </div>
                                        <a href="#">$5.77</a>
                                    </div>
                                    <div class="dit-btn clearfix">
                                        <a class="wis" href="#"><i class="fa fa-star" aria-hidden="true"></i> Save to wishlist </a>
                                        <a class="thi" href="#"><i class="fa fa-thumbs-up" aria-hidden="true"></i> Like this</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="prod-box">
                                <div class="prod-i">
                                    <img src="images/product/apple-juice.png" alt="#" />
                                </div>
                                <div class="prod-dit clearfix">
                                    <div class="dit-t clearfix">
                                        <div class="left-ti">
                                            <h4>Apple juice</h4>
                                            <p>By <span>Hanna Shop</span></p>
                                        </div>
                                        <a href="#">$3.22</a>
                                    </div>
                                    <div class="dit-btn clearfix">
                                        <a class="wis" href="#"><i class="fa fa-star" aria-hidden="true"></i> Save to wishlist </a>
                                        <a class="thi" href="#"><i class="fa fa-thumbs-up" aria-hidden="true"></i> Like this</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="prod-box">
                                <div class="prod-i">
                                    <img src="images/product/Chocolate-ice-cream.png" alt="#" />
                                </div>
                                <div class="prod-dit clearfix">
                                    <div class="dit-t clearfix">
                                        <div class="left-ti">
                                            <h4>Chocolate Ice Cream</h4>
                                            <p>By <span>Hanna Shop</span></p>
                                        </div>
                                        <a href="#">$3.77</a>
                                    </div>
                                    <div class="dit-btn clearfix">
                                        <a class="wis" href="#"><i class="fa fa-star" aria-hidden="true"></i> Save to wishlist </a>
                                        <a class="thi" href="#"><i class="fa fa-thumbs-up" aria-hidden="true"></i> Like this</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="prod-box">
                                <div class="prod-i">
                                    <img src="images/product/fried-chicken.png" alt="#" />
                                </div>
                                <div class="prod-dit clearfix">
                                    <div class="dit-t clearfix">
                                        <div class="left-ti">
                                            <h4>Fried Chicken</h4>
                                            <p>By <span>Hanna Shop</span></p>
                                        </div>
                                        <a href="#">$4.50</a>
                                    </div>
                                    <div class="dit-btn clearfix">
                                        <a class="wis" href="#"><i class="fa fa-star" aria-hidden="true"></i> Save to wishlist </a>
                                        <a class="thi" href="#"><i class="fa fa-thumbs-up" aria-hidden="true"></i> Like this</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="prod-box">
                                <div class="prod-i">
                                    <img src="images/product/vanilla_ice.png" alt="#" />
                                </div>
                                <div class="prod-dit clearfix">
                                    <div class="dit-t clearfix">
                                        <div class="left-ti">
                                            <h4>Vanilla Ice Cream</h4>
                                            <p>By <span>Hanna Shop</span></p>
                                        </div>
                                        <a href="#">$2.10</a>
                                    </div>
                                    <div class="dit-btn clearfix">
                                        <a class="wis" href="#"><i class="fa fa-star" aria-hidden="true"></i> Save to wishlist </a>
                                        <a class="thi" href="#"><i class="fa fa-thumbs-up" aria-hidden="true"></i> Like this</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="prod-box">
                                <div class="prod-i">
                                    <img src="images/product/pepsi.png" alt="#" />
                                </div>
                                <div class="prod-dit clearfix">
                                    <div class="dit-t clearfix">
                                        <div class="left-ti">
                                            <h4>Pepsi Cola</h4>
                                            <p>By <span>Hanna Shop</span></p>
                                        </div>
                                        <a href="#">$1.99</a>
                                    </div>
                                    <div class="dit-btn clearfix">
                                        <a class="wis" href="#"><i class="fa fa-star" aria-hidden="true"></i> Save to wishlist </a>
                                        <a class="thi" href="#"><i class="fa fa-thumbs-up" aria-hidden="true"></i> Like this</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="prod-box">
                                <div class="prod-i">
                                    <img src="images/product/French-Fries.png" alt="#" />
                                </div>
                                <div class="prod-dit clearfix">
                                    <div class="dit-t clearfix">
                                        <div class="left-ti">
                                            <h4>French Fries</h4>
                                            <p>By <span>Hanna Shop</span></p>
                                        </div>
                                        <a href="#">$4.70</a>
                                    </div>
                                    <div class="dit-btn clearfix">
                                        <a class="wis" href="#"><i class="fa fa-star" aria-hidden="true"></i> Save to wishlist </a>
                                        <a class="thi" href="#"><i class="fa fa-thumbs-up" aria-hidden="true"></i> Like this</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
                            <p>${applicationScope.UserName}</p>
                            <p><img width="90" src="images/logo.png" alt="#" style="margin-top: -5px;" /> All Rights Reserved. Company Name © 2018</p>
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
        <script src="js/wow.min.js"></script>
        <!--custom js--> 
        <script src="js/custom.js"></script>
    </body>
</html>