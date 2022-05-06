<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<c:set var="root" value="${pageContext.servletContext.contextPath}" />

<head>
<style>
.float-left-child {
	float: left;
}
</style>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Quản lý người dùng</title>

<!-- Custom fonts for this template-->
<link
	href="${root}/resources/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link
	href="${root}/resources/admin/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${root}/resources/admin/css/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top">

	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

		<a class="navbar-brand mr-1" href="manage.htm"> QUẢN LÝ</a> </a> -->
		<button class="btn btn-link btn-sm text-white order-1 order-sm-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>

		<!-- Navbar Search -->
		<form
			class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="Search for..."
					aria-label="Search" aria-describedby="basic-addon2">
				<div class="input-group-append">
					<button class="btn btn-primary" type="button">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</form>

		<!-- Navbar -->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown no-arrow"><a
				class="nav-link dropdown-toggle" href="#" id="userDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-user-circle fa-fw"></i>
			</a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">

					<a class="dropdown-item" href="../logout.htm" data-toggle="modal"
						data-target="#logoutModal">Logout</a>
				</div></li>
		</ul>

	</nav>

	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="sidebar navbar-nav">
			<li class="nav-item dropdown">
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<h6 class="dropdown-header">Login Screens:</h6>
					<a class="dropdown-item" href="login.htm">Login</a> <a
						class="dropdown-item" href="register.htm">Register</a> <a
						class="dropdown-item" href="forgot.htm">Forgot Password</a>
					<div class="dropdown-divider"></div>
				</div>
			</li>
			<li class="nav-item active"><a class="nav-link"
				href="/MyShop/manageuser/edit.htm" rel="stylesheet"> <i
					class="fas fa-fw fa-table"></i> <span>Quản lý người dùng</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="/MyShop/quanlyhatgiong/edit.htm" rel="stylesheet"> <i
					class="fas fa-fw fa-table"></i> <span>Quản lý hạt giống</span>
			</a></li>
		</ul>

		<div id="content-wrapper">
			<div class="container-fluid">
				<!-- Breadcrumbs-->
				<!-- <ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
					<li class="breadcrumb-item active">Tables</li>
				</ol> -->
				<!-- DataTables Example -->
				<!-- <div class="card mb-3"> -->
				<!-- <div class="card-header">
						<i class="fas fa-table"></i> Data Table Example
					</div> -->
				<!-- <h2 style="color: #FF0000; font-size: 30 px;">
					<b>MANAGE USERS</b>
				</h2> -->
				<div class="card-body">
					<div class="card">
						<div class="card-header">
							<label class="font-weight-bold"
								style="font-size: 20px; color: #800000">MANAGE USERS</label>
						</div>
						<div class="card-header">
							<form:form class="row g-3" modelAttribute="user"
								action="/MyShop/manageuser/edit.htm" rel="stylesheet">
								<div class="col-md-6">
									<label class="font-weight-bold">Username</label>
									<form:input path="username" type="text" class="form-control"
										id="exampleFormControlInput1" placeholder="Type username" />
									<p style="color: red; font-style: oblique">
										<form:errors path="username" />
									</p>
								</div>
								<div class="col-md-6">
									<label class="font-weight-bold">Password</label>
									<form:input path="password" type="text" class="form-control"
										id="exampleFormControlInput1" placeholder="Type Password" />
									<p style="color: red; font-style: oblique">
										<form:errors path="password" />
									</p>
								</div>
								<div class="col-md-6">
									<label class="font-weight-bold">FirstName</label>
									<form:input path="firstName" type="text" class="form-control"
										id="exampleFormControlInput1" placeholder="Type FirstName" />
									<p style="color: red; font-style: oblique">
										<form:errors path="firstName" />
									</p>
								</div>
								<div class="col-md-6">
									<label class="font-weight-bold">LastName</label>
									<form:input path="lastName" type="text" class="form-control"
										id="exampleFormControlInput1" placeholder="Type LastName" />
									<p style="color: red; font-style: oblique">
										<form:errors path="lastName" />
									</p>
								</div>
								<div class="col-md-6">
									<label class="font-weight-bold">Address</label>
									<form:input path="address" type="text" class="form-control"
										id="exampleFormControlInput1" placeholder="Type Address" />
									<p style="color: red; font-style: oblique">
										<form:errors path="address" />
									</p>
								</div>
								<div class="col-md-6">
									<label class="font-weight-bold">Phone</label>
									<form:input path="phone" type="text" class="form-control"
										id="exampleFormControlInput1" placeholder="Type Phone" />
									<p style="color: red; font-style: oblique">
										<form:errors path="phone" />
									</p>
								</div>
								<div class="col-md-6">
									<label class="font-weight-bold">Email</label>
									<form:input path="email" type="text" class="form-control"
										id="exampleFormControlInput1" placeholder="Type Email" />
									<p style="color: red; font-style: oblique">
										<form:errors path="email" />
									</p>
								</div>
								<div class='parent' class="col-md-6">
									<hr>
									<div class='child float-left-child'>
										<form:checkbox path="admin" id="scales" name="scales" />
										<label for="scales">Is Admin?</label>
									</div>
									<div class='child float-left-child' style="margin-left: 2.5em">
										<button name="${btnStatus}" class="btn btn-danger">Save</button>
										<p5 class="text-success">${message1}</p5>
										<p5 class="text-danger">${message0}</p5>
									</div>
								</div>
								<div class="form-inline col-5">
									<hr>
									<span id="result1"></span>
								</div>
							</form:form>
						</div>
					</div>
					<br>
					<div class="table-responsive">
						<%-- <jsp:useBean id="pagedListHolder" scope="request"
							type="org.springframework.beans.support.PagedListHolder" /> --%>
						<%-- <c:url value="" var="pagedLink">
							<c:param name="p" value="~" />
						</c:url> --%>
						<table class="table table-bordered" id="dataTable"
							table-layout: "auto" cellspacing="0">
							<thead class="thead-light">
								<tr>
									<!-- <th scope="col">Id</th> -->
									<th scope="col">Username</th>
									<th scope="col">Password</th>
									<th scope="col">FirstName</th>
									<th scope="col">LastName</th>
									<th scope="col">Address</th>
									<th scope="col">Phone</th>
									<th scope="col">Email</th>
									<th scope="col">Admin</th>
									<th scope="col">Edit</th>
									<th scope="col">Delete</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="us" items="${users}">
									<%-- items="${pagedListHolder.pageList}" --%>
									<%-- ${pagedListHolder.pageList}${user} --%>
									<tr>
										<%-- <td>${us.idUser}</td> --%>
										<td>${us.username}</td>
										<td>${us.password}</td>
										<td>${us.firstName}</td>
										<td>${us.lastName}</td>
										<td>${us.address}</td>
										<td>${us.phone}</td>
										<td>${us.email}</td>
										<td>${us.admin}</td>
										<td><a
											href="/MyShop/manageuser/edit/${us.idUser}.htm?linkEdit"
											rel="stylesheet"><img
												<%-- ${us.idUser} --%>
													width="31" height="31"
												src="<c:url value='/resources/img/edit.png'/>" /></a></td>
										<td><a name="btnDelete"
											href="/MyShop/manageuser/edit/${us.idUser}.htm?linkDelete"
											rel="stylesheet" role="button"><img width="31"
												height="31" src="<c:url value='/resources/img/delete.png'/>" /></a>
									</tr>
								</c:forEach>

							</tbody>
						</table>
						<%-- <tg:paging pagedListHolder="${pagedListHolder}"
							pagedLink="${pagedLink}" /> --%>
					</div>
				</div>
				<div class="card-footer small text-muted">Updated yesterday at
					11:59 PM</div>
				<!-- </div> -->

				<p class="small text-center text-muted my-5">
					<em>More table examples coming soon...</em>
				</p>

			</div>
			<!-- /.container-fluid -->

			<!-- Sticky Footer -->
			<footer class="sticky-footer">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright © Your Website 2019</span>
					</div>
				</div>
			</footer>

		</div>
		<!-- /.content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="../logout.htm">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="${root}/resources/admin/vendor/jquery/jquery.min.js"></script>
	<script
		src="${root}/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${root}/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Page level plugin JavaScript-->
	<script
		src="${root}/resources/admin/vendor/datatables/jquery.dataTables.js"></script>
	<script
		src="${root}/resources/admin/vendor/datatables/dataTables.bootstrap4.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="${root}/resources/admin/js/sb-admin.min.js"></script>

	<!-- Demo scripts for this page-->
	<script src="${root}/resources/admin/js/demo/datatables-demo.js"></script>

	<script>
		function searchValue() {
			//event.preventDefault();
			var searchProductname = $("#searchInput").val();
			alert(searchProductname)
		}
	</script>
</body>

</html>