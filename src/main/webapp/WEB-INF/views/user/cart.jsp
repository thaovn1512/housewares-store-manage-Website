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
					<h2><s:message code="cart.title"></s:message></h2>
					<div class="breadcrumb__option">
						<a href="index.htm"><s:message code="header.menu.home"></s:message></a> <span><s:message code="cart.title"></s:message></span>
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
								<th class="shoping__product"><s:message code="cart.table.product"></s:message></th>
								<th><s:message code="cart.table.price"></s:message></th>
								<th><s:message code="cart.table.quantity"></s:message></th>
								<th><s:message code="cart.table.total"></s:message></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${sessionScope.myCartItems}">
								<tr data-id="${item.value.product.id}"
									data-price="${item.value.product.price}"
									data-discount="${item.value.product.discount}">
									<td class="shoping__cart__item"><img
										src="resources/user/img/product/${item.value.product.image}"
										style="width: 100px; height: 100px">
										<h5>${item.value.product.name}</h5></td>
									<td class="shoping__cart__price"><fmt:formatNumber
											type="number" groupingUsed="true"
											value=" ${item.value.product.price-item.value.product.price*item.value.product.discount/100}" />đ

									</td>
									<td class="shoping__cart__quantity">
<!-- 										<div class="quantity"> -->

											<!-- 												<input class="soLuong" name="dsSoLuong" type="number" -->
											<%-- 													onchange="updatePrice()" value="${item.value.quantity}" --%>
											<!-- 													min="1" max="50"> -->
											<input type="number"
												value="${item.value.quantity}" min="1" max="${item.value.product.quantity+1}">

<!-- 										</div> -->
									</td>
									<!-- 									<td class="shoping__cart__total donGia totalPrice" -->
									<%-- 										donGia="${(item.value.product.price-item.value.product.price*item.value.product.discount/100)*item.value.quantity}"> --%>

									<%-- 										<fmt:formatNumber type="number" groupingUsed="true" --%>
									<%-- 											value="  ${(item.value.product.price-item.value.product.price*item.value.product.discount/100)*item.value.quantity}" />đ --%>
									<!-- 									</td> -->
									<td class="shoping__cart__total amount"><fmt:formatNumber
											type="number" groupingUsed="true"
											value="  ${(item.value.product.price-item.value.product.price*item.value.product.discount/100)*item.value.quantity}" />đ
									</td>
<!-- 									<input id="totalPrice" name="totalPrice" style="display: none"> -->
									<td class="shoping__cart__item__close"><a
										href="${pageContext.servletContext.contextPath}/cart/remove/${item.value.product.id}.htm"><span
											class="icon_close"></span></a></td>
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
					<a href="product.htm" class="primary-btn cart-btn"><s:message code="cart.button.continue"></s:message></a> <a href="cart/delete.htm"
						class="primary-btn cart-btn cart-btn-right"><span
						class="icon_delete"></span> <s:message code="cart.button.delete"></s:message></a>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="shoping__checkout">
					<h5><s:message code="cart.total.title"></s:message></h5>
					<ul>
						<%-- 						<li>Total <span id="total"><c:out --%>
						<%-- 									value="${sessionScope.myCartTotal}" />đ</span></li> --%>
						<li><s:message code="cart.total.content"></s:message> <span id="cart-amt"><fmt:formatNumber
									type="number" groupingUsed="true"
									value="${sessionScope.myCartTotal}" />đ</span></li>




					</ul>
					<input id="total" name="total" style="display: none"> <a
						href="order/checkout.htm" class="primary-btn"><s:message code="cart.checkout"></s:message></a>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Shoping Cart Section End -->
  <script type="text/javascript"> 
	$(document).ready(function() {
		$("tr[data-id] input").on("input", function() {
			var id = $(this).closest("tr").attr("data-id");
			var price = $(this).closest("tr").attr("data-price");
			var discount = $(this).closest("tr").attr("data-discount");
			var quantity = $(this).val();
			$.ajax({
			
				url: "${pageContext.request.contextPath}/cart/update/"+id+"/"+quantity+".htm",
				success: function(response) {
					$("#cart-cnt").html(response[0]);
					$("#cart-amount").html(response[1]);
				}
			});
			var amount = (price - price * discount / 100) * quantity;
			$(this).closest("tr").find("td.amount").html(amount);
		});
	});
  </script>  

<%@include file="/WEB-INF/views/layouts/user/footer.jsp"%>
