<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
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
						<h5 class="card-title text-center">로그인</h5>
						<form class="form-signin" method="post" action="login">
							<div class="form-label-group">
								<input type="text" id="userId" name="userId" class="form-control"
									placeholder="id" required autofocus>
							</div>
							<br>
							<div class="form-label-group">
								<input type="password" id="pwd" name="userPw" class="form-control"
									placeholder="Password" required>
							</div>
							<hr>
							<div class="form-label-group">
								<c:if test="${check == 1 }">
									<label>${message }</label>
								</c:if>
							</div>
							<button class="btn btn-lg btn-primary btn-block text-uppercase"
								type="submit">Sign in</button>
							<hr class="my-4">
							Forgot your <a href="javascript:void(0)" onclick="findid()">ID</a>
							or <a href="javascript:void(0)" onclick="findpassword()">Password</a>?
							<button class="btn btn-lg btn-secondary btn-block text-uppercase" onclick="location.href='join'"
								>Join</button>
						</form>
						
							<div >
	
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	
	<%@ include file="../include/footer.jsp" %>

	<script type="text/javascript">
		function findid() {
			var url = "find_id_form";

			window
					.open(url, "_blank_1",
							"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=500");
		}

		function findpassword() {
			var url = "find_password_form";

			window
					.open(url, "_blank_1",
							"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=500");
		}
	</script>
</body>
</html>