<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/header.jsp" %>
<%@include file="/WEB-INF/views/layouts/user/category.jsp" %>


    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="resources/user/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2><s:message code="header.contact.title"></s:message></h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html"><s:message code="header.menu.home"></s:message></a>
                            <span><s:message code="header.contact.title"></s:message></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_phone"></span>
                        <h4><s:message code="header.contact.phone"></s:message></h4>
                        <p>0397181350</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_pin_alt"></span>
                        <h4><s:message code="header.contact.address"></s:message></h4>
                        <p>97 Man Thiện, phường Hiệp Phú, Thành phố Hồ Chí Minh</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_clock_alt"></span>
                        <h4><s:message code="header.contact.open"></s:message></h4>
                        <p>10:00 am - 23:00 pm</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_mail_alt"></span>
                        <h4>Email</h4>
                        <p>n18dccn209@student.ptithcm.edu.vn</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Section End -->

    <!-- Map Begin -->
    <div class="map">
    <div class="mapouter"><div class="gmap_canvas"><iframe class="gmap_iframe" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?width=600&amp;height=400&amp;hl=en&amp;q=97 Man Thiện&amp;t=&amp;z=17&amp;ie=UTF8&amp;iwloc=B&amp;output=embed"></iframe><a href="https://www.fnfgo.com/">FNF Online Mods</a></div><style>.mapouter{position:relative;text-align:right;width:100%;height:500px;}.gmap_canvas {overflow:hidden;background:none!important;width:100%;height:500px;}.gmap_iframe {width:100%!important;height:500px!important;}</style></div>
<!--         <iframe -->
<!--             src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d49116.39176087041!2d-86.41867791216099!3d39.69977417971648!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x886ca48c841038a1%3A0x70cfba96bf847f0!2sPlainfield%2C%20IN%2C%20USA!5e0!3m2!1sen!2sbd!4v1586106673811!5m2!1sen!2sbd" -->
<!--             height="500" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe> -->
<!--         <div class="map-inside"> -->
<!--             <i class="icon_pin"></i> -->
<!--             <div class="inside-widget"> -->
<!--                 <h4>New York</h4> -->
<!--                 <ul> -->
<!--                     <li>Phone: +12-345-6789</li> -->
<!--                     <li>Add: 16 Creek Ave. Farmingdale, NY</li> -->
<!--                 </ul> -->
<!--             </div> -->
<!--         </div> -->
    </div>
    <!-- Map End -->

    <!-- Contact Form Begin -->
    <div class="contact-form spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="contact__form__title">
                        <h2><s:message code="header.contact.leave"></s:message></h2>
                    </div>
                </div>
            </div>
            <form action="#">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                    <s:message code="header.contact.nameplace" var="nameplace"></s:message>
                        <input type="text" placeholder="${nameplace}">
                    </div>
                    <div class="col-lg-6 col-md-6">
                    <s:message code="header.contact.emailplace" var="emailplace"></s:message>
                        <input type="text" placeholder="${emailplace}">
                    </div>
                    <div class="col-lg-12 text-center">
                     <s:message code="header.contact.message" var="messageplace"></s:message>
                        <textarea placeholder="${messageplace}"></textarea>
                        <button type="submit" class="site-btn">  <s:message code="header.contact.button" ></s:message></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- Contact Form End -->

   <%@include file="/WEB-INF/views/layouts/user/footer.jsp" %>
   