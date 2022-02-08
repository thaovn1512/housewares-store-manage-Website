<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/admin/header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">MANAGE PRODUCT</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="admin/index.htm">Dashboard</a></li>
				<li class="breadcrumb-item active">Product Table</li>
			</ol>
			<div class="card mb-4">
				<div class="card-body">
					<form:form action="admin/product/insert.htm"
						modelAttribute="product" method="POST"
						enctype="multipart/form-data">
						<form:input path="id" style="display:none" />
						<div class="form-group">
							<label>Product name:</label>
							<form:input type="text" class="form-control" path="name" />
							<form:errors path="name"/>
						</div>
						<div class="form-row">
							
								<div class="form-group col-md-6">
									<label>Category</label>
									<form:select class="custom-select" path="category.id"
										items="${loai}" itemValue="id" itemLabel="name"></form:select>
								</div>
								<div class="form-group col-md-6">
									<label>Brand</label>
									<form:select class="custom-select" path="brand.id"
										items="${nhanHieu}" itemValue="id" itemLabel="name"></form:select>
								</div>
							
						</div>
						<div class="form-row">
							<div class="col-md-6">
								<label>Price</label>
								<div class="input-group">
									<form:input type="number" class="form-control" path="price" />
									
									<div class="input-group-append"
										style="border-radius: 50px !important;">
										<span class="input-group-text">đ</span>
									</div>
								</div>
								<form:errors path="price"/>
								</div>
								<div class="col-md-6">
								<label>Discount</label>
								<div class="input-group ">
									<form:input type="number" class="form-control" path="discount" maxlength="100" />
									<div class="input-group-append"
										style="border-radius: 50px !important;">
										<span class="input-group-text">%</span>
									</div>
								</div>
								</div>
							
						</div>
						<div class="row">
							<div class="col">
								<label>Quantity</label>
								<div class="input-group">
									<form:input type="number" class="form-control" path="quantity" />
								</div>
								<form:errors path="quantity"/>
								<label for="myFile" class="mt-3">Image:</label>
								<div class="form-group">
									<input type="file" id="myFile" name="photo" /> <label
										style="color: red"> ${message} </label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="comment">Description:</label>
							<form:textarea path="description" class="form-control" rows="5"
								id="comment" style="border-radius: 5px !important"></form:textarea>
						</div>
						<form:errors path="description"/>
						<div class="form-group">
							<label for="comment">Information:</label>
							<form:textarea path="information" class="form-control" rows="5"
								id="comment" style="border-radius: 5px !important"></form:textarea>
						</div>
						<form:errors path="information"/>
						<button type="submit" class="btn btn-primary btn-lg">Save</button>
					</form:form>
					.
				</div>
			</div>




			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> List Product
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>Name Product</th>
								<th>Name Brand</th>
								<th>Name Category</th>
								<th>Image</th>
								<th>Price</th>
								<th>Discount</th>
								<th>Status</th>
								<th>Description</th>
								<th>Quantity</th>
								<th>Information</th>
								<th>Purchased</th>

							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Name Product</th>
								<th>Name Brand</th>
								<th>Name Category</th>
								<th>Image</th>
								<th>Price</th>
								<th>Discount</th>
								<th>Status</th>
								<th>Description</th>
								<th>Quantity</th>
								<th>Information</th>
								<th>Purchased</th>
							</tr>
						</tfoot>
						<tbody id="myTable">
							<c:forEach var="p" items="${listProduct}">
								<%-- <c:forEach var="pd" items="${listProduct}"> --%>
								<tr style="height: 100px">

									<td>${p.name}</td>
									<td>${p.brand.name}</td>
									<td>${p.category.name}</td>
									<td>${p.image}</td>
									<td>${p.price}</td>
									<td>${p.discount}</td>
									<td>${p.status}</td>
									<td>${p.description}</td>
									<td>${p.quantity}</td>
									<td>${p.information}</td>
									<td>${p.purchased}</td>

									<td><a href="admin/product/update/${p.id}.htm?btn-sua"><button
												type="button" class="btn btn-warning" name="btn-sua">Edit</button>
									</a></td>
									<td><a href="admin/product/delete/${p.id}.htm?btn-xoa"><button
												type="button" class="btn btn-danger" name="btn-xoa">Delete</button> </a></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
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

<script type="text/javascript">bkLib.onDomLoaded(nicEditors.allTextAreas);</script>


	<script>
		$(document)
				.ready(
						function() {
							$("#myInput")
									.on(
											"keyup",
											function() {
												var value = $(this).val()
														.toLowerCase();
												$("#myTable .card")
														.filter(
																function() {
																	$(this)
																			.toggle(
																					$(
																							this)
																							.text()
																							.toLowerCase()
																							.indexOf(
																									value) > -1)
																});
											});
						});
	</script>

	<%@include file="/WEB-INF/views/layouts/admin/footer.jsp"%>