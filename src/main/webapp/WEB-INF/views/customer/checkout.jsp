<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Semicolons &mdash; Book Store</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
<link rel="stylesheet" href="/static/customer/fonts/icomoon/style.css">

<link rel="stylesheet" href="/static/customer/css/bootstrap.min.css">
<link rel="stylesheet" href="/static/customer/css/magnific-popup.css">
<link rel="stylesheet" href="/static/customer/css/jquery-ui.css">
<link rel="stylesheet" href="/static/customer/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="/static/customer/css/owl.theme.default.min.css">


<link rel="stylesheet" href="/static/customer/css/aos.css">

<link rel="stylesheet" href="/static/customer/css/style.css">
<link rel="shortcut icon" type="image/png"
	href="/static/customer/images/logosemicolons.png" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Dosis:wght@200;300;400;500;600;700;800&family=Fira+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">

</head>
<body>

	<div class="site-wrap">
		<header class="site-navbar" role="banner">
			<div class="site-navbar-top">
				<div class="container">
					<div class="row align-items-center">

						<div
							class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
							<form action="" class="site-block-top-search"></form>
						</div>

						<div
							class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
							<div class="site-logo">
								<a href="/indexCustomer" class="js-logo-clone">Semicolons</a>
							</div>
						</div>

						<div class="col-6 col-md-4 order-3 order-md-3 text-right">
							<div class="site-top-icons">
								<ul>
									<li><a href="/myprofileCustomer"><span class="icon icon-person"></span></a></li>
									<!-- <li><a href="#"><span class="icon icon-heart-o"></span></a></li> -->
									<li><a href="/view-to-cart" class="site-cart"> <span
											class="icon icon-shopping_cart"></span> <span class="count">${cartsize}</span>
									</a></li>
								</ul>
							</div>
						</div>

					</div>
				</div>
			</div>
			<nav class="site-navigation text-right text-md-center"
				role="navigation">
				<div class="container">
					<ul class="site-menu js-clone-nav d-none d-md-block">
						<li><a href="/indexCustomer">HOME</a></li>
						<li class=""><a href="/aboutCustomer">About</a></li>
						<li><a href="/shopCustomer">Shop</a></li>
						<li><a href="/contactCustomer">Contact</a></li>
					</ul>
				</div>
			</nav>
		</header>

		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="/indexCustomer">Home</a> <span class="mx-2 mb-0">/</span>
						<a href="/view-to-cart">Cart</a> <span class="mx-2 mb-0">/</span>
						<strong class="text-black">Checkout</strong>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">

				<div class="row">
					<div class="col-md-6 mb-5 mb-md-0">
						<h2 class="h3 mb-3 text-black">Chi tiết thanh toán</h2>
						<div class="p-3 p-lg-5 border">
							<div class="form-group row">
								<div class="col-md-12">
									<label for="c_fname" class="text-black">Họ Và Tên <span
										class="text-danger">*</span></label> <input type="text"
										class="form-control" id="c_fname" name="c_fname"
										value="${nguoiDung.tenNguoiDung}" disabled>
								</div>
							</div>

							<div class="form-group row">
								<div class="col-md-12">
									<label for="c_address" class="text-black">Địa Chỉ <span
										class="text-danger">*</span></label> <input type="text"
										class="form-control" id="c_address" name="c_address"
										placeholder="Street address" value="${nguoiDung.diaChi}"
										disabled>
								</div>
							</div>

							<div class="form-group row">
								<div class="col-md-12">
									<label for="c_phone" class="text-black">Số Điện Thoại <span
										class="text-danger">*</span></label> <input type="text"
										class="form-control" id="c_phone" name="c_phone"
										placeholder="Phone Number" value="${nguoiDung.soDienThoai}"
										disabled>
								</div>
							</div>

                            <div class="form-group row mb-5">
                                <div class="col-md-12">
                                    <label for="c_email" class="text-black">Email <span
                                            class="text-danger">*</span></label> <input type="text"
                                                                                        class="form-control" id="c_email" name="c_phone"
                                                                                        placeholder="Phone Number" value="${nguoiDung.email}"
                                                                                        disabled>
                                </div>
                            </div>

						</div>
					</div>
					<div class="col-md-6">
						<div class="row mb-5">
							<div class="col-md-12">
								<h2 class="h3 mb-3 text-black">Đơn hàng của bạn</h2>
								<div class="p-3 p-lg-5 border">
									<table class="table site-block-order-table mb-5">
										<thead>
											<th>Sản Phẩm</th>
											<th>Tổng tiền</th>
										</thead>
										<tbody>
											<c:forEach var="item" items="${cart}">
												<tr>
													<td>${item.tensach}<strong class="mx-2">x</strong>
														${item.soluong}
													</td>
													<td>${item.soluong * item.gia}</td>
												</tr>
											</c:forEach>
											<tr>
												<td class="text-black font-weight-bold"><strong>Tổng
														tiền đơn hàng</strong></td>
												<td class="text-black font-weight-bold"><strong>$
														${tongtien}</strong></td>
											</tr>
										</tbody>
									</table>

									<div class="border p-3 mb-3">
										<h3 class="h6 mb-0">
											<a class="d-block" data-toggle="collapse"
												href="#collapsebank" role="button" aria-expanded="false"
												aria-controls="collapsebank">Chuyển khoản trực tiếp</a>
										</h3>

										<div class="collapse" id="collapsebank">
											<div class="py-2">
												<p class="mb-0">Thực hiện thanh toán trực tiếp vào tài
													khoản ngân hàng của chúng tôi. Vui lòng sử dụng ID đơn hàng
													của bạn làm tài liệu tham khảo thanh toán. Đơn đặt hàng của
													bạn sẽ không được giao cho đến khi tiền đã được xóa trong
													tài khoản của chúng tôi.</p>
											</div>
										</div>
									</div>

									<div class="border p-3 mb-5">
										<h3 class="h6 mb-0">
											<a class="d-block" data-toggle="collapse"
												href="#collapsepaypal" role="button" aria-expanded="false"
												aria-controls="collapsepaypal">Paypal</a>
										</h3>

										<div class="collapse" id="collapsepaypal">
											<div class="py-2">
												<p class="mb-0">Thực hiện thanh toán trực tiếp vào tài
													khoản ngân hàng của chúng tôi. Vui lòng sử dụng ID đơn hàng
													của bạn làm tài liệu tham khảo thanh toán. Đơn đặt hàng của
													bạn sẽ không được giao cho đến khi tiền đã được xóa trong
													tài khoản của chúng tôi.</p>
											</div>
										</div>
									</div>

									<div class="form-group">

										<a href="/checkout"><button
												class="btn btn-primary btn-lg py-3 btn-block">Đặt
												hàng</button></a>
									</div>

								</div>
							</div>
						</div>

					</div>
				</div>
				<!-- </form> -->
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
						<a href="#" class="block-6"> <img
							src="/static/customer/images/sach2.jpg" alt="Image placeholder"
							class="img-fluid rounded mb-4">
							<h3 class="font-weight-light  mb-0">Tìm những cuốn sách hoàn
								hảo của bạn</h3>
							<p>Khuyến mãi từ 20 &mdash; 30/09, 2023</p>
						</a>
					</div>
					<div class="col-md-6 col-lg-3">
						<div class="block-5 mb-5">
							<h3 class="footer-heading mb-4">Thông tin liên hệ</h3>
							<ul class="list-unstyled">
								<li class="address">Đường Võ Nguyên Giáp, Hoài Mỹ, Hoài
									Nhơn, Bình Định</li>
								<li class="phone"><a href="tel://23923929210">+84376758600</a></li>
								<li class="email">ads.tranvannhan@gmail.com</li>
							</ul>
						</div>

						<div class="block-7">
							<form action="#" method="post">
								<label for="email_subscribe" class="footer-heading">Đăng
									ký</label>
								<div class="form-group">
									<input type="text" class="form-control py-4"
										id="email_subscribe" placeholder="Email"> <input
										type="submit" class="btn btn-sm btn-primary" value="Gửi">
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="row pt-5 mt-5 text-center">
					<div class="col-md-12">
						<p>

							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							&mdash; Proudly created with Tran Van Nhan and Trinh Duy Bao</a>

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