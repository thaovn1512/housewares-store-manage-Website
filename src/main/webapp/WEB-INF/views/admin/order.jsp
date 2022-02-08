<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/admin/header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">MANAGE ORDER</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="admin/index.htm">Dashboard</a></li>
				<li class="breadcrumb-item active">Order</li>
			</ol>




			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> List Order
				</div>
				<div id="accordion" class="card-body">
					<c:forEach var="o" items="${listOrder}">
						<div class="card">
							<div class="card-header" style="padding: 0">
								<a class="card-link" data-toggle="collapse" href="#m${o.key.id}">
									<div class="media " style="width: 650px; float: left">
										<div class="media-body ">
											<h4 style="margin: 15px 10px;">
												<strong>Đơn hàng: ${o.key.id}</strong> <small
													class="badge badge-secondary"><i><fmt:formatNumber type="number"
															groupingUsed="true"
															value="${o.key.total}" />đ </i></small>

											</h4>
											<small style="color: black; margin-left: 5px">Ngày
												đặt: </small>${o.key.dayCreate} <small style="color: black">Tên
												khách hàng: </small>${o.key.customer} <small style="color: black">Số
												điện thoại: </small>${o.key.phone} <small style="color: black">Địa
												chỉ: </small>${o.key.address} <br> <small style="color: black">Trạng
												thái đơn hàng: </small>
											<c:choose>
												<c:when test="${o.key.status==true}"> Đã xác nhận</c:when>
												<c:when test="${o.key.status==false}"> Chưa xác nhận</c:when>
											</c:choose>
										</div>

									</div>
								</a>
								<div class="btn-group" style="float: right; z-index: 15">
									<c:if test="${o.key.status==false}">
										<a href="admin/order/confirm/${o.key.id}.htm?btn-xacnhan"><button
												type="button" class="btn btn-warning" name="btn-sua">Xác
												nhận</button> </a>
									</c:if>
									<a href="admin/order/confirm/${o.key.id}.htm?btn-xoa"><button
											type="button" class="btn btn-warning" data-toggle="modal"
											data-target="#myModal" name="btn-xoa">Hủy</button> </a>

								</div>
							</div>
							<div id="m${o.key.id}" class="collapse" data-parent="#accordion">
								<div class="card-body">
									<div id="accordion" class="mt-3">
										<c:forEach var="detail" items="${o.value}">
											<div class="card">
												<div class="card-header" style="padding: 0">
													<a class="card-link" data-toggle="collapse"
														href="#m${detail.key.id}">
														<div class="media " style="width: 650px; float: left">
															<img
																src="resources/user/img/product/${detail.key.image}"
																alt="${detail.key.id}" class="m-3  "   
																style="width: 60px;">
															<div class="media-body ">
																<h4 style="margin-top: 20px;">
																	<strong>${detail.key.name}</strong> <small
																		class="badge badge-secondary"><i><fmt:formatNumber type="number"
															groupingUsed="true"
															value="${detail.key.price-detail.key.price*detail.key.discount/100}" />
																			đ</i></small>
																</h4>
																<span>Số lượng:</span>${detail.value}
															</div>

														</div>
													</a>
												</div>

											</div>
										</c:forEach>
									</div>

								</div>
							</div>
						</div>

					</c:forEach>
				</div>
			</div>
		</div>
</div>


</main>
<div class="modal fade" id="myModal">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">WARNING</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">Are you sure you want to delete this
				items?</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">Delete</button>

			</div>

		</div>
	</div>



<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable .card").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>

	<%@include file="/WEB-INF/views/layouts/admin/footer.jsp"%>