<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/taglib/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${pageContext.servletContext.contextPath }/">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- <meta http-equiv="X-UA-Compatible" content="ie=edge"> -->
<title>Web bán đồ gia dụng</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="<c:url value="resources/user/css/bootstrap.min.css"></c:url>"
	type="text/css">

<!-- <link rel="stylesheet" href="resources/user/css/font-awesome.min.css" -->
<!-- 	type="text/css"> -->
<link rel="stylesheet"
	href="<c:url value="resources/user/css/font-awesome.min.css"></c:url>"
	type="text/css">

<!-- <link rel="stylesheet" href="resources/user/css/elegant-icons.css" -->
<!-- 	type="text/css"> -->
<link rel="stylesheet"
	href="<c:url value="resources/user/css/elegant-icons.css"></c:url>"
	type="text/css">
<!-- <link rel="stylesheet" href="resources/user/css/nice-select.css" -->
<!-- 	type="text/css"> -->
<link rel="stylesheet"
	href="<c:url value="resources/user/css/nice-select.css"></c:url>"
	type="text/css">
<!-- <link rel="stylesheet" href="resources/user/css/jquery-ui.min.css" -->
<!-- 	type="text/css"> -->
<link rel="stylesheet"
	href="<c:url value="resources/user/css/jquery-ui.min.css"></c:url>"
	type="text/css">
<!-- <link rel="stylesheet" href="resources/user/css/owl.carousel.min.css" -->
<!-- 	type="text/css"> -->
<link rel="stylesheet"
	href="<c:url value="resources/user/css/owl.carousel.min.css"></c:url>"
	type="text/css">
<!-- <link rel="stylesheet" href="resources/user/css/slicknav.min.css" -->
<!-- 	type="text/css"> -->
<link rel="stylesheet"
	href="<c:url value="resources/user/css/slicknav.min.css"></c:url>"
	type="text/css">
<!-- <link rel="stylesheet" href="resources/user/css/style.css" -->
<!-- 	type="text/css"> -->
<link rel="stylesheet"
	href="<c:url value="resources/user/css/style.css"></c:url>"
	type="text/css">
	   	<script type="text/javascript" src="https://code.jquery.com/jquery-latest.pack.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>



<body>
	<%-- <script src="<c:url value="resources/user/js/btnClick.js"/>"></script> --%>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- 	<!-- Humberger Begin -->
	<!-- 	<div class="humberger__menu__overlay"></div> -->
	<!-- 	<div class="humberger__menu__wrapper"> -->
	<!-- 		<div class="humberger__menu__logo"> -->
	<!-- 			<a href="index.htm"><img src="resources/user/img/logo.png" alt=""></a> -->
	<!-- 		</div> -->
	<!-- 		<div class="humberger__menu__cart"> -->
	<!-- 			<ul> -->
	<%-- 				<li><a href="cart/${id}.htm"><i class="fa fa-shopping-bag"><span>${quantity}</span></i></a> --%>
	<!-- 			</ul> -->
	<!-- 			<div class="header__cart_price"> -->
	<%-- 				item: <span>${amount}đ</span> --%>
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 		<div class="humberger__menu__cart"> -->
	<!-- 			<ul> -->
	<!-- 				<li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li> -->
	<%-- 				<li><a href="cart/${id}.htm"><i class="fa fa-shopping-bag"></i> --%>
	<%-- 						<span>${quantity}</span></a></li> --%>
	<!-- 			</ul> -->
	<!-- 			<div class="header__cart__price"> -->
	<%-- 				item: <span>${amount}đ</span> --%>
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 		<div class="humberger__menu__widget"> -->
	<!-- 			<div class="header__top__right__language"> -->
	<!-- 				<img src="resources/user/img/language.png" alt=""> -->
	<!-- 				<div>English</div> -->
	<!-- 				<span class="arrow_carrot-down"></span> -->
	<!-- 				<ul> -->
	<!-- 					<li><a href="#">Tiếng Việt</a></li> -->
	<!-- 					<li><a href="#">English</a></li> -->
	<!-- 				</ul> -->
	<!-- 			</div> -->

	<!-- 			<div class="header__top__right__auth"> -->
	<!-- 				<a href="user/login.htm"><i class="fa fa-user"></i>Login </a> -->
	<!-- 			</div> -->

	<!-- 		</div> -->
	<!-- 		<nav class="humberger__menu__nav mobile-menu"> -->
	<!-- 			<ul> -->
	<!-- 				<li class="active"><a href="index.htm">Home</a></li> -->
	<!-- 				<li><a href="product.htm">Shop</a></li> -->
	<!-- 				<li><a href="#">Pages</a> -->
	<!-- 					<ul class="header__menu__dropdown"> -->
	<!-- 						<li><a href="product-details.htm">Shop Details</a></li> -->
	<!-- 						<li><a href="cart.htm">Shoping Cart</a></li> -->
	<!-- 						<li><a href="checkout.htm">Check Out</a></li> -->
	<!-- 						<li><a href="#">Blog Details</a></li> -->
	<!-- 					</ul></li> -->
	<!-- 				<li><a href="blog.htm">Blog</a></li> -->
	<!-- 				<li><a href="contact.htm">Contact</a></li> -->
	<!-- 			</ul> -->
	<!-- 		</nav> -->
	<!-- 		<div id="mobile-menu-wrap"></div> -->
	<!-- 		<div class="header__top__right__social"> -->
	<!-- 			<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i -->
	<!-- 				class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a> -->
	<!-- 			<a href="#"><i class="fa fa-pinterest-p"></i></a> -->
	<!-- 		</div> -->

	<!-- 	</div> -->
	<!-- 	<!-- Humberger End -->

	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6">
						<div class="header__top__left"></div>
					</div>
					<div class="col-lg-6 col-md-6">
						<div class="header__top__right">
