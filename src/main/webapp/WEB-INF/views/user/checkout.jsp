<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/header.jsp" %>


    <%@include file="/WEB-INF/views/layouts/user/category.jsp" %>
    
<style type="text/css">
  *[id$=errors]{
  color: red;
  font-style: italic;
  }
  </style>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="resources/user/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2><s:message code="checkout.title"></s:message></h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html"><s:message code="header.menu.home"></s:message></a>
                            <span><s:message code="checkout.title"></s:message></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <h4><s:message code="checkout.bill.title"></s:message></h4>
                <form:form action="order/complete.htm" modelAttribute="bill" method="post">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            
                              
                                    <div class="checkout__input">
                                        <p><s:message code="checkout.name"></s:message><span>*</span></p>
                                        <form:input path="customer" type="text" value="${user.name}"/>
                                        <form:errors path="customer"/>
                                    </div>
                                
                           
                            <div class="checkout__input">
                                <p><s:message code="checkout.address"></s:message><span>*</span></p>
                                <form:input path="address" type="text" value="${user.address}"/>
                                 <form:errors path="address"/>
                            </div>
                              
                                    <div class="checkout__input">
                                        <p><s:message code="checkout.phone"></s:message><span>*</span></p>
                                        <form:input path="phone" type="text" value="${user.phone}"/>
                                         <form:errors path="phone"/>
                                    </div>
 
                               
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <form:input path="email" type="text" value="${user.email}"/>
                                         <form:errors path="email"/>
                                    </div>
                      

                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="checkout__order">
                                <h4><s:message code="checkout.order.title"></s:message></h4>
                                <div class="checkout__order__products"><s:message code="cart.table.product"></s:message> <span><s:message code="cart.table.total"></s:message></span></div>
                                <ul>
                                <c:forEach var="item" items="${sessionScope.myCartItems}">
                                    <li>${item.value.product.name}<span><fmt:formatNumber type="number"
									groupingUsed="true" value="${(item.value.product.price-item.value.product.price*item.value.product.discount/100)*item.value.quantity}" />đ</span></li>
                                   
                                    </c:forEach>
                                </ul>
                                <div class="checkout__order__total">Total <span><fmt:formatNumber type="number"
									groupingUsed="true" value="${sessionScope.myCartTotal}" />đ</span></div>
									<div>
							<span style="color: red; font-size: 20px">${message}</span>
						</div>
                                <button type="submit" class="site-btn"><s:message code="checkout.button"></s:message></button>
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->

   <%@include file="/WEB-INF/views/layouts/user/footer.jsp" %>
   