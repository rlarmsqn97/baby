<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>QnA 조회</title>
    <%@ include file="../../include/mainmenu.jsp" %>
</head>
<body>
	<div class="container" style="padding: 150px;">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<label>제목</label> ${view.title }<br /> <label>작성자</label>
						${view.userName }<br /> <label>내용</label> ${view.content }
					</div>
				</div>
				<c:if test="${user.userName == view.userName }">
				<div>
					<button class="btn btn-lg btn-primary btn-block text-uppercase"
						type="button"
						onclick="location.href='/board/qna/modify?bno=${view.bno}'">수정</button>
					<button class="btn btn-lg btn-primary btn-block text-uppercase"
						type="button"
						onclick="location.href='/board/qna/delete?bno=${view.bno}'">삭제</button>
				</div>
				</c:if>
	
	
		<!-- 답변 -->
 		<ul>
 			<c:forEach items="${reply }" var="reply">
 			<li>
 				<div>
 					<p>${reply.userName } / <fmt:formatDate value="${reply.regDate}" pattern="yyyy-MM-dd" /></p>
 					<p>${reply.content }</p>
 				
 					<button type="submit" type="button"
						onclick="location.href='/board/qna/qnaReplyModify?bno=${view.bno}&rno=${reply.rno }'">댓글 수정</button>
 					
 					<button type="button" onclick="location.href='/reply/delete?rno=${reply.rno}&bno=${view.bno}'">댓글 삭제</button>
 				
 				</div>
 			</li>
 			</c:forEach>
 			
 		</ul>
 		
 		<c:if test="${user.verify == 7 }">
 		<div>
		<form method="post" action="/reply/write">		
			<p>
				<label>댓글 작성자</label> <input type="text" name="userName" value="${user.userName }">
			</p>
			<p>
				<textarea rows="5" cols="50" name="content"></textarea>
			</p>
			<p>
				<input type="hidden" name="bno" value="${view.bno}">
				<button type="submit">댓글 작성</button>
			</p>
		</form>	
		</div>
		</c:if>
		<!-- 답변 -->
			</div>
		</div>
	</div>

	  <!-- Start Footer -->
 	<footer class="bg-secondary pt-4" style="bottom: 0; width: 100%">
        <div class="container">
            <div class="row py-4">

              
                <div class="col-lg-3 col-md-4 my-sm-0 mt-4">
                    <h2 class="h4 pb-lg-3 text-light light-300">회사소개</h2>
                                
                </div>

                <div class="col-lg-3 col-md-4 my-sm-0 mt-4">
                    <h2 class="h4 pb-lg-3 text-light light-300">개인정보취급방침</h2>
                    
                </div>

                <div class="col-lg-3 col-md-4 my-sm-0 mt-4">
                    <h2 class="h4 pb-lg-3 text-light light-300">이용약관</h2>
                   
                </div>
  
            </div>
        </div>

    </footer>
    <!-- End Footer -->

</body>
</html>