<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<meta charset="utf-8">
<head>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <%@ include file="../include/mainmenu.jsp" %> 
</head>

<body>
	
	<div class="container" style="padding : 150px;">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h5 class="card-title text-center">회원가입</h5>
						<form class="form-signin" method="post" autocomplete="off">
						
							<div class="form-label-group">
								<input type="text" id="userId" name="userId" class="form-control"
									placeholder="id" required="required">
							</div>
							<br>
							<div class="form-label-group">
								<input type="password" id="userPw" name="userPw" class="form-control"
									placeholder="Password" required="required">
							</div>
							<br>
							<div class="form-label-group">
								<input type="text" id="userName" name="userName" class="form-control"
									placeholder="이름" required="required">
							</div>
							<br>
								<div class="form-label-group">
								<input type="text" id="userPhon" name="userPhon" class="form-control"
									placeholder="Phone" required="required">
							</div>
							<br>
								<div class="form-label-group">
								<input type="email" id="userMail" name="userMail" class="form-control"
									placeholder="you@example.com" required="required">
							</div>
							<hr>
							<div class="form-label-group">
								<c:if test="${check == 1 }">
									<label>${message }</label>
								</c:if>
							</div>
							<button class="btn btn-lg btn-primary btn-block text-uppercase"
								type="submit">회원가입</button>					
						</form>					
					</div>
				</div>
			</div>
		</div>
	</div>
	    <script src="/resources/js/templatemo.js"></script>
    <!-- Custom -->
    <script src="/resources/js/custom.js"></script>
    
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>