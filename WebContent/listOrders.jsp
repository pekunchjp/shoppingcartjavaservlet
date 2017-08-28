<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@ page import="model.bean.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>Danh sách hóa đơn</title>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/style.css"/>
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
				<div>
					<h2 class="heading">Danh sách hóa đơn</h2>
				</div>
				<table class="table table-striped">
				<thead>
					<tr>
						<th>Mã hóa đơn</th>
						<th>Mã khách hàng</th>
						<th>Tổng tiền</th>
						<th>Trạng thái hóa đơn</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="p" items="${listOrders}">
						<tr>
						<th scope="row">${p.getOrderID()}</th>
						<td>${p.getCustomerID()}</td>
						<td>${p.getTotalAmount()}</td>
							<td>
								<c:forEach var="ot" items="${listOrderStatus}">
									<c:if test="${p.getOrderStatusID() == ot.getOrderStatusID() }">
										${ot.getName()}
									</c:if>
								</c:forEach>
							</td>
						<td>
							<a href="UpdateOrderServlet?customerID=${p.getOrderID()}">
								<span class="glyphicon glyphicon-edit"></span>
							</a> 
							<a href="DeleteOrderServlet?productID=${p.getOrderID()}" style="margin-left: 30px;">
								<span class="glyphicon glyphicon-trash"></span>
							</a>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>	
            </div>
        </div>
    </div>

    <footer class="container-fluid">
        <p>Copy right &copy; - Lazy Team</p>
        <p>15CNTT2 - Đại học Sư phạm Đà Nẵng - Đề tài báo cáo môn Nguyên Lí Ngôn Ngữ Lập Trình</p>
    </footer>
</body>
</html>