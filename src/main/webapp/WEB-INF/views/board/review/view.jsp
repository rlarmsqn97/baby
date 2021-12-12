<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>이용후기 조회</title>
    <%@ include file="../../include/mainmenu.jsp" %>
</head>
<body>
	<div class="container" style="padding : 150px;">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
							<label>제목</label>
					      	${view.title }<br/>
							
							<label>작성자</label>
							${view.userName }<br/>
							
							<label>내용</label>
							${view.content }
						</div>
					</div>
					<div>
					<button class="btn btn-lg btn-primary btn-block text-uppercase"
								type="button" onclick="location.href='/board/review/modify?bno=${view.bno}'">수정</button>
					<button class="btn btn-lg btn-primary btn-block text-uppercase"
								type="button" onclick="location.href='/board/review/delete?bno=${view.bno}'">삭제</button>
					</div>		
				</div>
			</div>
		</div>
	
		<%@ include file="../../include/footer.jsp" %>
</body>
</html>