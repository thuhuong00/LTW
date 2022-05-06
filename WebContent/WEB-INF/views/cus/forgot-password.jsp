<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<c:set var="root" value="${pageContext.servletContext.contextPath}" />

<head>
<meta charset="utf-8">
<title>Forgot password</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- STYLE CSS -->
<link rel="stylesheet" href="${root}/resources/register/css/style.css">
</head>

<body>

	<div class="wrapper">
		<div class="inner">
			<div class="image-holder">
				<img src="${root}/resources/register/images/bg1.png" alt="">
			</div>
			<form action="reset.htm">
				<br> <br> <br>
				<h3>Forgot password?</h3>
				<h4 style="color: black; font-size: 18px;">Enter your email
					address and we will</h4>
				<h4 style="color: black; font-size: 18px;">send you
					instructions on how to reset</h4>
				<h4 style="color: black; font-size: 18px;">your password. Type
					your email below.</h4>
				<br>
				<p class="text-danger" style="font-size: 16px; color: #800000;">
					<b>${message}</b>
				</p>
				<p class="text-success" style="font-size: 16px; color: #800000;">
					<b>${message1}</b>
				</p>
				<div>
					<!-- class="form-holder" -->
					<p style="color: red; font-style: oblique">
						<form:errors path="email" />
					</p>
					<input name="email" type="text" placeholder="Enter email address"
						class="form-control">
				</div>
				<div style="position: absolute; right: 490px; top: 380px;"
					class="form-login">
					<button>Reset Password</button>
				</div>
				<a style="font-size: 16px; position: absolute; right: 600px; top: 440px;"
					href="register.htm">Register</a> 
				<a style="font-size: 16px; position: absolute; right: 490px; top: 440px;"
					href="login.htm">Login</a>
			</form>
		</div>
	</div>
	<script src="${root}/resources/register/js/jquery-3.3.1.min.js"></script>
	<script src="${root}/resources/register/js/main.js"></script>
</body>
</html>