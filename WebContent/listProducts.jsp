<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@ page import="model.bean.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>Danh sách sản phẩm</title>
<link rel="stylesheet" href="css/style.css"/>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.2.1.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<div class="modal fade" id="myModal88" tabindex="2" role="dialog"
		aria-labelledby="myModal88" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">${thongBao}</h4>
				</div>
				<div class="modal-body modal-body-sub">
					<div class="row">
						<div class="col-md-8 modal_body_left modal_body_left1"
							style="border-right: 1px dotted #C2C2C2; padding-right: 3em;">
							<div class="sap_tabs">
								<div id="horizontalTab"
									style="display: block; width: 100%; margin: 0px;">
									<ul>
										<li class="resp-tab-item" aria-controls="tab_item-0"><span>Sign
												in</span></li>
										<li class="resp-tab-item" aria-controls="tab_item-1"><span>Sign
												up</span></li>
									</ul>
									<div class="tab-1 resp-tab-content"
										aria-labelledby="tab_item-0">
										<div class="facts">
											<div class="register">
												<form action="LoginServlet" method="post">
													<input name="loginName" placeholder="Email Address"
														type="text" required=""> <input name="password"
														placeholder="Password" type="password" required="">
													<div class="sign-up">
														<input type="submit" value="Sign in" />
													</div>
												</form>
											</div>
										</div>
										<c:choose>
											<c:when
												test="${not empty loginResult && loginResult == false}">
												<p style="color: red">Login Failed. Please try again.</p>
												<script>
													$('#myModal88').modal(
															'show');
												</script>
											</c:when>
											<c:when
												test="${not empty loginResult && loginResult == true}">
												<p style="color: red">Login Successful.</p>
											</c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose>
									</div>

									<div class="tab-2 resp-tab-content"
										aria-labelledby="tab_item-1">
										<div class="facts">
											<div class="register">
												<form action="RegisterServlet" method="post">
													<input placeholder="Name" name="Name" type="text"
														required=""> <input placeholder="Email Address"
														name="Email" type="email" required=""> <input
														placeholder="Password" name="Password" type="password"
														required=""> <input placeholder="Confirm Password"
														name="Password" type="password" required="">
													<div class="sign-up">
														<input type="submit" value="Create Account" />
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
							<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
							<script type="text/javascript">
								$(document).ready(function() {
									$('#horizontalTab').easyResponsiveTabs({
										type : 'default', //Types: default, vertical, accordion           
										width : 'auto', //auto or any width like 600px
										fit : true
									// 100% fit in a container
									});
								});
							</script>
							<div id="OR" class="hidden-xs">OR</div>
						</div>
						<div class="col-md-4 modal_body_right modal_body_right1">
							<div class="row text-center sign-with">
								<div class="col-md-12">
									<h3 class="other-nw">Sign in with</h3>
								</div>
								<div class="col-md-12">
									<ul class="social">
										<li class="social_facebook"><a href="#"
											class="entypo-facebook"></a></li>
										<li class="social_dribbble"><a href="#"
											class="entypo-dribbble"></a></li>
										<li class="social_twitter"><a href="#"
											class="entypo-twitter"></a></li>
										<li class="social_behance"><a href="#"
											class="entypo-behance"></a></li>
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
				<h4>Hello ${loginName}      <a href="LogoutServlet" class="logout" style="display:inline; border: none">Logout</a></h4>
			</div>
			<div class="w3l_logo">
				<h1>
					<a href="HomeServlet">Trang Quản Trị LazyShop</a>
				</h1>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="container-fluid">
     	<div class="row content">
        	<div class="col-sm-3 sidenav">
            	<h3>Actors</h3>
                    <ul class="nav nav-pills nav-stacked">
                        <li><a href="ListCustomersServlet">Khách hàng</a></li>
                        <li><a href="ListProductsServlet">Hàng hóa</a></li>
                        <li><a href="ListOrdersServlet">Hóa đơn</a></li>
                    </ul><br>
                    <div class="input-group">
                    	<input type="text" class="form-control" placeholder="Search Something..">
                    	<span class="input-group-btn">
                        	<button class="btn btn-default" type="button">
                        		<span class="glyphicon glyphicon-search"></span>
                    		</button>
                        </span>
                    </div>
			</div>

            <div class="col-sm-9">
				<div class="heading">
					<h2>Danh sách hàng hóa</h2>
					<div class="row">
						<div class="col-sm-4">
							<div class="input-group">
                    			<input type="text" class="form-control" placeholder="Nhập mã sản phẩm ... ">
                    			<span class="input-group-btn">
                        			<button class="btn btn-default" type="button">
                        				<span class="glyphicon glyphicon-search"></span>
                    				</button>
                        		</span>
							</div>
						</div>
						<div class="col-sm-2">
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Thêm sản phẩm</button>
    
        				</div>
					</div>					
				</div>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Mã sản phẩm</th>
							<th>Loại sản phẩm</th>
							<th>Tên sản phẩm</th>
							<th>Giá sản phẩm</th>
							<th>Chi tiết sản phẩm</th>
							<th>Link ảnh</th>
							<th>Số lượng</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="p" items="${listProducts}">
							<tr>
								<th scope="row">${p.getProductID()}</th>
								<td>${p.getProductCategoryID()}</td>
								<td>${p.getName()}</td>
								<td>${p.getPrice()}</td>
								<td>${p.getDescription()}</td>
								<td>${p.getImage()}</td>
								<td>${p.getQuantity() }</td>
								<td>
									<a href="UpdateProductServlet?productID=${p.getProductID()}">
										<span class="glyphicon glyphicon-edit"></span>
									</a>
									<a href="DeleteProductServlet?productID=${p.getProductID()}" style="margin-left: 30px;">
										<span class="glyphicon glyphicon-trash"></span>
									</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
            </div>
        </div>
        
        
        <!-- Modal -->
  		<div class="modal fade" id="myModal" role="dialog">
    		<div class="modal-dialog">  
      			<!-- Modal content-->
      			<div class="modal-content">
        			<div class="modal-header">
          				<button type="button" class="close" data-dismiss="modal">&times;</button>
          				<h4 class="modal-title">Thêm sản phẩm mới</h4>
        			</div>
        			<div class="modal-body">
    					<form action="AddProductServlet" method="post"
    						id="signInForm"
    						data-fv-framework="bootstrap"
    						data-fv-icon-valid="glyphicon glyphicon-ok"
    						data-fv-icon-invalid="glyphicon glyphicon-remove"
    						data-fv-icon-validating="glyphicon glyphicon-refresh">
        					<div class="row form-group">
            					<label class="col-lg-3">Mã sản phẩm</label>
            					<div class="col-lg-6">
                					<input type="number" class=" form-control" name="productID"
                						required data-fv-notempty-message="The ProductID is required"/>
            					</div>
        					</div>
        					<div class="row form-group">
            					<label class="col-lg-3">Loại sản phẩm</label>
            					<div class="col-lg-6">
                					<select class="form-control" name="productCategoryID" 
                						required data-fv-notempty-message="The ProductCategoryID is required">
                						<c:forEach var="p" items="${listProductCategory}">
                							<option value="${p.getProductCategoryID()}"> ${p.getName()} </option>
                						</c:forEach>
                					</select>
            					</div>
        					</div>
        					
        					<div class="row form-group">
            					<label class="col-lg-3">Tên sản phẩm</label>
            					<div class="col-lg-6">
                					<input type="text" class=" form-control" name="name"
                						required data-fv-notempty-message="The Product Name is required"/>
            					</div>
        					</div>
        					<div class="row form-group">
            					<label class="col-lg-3">Giá sản phẩm</label>
            					<div class="col-lg-6">
                					<input type="number" step="0.01" class=" form-control" name="price"
                						required data-fv-notempty-message="The price is required"/>
            					</div>
        					</div>
							<div class="row form-group">
            					<label class="col-lg-3">Mô tả</label>
            					<div class="col-lg-6">
                					<input type="text" class=" form-control" name="description"/>
            					</div>
        					</div>
        					<div class="row form-group">
            					<label class="col-lg-3">Link ảnh</label>
            					<div class="col-lg-6">
                					<input type="text" class=" form-control" name="image"/>
            					</div>
        					</div>
        					<div class="row form-group">
            					<label class="col-lg-3">Số lượng nhập hàng</label>
            					<div class="col-lg-6">
                					<input type="number" class=" form-control" name="quantity"/>
            					</div>
        					</div>
        					
        					<div class="row form-group">
            					<div class="col-lg-3 ">
                					<button class="btn btn-primary" type="submit" value="submit" name="submit">Thêm mới</button>
            					</div>
        					</div>
    					</form>
        			</div>
        			<div class="modal-footer">
          				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        			</div>
      			</div>   
    		</div>
  		</div>
  				
    </div>

    <footer class="container-fluid">
        <p>Copy right &copy; - Lazy Team</p>
        <p>15CNTT2 - Đại học Sư phạm Đà Nẵng - Đề tài báo cáo môn Nguyên Lí Ngôn Ngữ Lập Trình</p>
    </footer>
</body>
<script>
$(document).ready(function() {
    $('#signInForm').formValidation();
});
</script>
</html>