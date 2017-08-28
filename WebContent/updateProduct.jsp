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
	<div class="container-fluid">
		<div class="header">
  			<h1>Trang quản trị - LazyShop</h1>
		</div>
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
					<h2>Cập nhật sản phẩm  ${product.getName()}</h2>				
				</div>
				<form action="UpdateProductServlet" method="post"
    						id="signInForm"
    						data-fv-framework="bootstrap"
    						data-fv-icon-valid="glyphicon glyphicon-ok"
    						data-fv-icon-invalid="glyphicon glyphicon-remove"
    						data-fv-icon-validating="glyphicon glyphicon-refresh">
        					<div class="row form-group">
            					<label class="col-lg-3">Mã sản phẩm</label>
            					<div class="col-lg-6">
                					<input type="number" class=" form-control" name="productID" readonly="readonly" value="${product.getProductID() }"/>
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
                						required data-fv-notempty-message="The Product Name is required" value="${product.getName() }"/>
            					</div>
        					</div>
        					<div class="row form-group">
            					<label class="col-lg-3">Giá sản phẩm</label>
            					<div class="col-lg-6">
                					<input type="number" step="0.01" class=" form-control" name="price"
                						required data-fv-notempty-message="The price is required" value="${product.getPrice() }"/>
            					</div>
        					</div>
							<div class="row form-group">
            					<label class="col-lg-3">Mô tả</label>
            					<div class="col-lg-6">
                					<input type="text" class=" form-control" name="description" value="${product.getDescription() }"/>
            					</div>
        					</div>
        					<div class="row form-group">
            					<label class="col-lg-3">Link ảnh</label>
            					<div class="col-lg-6">
                					<input type="text" class=" form-control" name="image" value="${product.getImage() }"/>
            					</div>
        					</div>
        					<div class="row form-group">
            					<label class="col-lg-3">Số lượng</label>
            					<div class="col-lg-6">
                					<input type="number" class=" form-control" name="quantity" value="${product.getQuantity() }"/>
            					</div>
        					</div>
        					
        					<div class="row form-group">
            					<div class="col-lg-3 ">
                					<button class="btn btn-primary" type="submit" value="submit" name="submit">Cập nhật</button>
            					</div>
        					</div>
    					</form>
			</div>
        </div>
  		
    </div>

    <footer class="container-fluid">
        <p>Copy right &copy; - Lazy Team</p>
        <p>15CNTT2 - Đại học Sư phạm Đà Nẵng - Đề tài báo cáo môn Nguyên Lí Ngôn Ngữ Lập Trình</p>
    </footer>
</body>
</script>
</html>