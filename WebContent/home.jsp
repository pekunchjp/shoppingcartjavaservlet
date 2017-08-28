
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=charset=utf-8">
<title>Lazy Shop</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/fasthover.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script src="js/jquery.min.js"></script>
<!-- //js -->
<!-- countdown -->
<link rel="stylesheet" href="css/jquery.countdown.css" />
<!-- //countdown -->
<!-- cart -->
<script src="js/simpleCart.min.js"></script>
<!-- cart -->
<!-- for bootstrap working -->
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //for bootstrap working -->
<link href='//fonts.googleapis.com/css?family=Glegoo:400,700' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<!-- start-smooth-scrolling -->
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- //end-smooth-scrolling -->
</head>
	
<body>
	<!-- header -->
	<div class="modal fade" id="myModal88" tabindex="2" role="dialog" aria-labelledby="myModal88"
		aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;</button>
					<h4 class="modal-title" id="myModalLabel">
						${thongBao}</h4>
				</div>
				<div class="modal-body modal-body-sub">
					<div class="row">
						<div class="col-md-8 modal_body_left modal_body_left1" style="border-right: 1px dotted #C2C2C2;padding-right:3em;">
							<div class="sap_tabs">	
								<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
									<ul>
										<li class="resp-tab-item" aria-controls="tab_item-0"><span>Sign in</span></li>
										<li class="resp-tab-item" aria-controls="tab_item-1"><span>Sign up</span></li>
									</ul>		
									<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
										<div class="facts">
											<div class="register">
												<form action="LoginServlet" method="post">			
													<input name="loginName" placeholder="Email Address" type="text" required="">						
													<input name="password" placeholder="Password" type="password" required="">										
													<div class="sign-up">
														<input type="submit" value="Sign in"/>
													</div>
												</form>
											</div>
										</div> 
										<c:choose>
  											<c:when test="${not empty loginResult && loginResult == false}">
  												<p style="color:red"> Login Failed. Please try again. </p> 
  												<script>
													$('#myModal88').modal('show');
												</script> 
  											</c:when>
  											<c:when test="${not empty loginResult && loginResult == true}">
												<p style="color:red"> Login Successful. </p>
  											</c:when>
  											<c:otherwise>
  											</c:otherwise>
										</c:choose>
									</div>	

									<div class="tab-2 resp-tab-content" aria-labelledby="tab_item-1">
										<div class="facts">
											<div class="register">
												<form action="RegisterServlet" method="post">			
													<input placeholder="Name" name="Name" type="text" required="">
													<input placeholder="Email Address" name="Email" type="email" required="">	
													<input placeholder="Password" name="Password" type="password" required="">	
													<input placeholder="Confirm Password" name="Password" type="password" required="">
													<div class="sign-up">
														<input type="submit" value="Create Account"/>
													</div>
												</form>
											</div>
										</div>
										<c:choose>
  											<c:when test="${not empty resgiterResult && resgiterResult == false}">
  												<p style="color:red"> Resgister Failed. Please try again.</p> 
  												<script>
													$('#myModal88').modal('show');
												</script> 
  											</c:when>
  											<c:when test="${not empty loginResult && loginResult == true}">
												<p style="color:red"> Resgister Successful. </p>
  											</c:when>
  											<c:otherwise>
  											</c:otherwise>
										</c:choose>
									</div> 			        					            	      
								</div>	
							</div>
							<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
							<script type="text/javascript">
								$(document).ready(function () {
									$('#horizontalTab').easyResponsiveTabs({
										type: 'default', //Types: default, vertical, accordion           
										width: 'auto', //auto or any width like 600px
										fit: true   // 100% fit in a container
									});
								});
							</script>
							<div id="OR" class="hidden-xs">
								OR</div>
						</div>
						<div class="col-md-4 modal_body_right modal_body_right1">
							<div class="row text-center sign-with">
								<div class="col-md-12">
									<h3 class="other-nw">
										Sign in with</h3>
								</div>
								<div class="col-md-12">
									<ul class="social">
										<li class="social_facebook"><a href="#" class="entypo-facebook"></a></li>
										<li class="social_dribbble"><a href="#" class="entypo-dribbble"></a></li>
										<li class="social_twitter"><a href="#" class="entypo-twitter"></a></li>
										<li class="social_behance"><a href="#" class="entypo-behance"></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="header">
		<div class="container">
			<div class="w3l_login">
				<c:choose>
  					<c:when test="${not empty loginResult && loginResult == true}">
  						<div class="row">
  							<h4>Hello ${loginName}      <a href="LogoutServlet" class="logout" style="display:inline; border: none">Logout</a></h4>
  						</div>
  					</c:when>
  					<c:otherwise>
  						<a href="#" data-toggle="modal" data-target="#myModal88"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a>
  					</c:otherwise>
				</c:choose>
				
			</div>
			<div class="w3l_logo">
				<h1><a href="HomeServlet">Lazy Fashion Shop<span>For Fashion Lovers</span></a></h1>
			</div>
			<div class="search">
				<input class="search_box" type="checkbox" id="search_box">
				<label class="icon-search" for="search_box"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></label>
				<div class="search_form">
					<form action="#" method="post">
						<input type="text" name="Search" placeholder="Search...">
						<input type="submit" value="Send">
					</form>
				</div>
			</div>
			<div class="cart box_1">
				<a href="CartServlet">
					<img src="images/bag.png" alt="" />
				</a>
				<div class="clearfix"> </div>
			</div>	
			<div class="clearfix"> </div>
		</div>
	</div>
	
	<div class="navigation">
		<div class="container">
			<nav class="navbar navbar-default">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header nav_2">
					<button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div> 
				<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
					<ul class="nav navbar-nav">
						<li class="active"><a href="HomeServlet" class="act">Home</a></li>	
						<!-- Mega Menu -->
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Products<b class="caret"></b></a>
							<ul class="dropdown-menu multi-column columns-3">
								<div class="row">
									<c:forEach items="listProductCategorys">
									<div class="col-sm-3">
										<ul class="multi-column-dropdown">
											<h6>Clothing</h6>
											<li><a href="CategoryServlet?categoryID=${listProductCategorys[0].getProductCategoryID()}">${listProductCategorys[0].getName()}</a></li>
											<li><a href="CategoryServlet?categoryID=${listProductCategorys[1].getProductCategoryID()}">${listProductCategorys[1].getName()}</a></li>
											<li><a href="CategoryServlet?categoryID=${listProductCategorys[2].getProductCategoryID()}">${listProductCategorys[2].getName()}</a></li>
											<li><a href="CategoryServlet?categoryID=${listProductCategorys[3].getProductCategoryID()}">${listProductCategorys[3].getName()}</a></li>
											<li><a href="CategoryServlet?categoryID=${listProductCategorys[4].getProductCategoryID()}">${listProductCategorys[4].getName()}</a></li>
										</ul>
									</div>
									<div class="col-sm-3">
										<ul class="multi-column-dropdown">
											<h6>Ethnic Wear</h6>
											<li><a href="CategoryServlet?categoryID=${listProductCategorys[5].getProductCategoryID()}">${listProductCategorys[5].getName()}</a></li>
											<li><a href="CategoryServlet?categoryID=${listProductCategorys[6].getProductCategoryID()}">${listProductCategorys[6].getName()}</a></li>
											<li><a href="CategoryServlet?categoryID=${listProductCategorys[7].getProductCategoryID()}">${listProductCategorys[7].getName()}</a></li>
											<li><a href="NewProductServlet"><i>New in clothing</i></a></li>
										</ul>
									</div>
									<div class="col-sm-2">
										<ul class="multi-column-dropdown">
											<h6>Foot Wear</h6>
											<li><a href="CategoryServlet?categoryID=${listProductCategorys[5].getProductCategoryID()}">${listProductCategorys[8].getName()}</a></li>
											<li><a href="CategoryServlet?categoryID=${listProductCategorys[6].getProductCategoryID()}">${listProductCategorys[9].getName()}</a></li>
											<li><a href="CategoryServlet?categoryID=${listProductCategorys[7].getProductCategoryID()}">${listProductCategorys[10].getName()}</a></li>
											<li><a href="CategoryServlet?categoryID=${listProductCategorys[8].getProductCategoryID()}">${listProductCategorys[11].getName()}</a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
									</c:forEach>
								</div>
							</ul>
						</li>
						<li><a href="about.html">About Us</a></li>
						<li><a href="short-codes.html">Short Codes</a></li>
						<li><a href="mail.html">Mail Us</a></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
