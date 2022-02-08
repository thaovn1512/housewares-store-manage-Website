<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/layouts/user/header.jsp"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="/WEB-INF/views/layouts/user/category.jsp"%>


<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg"
	data-setbg="resources/user/img/breadcrumb.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>Đồ Gia Dụng</h2>
					<div class="breadcrumb__option">
						<a href="index.htm"><s:message code="header.menu.home"></s:message></a>
						<span><s:message code="header.menu.shop"></s:message></span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Section Begin -->
<section class="product spad">
	<div class="container">

		<div class="row">
			<%-- 		<jsp:useBean id="pagedListHolder" scope="request" --%>
			<%-- 					type="org.springframework.beans.support.PagedListHolder" /> --%>
			<%-- 			<c:url value="/product/list-by-category/${c.id}.htm" var="pagedLink"> --%>
			<%-- 				<c:param name="p" value="~" /> --%>
			<%-- 			</c:url> --%>
			<div class="col-lg-3 col-md-5">
				<div class="sidebar">
					<div class="sidebar__item">
						<h4>
							<s:message code="header.category"></s:message>
						</h4>
						<ul>
							<c:forEach var="c" items="${categories}">
								<li><a
									href="${pageContext.servletContext.contextPath }/product/list-by-category/${c.id}.htm">${c.name}</a></li>
							</c:forEach>
						</ul>
					</div>


					<div class="sidebar__item">
						<h4>
							<s:message code="header.brand"></s:message>
						</h4>
						<c:forEach var="br" items="${brands}">
							<div class="sidebar__item__size">
								<ul>

									<div>
										<li><a
											href="${pageContext.servletContext.contextPath }/product/list-by-brand/${br.id}.htm">${br.name}</a></li>
									</div>

								</ul>
							</div>
						</c:forEach>
					</div>
					<div class="sidebar__item">
						<div class="latest-product__text">
							<h4>
								<s:message code="index.latest"></s:message>
							</h4>
							<div class="latest-product__slider owl-carousel">
								<c:forEach var="p" items="${listLatest}" varStatus="theCount"
									step="3">
									<div class="latest-prdouct__slider__item">
										<c:forEach var="p1" items="${listLatest}"
											begin="${theCount.index}" end="${theCount.index+2}">
											<a
												href="${pageContext.servletContext.contextPath}/product/detail/${p1.id}.htm"
												class="latest-product__item">
												<div class="latest-product__item__pic">
													<img src="resources/user/img/product/${p1.image}">
												</div>
												<div class="latest-product__item__text"
													style="color: #1c1c1c">
													<h6>${p1.name}</h6>
													<span><fmt:formatNumber type="number"
															groupingUsed="true"
															value="${p1.price-p1.price*p1.discount/100}" />đ</span>

												</div>
											</a>
										</c:forEach>
									</div>


								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-9 col-md-7">
				<div class="product__discount">
					<div class="section-title product__discount__title">
						<h2>
							<s:message code="index.saleoff"></s:message>
						</h2>
					</div>
					<div class="row">
						<div class="product__discount__slider owl-carousel">
							<c:forEach var="p" items="${listSale}">
								<div class="col-lg-4">
									<div class="product__discount__item">
										<div class="product__discount__item__pic set-bg"
											data-setbg="resources/user/img/product/${p.image}" />
										<div class="product__discount__percent">${p.discount}%</div>
										<ul class="product__item__pic__hover" data-id="${p.id}">
											<li><a><i class="fa fa-heart btn-star"></i></a></li>
											<!-- 												<li><a><button class="btn-star"><i class="fa fa-heart"></i></button></a></li>  -->
											<li><a href="#"><i class="fa fa-retweet"></i></a></li>
											<c:if test="${p.quantity==0}">
												<li><a style="color: #252525"><i
														class="fa fa-shopping-cart"></i></a></li>
											</c:if>
											<c:if test="${p.quantity!=0}">
												<li><a href="./cart/${p.id}.htm?btn-dat"><i
													class="fa fa-shopping-cart"></i></a></li>
											</c:if>
											
										</ul>
									</div>
									<div class="product__discount__item__text">
										<span>${p.category.name}</span>
										<h5>
											<a
												href="${pageContext.servletContext.contextPath}/product/detail/${p.id}.htm">${p.name}</a>
										</h5>
										<div class="product__item__price">
											<fmt:formatNumber type="number" groupingUsed="true"
												value="${p.price-p.price*p.discount/100}" />
											đ <span>${p.price}đ</span>
										</div>
									</div>
								</div>
						</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="filter__item">
				<div class="row">
					<div class="col-lg-4 col-md-5">
						<div class="filter__sort">

							<div class="header__top__right__language">
								<span><s:message code="product.sort"></s:message></span> <span
									class="arrow_carrot-down"></span>
								<ul>
									<li><a href="product.htm"><s:message
												code="product.sort.default"></s:message></a></li>
									<li><a href="product/ascending.htm"><s:message
												code="product.sort.ascending"></s:message></a></li>
									<li><a href="product/descending.htm"><s:message
												code="product.sort.descending"></s:message></a></li>
									<li><a href="product/latest.htm"><s:message
												code="product.sort.latest"></s:message></a></li>
									<li><a href="product/bestseller.htm"><s:message
												code="product.sort.bestsell"></s:message></a></li>
									<li><a href="product/saleoff.htm"><s:message
												code="product.sort.saleoff"></s:message></a></li>
								</ul>
							</div>
							<!-- 														 <select> -->
							<!-- 															<a href="/product.htm"><option value="0">Default</option></a> -->
							<!-- 															<a href="/product/ascending.htm"><option value="1">Ascending</option></a> -->
							<!-- 															<option value="1">Ascending</option> 
