<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="_csrf" th:content="${_csrf.token}"/>
    <meta name="_csrf_header" th:content="${_csrf.headerName}"/>
    <title>회원등록</title>
    <script src="https://kit.fontawesome.com/e6f78261b2.js" crossorigin="anonymous"></script>
    <script src="/resources/js/jquery.min.js"></script>
    <link rel="stylesheet" href="/resources/css/admin/admin_userlist.css">
    <link rel="stylesheet" href="/resources/css/admin/adminnav.css">
    
    <link rel="apple-touch-icon" href="/resources/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico">
    <!-- Load Require CSS -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font CSS -->
    <link href="/resources/css/boxicon.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600&display=swap" rel="stylesheet">
    <!-- Load Tempalte CSS -->
    <link rel="stylesheet" href="/resources/css/templatemo.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="/resources/css/custom.css">
    
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
	
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
<%@include file = "nav/admin_nav.jsp" %>
<nav th:replace="admin/admin_nav :: navFragment"></nav>
<section>
    <div class="container" style="padding : 150px;">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h5 class="card-title text-center">회원등록</h5>
						<form class="form-signin" method="post">
						
							<div class="form-label-group">
								<input type="text" id="userName" name="userName" class="form-control"
									placeholder="이름" required autofocus>
							</div>
							<br>
							<div class="form-label-group">
								<input type="password" id="userPhon" name="userPhon" class="form-control"
									placeholder="전화번호" required>
							</div>
							<br>
								<div class="form-label-group">
								<input type="text" id="userId" name="userId" class="form-control"
									placeholder="임시아이디" required>
							</div>
							<br>
								<div class="form-label-group">
								<input type="text" id="userPw" name="userPw" class="form-control"
									placeholder="임시비밀번호" required>
							</div>
							<hr>
							<div class="form-label-group">
								<c:if test="${check == 1 }">
									<label>${message }</label>
								</c:if>
							</div>
							<button class="btn btn-lg btn-primary btn-block text-uppercase"
								type="submit">회원등록</button>					
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script src="/resources/js/admin/admin_nav.js"></script>
<script src="/resources/js/admin/admin_userlist.js"></script>

</body>
</html>