<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@include file="/WEB-INF/views/layouts/user/header.jsp"%>
<%@include file="/WEB-INF/views/layouts/user/category.jsp"%>


<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg"
	data-setbg="resources/user/img/breadcrumb.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>${product.name}</h2>
					<div class="breadcrumb__option">
						<a href="/index.htm"><s:message code="header.menu.home"></s:message></a>
						<a
							href="${pageContext.servletContext.contextPath}/product/list-by-category/${product.category.id}.htm">${product.category.name}</a>
						<span>${product.name}</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Details Section Begin -->
<section class="product-details spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6">
				<div class="product__details__pic">
					<div class="product__details__pic__item">
						<img class="product__details__pic__item--large"
							src="resources/user/img/product/${product.image}" alt="">
					</div>
					<div class="product__details__pic__slider owl-carousel">
						<img
							data-imgbigurl="resources/user/img/product/product-${product.image}"
							src="resources/user/img/product/${product.image}" alt="">
						<img
							data-imgbigurl="resources/user/img/product/product-${product.image}"
							src="resources/user/img/product/${product.image}" alt="">
						<img
							data-imgbigurl="resources/user/img/product/product-${product.image}"
							src="resources/user/img/product/${product.image}" alt="">
						<img
							data-imgbigurl="resources/user/img/product/${product.image}"
							src="resources/user/img/product/${product.image}" alt="">
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-6">
				<div class="product__details__text">
					<h3>${product.name}</h3>
					<h5>
						<s:message code="product.brand"></s:message>
						: <a
							href="${pageContext.servletContext.contextPath}/product/list-by-brand/${product.brand.id}.htm"
							style="text-decoration: none; color: blue; display: inline-block;">${product.brand.name}</span></a>
					</h5>
					<div class="product__details__rating">
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star-half-o"></i> <span>(18 reviews)</span>
					</div>
					<div class="product__details__price " id="discountPrice">
						<fmt:formatNumber type="number" groupingUsed="true"
							value="${product.price-product.price*product.discount/100}" />
						đ
						<c:if test="${product.discount!=0}">
							<span
								style="color: #b2b2b2; text-decoration: line-through; margin-left: 10px; font-size: 25px;">${product.price}đ</span>
						</c:if>
					</div>
					<p>${product.description }</p>

					<c:if test="${product.quantity==0}">
						<a style="background: #b2b2b2" class="primary-btn"><s:message
								code="product.add"></s:message></a>
					</c:if>
					<c:if test="${product.quantity!=0}">
						<a href="./cart/${product.id}.htm?btn-dat" class="primary-btn"><s:message
								code="product.add"></s:message></a>
					</c:if>
					<a href="#" class="heart-icon btn-star"><span
						class="icon_heart_alt"></span></a>
					<ul>
						<li><b><s:message code="product.availability"></s:message></b>
							<c:if test="${product.status==true}">
								<span><s:message code="product.availability.true"></s:message></span>
							</c:if> <c:if test="${product.status==false}">
								<span><s:message code="product.availability.false"></s:message></span>
							</c:if></li>
						<li><b><s:message code="product.availability.shipping"></s:message></b>
							<span><s:message
									code="product.availability.shipping.title"></s:message> <samp>
									<s:message code="product.availability.shipping.sub"></s:message>
								</samp></span></li>
						<li><b><s:message code="product.availability.status"></s:message></b>
							<span>${product.quantity}</span></li>
						<li><b><s:message code="product.availability.date"></s:message></b>
							<span>${product.dateCreate}</span></li>
						<li><b><s:message code="product.availability.share"></s:message></b>
							<div class="share">
								<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
									class="fa fa-twitter"></i></a> <a href="#"><i
									class="fa fa-instagram"></i></a> <a href="#"><i
									class="fa fa-pinterest"></i></a>
							</div></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="product__details__tab">
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true"><s:message
									code="product.descript"></s:message></a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#tabs-2" role="tab" aria-selected="false"><s:message
									code="product.information"></s:message></a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#tabs-3" role="tab" aria-selected="false"><s:message
									code="product.review"></s:message> <span>(1)</span></a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tabs-1" role="tabpanel">
							<div class="product__details__tab__desc">
								<h6>
									<s:message code="product.descript.title"></s:message>
								</h6>
								<p>${product.description}</p>

							</div>
						</div>
						<div class="tab-pane" id="tabs-2" role="tabpanel">
							<div class="product__details__tab__desc">
								<h6>
									<s:message code="product.information.title"></s:message>
								</h6>
								<p>${product.information}</p>

							</div>
						</div>
						<div class="tab-pane" id="tabs-3" role="tabpanel">
							<div class="product__details__tab__desc">
								<h6>
									<s:message code="product.review"></s:message>
								</h6>
								<p>Sản phẩm tốt. Giao hàng nhanh chóng tiện lợi</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Product Details Section End -->

