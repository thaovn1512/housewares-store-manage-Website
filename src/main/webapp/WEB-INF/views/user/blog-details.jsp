<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@include file="/WEB-INF/views/layouts/user/header.jsp"%>
    
    <%@include file="/WEB-INF/views/layouts/user/category.jsp"%>
    
    
    
    
    <!-- Blog Details Hero Begin -->
    <section class="blog-details-hero set-bg" data-setbg="resources/user/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="blog__details__hero__text">
                        <h2>${blog.name}</h2>
                        <ul>
                            <li>${blog.admin.name}</li>
                            <li>${blog.dayCreate}</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Hero End -->

    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5 order-md-1 order-2">
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
                <div class="col-lg-8 col-md-7 order-md-1 order-1">
                    <div class="blog__details__text">
                        <img src="resources/user/img/blog/${blog.image}.jpg" alt="">
                        <h2>${blog.name}</h2>
                        <p>${blog.link}</p>
                        
                    </div>
                    <div class="blog__details__content">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="blog__details__author">
                                    <div class="blog__details__author__pic">
                                        <img src="resources/user/img/blog/details/author.jpg" alt="">
                                    </div>
                                    <div class="blog__details__author__text">
                                        <h6>${blog.admin.name}</h6>
                                        <span>Admin</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="blog__details__widget">
                                    <div class="blog__details__social">
                                        <a href="#"><i class="fa fa-facebook"></i></a>
                                        <a href="#"><i class="fa fa-twitter"></i></a>
                                        <a href="#"><i class="fa fa-google-plus"></i></a>
                                        <a href="#"><i class="fa fa-linkedin"></i></a>
                                        <a href="#"><i class="fa fa-envelope"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Section End -->

    <!-- Related Blog Section Begin -->
<!--     <section class="related-blog spad"> -->
<!--         <div class="container"> -->
<!--             <div class="row"> -->
<!--                 <div class="col-lg-12"> -->
<!--                     <div class="section-title related-blog-title"> -->
<!--                         <h2>Post You May Like</h2> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--             <div class="row"> -->
<!--                 <div class="col-lg-4 col-md-4 col-sm-6"> -->
<!--                     <div class="blog__item"> -->
<!--                         <div class="blog__item__pic"> -->
<!--                             <img src="img/blog/blog-1.jpg" alt=""> -->
<!--                         </div> -->
<!--                         <div class="blog__item__text"> -->
<!--                             <ul> -->
<!--                                 <li><i class="fa fa-calendar-o"></i> May 4,2019</li> -->
<!--                                 <li><i class="fa fa-comment-o"></i> 5</li> -->
<!--                             </ul> -->
<!--                             <h5><a href="#">Cooking tips make cooking simple</a></h5> -->
<!--                             <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-lg-4 col-md-4 col-sm-6"> -->
<!--                     <div class="blog__item"> -->
<!--                         <div class="blog__item__pic"> -->
<!--                             <img src="img/blog/blog-2.jpg" alt=""> -->
<!--                         </div> -->
<!--                         <div class="blog__item__text"> -->
<!--                             <ul> -->
<!--                                 <li><i class="fa fa-calendar-o"></i> May 4,2019</li> -->
<!--                                 <li><i class="fa fa-comment-o"></i> 5</li> -->
<!--                             </ul> -->
<!--                             <h5><a href="#">6 ways to prepare breakfast for 30</a></h5> -->
<!--                             <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-lg-4 col-md-4 col-sm-6"> -->
<!--                     <div class="blog__item"> -->
<!--                         <div class="blog__item__pic"> -->
<!--                             <img src="img/blog/blog-3.jpg" alt=""> -->
<!--                         </div> -->
<!--                         <div class="blog__item__text"> -->
<!--                             <ul> -->
<!--                                 <li><i class="fa fa-calendar-o"></i> May 4,2019</li> -->
<!--                                 <li><i class="fa fa-comment-o"></i> 5</li> -->
<!--                             </ul> -->
<!--                             <h5><a href="#">Visit the clean farm in the US</a></h5> -->
<!--                             <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </section> -->
    <!-- Related Blog Section End -->

  
    
    
    
    <%@include file="/WEB-INF/views/layouts/user/footer.jsp"%>
    