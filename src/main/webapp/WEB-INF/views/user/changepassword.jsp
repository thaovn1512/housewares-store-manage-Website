<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<%@include file="/WEB-INF/views/layouts/user/header.jsp"%>

<!-- Hero Section Begin -->
<section class="hero">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="hero__categories">
					<div class="hero__categories__all">
						<i class="fa fa-bars"></i> <span><s:message code="account.title"></s:message></span>
					</div>
					<ul>

							<li><a href="updateProfile.htm"><s:message code="account.menu.profile"></s:message></a></li>
						<li><a href="changePassword.htm"><s:message code="account.menu.change"></s:message></a></li>

					</ul>
				</div>
			</div>
			<div class="col-lg-9">
			 <div class="checkout__form">
                <h4><s:message code="account.menu.change"></s:message></h4>
                <form action="changePassword.htm"  method="post">
                            <div class="checkout__input">
                                <p>Email<span>*</span></p>
                                 <input name="email" type="email" value="${user.email}" disabled="true" />
                            </div>
                            <div class="checkout__input">
                                <p><s:message code="account.currentpw"></s:message><span>*</span></p>
                                <input name="pw" type="password"  />
                                
                            </div>
                             <div class="checkout__input">
                                <p><s:message code="account.newpw"></s:message><span>*</span></p>
                                <input name="pw1" type="password"  />
                                
                            </div>
                             <div class="checkout__input">
                                <p><s:message code="account.confirmpw"></s:message><span>*</span></p>
                                <input name="pw2" type="password"  />
                                
                            </div>
                            <div><span style="color: red; font-size: 20px">${message}</span> </div>
                           <div class="checkout__order">
                      <button type="submit" class="site-btn"><s:message code="account.button"></s:message></button>
                        </div>
                </form>
            </div>
			</div>
		</div>
	</div>
</section>
<!-- Hero Section End -->






<%@include file="/WEB-INF/views/layouts/user/footer.jsp"%>