<!-- //header -->
	<!-- banner -->
	<div class="banner" id="home1">
		<div class="container">
			<h3>fashions fade, <span>style is eternal</span></h3>
		</div>
	</div>
<!-- //banner -->
<!-- banner-bottom -->
	<div class="banner-bottom">
		<div class="container">
			<div class="col-md-5 wthree_banner_bottom_left">
				<div class="video-img">
					<a class="play-icon popup-with-zoom-anim" href="#small-dialog">
						<span class="glyphicon glyphicon-expand" aria-hidden="true"></span>
					</a>
				</div>
				<!-- pop-up-box -->    
						<link href="css/popuo-box.css" rel="stylesheet" type="text/css" property="" media="all" />
						<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
					<!--//pop-up-box -->
					<div id="small-dialog" class="mfp-hide">
						<iframe src="https://player.vimeo.com/video/23259282?title=0&byline=0&portrait=0"></iframe>
					</div>
					<script>
						$(document).ready(function() {
						$('.popup-with-zoom-anim').magnificPopup({
							type: 'inline',
							fixedContentPos: false,
							fixedBgPos: true,
							overflowY: 'auto',
							closeBtnInside: true,
							preloader: false,
							midClick: true,
							removalDelay: 300,
							mainClass: 'my-mfp-zoom-in'
						});
																						
						});
					</script>
			</div>
			<!-- end left -->
			<div class="col-md-7 wthree_banner_bottom_right">
				<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
					<ul id="myTab" class="nav nav-tabs" role="tablist">
						<li role="presentation"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" values="${listProductCategorys[0].getProductCategoryID()}">${listProductCategorys[0].getName()}</a></li>
						<li role="presentation"><a href="#skirts" role="tab" id="skirts-tab" data-toggle="tab" aria-controls="skirts" values="${listProductCategorys[1].getProductCategoryID() }">${listProductCategorys[1].getName()}</a></li>
						<li role="presentation"><a href="#watches" role="tab" id="watches-tab" data-toggle="tab" aria-controls="watches" values="${listProductCategorys[2].getProductCategoryID() }">${listProductCategorys[2].getName()}</a></li>
						<li role="presentation"><a href="#sandals" role="tab" id="sandals-tab" data-toggle="tab" aria-controls="sandals" values="${listProductCategorys[3].getProductCategoryID() }">${listProductCategorys[3].getName()}</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">
							<div class="agile_ecommerce_tabs">	
								<c:forEach var="p" items="${listProducts1}" begin="0" end="2" step="1" varStatus="loop">
									<div class="col-md-4 agile_ecommerce_tab_left">
										<div class="hs-wrapper">
											<img src="${p.getImage()}" alt=" " class="img-responsive" />
										</div>
										<div class="simpleCart_shelfItem">
											<p><i class="item_price">$${p.getPrice()}</i></p>
											<h5><a href="DetailServlet?productID=${p.getProductID()}">${p.getName()}</a></h5>
											<c:choose>
											<c:when test="${p.getQuantity() > 0 }">
												<p><a class="item_add" href="OrderServlet?productID=${p.getProductID()}">Add to cart</a></p>
											</c:when>
											<c:otherwise>
												<p class="hethang">Out Of Stock</p>
											</c:otherwise>
											</c:choose>
										</div>
									</div>
								</c:forEach>	
								<!-- end 1 tag_left -->
								<div class="clearfix"> </div>
							</div>
							<!-- end con cua hometag -->
						</div>
						<!-- end hometag -->
						<div role="tabpanel" class="tab-pane fade" id="skirts" aria-labelledby="skirts-tab">
							<div class="agile_ecommerce_tabs">							
								<c:forEach var="p" items="${listProducts2}" begin="0" end="2" step="1" varStatus="loop">
									<div class="col-md-4 agile_ecommerce_tab_left">
										<div class="hs-wrapper">
											<img src="${p.getImage()}" alt=" " class="img-responsive" />
										</div>
										<div class="simpleCart_shelfItem">
											<p><i class="item_price">$${p.getPrice()}</i></p>
											<h5><a href="DetailServlet?productID=${p.getProductID()}">${p.getName()}</a></h5>
											<c:choose>
											<c:when test="${p.getQuantity() > 0 }">
												<p><a class="item_add" href="OrderServlet?productID=${p.getProductID()}">Add to cart</a></p>
											</c:when>
											<c:otherwise>
												<p class="hethang">Out Of Stock</p>
											</c:otherwise>
											</c:choose>
										</div>
									</div>
								</c:forEach>
								<div class="clearfix"> </div>
							</div>
							<!-- end con của skirtag -->
						</div>
						<!-- end skỉttag -->
						<div role="tabpanel" class="tab-pane fade" id="watches" aria-labelledby="watches-tab">
							<div class="agile_ecommerce_tabs">
								<c:forEach var="p" items="${listProducts3}" begin="0" end="2" step="1" varStatus="loop">
									<div class="col-md-4 agile_ecommerce_tab_left">
										<div class="hs-wrapper">
											<img src="${p.getImage()}" alt=" " class="img-responsive" />
										</div>
										<div class="simpleCart_shelfItem">
											<p><i class="item_price">$${p.getPrice()}</i></p>
											<h5><a href="DetailServlet?productID=${p.getProductID()}">${p.getName()}</a></h5>
											<c:choose>
											<c:when test="${p.getQuantity() > 0 }">
												<p><a class="item_add" href="OrderServlet?productID=${p.getProductID()}">Add to cart</a></p>
											</c:when>
											<c:otherwise>
												<p class="hethang">Out Of Stock</p>
											</c:otherwise>
											</c:choose>
										</div>
									</div>
								</c:forEach>
								<div class="clearfix"> </div>
							</div>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="sandals" aria-labelledby="sandals-tab">
							<div class="agile_ecommerce_tabs">
								<c:forEach var="p" items="${listProducts4}" begin="0" end="2" step="1" varStatus="loop">
									<div class="col-md-4 agile_ecommerce_tab_left">
										<div class="hs-wrapper">
											<img src="${p.getImage()}" alt=" " class="img-responsive" />
										</div>
										<div class="simpleCart_shelfItem">
											<p><i class="item_price">$${p.getPrice()}</i></p>
											<h5><a href="DetailServlet?productID=${p.getProductID()}">${p.getName()}</a></h5>
											<c:choose>
											<c:when test="${p.getQuantity() > 0 }">
												<p><a class="item_add" href="OrderServlet?productID=${p.getProductID()}">Add to cart</a></p>
											</c:when>
											<c:otherwise>
												<p class="hethang">Out Of Stock</p>
											</c:otherwise>
											</c:choose>
										</div>
									</div>
								</c:forEach>
								<div class="clearfix"> </div>
							</div>
						</div>
					</div>
					<!-- end tabcontent -->
				</div>
				<!-- end tab -->
			</div>
			<!-- end right -->
			<div class="clearfix"> </div>
		</div>
		<!-- end container -->
	</div>
