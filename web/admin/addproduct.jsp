<%-- 
    Document   : addproduct
    Created on : Jan 19, 2021, 9:36:20 PM
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
                      <a href="/index.jsp" class="navbar-brand"><img src="images/logo.png" alt="" /></a>
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
   <form action="/J3.L.P0013/AddProductController" method="POST" enctype="multipart/form-data">
      <div class="product-page-main">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="prod-page-title">
                      <h2><input type="text" name="txtName" value="" placeholder="Product's Name"/></h2> <h4><input type="text" name="txtID" value="" placeholder="Product's ID" /></h4>
                     <p>From <span>Hanna Shop</span></p>
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
                                 <div class="tab-pane active" id="pic-1">
                                    <h4>Choose your product picture</h4>
                                    <input type="file" name="file">
                                 </div>
                              </div>   
                           </div>
                        </div>
                     </div>
                     <div class="description-box">
                        <div class="dex-a">
                           <h4>Description</h4>
                           <p>
                              <textarea type="text" name="txtDescription" placeholder="Description" cols="80" rows="4"></textarea>
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
                                    <p><input type="text" value="" name="txtStock"
                                          onkeypress="return isNumberKey(event)" required="" placeholder="Stock" /></p>
                                 </div>
                              </li>
                              <li class="clearfix">
                                 <div class="col-md-4">
                                    <h5>Size</h5>
                                 </div>
                                 <div class="col-md-8">
                                    <p><input type="text" value="" name="txtSize" placeholder="Size" /></p>
                                 </div>
                              </li>
                              <li class="clearfix">
                                 <div class="col-md-4">
                                    <h5>Shipping</h5>
                                 </div>
                                 <div class="col-md-8">
                                    <p><input type="text" value="" name="txtShipping" placeholder="Shipping" /></p>
                                 </div>
                              </li>
                              <li class="clearfix">
                                 <div class="col-md-4">
                                    <h5>Delivery</h5>
                                 </div>
                                 <div class="col-md-8">
                                    <p><input type="text" value="" name="txtDelivery" placeholder="Delivery" /></p>
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
                     <h4>Price</h4>
                     <h3><input type="text" name="txtPrice" value="" placeholder="Price" required="">$</h3>
                     <p>Category</p>
                     <div class="box">
                        <select name="cbbCategory">
                            <c:forEach var="cateDTO" items="${requestScope.listCate}">
                                <option>${cateDTO.name}</option>
                            </c:forEach>
                        </select>
                     </div>
                     <a href="#"><button value="Add">Add Product</button></a>
                     <h5><i class="fa fa-clock-o" aria-hidden="true"></i> <strong><input type="text" value=""
                              name="txtDeliveryTime" placeholder="Delivery Time" /></strong> avg. delivery time</h5>
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