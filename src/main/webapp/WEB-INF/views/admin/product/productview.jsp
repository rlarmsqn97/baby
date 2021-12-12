<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
 	<meta charset="utf-8">
    <title>대여상품상세페이지</title>
  <link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico">
  
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
   
    <link href="/resources/css/boxicon.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600&display=swap" rel="stylesheet">
  
    <link rel="stylesheet" href="/resources/css/templatemo.css">
   
    <link rel="stylesheet" href="/resources/css/custom.css">
    
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
	
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      
    <script src="https://kit.fontawesome.com/e6f78261b2.js" crossorigin="anonymous"></script>
    <script src="/resources/js/jquery.js"></script>
    <link rel="stylesheet" href="/resources/css/admin/adminnav.css">
    <link rel="stylesheet" href="/resources/css/admin/admin_registerGoods.css">
</head>
</head>

<body>
<%@include file="../nav/admin_nav.jsp" %>
    <!-- Start Banner Hero -->
  
    <!-- End Banner Hero -->

    <!-- Start Work Sigle -->
 <section class="py-5 mb-5">

		<div class="container">
		 <form role="form" method="post" autocomplete="off">
				<div class="worksingle-content col-lg-8 m-auto text-left justify-content-center">
					<img class="img-fluid border rounded"
						src="${pd.pdThumbImg }" alt="Card image cap">			
					<div style="margin-left: 210px;">
						<input type="hidden" name="n" value="${pd.pdNum}" /> 
						<label class="form-label">상품명</label> <span>${pd.pdName }</span><br>
						<label class="form-label">사용연령</label> <span>${pd.pdAge }</span><br>
					    <label class="form-label">가격</label> <span><fmt:formatNumber value="${pd.pdPrice }" pattern="###,###,###" />원</span><br> <label
							class="form-label">대여일</label> <span> <input
							type="datetime-local" name="firstdate" class="datetime">&nbsp;~<label
							class="form-label">반납일</label> <input type="datetime-local"
							name="lastdate" class="datetime">
						</span>
					</div>
					<div class="container-lg py-5">
						<button type="button" class="btn btn-secondary text-white"
							style="float: right;" onclick="location.href='write'">예약하기</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-secondary text-white"
							style="float: right; margin-right: 10px;"
							onclick="location.href='write'">장바구니</button>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8 m-auto text-left justify-content-center">
						<p class="pt-5 text-muted light-300">
							<img src="${pd.pdImg }">
						</p>
					</div>
				</div>
				<!-- End Paragrph -->

				<div class="row">
					<div class="col-md-8 m-auto text-left justify-content-center">
						<p
							class="display-6 py-4 ps-4 border border-5 border-top-0 border-end-0 border-bottom-0 border-start">
							<i> <span>${pd.pdDes }</span>
							</i>
						</p>
						<p class="text-muted light-300">Nam tortor quam, aliquet vel
							nibh sit amet, faucibus bibendum nisl. Donec vehicula nulla
							justo, vel sodales massa vestibulum nec. Praesent non orci sed
							massa fringilla rutrum at et odio. Quisque est orci, elementum
							sed neque ac, suscipit consectetur leo. Cras fermentum luctus
							cursus. Ut porta, augue vel tempus congue, augue purus vulputate
							ex, lacinia lobortis arcu metus sed lectus.</p>
					</div>
				</div>
				<!-- End Qute -->

				<div class="row justify-content-center">
					<div class="col-lg-8 ml-auto mr-auto pt-3 pb-4">
						<p class="text-muted light-300">Ed do eiusmod tempor
							incididunt ut labore et dolore magna aliqua. Quis ipsum
							suspendisse ultrices gravida. Risus commodo viverra maecenas
							accumsan lacus vel facilisis. Lorem ipsum dolor sit amet,
							consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
							labore et dolore magna aliqua. Ut enim ad minim veniam, quis
							nostrud exercitation ullamco laboris nisi ut aliquip ex ea
							commodo consequat. Duis aute irure dolor in reprehenderit in
							voluptate velit esse cillum dolore eu fugiat nulla.</p>
					</div>
				</div>

				<div class="bottom">
					<div class="bottombtn">
						<button type="button" class="btn btn-secondary text-white" id="modify_Btn">수정</button>
						<button type="button" id="delete_Btn" class="btn btn-warning">삭제</button>
						 <script>
							  var formObj = $("form[role='form']");
							  
							  $("#modify_Btn").click(function(){
							   formObj.attr("action", "productmodify");
							   formObj.attr("method", "get")
							   formObj.submit();
							  });
							  
							  $("#delete_Btn").click(function(){    
								var con =confirm("정말 삭제?");
								if(con) {
							   formObj.attr("action", "productdelete");
							   formObj.submit();
								}
							  });
						 </script>
					</div>
				</div>
					</form>
			</div>
	</section>

    <!-- Page Script -->
    <script>
        $(window).load(function() {
            // Slide
            $('.templatemo-slide-link').click(function() {
                var this_href = $(this).attr('href');
                $('#templatemo-slide-link-target img').attr('src', this_href);
                return false;
            });
            // End Slide
        });
    </script>
    
    <!-- Templatemo -->
    <script src="/resources/js/templatemo.js"></script>
    <!-- Custom -->
    <script src="/resources/js/custom.js"></script>
    <script src="/resources/js/bootstrap.bundle.min.js"></script>
    <!-- Load jQuery require for Page Script -->
    <script src="/resources/js/jquery.min.js"></script>
    

</body>

</html>