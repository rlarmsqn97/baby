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
          <!-- Start Banner Hero -->
    <div id="work_banner" class="banner-wrapper bg-light w-100 py-5"style="height:500px">
        <div class="banner-vertical-center-work container text-light d-flex justify-content-center align-items-center py-5 p-0">
            <div class="banner-content col-lg-8 col-12 m-lg-auto text-center">
                <h1 class="banner-heading h2 display-3 pb-5 semi-bold-600 typo-space-line-center">장바구니</h1>
            </div>
        </div>
    </div>


        <div class="row px-lg-3">
			<table class="table">
					 <thead>
		            <tr>
		                <th>번호</th>
		                <th>제목</th>
		                <th>이름</th>
		                <th>등록일자</th>
		            </tr>
		        </thead>
		        <tbody>
		
		            <tr>
		                <td>1</td>
		                <td>후기</td>
		                <td>김근부</td>
		                <td>2012-10-19</td>
		
		            </tr>
		        </tbody>
		    </table>
					     
        </div>
    </div>
    <!-- End Content -->

 <!-- End Content -->
	<div class="row" >
            <div class="btn-toolbar justify-content-center pb-4" role="toolbar" aria-label="Toolbar with button groups">
                <div class="btn-group me-2" role="group" aria-label="First group">
                    <button type="button" class="btn btn-secondary text-white">Previous</button>
                </div>
                <div class="btn-group me-2" role="group" aria-label="Second group">
                    <button type="button" class="btn btn-light">1</button>
                </div>
                <div class="btn-group me-2" role="group" aria-label="Second group">
                    <button type="button" class="btn btn-secondary text-white">2</button>
                </div>
                <div class="btn-group" role="group" aria-label="Third group">
                    <button type="button" class="btn btn-secondary text-white">Next</button>
                </div>
            </div>
     </div>
  	<div  class="container-lg py-5">
			<button type="button" class="btn btn-secondary text-white" style="float:right;" onclick="location.href='write'">글쓰기</button>
	</div>
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