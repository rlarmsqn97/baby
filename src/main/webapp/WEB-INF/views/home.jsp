<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<meta charset="utf-8">
<head>
    <script src="resources/js/templatemo.js"></script>
    <!-- Custom -->
    <script src="resources/js/custom.js"></script>
    
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    <%@ include file="include/mainmenu.jsp" %>
</head>

<body>

    <!-- Start Banner Hero -->
    <div class="banner-wrapper bg-light">
        <div id="index_banner" class="banner-vertical-center-index container-fluid pt-5" style="height:500px;">

            <!-- Start slider -->
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                
                <div class="carousel-inner">
                    <div class="carousel-item active">

                        <div class="py-5 row d-flex align-items-center">
                            <div class="banner-content col-lg-8 col-8 offset-2 m-lg-auto text-left py-5 pb-5">
                                <h1 class="banner-heading h1 text-secondary display-3 mb-0 pb-5 mx-0 px-0 light-300 typo-space-line">
                                    강동구 <strong>카시트</strong> 이용해보세요 
                                  <br>
                              </h1>
                                <p class="banner-body text-muted py-3 mx-0 px-0">      
                              </p>
                                
                            </div>
                        </div>

                    </div>
                  
                </div>
               
            </div>
            <!-- End slider -->

        </div>
    </div>
    <!-- End Banner Hero -->



    <!-- Start Service -->
    <section class="service-wrapper py-3">
        <!-- <div class="container-fluid pb-3">
            <div class="row">
                <h2 class="h2 text-center col-12 py-5 semi-bold-600">Services</h2>
                <div class="service-header col-2 col-lg-3 text-end light-300">
                    <i class='bx bx-gift h3 mt-1'></i>
                </div>
                <div class="service-heading col-10 col-lg-9 text-start float-end light-300">
                    <h2 class="h3 pb-4 typo-space-line">대여품목 검색</h2>
                </div>
            </div>
            <h5 class="service-footer col-10 offset-2 col-lg-9 offset-lg-3 text-start pb-3 text-muted px-2">
               대여날짜 : <input type="text" id="Datepicker1"><br> 대여시간 : <input type="text"  id="time1" required size="8" maxlength="5"><br>
               <hr>
               반납날짜 : <input type="text" id="Datepicker2"><br> 반납시간 : <input type="text"  id="time2" required size="8" maxlength="5">

            </h5>
        </div> -->

        <div class="service-tag py-5 bg-secondary">
            <div class="col-md-12">
                <ul class="nav d-flex justify-content-center">
                 
                </ul>
            </div>
        </div>

    </section>

    <!-- End Service -->






    <!-- Start View Work -->
    <!-- End View Work -->

    <!-- Start Recent Work -->
     <section class="py-5 mb-5">
        <div class="container">
            <div class="recent-work-header row text-center pb-5">
                <h2 class="col-md-6 m-auto h2 semi-bold-600 py-5">대여 상품</h2>
            </div>
            
            <div class="row gy-5 g-lg-5 mb-4">
				<c:forEach items="${list }" var="list">
                <!-- Start Recent Work -->
                <div class="col-md-4 mb-3">
                    <a href="/shop/productdetail?n=${list.pdNum }" class="recent-work card border-0 shadow-lg overflow-hidden">
                        <img class="recent-work-img card-img" src="${list.pdThumbImg }">
                        <div class="recent-work-vertical card-img-overlay d-flex align-items-end">
                            <div class="recent-work-content text-start mb-3 ml-3 text-dark">
                                <h3 class="card-title light-300">상품명 : ${list.pdName }</h3>
                                <p class="card-text">   상품가격 : ${list.pdPrice }</p>
                            </div>
                        </div>
                    </a>
                </div>
                </c:forEach>
            </div>
        </div>      
    </section> 
    <!-- End Recent Work -->



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
    <script src="resources/js/bootstrap.bundle.min.js"></script>
    <!-- Load jQuery require for isotope -->
    <script src="resources/js/jquery.min.js"></script>
    <!-- Isotope -->
    <script src="resources/js/isotope.pkgd.js"></script>
    <!-- Page Script -->
    <script>
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
    </script>
    
    <!-- 대여날짜 -->
    <script>
	    $(function() {
	        $( "#Datepicker1" ).datepicker({
	        	 changeMonth: true, 
	             dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	             dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	             monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	             monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		         currentText: '오늘 날짜', 
		         dateFormat: "yy-mm-dd"
	        });
	    });
    </script>
    
    <!-- 반납날짜 -->
      <script>
	    $(function() {
	        $( "#Datepicker2" ).datepicker({
	        	 changeMonth: true, 
	             dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	             dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	             monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	             monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		         currentText: '오늘 날짜', 
		         dateFormat: "yy-mm-dd"
	        });
	    });
    </script>
    
    <script>
   		$(function() {
	    $("#time1").timepicker({
	    	step: 30,            //시간간격 : 5분
	    	timeFormat: "H:mm",   //시간:분 으로표시
	    	maxTime : "19:00",
	    	minTime : "9:00"
	    });
   	 });
    </script>
    
    <script>
   		$(function() {
	    $("#time2").timepicker({
	    	step: 30,            //시간간격 : 5분
	    	timeFormat: "H:mm",    //시간:분 으로표시
	    	maxTime : "19:00",
	    	minTime : "9:00"
	    });
   	 });
    </script>
    
</body>

</html>