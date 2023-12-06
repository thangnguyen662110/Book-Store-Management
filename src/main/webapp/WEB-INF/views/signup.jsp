<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Semicolons &mdash; Book Store</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
	<link rel="stylesheet" href="/static/customer/fonts/icomoon/style.css">
	<link rel="stylesheet" href="/static/customer/css/bootstrap.min.css">
	<link rel="stylesheet" href="/static/customer/css/magnific-popup.css">
	<link rel="stylesheet" href="/static/customer/css/jquery-ui.css">
	<link rel="stylesheet" href="/static/customer/css/owl.carousel.min.css">
	<link rel="stylesheet" href="/static/customer/css/owl.theme.default.min.css">
	<link rel="stylesheet" href="/static/customer/css/aos.css">
	<link rel="stylesheet" href="/static/customer/css/style.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Dosis:wght@200;300;400;500;600;700;800&family=Fira+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
		  rel="stylesheet">
	<link rel="shortcut icon" type="image/png" href="/static/customer/images/logosemicolons.png"/>
	<link rel="stylesheet" href="/static/css/login.css">
</head>

<body>
<div class="site-wrap">
	<header class="site-navbar" role="banner">
		<div class="site-navbar-top">
			<div class="container">
				<div class="row align-items-center">

					<div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
						<form action="" class="site-block-top-search">
						</form>
					</div>

					<div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
						<div class="site-logo">
							<a href="" class="js-logo-clone">Semicolons</a>
						</div>
					</div>

					<div class="col-6 col-md-4 order-3 order-md-3 text-right">
						<div class="site-top-icons">
							<ul>
								<li><a href=""><span class="icon icon-person"></span></a></li>

								<li>
									<a href="" class="site-cart">
										<span class="icon icon-shopping_cart"></span>
										<span class="count"></span>
									</a>
								</li>
								<li class="d-inline-block d-md-none ml-md-0"><a href="#"
																				class="site-menu-toggle js-menu-toggle"><span
										class="icon-menu"></span></a></li>
							</ul>
						</div>
					</div>

				</div>
			</div>
		</div>
		<nav class="site-navigation text-right text-md-center" role="navigation">
			<div class="container">
				<ul class="site-menu js-clone-nav d-none d-md-block">
					<li>
						<a href="">HOME</a>
					</li>
					<li class="">
						<a href="">About</a>
					</li>
					<li><a href="">Shop</a></li>
					<li><a href="">Contact</a></li>
				</ul>
			</div>
		</nav>
	</header>
	<div class="main container-fluid p-0 mx-auto w-100"
		style="margin-top: 30px !important;">
		<div class="mx-auto w-50 h-50">
			<div class="form-login w-75 h-100 mx-auto">
				<form:form action="/signup" modelAttribute="acc" method="post">
					<%-- <form action="/signup" method="post"> --%>
						<div>
							<p>Tên Đăng Nhập:</p>
							<form:input path="tenDangNhap" class="w-100 rounded"
								type="text" placeholder="Nhập Tên Đăng Nhập"/>
							<form:errors path="tenDangNhap" class="err"/>
							<c:if test="${errUserNameExist}"><span class="err">Tên Đăng Nhập đã tồn tại trên Hệ Thống</span></c:if>

						</div>
						<div>
							<p class="mt-3">Mật Khẩu:</p>
							<form:input path="matKhau" class="w-100 rounded"
								type="password" placeholder="Nhập Mật Khẩu"/>
							<form:errors path="matKhau" class="err"/>
						</div>
						<div>
							<p class="mt-3">Xác Nhận Mật Khẩu:</p>
							<input name="xNMatKhau" class="w-100 rounded"
								type="password" placeholder="Nhập Xác Nhận Mật Khẩu" value="${xnMK}">
								<c:if test="${err}"><span class="err">Vui lòng nhập Xác Nhận Mật Khẩu</span></c:if>
								<c:if test="${errNoEquals}"><span class="err">Xác Nhận Mật Khẩu không trùng với Mật Khẩu</span></c:if>
						</div>
						<div>
							<p class="mt-3">Họ Và Tên:</p>
							<form:input path="tenNguoiDung" class="w-100 rounded"
								type="text" placeholder="Nhập Họ Và Tên"/>
							<form:errors path="tenNguoiDung" class="err"/>
						</div>
						<div>
							<p class="mt-3">Số Điện Thoại:</p>
							<form:input path="soDienThoai" class="w-100 rounded"
								type="text" placeholder="Nhập Số Điện Thoại"/>
							<form:errors path="soDienThoai" class="err"/>
						</div>
						<div class="mb-3">
							<p class="mt-3">Địa Chỉ:</p>
							<form:input path="diaChi" class="w-100 rounded"
										type="text" placeholder="Nhập Địa Chỉ"/>
							<form:errors path="diaChi" class="err"/>

						</div>
						<div class="mb-3">
							<p class="mt-3">Email:</p>
							<form:input path="email" class="w-100 rounded"
								type="email" placeholder="Nhập Địa Chỉ"/>
							<form:errors path="email" class="err"/>
						</div>

					<form:errors path="*" cssClass="err" element="span"/>

					<div class="w-75 mx-auto" style="text-align: center;">
						<c:if test="${mess}"><span class="success fs-5">Tạo Tài Khoản Thành Công</span></c:if>
						<button type="submit" class="w-100 mt-3 rounded btn-login">-- Sign Up --</button>
					</div>
					<div class="text-center mt-3 mb-4">
						<span>Have an account ?</span><a class="ms-2" href="/loginForm">Log In</a>
					</div>
					<%-- </form> --%>
				</form:form>
			</div>
		</div>
	</div>
	<footer class="site-footer border-top">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 mb-5 mb-lg-0">
					<div class="row">
						<div class="col-md-12">
							<h3 class="footer-heading mb-4">Điều hướng</h3>
						</div>
						<div class="col-md-6 col-lg-4">
							<ul class="list-unstyled">
								<li><a href="#">Bán trực tuyến</a></li>
								<li><a href="#">Đặc trưng</a></li>
								<li><a href="#">Giỏ hàng</a></li>
								<li><a href="#">Người xây dựng cửa hàng</a></li>
							</ul>
						</div>
						<div class="col-md-6 col-lg-4">
							<ul class="list-unstyled">
								<li><a href="#">Thương mại di động</a></li>
								<li><a href="#">Vận chuyển thả</a></li>
								<li><a href="#">Phát triển trang web</a></li>
							</ul>
						</div>
						<div class="col-md-6 col-lg-4">
							<ul class="list-unstyled">
								<li><a href="#">Điểm bán hàng</a></li>
								<li><a href="#">Phần cứng</a></li>
								<li><a href="#">Phần mềm</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 mb-4 mb-lg-0">
					<h3 class="footer-heading mb-4">Khuyến Mãi</h3>
					<a href="#" class="block-6">
						<img src="/static/customer/images/sach2.jpg" alt="Image placeholder"
							 class="img-fluid rounded mb-4">
						<h3 class="font-weight-light  mb-0">Tìm những cuốn sách hoàn hảo của bạn</h3>
						<p>Khuyến mãi từ 20 &mdash; 30/09, 2023</p>
					</a>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="block-5 mb-5">
						<h3 class="footer-heading mb-4">Thông tin liên hệ</h3>
						<ul class="list-unstyled">
							<li class="address">Đường Võ Nguyên Giáp, Hoài Mỹ, Hoài Nhơn, Bình Định</li>
							<li class="phone"><a href="tel://23923929210">+84376758600</a></li>
							<li class="email">ads.tranvannhan@gmail.com</li>
						</ul>
					</div>

					<div class="block-7">
						<form action="#" method="post">
							<label for="email_subscribe" class="footer-heading">Đăng ký</label>
							<div class="form-group">
								<input type="text" class="form-control py-4" id="email_subscribe" placeholder="Email">
								<input type="submit" class="btn btn-sm btn-primary" value="Gửi">
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="row pt-5 mt-5 text-center">
				<div class="col-md-12">
					<p>

						Copyright &copy;<script>document.write(new Date().getFullYear());</script> &mdash; Proudly
						created with Tran Van Nhan and Trinh Duy Bao</a>

					</p>
				</div>
			</div>
		</div>
	</footer>
</div>
<script src="/static/customer/js/jquery-3.3.1.min.js"></script>
<script src="/static/customer/js/jquery-ui.js"></script>
<script src="/static/customer/js/popper.min.js"></script>
<script src="/static/customer/js/bootstrap.min.js"></script>
<script src="/static/customer/js/owl.carousel.min.js"></script>
<script src="/static/customer/js/jquery.magnific-popup.min.js"></script>
<script src="/static/customer/js/aos.js"></script>
<script src="/static/customer/js/main.js"></script>
</body>

</html>