<!-- 															<option value="2">Decrease</option> -->
							<!-- 															<option value="3">Lastet</option> -->
							<!-- 														</select> -->

						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<jsp:useBean id="pagedListHolder" scope="request"
					type="org.springframework.beans.support.PagedListHolder" />

				<c:url value="/product/list-by-category/${c.id}.htm" var="pagedLink">
					<c:param name="p" value="~" />
				</c:url>
				<c:url value="/product.htm" var="pagedLink">
					<c:param name="p" value="~" />
				</c:url>
				<c:forEach var="pd" items="${pagedListHolder.pageList}">
					<div class="col-lg-4 col-md-6 col-sm-6">
						<c:if test="${pd.discount==0}">
							<div class="product__item">
								<div class="product__item__pic set-bg"
									data-setbg="resources/user/img/product/${pd.image}">

									<ul class="product__item__pic__hover">
										<li><a href="#"><i class="fa fa-heart"></i></a></li>
										<li><a href="#"><i class="fa fa-retweet"></i></a></li>
										<c:if test="${pd.quantity==0}">
												<li><a style="color: #252525"><i
														class="fa fa-shopping-cart"></i></a></li>
											</c:if>
											<c:if test="${pd.quantity!=0}">
												<li><a href="./cart/${pd.id}.htm?btn-dat"><i
												class="fa fa-shopping-cart"></i></a></li>
											</c:if>
										
									</ul>
								</div>
								<div class="product__item__text">
									<h6>
										<a
											href="${pageContext.servletContext.contextPath }/product/detail/${pd.id}.htm">${pd.name}</a>
									</h6>
									<h5>
										<fmt:formatNumber type="number" groupingUsed="true"
											value="${pd.price}" />
										đ
									</h5>
								</div>
							</div>
						</c:if>
						<c:if test="${pd.discount!=0}">
							<div class="product__discount__item">
								<div class="product__discount__item__pic set-bg"
									data-setbg="resources/user/img/product/${pd.image}">
									<div class="product__discount__percent">${pd.discount}%</div>
									<ul class="product__item__pic__hover">
										<li><a href="#"><i class="fa fa-heart"></i></a></li>
										<li><a href="#"><i class="fa fa-retweet"></i></a></li>
										<c:if test="${pd.quantity==0}">
												<li><a style="color: #252525"><i
														class="fa fa-shopping-cart"></i></a></li>
											</c:if>
											<c:if test="${pd.quantity!=0}">
												<li><a href="./cart/${pd.id}.htm?btn-dat"><i
												class="fa fa-shopping-cart"></i></a></li>
											</c:if>
										
									</ul>
								</div>
								<div class="product__discount__item__text">

									<h6>
										<a style="color: #252525"
											href="${pageContext.servletContext.contextPath }/product/detail/${pd.id}.htm">${pd.name}</a>
									</h6>
									<div class="product__item__price">
										<fmt:formatNumber type="number" groupingUsed="true"
											value="${pd.price-pd.price*pd.discount/100}" />
										đ <span>${pd.price}đ</span>
									</div>
								</div>
							</div>
						</c:if>
					</div>
				</c:forEach>

			</div>
			<tg:paging pagedListHolder="${pagedListHolder}"
				pagedLink="${pagedLink}" />
		</div>
	</div>
	</div>
</section>
<!-- Product Section End -->


<%@include file="/WEB-INF/views/layouts/user/footer.jsp"%>