<!-- 							<div class="header__top__right__social"> -->
<!-- 								<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i -->
<!-- 									class="fa fa-twitter"></i></a> <a href="#"><i -->
<!-- 									class="fa fa-linkedin"></i></a> <a href="#"><i -->
<!-- 									class="fa fa-pinterest-p"></i></a> -->
<!-- 							</div> -->
							<div class="header__top__right__language">
								<img src="resources/user/img/language-vi.png" alt="">
								<div><a href="${pageContext.servletContext.contextPath }/?language=vi" style="color: black">Tiếng Việt</a></div>
<!-- 								<span class="arrow_carrot-down"></span> -->
<!-- 								<ul> -->
<%-- 									<li><a href="${pageContext.servletContext.contextPath }/?language=vi">Tiếng Việt</a></li> --%>
<%-- 									<li><a href="${pageContext.servletContext.contextPath }/?language=en">English</a></li> --%>
<!-- 								</ul> -->
							</div>
							<div class="header__top__right__language">
								<img src="resources/user/img/language.png" alt="">
								<div><a href="${pageContext.servletContext.contextPath }/?language=en" style="color: black">English</a></div>
<!-- 								<span class="arrow_carrot-down"></span> -->
<!-- 								<ul> -->
<%-- 									<li><a href="${pageContext.servletContext.contextPath }/?language=vi">Tiếng Việt</a></li> --%>
<%-- 									<li><a href="${pageContext.servletContext.contextPath }/?language=en">English</a></li> --%>
<!-- 								</ul> -->
							</div>
							<c:if test="${ empty user}">
								<div class="header__top__right__auth">
									<a href="login.htm"><i class="fa fa-user"></i> <s:message code="login.button" ></s:message></a>
								</div>
							</c:if>
							<c:if test="${not empty user}">

								<div class="header__top__right__language">

									<div><s:message code="header.title"></s:message>: ${user.name}</div>
									<span class="arrow_carrot-down"></span>
									<ul style="width: 120px">
										<li><a href="logout.htm"><s:message code="header.account.logout"></s:message></a></li>
										<li><a href="information.htm"><s:message code="header.account.information"></s:message></a></li>
										<li><a href="order/list-order.htm"><s:message code="header.account.order"></s:message></a></li>

									</ul>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="index.htm"><img src="resources/user/img/logo.png"
							alt=""></a>
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="header__menu">
						<ul>
							<li class="active"><a href="index.htm"><s:message code="header.menu.home"></s:message></a></li>
							<li><a href="product.htm"><s:message code="header.menu.shop"></s:message></a></li>
<!-- 							<li><a href="#">Pages</a> -->
<!-- 								<ul class="header__menu__dropdown"> -->
<!-- 									<li><a href="product-details.htm">Shop Details</a></li> -->
<!-- 									<li><a href="cart.htm">Shoping Cart</a></li> -->
<!-- 									<li><a href="checkout.htm">Check Out</a></li> -->
<!-- 									<li><a href="blog-details.htm">Blog Details</a></li> -->
<!-- 								</ul></li> -->
							<li><a href="blog.htm"><s:message code="header.menu.blog"></s:message></a></li>
							<li><a href="contact.htm"><s:message code="header.menu.contact"></s:message></a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3">
					<div class="header__cart">
						<ul>
							<li><a href="#"><i class="fa fa-heart"></i> <span></span></a></li>
							<li><a href="cart/view.htm" id="checkout"><i
									class="fa fa-shopping-bag"></i> <span id="cart-cnt"><c:out
											value="${sessionScope.myCartNum}" /></span></a></li>
						</ul>
						<div class="header__cart__price">
							<%-- 							item: <span><c:out value="${sessionScope.myCartTotal}"/>đ</span> --%>
							<s:message code="header.cart"></s:message>: <span id="cart-amt"><fmt:formatNumber type="number"
									groupingUsed="true" value="${sessionScope.myCartTotal}" />đ</span>
						</div>
					</div>
				</div>
			</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->