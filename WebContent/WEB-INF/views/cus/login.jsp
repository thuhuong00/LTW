<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<c:set var="root" value="${pageContext.servletContext.contextPath}" />
<head>
<meta charset="utf-8">
<title>Log in</title>
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
			<form action="logininfo.htm" method="post">
				<h3>Log in</h3>
				<p5 class="text-danger">
				<b style="color: red;">${message0}</b></p5>
				<hr>
				<div class="form-holder active">
					<p style="color: red; font-style: oblique">
						<form:errors path="username" />
					</p>
					<input name="username" type="text" placeholder="Username"
						class="form-control" />
				</div>
				<div class="form-holder">
					<p style="color: red; font-style: oblique">
						<form:errors path="password" />
					</p>
					<input name="password" type="password" placeholder="Password"
						class="form-control" style="font-size: 15px;" />
				</div>
				<div
					style="font-size: 16px; position: absolute; right: 440px; top: 320px;">
					<a href="forgot.htm">Forgot Password?</a>
				</div>
				<div class="form-login"
					style="position: absolute; right: 500px; top: 390px;">
					<button>Login</button>
				</div>
				<br>
				<div class="form-login">
					<p
						style="color: black; font-size: 16px; position: absolute; right: 430px; top: 465px;">
						<b>If You Don't Have Account?</b> <a href="register.htm">Register</a>
					</p>
				</div>
				<!-- style="color: red; font-style:oblique; font-size: 18px; position: absolute; right: 630px; top: 560px;" -->

			</form>
		</div>
	</div>

	<script src="${root}/resources/register/js/jquery-3.3.1.min.js"></script>
	<script src="${root}/resources/register/js/main.js"></script>
</body>
</html>