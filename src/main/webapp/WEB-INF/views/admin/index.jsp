<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="/WEB-INF/views/layouts/admin/header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">OVERVIEW</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">Overview</li>
			</ol>
			<div class="row">
				<div class="col-xl-3 col-md-6">
					<div class="card bg-primary text-white mb-4">
						<div class="card-body">PHẠM THỊ NGỌC BÍCH 014</div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a class="small text-white stretched-link" href="admin/index.htm">View
								Details</a>
							<div class="small text-white">
								<i class="fas fa-angle-right"></i>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6">
					<div class="card bg-warning text-white mb-4">
						<div class="card-body">VÕ NHẬT THẢO 209</div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a class="small text-white stretched-link" href="admin/index.htm">View
								Details</a>
							<div class="small text-white">
								<i class="fas fa-angle-right"></i>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6">
					<div class="card bg-success text-white mb-4">
						<div class="card-body">Đồ án Web Gia dụng</div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a class="small text-white stretched-link" href="admin/index.htm">View
								Details</a>
							<div class="small text-white">
								<i class="fas fa-angle-right"></i>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6">
					<div class="card bg-danger text-white mb-4">
						<div class="card-body">NGUYỄN TRUNG HIẾU_ THẦY</div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a class="small text-white stretched-link" href="admin/index.htm">View
								Details</a>
							<div class="small text-white">
								<i class="fas fa-angle-right"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-chart-area me-1"></i> Pie Chart
						</div>
						<div class="card-body">
							<jsp:include page="_chart.jsp"></jsp:include>
						</div>
					</div>
				
<!-- 				<div class="col-xl-6"> -->
<!-- 					<div class="card mb-4"> -->
<!-- 						<div class="card-header"> -->
<!-- 							<i class="fas fa-chart-bar me-1"></i> Bar Chart Example -->
<!-- 						</div> -->
<!-- 						<div class="card-body"> -->
<%-- 							<jsp:include page="_barChart.jsp"></jsp:include> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> REVENUE BY MONTH
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>Month</th>
								<th>Quantity</th>
								<th>Revenue</th>
								<th>Min</th>
								<th>Max</th>
								<th>Avg</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Month</th>
								<th>Quantity</th>
								<th>Revenue</th>
								<th>Min</th>
								<th>Max</th>
								<th>Avg</th>
							</tr>
						</tfoot>
						<tbody>
							<c:forEach var="e" items="${dataMonth}">
								<tr>
									<td>${e[0]}</td>
									<td>${e[1]}</td>
									<td><fmt:formatNumber type="number" groupingUsed="true"
											value="${e[2]}" />đ</td>
									<td><fmt:formatNumber type="number" groupingUsed="true"
											value="${e[3]}" />đ</td>
									<td><fmt:formatNumber type="number" groupingUsed="true"
											value="${e[4]}" />đ</td>
									<td><fmt:formatNumber type="number" groupingUsed="true"
											value="${e[5]}" />đ</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>

	<%@include file="/WEB-INF/views/layouts/admin/footer.jsp"%>