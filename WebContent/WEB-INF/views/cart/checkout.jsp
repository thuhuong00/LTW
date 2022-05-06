<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<c:set var="root" value="${pageContext.servletContext.contextPath}" />
<head>
<title>Thông tin đơn hàng</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="${root}/resources/cart/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="${root}/resources/cart/css/animate.css">

<link rel="stylesheet"
	href="${root}/resources/cart/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${root}/resources/cart/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${root}/resources/cart/css/magnific-popup.css">

<link rel="stylesheet" href="${root}/resources/cart/css/aos.css">

<link rel="stylesheet"
	href="${root}/resources/cart/css/ionicons.min.css">

<link rel="stylesheet"
	href="${root}/resources/cart/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="${root}/resources/cart/css/jquery.timepicker.css">


<link rel="stylesheet" href="${root}/resources/cart/css/flaticon.css">
<link rel="stylesheet" href="${root}/resources/cart/css/icomoon.css">
<link rel="stylesheet" href="${root}/resources/cart/css/style.css">
</head>
<body class="goto-here">

	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="/MyShop/index.htm" rel="stylesheet">VinaSeed</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="/MyShop/index.htm"
						rel="stylesheet" class="nav-link">Trang chủ</a></li>
					<li class="nav-item"><a href="/MyShop/about.htm"
						rel="stylesheet" class="nav-link">Giới thiệu</a></li>
					<li class="nav-item active dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="dropdown04"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Sản
							phẩm</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item" href="/MyShop/seed/hoa.htm"
								rel="stylesheet">Hạt giống hoa</a> <a class="dropdown-item"
								href="/MyShop/seed/rau.htm" rel="stylesheet">Hạt giống rau</a> <a
								class="dropdown-item" href="/MyShop/seed/raumam.htm"
								rel="stylesheet">Hạt giống rau mầm</a> <a class="dropdown-item"
								href="/MyShop/seed/caythuoc.htm" rel="stylesheet">Hạt giống
								cây thuốc</a>
						</div></li>

					<c:if test="${sessionScope.myLogin== null }">
						<li class="nav-item"><a href="/MyShop/login.htm"
							rel="stylesheet" class="nav-link">Đăng nhập</a></li>
						
					</c:if>
					<c:if test="${sessionScope.myLogin!=null }">

						<li class="nav-item cta cta-colored"><a
							href="/MyShop/cart/cart.htm" rel="stylesheet" class="nav-link"><span
								class="icon-shopping_cart"></span>[${sessionScope.myOrder.size()}]</a></li>
						<!-- <li class="nav-item active"><div class="nav-link"
								style="text-align: right;">Xin chào</div></li> -->
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" id="navbardrop"
							data-toggle="dropdown">Xin chào ${sessionScope.myLogin.getFirstName()}</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/MyShop/order/show.htm" rel="stylesheet"> Đơn hàng <a
									class="dropdown-item" href="/MyShop/logout.htm" rel="stylesheet">Đăng xuất</a>
								</a>
							</div></li>

					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<div class="hero-wrap hero-bread"
		style="background-image: url('../images/home2.png');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.htm">VINASEED</a></span> 
					</p>
					<h1 class="mb-0 bread">Thông tin đơn hàng</h1>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section">
		<div class="container" style="width: 700px">
			<label style="color: red;">${message}</label>
			<c:if test="${sessionScope.myOrder!=null}">
				<form:form action="http://localhost:8080/MyShop/cart/theOrder.htm" modelAttribute="theOrder">
					<div class="form-group">
						<label>Họ và tên đệm:</label>
						<form:input cssClass="form-control" path="lastName" />
						<form:errors path="lastName" />
					</div>
					<div class="form-group">
						<label>Tên:</label>
						<form:input cssClass="form-control" path="firstName" />
						<form:errors path="firstName" />
					</div>

					<div class="form-group">
						<label>Địa chỉ:</label>
						<form:input cssClass="form-control" path="address" />
						<form:errors path="address" />
					</div>
					<div class="form-group">
						<label>Số điện thoại:</label>
						<form:input cssClass="form-control" path="phone" pattern="0\\d{9}" />
						<form:errors path="phone" />
					</div>
					
					<div>
						<!-- <a style="float: right;" href="/MyShop/cart/theOrder.htm" rel="stylesheet"
									class="btn btn-primary">Đặt hàng</a> -->
									<button>Đặt hàng</button>
						<!-- <button class="btn btn-success">Đặt hàng</button -->
					</div>
				</form:form>
			</c:if>
		</div>
	</section>
	<!-- .section -->

	<footer class="ftco-footer ftco-section">
		<div class="container">
			<div class="row">
				<div class="mouse">
					<a href="#" class="mouse-icon">
						<div class="mouse-wheel">
							<span class="ion-ios-arrow-up"></span>
						</div>
					</a>
				</div>
			</div>
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">SEEDS</h2>
						<p>We believe in service, and you know that</p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-5">
						<h2 class="ftco-heading-2">SẢN PHẨM CHÍNH</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">Hạt giống hoa</a></li>
							<li><a href="#" class="py-2 d-block">Hạt giống rau</a></li>
							<li><a href="#" class="py-2 d-block">Hạt giống rau mầm</a></li>
							<li><a href="#" class="py-2 d-block">Hạt giống cây thuốc</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">QUY ĐỊNH VÀ CHÍNH SÁCH</h2>
						<div class="d-flex">
							<ul class="list-unstyled mr-l-5 pr-l-3 mr-4">
								<li><a href="#" class="py-2 d-block">Hình thức thanh
										toán</a></li>
								<li><a href="#" class="py-2 d-block">Chính sách đổi trả
										sản phẩm</a></li>
								<li><a href="#" class="py-2 d-block">Vận chuyển, giao
										nhận</a></li>
								<li><a href="#" class="py-2 d-block">Chính sách bảo mật</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">HAVE A QUESTION?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span
									class="text">97 Man Thiện, phường Hiệp Phú, quận 9,
										TPHCM</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">+842643960397</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span
										class="text">info@gmail.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>

		</div>
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src="${root}/resources/cart/js/jquery.min.js"></script>
	<script src="${root}/resources/cart/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="${root}/resources/cart/js/popper.min.js"></script>
	<script src="${root}/resources/cart/js/bootstrap.min.js"></script>
	<script src="${root}/resources/cart/js/jquery.easing.1.3.js"></script>
	<script src="${root}/resources/cart/js/jquery.waypoints.min.js"></script>
	<script src="${root}/resources/cart/js/jquery.stellar.min.js"></script>
	<script src="${root}/resources/cart/js/owl.carousel.min.js"></script>
	<script src="${root}/resources/cart/js/jquery.magnific-popup.min.js"></script>
	<script src="${root}/resources/cart/js/aos.js"></script>
	<script src="${root}/resources/cart/js/jquery.animateNumber.min.js"></script>
	<script src="${root}/resources/cart/js/bootstrap-datepicker.js"></script>
	<script src="${root}/resources/cart/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="${root}/resources/cart/js/google-map.js"></script>
	<script src="${root}/resources/cart/js/main.js"></script>

	<script>
		$(document).ready(function() {

			var quantitiy = 0;
			$('.quantity-right-plus').click(function(e) {

				// Stop acting like a button
				e.preventDefault();
				// Get the field name
				var quantity = parseInt($('#quantity').val());

				// If is not undefined

				$('#quantity').val(quantity + 1);

				// Increment

			});

			$('.quantity-left-minus').click(function(e) {
				// Stop acting like a button
				e.preventDefault();
				// Get the field name
				var quantity = parseInt($('#quantity').val());

				// If is not undefined

				// Increment
				if (quantity > 0) {
					$('#quantity').val(quantity - 1);
				}
			});

		});
	</script>

</body>
</html>