<!-- //banner-bottom -->


<!-- banner-bottom1 -->
	<div class="banner-bottom1">
		<div class="agileinfo_banner_bottom1_grids">
			<div class="col-md-7 agileinfo_banner_bottom1_grid_left">
				<h3>Grand Opening Event With flat<span>20% <i>Discount</i></span></h3>
				<a href="products.html">Shop Now</a>
			</div>
			<div class="col-md-5 agileinfo_banner_bottom1_grid_right">
				<h4>hot deal</h4>
				<div class="timer_wrap">
					<div id="counter"> </div>
				</div>
				<script src="js/jquery.countdown.js"></script>
				<script src="js/script.js"></script>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //banner-bottom1 -->

<!-- new-products -->
	<div class="new-products">
		<div class="container">
			<h3>New Products</h3>
			<div class="agileinfo_new_products_grids">
				<c:forEach var="p" items="${listProducts}" begin="0" end="3" step="1" varStatus="loop">
				<div class="col-md-3 agileinfo_new_products_grid">
					<div class="agile_ecommerce_tab_left agileinfo_new_products_grid1">
						<div class="hs-wrapper hs-wrapper1">
							<img src="${p.getImage()}" alt=" " class="img-responsive" />
						</div>
						<div class="simpleCart_shelfItem">
							<p><i class="item_price">$${p.getPrice()}</i></p>
							<h5><a href="DetailServlet?productID=${p.getProductID()}">${p.getName()}</a></h5>
							<c:choose>
								<c:when test="${p.getQuantity() > 0 }">
									<p><a class="item_add" href="OrderServlet?productID=${p.getProductID()}">Add to cart</a></p>
								</c:when>
								<c:otherwise>
									<p class="hethang">Out Of Stock</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				</c:forEach>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!-- //new-products -->
