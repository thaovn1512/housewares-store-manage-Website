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
					<h2><s:message code="order.title"></s:message></h2>
					<div class="breadcrumb__option">
						<a href="index.htm"><s:message code="header.menu.home"></s:message></a> <span><s:message code="order.title"></s:message></span>
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
			<div style="margin-bottom: 40px"><h2 ><s:message code="order.table.title"></s:message></h2></div>
				
				<div class="shoping__cart__table">
					<table>
						<thead>
							<tr>
								<th class="shoping__product">Id</th>
								<th><s:message code="order.table.name"></s:message></th>
								<th><s:message code="order.table.phone"></s:message></th>
								<th><s:message code="order.table.address"></s:message></th>
								<th><s:message code="order.table.date"></s:message></th>
								<th><s:message code="order.table.total"></s:message></th>
								<th><s:message code="order.table.status"></s:message></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="bill" items="${listBill}">
								<tr>
									<td>${bill.id}</td>
									<td>${bill.customer}</td>
									<td>${bill.phone}</td>
									<td>${bill.address}</td>
									<td>${bill.dayCreate}</td>
									<td><fmt:formatNumber
											type="number" groupingUsed="true"
											value="${bill.total}" />đ</td>
									<c:if test="${bill.status==true}"><td>Đã xác nhận</td></c:if>
									<c:if test="${bill.status==false}"><td>Chưa xác nhận</td></c:if>
									
									<td><a
										href="${pageContext.servletContext.contextPath}/order/detail/${bill.id}.htm"
										class="btn btn-sm btn-warning"><s:message code="order.button"></s:message></a></td>

								</tr>

							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
	</div>
</section>
<!-- Shoping Cart Section End -->

<%@include file="/WEB-INF/views/layouts/user/footer.jsp"%>
