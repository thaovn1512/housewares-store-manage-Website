<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/admin/header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">MANAGE USER</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="admin/index.htm">Dashboard</a></li>
				<li class="breadcrumb-item active">User</li>
			</ol>
			



			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> List User
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>Id</th>
								<th>User name</th>
								<th>Email</th>
								<th>Password</th>
								<th>Phone</th>
								<th>Address</th>
								<th>Day Create</th>
								

							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Id</th>
								<th>User name</th>
								<th>Email</th>
								<th>Password</th>
								<th>Phone</th>
								<th>Address</th>
								<th>Day Create</th>
								
							</tr>
						</tfoot>
						<tbody id="myTable">
							<c:forEach var="p" items="${listUser}">
								<tr style="height: 100px">

									<td>${p.id}</td>
									<td>${p.name}</td>
									<td>${p.email}</td>
									<td>${p.password}</td>
									<td>${p.phone}</td>
									<td>${p.address}</td>
									<td>${p.dayCreated}</td>
									

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		</main>
</div>



	<%@include file="/WEB-INF/views/layouts/admin/footer.jsp"%>