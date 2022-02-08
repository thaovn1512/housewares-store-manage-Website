<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath }/">
<%@include file="/WEB-INF/views/taglib/taglib.jsp"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Hero Section Begin -->
<section class="hero hero-normal">
	<div class="container">
			
		<div class="row">
			
			<div class="col-lg-3">
				<div class="hero__categories">
					<div class="hero__categories__all">
						<i class="fa fa-bars"></i> <span><s:message code="header.category"></s:message></span>
					</div>
					<ul>
						<c:forEach var="c" items="${categories}">
							<li><a href="${pageContext.servletContext.contextPath }/product/list-by-category/${c.id}.htm">${c.name}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="col-lg-9">
				<div class="hero__search">
					<div class="hero__search__form">
						<form action="${pageContext.servletContext.contextPath}/product/list-by-keywords.htm" method="post">
						<s:message code="header.search.placeholder" var="placeholderSearch"></s:message>
							<input name="keywords" value="${param.keywords}" type="text" placeholder="${placeholderSearch}">
							<button class="site-btn"><s:message code="header.search"></s:message></button>
						</form>
					</div>
					<div class="hero__search__phone">
						<div class="hero__search__phone__icon">
							<i class="fa fa-phone"></i>
						</div>
						<div class="hero__search__phone__text">
							<h5>0397181350</h5>
							<span><s:message code="header.support"></s:message></span>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</section>
<!-- Hero Section End -->
