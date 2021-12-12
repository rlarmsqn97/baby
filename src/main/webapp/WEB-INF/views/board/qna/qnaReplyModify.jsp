<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>QnA 댓글 수정</title>
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

				<!-- 답변 -->
				<form method="post">
					<ul>
						<li>
							<div>
								<c:forEach items="${reply }" var="reply">
								<p>${reply.userName }</p> / <fmt:formatDate value="${reply.regDate}" pattern="yyyy-MM-dd" />
								<textarea cols="50" rows="5" name="content">${reply.content }</textarea>
								<button type="submit">완료</button>
								</c:forEach>
							</div>
						</li>
					</ul>
				</form>
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