<!-- Related Product Section Begin -->
<section class="related-product">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title related__product__title">
					<h2>
						<s:message code="product.related"></s:message>
					</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="product__discount__slider owl-carousel">
				<c:forEach var="relatedProduct" items="${listRelated}">
					<div class="col-lg-3 col-md-4 col-sm-6">

						<c:if test="${relatedProduct.discount==0}">
							<div class="product__item" style="width: 270px">
								<div class="product__item__pic set-bg"
									data-setbg="resources/user/img/product/${relatedProduct.image}">

									<ul class="product__item__pic__hover">
										<li><a href="#"><i class="fa fa-heart btn-star"></i></a></li>
										<li><a href="#"><i class="fa fa-retweet"></i></a></li>
										<c:if test="${relatedProduct.quantity==0}">
											<li><a style="color: #252525"><i
													class="fa fa-shopping-cart"></i></a></li>
										</c:if>
										<c:if test="${relatedProduct.quantity!=0}">
											<li><a href="./cart/${relatedProduct.id}.htm?btn-dat"><i
													class="fa fa-shopping-cart"></i></a></li>
										</c:if>
									</ul>
								</div>
								<div class="product__item__text " style="width: 270px">
									<h6>
										<a
											href="${pageContext.servletContext.contextPath }/product/detail/${relatedProduct.id}.htm">${relatedProduct.name}</a>
									</h6>
									<h5>
										<fmt:formatNumber type="number" groupingUsed="true"
											value="${relatedProduct.price}" />
										đ
									</h5>
								</div>
							</div>
						</c:if>
						<c:if test="${relatedProduct.discount!=0}">
							<div class="product__discount__item" style="width: 270px">
								<div class="product__discount__item__pic set-bg"
									data-setbg="resources/user/img/product/${relatedProduct.image}">
									<div class="product__discount__percent">-${relatedProduct.discount}%</div>
									<ul class="product__item__pic__hover">
										<li><a href="#"><i class="fa fa-heart btn-star"></i></a></li>
										<li><a href="#"><i class="fa fa-retweet"></i></a></li>
										<c:if test="${relatedProduct.quantity==0}">
											<li><a style="color: #252525"><i
													class="fa fa-shopping-cart"></i></a></li>
										</c:if>
										<c:if test="${relatedProduct.quantity!=0}">
											<li><a href="./cart/${relatedProduct.id}.htm?btn-dat"><i
													class="fa fa-shopping-cart"></i></a></li>
										</c:if>
									</ul>
								</div>
								<div class="product__discount__item__text" style="width: 270px">

									<h6>
										<a style="color: #252525"
											href="${pageContext.servletContext.contextPath }/product/detail/${relatedProduct.id}.htm">${relatedProduct.name}</a>
									</h6>
									<div class="product__item__price">
										<fmt:formatNumber type="number" groupingUsed="true"
											value="${relatedProduct.price-relatedProduct.price*relatedProduct.discount/100}" />
										đ <span>${relatedProduct.price}đ</span>
									</div>
								</div>
							</div>
						</c:if>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</section>
<!-- Related Product Section End -->
<%@include file="/WEB-INF/views/layouts/user/footer.jsp"%>