<!-- top-brands -->
	<div class="top-brands">
		<div class="container">
			<h3>Top Brands</h3>
			<div class="sliderfig">
				<ul id="flexiselDemo1">			
					<li>
						<img src="images/4.png" alt=" " class="img-responsive" />
					</li>
					<li>
						<img src="images/5.png" alt=" " class="img-responsive" />
					</li>
					<li>
						<img src="images/6.png" alt=" " class="img-responsive" />
					</li>
					<li>
						<img src="images/7.png" alt=" " class="img-responsive" />
					</li>
					<li>
						<img src="images/46.jpg" alt=" " class="img-responsive" />
					</li>
				</ul>
			</div>
					<script type="text/javascript">
							$(window).load(function() {
								$("#flexiselDemo1").flexisel({
									visibleItems: 4,
									animationSpeed: 1000,
									autoPlay: true,
									autoPlaySpeed: 3000,    		
									pauseOnHover: true,
									enableResponsiveBreakpoints: true,
									responsiveBreakpoints: { 
										portrait: { 
											changePoint:480,
											visibleItems: 1
										}, 
										landscape: { 
											changePoint:640,
											visibleItems:2
										},
										tablet: { 
											changePoint:768,
											visibleItems: 3
										}
									}
								});
								
							});
					</script>
					<script type="text/javascript" src="js/jquery.flexisel.js"></script>
		</div>
	</div>
