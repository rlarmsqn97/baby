<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>QnA 목록</title>
    <%@ include file="../../include/mainmenu.jsp" %>
</head>
<body>
	  <div class="container-lg py-5">
        <div class="col-md-12 m-auto text-center py-5">
            <h1 class="pricing-header h2 semi-bold-600">문의하기</h1>
        </div>


        <div class="row px-lg-3">
			<table class="table">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성일</th>
									<th>작성자</th>
									<th>조회수</th>
								</tr>
							</thead>
					
							<tbody>
								<c:forEach items="${list}" var="list">
								 <tr>
								  <td>${list.bno}</td>
								  <td><a href="/board/qna/view?bno=${list.bno}">${list.title}</a></td>
								  <td><fmt:formatDate value="${list.regDate}" pattern="yyyy년-MM월-dd일" /></td>
								  <td>${list.userName}</td>
								  <td>${list.viewCnt}</td>
								 </tr>
								</c:forEach>
							</tbody>
						</table>
						
						<div>
							<c:if test="${page.prev }">
								<span>[ <a href="/board/qna/listPageSearch?num=${page.startPageNum -1}${page.searchTypeKeyword}">이전</a> ]</span>			
							</c:if>
							
							<c:forEach begin="${page.startPageNum }" end="${page.endPageNum }" var="num">
								<span>
									<c:if test="${select != num }">
										<a href="/board/qna/listPageSearch?num=${num }${page.searchTypeKeyword}">${num }</a>
									</c:if>
									
									<c:if test="${select == num }">
										<b>${num }</b>
									</c:if>
								</span>
							</c:forEach>
							
							<c:if test="${page.next }">
								<span>[ <a href="/board/qna/listPageSearch?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a> ]</span>
							</c:if>						
						</div>
						
						<div>
							<select name="searchType">
							     <option value="title" <c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option>
							     <option value="content" <c:if test="${page.searchType eq 'content'}">selected</c:if>>내용</option>
							     <option value="title_content" <c:if test="${page.searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
							     <option value="userName" <c:if test="${page.searchType eq 'userName'}">selected</c:if>>작성자</option>
							</select>
							
							<input type="text" name="keyword" value="${page.keyword}"/>
							<button type="button" id="searchBtn">검색</button>
						</div>
						<c:if test="${user != null }">
							<button style="width:100px; height:25px;" type="button" onclick="location.href='/board/qna/write'">글쓰기</button>
						</c:if>	
						</div>
					</div>

	
		<%@ include file="../../include/footer.jsp" %>
		
		<script>
			document.getElementById("searchBtn").onclick = function () {
				
				let searchType = document.getElementsByName("searchType")[0].value;
				let keyword = document.getElementsByName("keyword")[0].value;
				
				location.href = "/board/qna/listPageSearch?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
		
			};
		</script>
</body>
</html>