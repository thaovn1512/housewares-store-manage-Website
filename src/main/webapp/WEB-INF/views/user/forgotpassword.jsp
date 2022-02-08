<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@	taglib  uri="http://www.springframework.org/tags" prefix="s"%>
	
	<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <base href="${pageContext.servletContext.contextPath }/">
    
    <%@include file="/WEB-INF/views/taglib/taglib.jsp" %>
    
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="resources/login/fonts/icomoon/style.css">

    <link rel="stylesheet" href="resources/login/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="resources/login/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="resources/login/css/style.css">

    <title><s:message code="forgot-password.title" ></s:message></title>
  </head>
  <body>
  

  
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
              <h3><s:message code="forgot-password.title" ></s:message></h3>
              <p class="mb-4"><s:message code="forgot-password.sub-title" ></s:message></p>
            </div>
            <form action="forgot-password.htm" method="post">
              <div class="form-group first">
                <label for="email"><s:message code="forgot-password.email" ></s:message>:</label>
                <input type="text" class="form-control" name="email">
              </div>
            <div><span style="color: red">${message}</span> </div>
              <button type="submit" class="btn btn-block btn-primary" style="margin-top: 15px"><s:message code="forgot-password.button" ></s:message>
									</button>
									 
            </form>
            <div style="margin-top: 15px">
            <span class="ml-auto" ><s:message code="forgot-password.login.title" ></s:message> <a href="login.htm"
									class="forgot-pass"><s:message code="forgot-password.login.button" ></s:message> </a><s:message code="forgot-password.login.title1" ></s:message></span></div>
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
	