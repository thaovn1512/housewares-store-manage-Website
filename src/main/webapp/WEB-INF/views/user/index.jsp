<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<%@include file="/WEB-INF/views/layouts/user/header.jsp" %>

 <style>p {
    width: 300px;
    overflow: hidden;
    text-overflow: ellipsis;
    line-height: 20px;
    -webkit-line-clamp: 5;
    display: -webkit-box;
    -webkit-box-orient: vertical;
}</style>

<!-- Hero Section Begin -->
<section class="hero">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="hero__categories">
					<div class="hero__categories__all">
						<i class="fa fa-bars"></i> <span><s:message code="header.category"></s:message></span>
					</div>
					<ul>
						<c:forEach var="c" items="${categories}">
							<li><a
								href="${pageContext.servletContext.contextPath }/product/list-by-category/${c.id}.htm">${c.name}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="col-lg-9">
				<div class="hero__search">
					<div class="hero__search__form">
						<form
							action="${pageContext.servletContext.contextPath}/product/list-by-keywords.htm"
							method="post">
							<s:message code="header.search.placeholder" var="placeholderSearch"></s:message>
							<input value="${param.keywords}" name="keywords" type="text"
								placeholder="${placeholderSearch}">
							<button class="site-btn"><s:message code="header.search" ></s:message></button>
						</form>
					</div>
					<div class="hero__search__phone">
						<div class="hero__search__phone__icon">
							<i class="fa fa-phone"></i>
						</div>
						<div class="hero__search__phone__text">
							<h5>0397181350</h5>
							<span><s:message code="header.support" ></s:message></span>
						</div>
					</div>
				</div>
				<!-- Banner -->
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner">

						<div class="item active">
							<a href="https://tiki.vn/thuong-hieu/lock-lock.html"
								target="_blank"><img
								src="resources/user/img/banner/bannerIndex.jpg"
								style="width: 100%;"></a>

						</div>

						<div class="item">
							<a href="https://tiki.vn/khuyen-mai/flash-sale-dien-gia-dung"
								target="_blank"><img
								src="resources/user/img/banner/banner1.jpg" style="width: 100%;"></a>

						</div>

						<div class="item">
							<a
								href="https://tiki.vn/khuyen-mai/sieu-sale-thuong-hieu-gia-dung?preview=1&page_id=218"
								target="_blank"><img
								src="resources/user/img/banner/banner2.jpg" style="width: 100%;"></a>


						</div>

					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>

		

				<!--End Banner -->

			</div>
		</div>
	</div>
</section>
<!-- Hero Section End -->


<!-- Categories Section Begin -->
<section class="categories">
	<div class="container">
		<div class="row">
			<div class="categories__slider owl-carousel">
				<c:forEach var="c" items="${categories}">
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="resources/user/img/categories/cat-${c.id}.jpg">
							<h5>
								<a
									href="${pageContext.servletContext.contextPath}/product/list-by-category/${c.id}.htm">${c.name}</a>
							</h5>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
</section>
<!-- Categories Section End -->

<!-- Featured Section Begin -->
<section class="featured spad">
	<div class="container">

	</div>
</section>
<!-- Featured Section End -->

<!-- Banner Begin -->
<div class="banner">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6 col-sm-6">
				<div class="banner__pic">
					<img src="resources/user/img/banner/banner1.jpg" alt="">
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6">
				<div class="banner__pic">
					<img src="resources/user/img/banner/banner2.jpg" alt="">
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Banner End -->

<!-- Latest Product Section Begin -->
<section class="latest-product spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4><s:message code="index.latest" ></s:message></h4>
					<div class="latest-product__slider owl-carousel">
						<c:forEach var="p" items="${listLatest}" varStatus="theCount" step="3">							
								<div class="latest-prdouct__slider__item">
								<c:forEach var="p1" items="${listLatest}" begin="${theCount.index}" end="${theCount.index+2}">
									<a href="${pageContext.servletContext.contextPath}/product/detail/${p1.id}.htm" class="latest-product__item">
										<div class="latest-product__item__pic">
											<img src="resources/user/img/product/${p1.image}">
										</div>
										<div class="latest-product__item__text" style="color: #1c1c1c">
											<h6>${p1.name}</h6>
											<span><fmt:formatNumber type="number" groupingUsed="true"
												value="${p.price-p.price*p.discount/100}" />đ</span>
											
										</div>
									</a> 	
									</c:forEach>
								</div>
						
							
						</c:forEach>
						
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4><s:message code="index.bestsell" ></s:message></h4>
					<div class="latest-product__slider owl-carousel">
						<c:forEach var="p" items="${listBestseller}" varStatus="theCount" step="3">
						
							
								<div class="latest-prdouct__slider__item">
								<c:forEach var="p1" items="${listBestseller}" begin="${theCount.index}" end="${theCount.index+2}">
									<a href="${pageContext.servletContext.contextPath}/product/detail/${p1.id}.htm" class="latest-product__item">
										<div class="latest-product__item__pic">
											<img src="resources/user/img/product/${p1.image}">
										</div>
										<div class="latest-product__item__text">
											<h6>${p1.name}</h6>
											
											<span><fmt:formatNumber type="number" groupingUsed="true"
												value="${p.price-p.price*p.discount/100}" />đ</span>
										</div>
									</a> 	
									
									</c:forEach>
								</div>
						
							
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4><s:message code="index.sale" ></s:message></h4>

					<div class="latest-product__slider owl-carousel">
						<c:forEach var="p" items="${listSale}" varStatus="theCount" step="3">
						
							
								<div class="latest-prdouct__slider__item">
								<c:forEach var="p1" items="${listSale}" begin="${theCount.index}" end="${theCount.index+2}">
								<c:if test="${p1.discount!=0}">
									<a href="${pageContext.servletContext.contextPath}/product/detail/${p1.id}.htm" class="latest-product__item">
										<div class="latest-product__item__pic">
											<img src="resources/user/img/product/${p1.image}">
										</div>
										<div class="latest-product__item__text">
											<h6>${p1.name}</h6>
											
											<span><fmt:formatNumber type="number" groupingUsed="true"
												value="${p.price-p.price*p.discount/100}" />đ</span>
										</div>
									</a> 	
																	
									</c:if>
									
									</c:forEach>
								</div>
						
							
						</c:forEach>

						
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Latest Product Section End -->

<!-- Blog Section Begin -->
<section class="from-blog spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title from-blog__title">
					<h2><s:message code="index.blog" ></s:message></h2>
				</div>
			</div>
		</div>
		<div class="row">
		<c:forEach var="blog" items="${listRecent}" begin="0" end="2">
			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="blog__item">
					<div class="blog__item__pic">
						<img src="resources/user/img/blog/${blog.image}.jpg" style="width: 290px; height:250px ">
					</div>
					<div class="blog__item__text">
						<ul>
							<li><i class="fa fa-calendar-o"></i> ${blog.dayCreate}</li>
							<li><i class="fa fa-comment-o"></i> 5</li>
						</ul>
						<h5>
							<a href="${pageContext.servletContext.contextPath }/blog/detail/${blog.id}.htm">${blog.name}</a>
						</h5>
						<p>${blog.link}</p>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
</section>
<!-- Blog Section End -->

<%@include file="/WEB-INF/views/layouts/user/footer.jsp"%>

