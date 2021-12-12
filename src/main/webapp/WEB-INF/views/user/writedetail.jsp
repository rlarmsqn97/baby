<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<meta charset="utf-8">
<head>
  <%@ include file="../include/mainmenu.jsp" %>
</head>

<body>
  

    <!-- Start pricing -->
    <div class="container-lg py-5">
        <div class="col-md-12 m-auto text-center py-5">
            <h1 class="pricing-header h2 semi-bold-600">게시글보기</h1>
            <p class="pricing-footer">
                <!-- Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut facilisis. -->
            </p>
        </div>
    </div>

	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="height: 200px; text-align: left;"></td>
					</tr>
				</tbody>
			</table>	
		</div>
		
		<div>
			<a href="qna"  class="btn btn-sm btn-primary">목록</a>	
		</div>
	</div>
	<!-- 게시판 글 보기 양식 영역 끝 -->
    <!-- End Content -->

  <!-- Start Footer -->
 		<%@ include file="../include/footer.jsp" %>
    <!-- End Footer -->

    <!-- Bootstrap -->
    <script src="resources/js/bootstrap.bundle.min.js"></script>
    <!-- Templatemo -->
    <script src="resources/js/templatemo.js"></script>
    <!-- Custom -->
    <script src="resources/js/custom.js"></script>

</body>

</html>