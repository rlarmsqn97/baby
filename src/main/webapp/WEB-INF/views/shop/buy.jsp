<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
 	<meta charset="utf-8">
    <title>예약하기</title>
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
  
     <link rel="stylesheet" href="/resources/css/cart.css">
         <%@ include file="../include/mainmenu.jsp" %>
         	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
         	
         	<link rel="shortcut icon" href="#">
     <style>
     	.orderInfo { border:5px solid #eee; padding:20px;}
.orderInfo .inputArea { margin:10px 0; }
.orderInfo .inputArea label { display:inline-block; width:120px; margin-right:10px; }
.orderInfo .inputArea input { font-size:14px; padding:5px; }
#userAddr2, #userAddr3 { width:250px; }

.orderInfo .inputArea:last-child { margin-top:30px; }
.orderInfo .inputArea button { font-size:20px; border:2px solid #ccc; padding:5px 10px; background:#fff; margin-right:20px;}	
     </style>
</head>
     
<body>
   

    <!-- Start Banner Hero -->
    <div id="work_banner" class="banner-wrapper bg-light w-100 py-5"style="height:500px">
        <div class="banner-vertical-center-work container text-light d-flex justify-content-center align-items-center py-5 p-0">
            <div class="banner-content col-lg-8 col-12 m-lg-auto text-center">
                <h1 class="banner-heading h2 display-3 pb-5 semi-bold-600 typo-space-line-center">예약하기</h1>
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

  <!-- Page Add Section Begin -->
        <section class="page-add cart-page-add">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="page-breadcrumb">
                            <h2><span>예약하기</span></h2>
                        </div>
                    </div>
                    
                </div>
            </div>
        </section>
        <!-- Cart Page Section Begin -->
	<div class="cart-page">
		<div class="container">
			<div class="row pt-5">
				<div
					class="worksingle-content col-lg-8 m-auto text-left justify-content-center">
					<img class="img-fluid border rounded" src="${view.pdThumbImg }"
						alt="Card image cap">
					<div style="margin-left: 210px;">
						<label class="form-label">상품명 : ${view.pdName }</label><br> <label
							class="form-label">사용연령 : ${view.pdAge }</label><br> <label
							class="form-label">가격 : </label>
						<fmt:formatNumber pattern="###,###,###" value="${view.pdPrice * (c + d)}"></fmt:formatNumber>
						<br> <label class="form-label"> 구입 수량 : <input
							type="text" class="numBox" value="${c }" readonly="readonly" />
						</label><br> <span> <label class="form-label">대여일</label> <input
							type="text" id="startDate" class="datetime" value="${s }">
							&nbsp;~ <label class="form-label">반납일</label> <input type="text"
							id="endDate" class="datetime" value="${e }">
						</span>
							<label class="form-label">차이 일수 : ${d}</label><br> 
					</div>
				</div>
			</div>

			<div class="orderInfo">
				<form role="form" method="post" autocomplete="off">

					<input type="hidden" name="amount" id="amount" value="${view.pdPrice * (c + d)}" />
					<input type="hidden" name="cartStock" id="cartStock" value="${c }" />

					<div class="inputArea">
						<label for="">예약자이름 :</label> <input type="text" name="orderName"
							id="orderName" value="${user.userName }" required="required" />
					</div>

					<div class="inputArea">
						<label for="orderPhon">예약자 번호 :</label> <input type="text"
							name="orderPhon" id="orderPhon" value="${user.userPhon }"
							required="required" />
					</div>


					<div class="inputArea">
						<label for="userAddr1">렌터카회사명 : </label> <input type="text"
							name="rentCar" id="rentCar" required="required" />
					</div>

					<div class="inputArea">
						<label for="userAddr2">요청사항</label> <input type="text" name="reQu"
							id="reQu" required="required" />
					</div>

					<div class="inputArea">
						<button type="submit" class="order_btn">예약하기</button>
						<button type="button" class="cancel_btn">취소</button>
					</div>


				</form>
			</div>
		</div>

	</div>
	
	
 
 
  <!-- Start Footer -->
    <footer class="bg-secondary pt-4">
        <div class="container">
            <div class="row py-4">

              
                <div class="col-lg-3 col-md-4 my-sm-0 mt-4">
                    <h2 class="h4 pb-lg-3 text-light light-300" onclick="location.href='/user/introduce'">회사소개</h2>
                                
                </div>

                <div class="col-lg-3 col-md-4 my-sm-0 mt-4">
                    <h2 class="h4 pb-lg-3 text-light light-300" onclick="location.href='/user/rule'">개인정보취급방침</h2>
                    
                </div>

                <div class="col-lg-3 col-md-4 my-sm-0 mt-4">
                    <h2 class="h4 pb-lg-3 text-light light-300" onclick="location.href='/user/terms'">이용약관</h2>
                   
                </div>
  
            </div>
        </div>

    </footer>
    <!-- End Footer -->

   


    <!-- Bootstrap -->
    <script src="/resources/js/bootstrap.bundle.min.js"></script>
    <!-- Lightbox -->
    <script src="/resources/js/fslightbox.js"></script>
  <!--   <script>
        fsLightboxInstances['gallery'].props.loadOnlyCurrentSource = true;
    </script> -->
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
 
   
    <!-- Templatemo -->
    <script src="/resources/js/templatemo.js"></script>
    <!-- Custom -->
    <script src="/resources/js/custom.js"></script>
    <script src="/resources/js/cart.js"></script>  
</body>
</html>