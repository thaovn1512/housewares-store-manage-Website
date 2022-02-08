<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/header.jsp"%>

    <%@include file="/WEB-INF/views/layouts/user/category.jsp"%>
    
    
   <style>p {
    width: 300px;
    overflow: hidden;
    text-overflow: ellipsis;
    line-height: 20px;
    -webkit-line-clamp: 5;
    display: -webkit-box;
    -webkit-box-orient: vertical;
}</style>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="resources/user/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2><s:message code="blog.title"></s:message></h2>
                        <div class="breadcrumb__option">
                            <a href="index.htm"><s:message code="header.menu.home"></s:message></a>
                            <span><s:message code="blog.title"></s:message></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Blog Section Begin -->
    <section class="blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__search">
                            <form action="#">
                                <input type="text" placeholder="Search...">
                                <button type="submit"><span class="icon_search"></span></button>
                            </form>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4><s:message code="blog.category"></s:message></h4>
                            <ul>
                            <c:forEach var="c" items="${categories}">
                                <li><a href="#">${c.name}</a></li>
                                
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4><s:message code="blog.recent"></s:message></h4>
                            <div class="blog__sidebar__recent">
                            <c:forEach var="blog" items="${listRecent}" begin="0" end="2">
                                <a href="${pageContext.servletContext.contextPath }/blog/detail/${blog.id}.htm" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="resources/user/img/blog/${blog.image}.jpg" style="width: 70px; height:70px ">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>${blog.name}</h6>
                                        <span>${blog.dayCreate}</span>
                                    </div>
                                </a>
                               </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 col-md-7">
                    <div class="row">
                    <c:forEach var="blog" items="${listBlog}" >
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="blog__item">
                                <div class="blog__item__pic">
                                    <img src="resources/user/img/blog/${blog.image}.jpg" style="width: 290px; height:250px ">
                                </div>
                                <div class="blog__item__text">
                                    <ul>
                                        <li><i class="fa fa-calendar-o"></i>${blog.dayCreate}</li>
                                        <li><i class="fa fa-comment-o"></i> 5</li>
                                    </ul>
                                    <h5><a href="${pageContext.servletContext.contextPath }/blog/detail/${blog.id}.htm">${blog.name}</a></h5>
                                    <p>${blog.link} </p>
                                    <a href="${pageContext.servletContext.contextPath }/blog/detail/${blog.id}.htm" class="blog__btn"><s:message code="blog.read"></s:message> <span class="arrow_right"></span></a>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

    
    
    
    
    
    
    <%@include file="/WEB-INF/views/layouts/user/footer.jsp"%>
    