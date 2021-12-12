<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
 	<meta charset="utf-8">
    <title>마이페이지</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
     <link rel="stylesheet" href="/resources/css/cart.css">
         <%@ include file="../include/mainmenu.jsp" %>
         	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
         	
         	
  <style>
table.type02 {
  border-collapse: separate;
  border-spacing: 0;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-left: 1px solid #ccc;
  margin : 20px 10px;
}
table.type02 th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  border-top: 1px solid #fff;
  border-left: 1px solid #fff;
  background: #eee;
}
table.type02 td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}
 section#content ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
 section#content .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
</style>
</head>
     
<body>
   

    <!-- Start Banner Hero -->
    <div id="work_banner" class="banner-wrapper bg-light w-100 py-5"style="height:500px">
        <div class="banner-vertical-center-work container text-light d-flex justify-content-center align-items-center py-5 p-0">
            <div class="banner-content col-lg-8 col-12 m-lg-auto text-center">
                <h1 class="banner-heading h2 display-3 pb-5 semi-bold-600 typo-space-line-center">마이페이지</h1>
                <h3 class="h4 pb-2 regular-400">Elit, sed do eiusmod tempor incididunt</h3>
                <p class="banner-body pb-2 light-300">
                    Vector illustration <a class="text-white" href="http://freepik.com/" target="_blank">Freepik</a>.
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                    sed do eiusmod tempor incididunt ut labore et dolore magna
                    aliqua. Quis ipsum suspendisse ultrices gravida. Risus
                    commodo viverra maecenas accumsan lacus.
                </p>
                <button type="submit" class="btn rounded-pill btn-outline-light px-4 me-4 light-300">Learn More</button>
                <button type="submit" class="btn rounded-pill btn-secondary text-light px-4 light-300">Contact Us</button>
            </div>
        </div>
    </div>
    <!-- End Banner Hero -->

	<section>
	<!-- 모바일에서 컬럼들이 하나는 꽉찬너비로, 다른 하나는 절반너비로 쌓이게 합니다 -->
	<div class="container" style="height:500px">
		<div>
			<button type="button" onclick="location.href='/user/modify'">정보수정</button>
			<button type="button" onclick="document.getElementById('id01').style.display='block'" class="w3-button w3-black">회원탈퇴</button>
		</div>
		<div style="height:-50px">
			<span style=" font-size:20px; font-weight:bold; display:inline-block;">내 정보</span>
		</div>
		<table class="type02">
		  <tr>
		    <th scope="row">아이디</th>
		    <td>${user.userId }</td>
		  </tr>
		  <tr>
		    <th scope="row">이름</th>
		    <td>${user.userName }</td>
		  </tr>
		   <tr>
		    <th scope="row">전화번호</th>
		    <td>${user.userPhon }</td>
		  </tr>
		   <tr>
		    <th scope="row">이메일</th>
		    <td>${user.userMail }</td>
		  </tr>
		</table>
	</div>
	</section>

	<!-- 회원탈퇴 모달 -->
	 <div id="id01" class="w3-modal">
	  <div class="w3-modal-content">
	
	    <header class="w3-container w3-teal">
	      <span onclick="document.getElementById('id01').style.display='none'"
	      class="w3-button w3-display-topright">&times;</span>
	      <h2>회원탈퇴 비밀번호를 입력해주세요</h2>
	    </header>
		<form action="/user/delete" method="post">
	    <div class="w3-container">
	    <input type="hidden" name="userId" value="${user.userId }">
	      <p>비밀번호 : <input type="text" name="userPw"/></p>	  
	      <button type="submit">확인</button>   
	    </div>	
	    </form>
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
   
   


    <!-- Bootstrap -->
    <script src="/resources/js/bootstrap.bundle.min.js"></script>
    <!-- Lightbox -->
    <script src="/resources/js/fslightbox.js"></script>
    <script>
        fsLightboxInstances['gallery'].props.loadOnlyCurrentSource = true;
    </script>
    <!-- Load jQuery require for isotope -->
    <script src="/resources/js/jquery.min.js"></script>
    <!-- Isotope -->
    <script src="/resources/js/isotope.pkgd.js"></script>
    <!-- Page Script -->
 <!--    <script>
        $(window).load(function() {
            // init Isotope
            var $projects = $('.projects').isotope({
                itemSelector: '.project',
                layoutMode: 'fitRows'
            });
            $(".filter-btn").click(function() {
                var data_filter = $(this).attr("data-filter");
                $projects.isotope({
                    filter: data_filter
                });
                $(".filter-btn").removeClass("active");
                $(".filter-btn").removeClass("shadow");
                $(this).addClass("active");
                $(this).addClass("shadow");
                return false;
            });
        });
    </script> -->
     <!-- 초기화면 상품 전체선택이지만 하나라도 체크박스 해제할 경우 이벤트  -->
     <!-- 페이지 들어오자마자 체크박스  체크 -->
        <script>
            var tt = "${cart}";
            if (tt == 'false') {
                $("#allCheck").prop("checked", false);
            } else {
                $("#allCheck").prop("checked", true);
                $(".chkbox").prop("checked", true);
                itemSum();
            }
 
        </script>
        
        
    <!-- 체크박스에 체크한 상품을 가지고 주문 폼 페이지로 이동 -->
    <script>
    function goOrder(){
    	var chk = $('input[name="opnum"]');
    	if(chk.length == 0){
    		alert('장바구니에 담긴 상품이 없습니다');
    		return;
    	}
    	
    	
    
    }
    
    </script>
   
    <!-- Templatemo -->
    <script src="/resources/js/templatemo.js"></script>
    <!-- Custom -->
    <script src="/resources/js/custom.js"></script>
    <script src="/resources/js/cart.js"></script>  
</body>
</html>