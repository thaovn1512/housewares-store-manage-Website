<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@	taglib  uri="http://www.springframework.org/tags" prefix="s"%>
	
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<base href="${pageContext.servletContext.contextPath }/">

<%@include file="/WEB-INF/views/taglib/taglib.jsp"%>

<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="resources/login/fonts/icomoon/style.css">

<link rel="stylesheet" href="resources/login/css/owl.carousel.min.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="resources/login/css/bootstrap.min.css">

<!-- Style -->
<link rel="stylesheet" href="resources/login/css/style.css">

<title>Sign Up</title>
</head>
<body>

	<style type="text/css">
*[id$=errors] {
	color: red;
	font-style: italic;
}
</style>

	<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<img src="resources/login/images/undraw_remotely_2j6y.svg"
						alt="Image" class="img-fluid">
				</div>
				<div class="col-md-6 contents">
					<div class="row justify-content-center">
						<div class="col-md-8">
							<div class="mb-4">
								<h3><s:message code="signup.title" ></s:message></h3>
								<p class="mb-4"><s:message code="signup.sub-title" ></s:message></p>
							</div>
							<form:form action="signup.htm" method="post"
								modelAttribute="user">
								<div class="form-group first">
									<label for="email"><s:message code="signup.email" ></s:message>:</label>
									<form:input type="email" path="email" class="form-control" />
									<form:errors path="email" />
								</div>
								<div class="form-group last mb-4">
									<label for="password"><s:message code="signup.password" ></s:message>:</label>
									<form:input type="password" path="password"
										class="form-control" />
									<form:errors path="password" />
								</div>
								<div class="form-group first">
									<label for="name"><s:message code="signup.name" ></s:message>:</label>
									<form:input type="text" path="name" class="form-control" />
									<form:errors path="name" />

								</div>
								<div class="form-group first">
									<label for="phone"><s:message code="signup.phone" ></s:message>:</label>
									<form:input type="text" path="phone" class="form-control" />
									<form:errors path="phone" />

								</div>
								<div class="form-group first">
									<label for="address"><s:message code="signup.address" ></s:message>:</label>
									<form:input type="text" path="address" class="form-control" />
									<form:errors path="address" />

								</div>
								<span class="ml-auto"><s:message code="signup.login.title" ></s:message> <a
									href="login.htm" class="forgot-pass"><s:message code="signup.login.button" ></s:message></a></span>
								<div>
									<span style="color: red">${message}</span>
								</div>
								<form:button type="submit" class="btn btn-block btn-primary"><s:message code="signup.button" ></s:message>
									</form:button>

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
