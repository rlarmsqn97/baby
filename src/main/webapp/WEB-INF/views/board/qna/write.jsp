<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>QnA 작성</title>
    <%@ include file="../../include/mainmenu.jsp" %>
</head>
<body>
	<div class="container" style="padding : 150px;">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<form method="post">

						<label>제목</label>
						<input type="text" name="title" /><br />
						
						<label>작성자</label>
						<input type="text" name="userName" value="${user.userName }" /><br />
						
						<label>내용</label>
						<textarea cols="50" rows="5" name="content"></textarea><br />
						
						<button class="btn btn-lg btn-primary btn-block text-uppercase"
								type="submit">작성</button>	
						</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<%@ include file="../../include/footer.jsp" %>
</body>
</html>