<!-- //top-brands -->
<!-- newsletter -->
	<div class="newsletter">
		<div class="container">
			<div class="col-md-6 w3agile_newsletter_left">
				<h3>Newsletter</h3>
				<p>Excepteur sint occaecat cupidatat non proident, sunt.</p>
			</div>
			<div class="col-md-6 w3agile_newsletter_right">
				<form action="#" method="post">
					<input type="email" name="Email" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" required="">
					<input type="submit" value="" />
				</form>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //newsletter -->
<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="w3_footer_grids">
				<div class="col-md-3 w3_footer_grid">
					<h3>Contact</h3>
					<p>Duis aute irure dolor in reprehenderit in voluptate velit esse.</p>
					<ul class="address">
						<li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>1234k Avenue, 4th block, <span>New York City.</span></li>
						<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:info@example.com">info@example.com</a></li>
						<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>+1234 567 567</li>
					</ul>
				</div>
				<div class="col-md-3 w3_footer_grid">
					<h3>Information</h3>
					<ul class="info"> 
						<li><a href="about.html">About Us</a></li>
						<li><a href="mail.html">Contact Us</a></li>
						<li><a href="short-codes.html">Short Codes</a></li>
						<li><a href="faq.html">FAQ's</a></li>
						<li><a href="products.html">Special Products</a></li>
					</ul>
				</div>
				<div class="col-md-3 w3_footer_grid">
					<h3>Category</h3>
					<ul class="info"> 
						<li><a href="dresses.html">Dresses</a></li>
						<li><a href="sweaters.html">Sweaters</a></li>
						<li><a href="shirts.html">Shirts</a></li>
						<li><a href="sarees.html">Sarees</a></li>
						<li><a href="skirts.html">Shorts & Skirts</a></li>
					</ul>
				</div>
				<div class="col-md-3 w3_footer_grid">
					<h3>Profile</h3>
					<ul class="info"> 
						<li><a href="products.html">Summer Store</a></li>
						<li><a href="checkout.html">My Cart</a></li>
					</ul>
					<h4>Follow Us</h4>
					<div class="agileits_social_button">
						<ul>
							<li><a href="#" class="facebook"> </a></li>
							<li><a href="#" class="twitter"> </a></li>
							<li><a href="#" class="google"> </a></li>
							<li><a href="#" class="pinterest"> </a></li>
						</ul>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
		<div class="footer-copy">
			<div class="footer-copy1">
				<div class="footer-copy-pos">
					<a href="#home1" class="scroll"><img src="images/arrow.png" alt=" " class="img-responsive" /></a>
				</div>
			</div>
			<div class="container">
				<p>&copy; 2016 Women's Fashion. All rights reserved | Design by <a href="http://w3layouts.com/">W3layouts</a></p>
			</div>
		</div>
	</div>
<!-- //footer -->
</body>
</html>