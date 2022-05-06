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

<title>Quản lý hạt giống</title>

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

		<a class="navbar-brand mr-1" href="manage.htm">QUẢN LÝ</a>

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
			<li class="nav-item active"><a class="nav-link"
				href="/MyShop/manageuser/edit.htm" rel="stylesheet"> <i class="fas fa-fw fa-table"></i>
					<span>Quản lý người dùng</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link" href="/MyShop/quanlyhatgiong/edit.htm" rel="stylesheet">
					<i class="fas fa-fw fa-table"></i> <span>Quản lý hạt giống</span>
			</a></li>
		</ul>

		<div id="content-wrapper">
			<div class="container-fluid">
				<div class="card-body">
					<div class="card">
						<div class="card-header">
							<label class="font-weight-bold"
								style="font-size: 20px; color: #800000">Quản lý hạt
								giống</label>
						</div>
						<div class="card-header">
							<form:form class="row g-3" modelAttribute="Seed"
								action="/MyShop/quanlyhatgiong/edit.htm" rel="stylesheet">
`								<!-- seedName -->
								<div class="col-md-6">
									<label class="font-weight-bold">SeedName</label>
									<form:input path="seedName" type="text" class="form-control"
										id="exampleFormControlInput1" placeholder="Type seedName" />
									<p style="color: red; font-style: oblique">
										<form:errors path="seedName" />
									</p>
								</div>
								<!-- typeSeed -->
								<div class="col-md-6">
									<label class="font-weight-bold">TypeSeed</label>
									<form:input path="typeSeed.idTypeSeed" type="text"
										class="form-control" id="exampleFormControlInput1"
										placeholder="Type typeSeed" />
									<p style="color: red; font-style: oblique">
										<form:errors path="typeSeed" />
									</p>
								</div>
								<!-- images -->
								<div class="col-md-6">
									<label class="font-weight-bold">Images</label>
									<form:input path="images" type="text" class="form-control"
										id="exampleFormControlInput1" placeholder="Type images" />
									<p style="color: red; font-style: oblique">
										<form:errors path="images" />
									</p>
								</div>
								<!-- information -->
								<div class="col-md-6">
									<label class="font-weight-bold">Information</label>
									<form:input path="information" type="text" class="form-control"
										id="exampleFormControlInput1" placeholder="Type information" />
									<p style="color: red; font-style: oblique">
										<form:errors path="information" />
									</p>
								</div>
								<!-- price -->
								<div class="col-md-6">
									<label class="font-weight-bold">Price</label>
									<form:input path="price" type="text" class="form-control"
										id="exampleFormControlInput1" placeholder="Type price" />
									<p style="color: red; font-style: oblique">
										<form:errors path="price" />
									</p>
								</div>
								<!-- number -->
								<div class="col-md-6">
									<label class="font-weight-bold">Number</label>
									<form:input path="number" type="text" class="form-control"
										id="exampleFormControlInput1" placeholder="Type number" />
									<p style="color: red; font-style: oblique">
										<form:errors path="number" />
									</p>
								</div>

								<div class='parent' class="col-md-6">
									<hr>
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
						<table class="table table-bordered" id="dataTable"
							table-layout: "auto" cellspacing="0">
							<thead class="thead-light">
								<tr>
									<th scope="col">IDSeed</th>
									<th scope="col">SeedName</th>
									<th scope="col">TypeSeed</th>
									<th scope="col">Price</th>
									<th scope="col">Images</th>
									<th scope="col">Information</th>
									<th scope="col">number</th>
									<th scope="col">Edit</th>
									<th scope="col">Delete</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="s" items="${list}">
									<td>${s.idSeed}</td>
									<td>${s.seedName}</td>
									<td>${s.typeSeed}</td>
									<td>${s.price}</td>
									<td>${s.images}</td>
									<td>${s.information}</td>
									<td>${s.number}</td>
									<td><a
										href="/MyShop/quanlyhatgiong/edit/${s.idSeed}.htm?linkEdit"
										rel="stylesheet"><img
											<%-- ${us.idUser} --%>
													width="31" height="31"
											src="<c:url value='/resources/img/edit.png'/>" /></a></td>
									<td><a name="btnDelete"
										href="/MyShop/quanlyhatgiong/edit/${s.idSeed}.htm?linkDelete"
										rel="stylesheet" role="button"><img width="31" height="31"
											src="<c:url value='/resources/img/delete.png'/>" /></a>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</div>
				<div class="card-footer small text-muted">Updated yesterday at
					11:59 PM</div>


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
						<h5 class="modal-title" id="exampleModalLabel">Ready to
							Leave?</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">Select "Logout" below if you are
						ready to end your current session.</div>
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