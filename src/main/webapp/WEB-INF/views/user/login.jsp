<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 	    <%@include file="/WEB-INF/views/taglib/taglib.jsp" %> --%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
	<%@	taglib  uri="http://www.springframework.org/tags" prefix="s"%>
	
	<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <base href="${pageContext.servletContext.contextPath }/">
    
    
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="resources/login/fonts/icomoon/style.css">

    <link rel="stylesheet" href="resources/login/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="resources/login/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="resources/login/css/style.css">

    <title><s:message code="login.title" ></s:message></title>
  </head>
  <body>
  <style type="text/css">
  *[id$=errors]{
  color: red;
  font-style: italic;
  }
  </style>

  
  <div class="content">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <img src="resources/login/images/undraw_remotely_2j6y.svg" alt="Image" class="img-fluid">
        </div>
        <div class="col-md-6 contents">
          <div class="row justify-content-center">
            <div class="col-md-8">
              <div class="mb-4">
<!--               <h3>Sign In</h3> -->
              <h3><s:message code="login.title" ></s:message></h3>
              <p class="mb-4"><s:message code="login.sub-title" ></s:message></p>
            </div>
            <form:form action="login.htm" modelAttribute="user" method="POST">
              <div class="form-group first">
                <label for="email"><s:message code="login.email" ></s:message></label>
                <form:input path="email" type="email" class="form-control" />
				<form:errors path="email"/>
              </div>
              <div class="form-group last mb-4">
                <label for="password"><s:message code="login.password" ></s:message></label>
                <form:input path="password" type="password" class="form-control"/>
                <form:errors path="password"/>
              </div>
              
              <div class="d-flex mb-3 align-items-center">
<!--                 <label class="control control--checkbox mb-0"><span class="caption">Remember me</span> -->
<!--                   <input name="rm" type="checkbox" checked="checked"/> -->
<%-- <%--                   <form:checkbox path="rm" value="remember"/>   --%> 
<!--                   <div class="control__indicator"></div> -->
<!--                 </label> -->
                <span class="ml-auto"><a href="forgot-password.htm" class="forgot-pass"><s:message code="login.forgot-password" ></s:message></a></span> 
                
              </div>
<div><span class="ml-auto"><s:message code="login.register.title" ></s:message> <a href="signup.htm" class="forgot-pass" ><s:message code="login.register.button" ></s:message></a></span> </div>
				<div><span style="color: red">${message}</span> </div>
              <form:button type="submit" class="btn btn-block btn-primary"><s:message code="login.button" ></s:message></form:button>
            </form:form>
            </div>
          </div>
          
        </div>
        
      </div>
    </div>
  </div>

  
    <script src="resources/login/js/jquery-3.3.1.min.js"></script>
    <script src="resources/login/js/popper.min.js"></script>
    <script src="resources/login/js/bootstrap.min.js"></script>
    <script src="resources/login/js/main.js"></script>
  </body>
</html>
	