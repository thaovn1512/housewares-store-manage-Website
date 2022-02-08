<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/header.jsp"%>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg"
	data-setbg="resources/user/img/breadcrumb.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2><s:message code="order.detail.title"></s:message></h2>
					<div class="breadcrumb__option">
						<a href="index.htm"><s:message code="header.menu.home"></s:message></a><a href="order/list-order.htm"><s:message code="order.title"></s:message></a> <span><s:message code="order.detail.title"></s:message></span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<!-- Shoping Cart Section Begin -->
<section class="shoping-cart spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="shoping__cart__table">
					<table>
						<thead>
							<tr>
								<th>Id</th>
								<th class="shoping__product"><s:message code="order.table.product"></s:message></th>
								<th><s:message code="order.table.price"></s:message></th>
								<th><s:message code="order.table.quantity"></s:message></th>
								<th><s:message code="order.table.total"></s:message></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="detail" items="${listDetail}">
								<tr>
								<td>${detail.id}</td>
									<td class="shoping__cart__item"><img
										src="resources/user/img/product/${detail.product.image}"
										style="width: 100px; height: 100px">
										<h5>${detail.product.name}</h5></td>
									<td class="shoping__cart__price"><fmt:formatNumber
											type="number" groupingUsed="true"
											value=" ${detail.product.price-detail.product.price*detail.product.discount/100}" />đ

									</td>
									<td class="shoping__cart__quantity">${detail.quantity}</td>
									<td class="shoping__cart__total amount"><fmt:formatNumber
											type="number" groupingUsed="true"
											value="${(detail.product.price-detail.product.price*detail.product.discount/100)*detail.quantity}" />đ
									</td>
									<!-- 									<input id="totalPrice" name="totalPrice" style="display: none"> -->
								</tr>

							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="shoping__cart__btns">
					<a href="product.htm" class="primary-btn cart-btn"><s:message code="order.button.continue"></s:message></a> 
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Shoping Cart Section End -->


<%@include file="/WEB-INF/views/layouts/user/footer.jsp"%>
