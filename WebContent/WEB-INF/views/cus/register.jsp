<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<c:set var="root" value="${pageContext.servletContext.contextPath}" />
<head>
		<meta charset="utf-8">
		<title>Account</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<!-- STYLE CSS -->
		<link rel="stylesheet" href="${root}/resources/register/css/style.css">
	</head>

	<body>
	<style>
         .error{
            color: #D8000C;
            background-color: #FFBABA;
         }
      </style>
		<div class="wrapper">
			<div class="inner">
				<div class="image-holder">
					<img src="${root}/resources/register/images/bg1.png" alt="">
				</div>
				<form:form method="POST" action="registerinfor.htm" modelAttribute="user">
					<h3>Register</h3>
					<p class="text-danger" style="font-size: 17px; color: red"><b>${message}</b></p><br>
					<div class="form-holder active">
						<p style="color: red; font-style:oblique"><form:errors path="username"/></p>
						<form:input path="username" type="text" placeholder="Username" class="form-control"/>
					</div>
					<div class="form-holder">
						<p style="color: red; font-style:oblique"><form:errors path="password"/></p>
						<form:input path="password" type="text" placeholder="Password" class="form-control"/>
					</div>
					<div class="form-holder">
						<p style="color: red; font-style:oblique"><form:errors path="firstName"/></p>
						<form:input path="firstName" type="text" placeholder="Firstname" class="form-control"/>
					</div>
					<div class="form-holder">
						<p style="color: red; font-style:oblique"><form:errors path="lastName"/></p>
						<form:input path="lastName" type="text" placeholder="Lastname" class="form-control"/>
					</div>
					<div class="form-holder">
						<p style="color: red; font-style:oblique"><form:errors path="address"/></p>
						<form:input path="address" type="text" placeholder="Address" class="form-control"/>
					</div>
					<div class="form-holder">
						<p style="color: red; font-style:oblique"><form:errors path="phone"/></p>
						<form:input path="phone" type="text" placeholder="Phone number" class="form-control"/>
					</div>
					<div class="form-holder">
						<p style="color: red; font-style:oblique"><form:errors path="email"/></p>
						<form:input path="email" type="text" placeholder="E-mail" class="form-control"/>
					</div>
					<div class="form-login">
						<button style="color: black; font-size: 16px;"><b>Register</b></button><!--  style="color: black; font-size: 16px; position: absolute;  right: 700px;  top: 740px;" -->
						<p style="color: black; font-size: 16px;"><b>Already Have account?</b><a href="login.htm">Login</a></p>
					</div>
					<br>
						<p class="text-danger" style="font-size: 20px; color: #009900"><b>${message0}</b></p><br>
					<br>
				</form:form>
			</div>
		</div>

		<script src="${root}/resources/register/js/jquery-3.3.1.min.js"></script>
		<script src="${root}/resources/register/js/main.js"></script>
	</body>
</html>