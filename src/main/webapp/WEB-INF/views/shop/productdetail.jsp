<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
 	<meta charset="utf-8">
    <title>대여상품상세페이지</title>
      <%@ include file="../include/mainmenu.jsp" %>
   	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
  	
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>

<body>

    <!-- Start Banner Hero -->
    <div id="work_single_banner" class="bg-light w-100" style="height:500px">
        <div class="container-fluid text-light d-flex justify-content-center align-items-center border-0 rounded-0 p-0 py-5">
            <div class="banner-content col-lg-8 m-lg-auto text-center py-5 px-3">
                <h1 class="banner-heading h2 pb-5 typo-space-line-center">상품상세</<h1>
                </h1>            
            </div>
        </div>
    </div>
    <!-- End Banner Hero -->

    <!-- Start Work Sigle -->
    <section class="container py-5">
    	 <div class="row pt-5">
            <div class="worksingle-content col-lg-8 m-auto text-left justify-content-center">
               <img class="img-fluid border rounded" src="${view.pdThumbImg }" alt="Card image cap">
               	  <form action="/shop/buy" method="get">
               	  	<input type="hidden" name="pdNum" value="${view.pdNum }"/>
                  <div style="margin-left:210px;">
		               <label class="form-label">상품명 : ${view.pdName }</label><br>
		              	<label class="form-label">사용연령 : ${view.pdAge }</label><br>
		              	<label class="form-label">가격 : </label><fmt:formatNumber pattern="###,###,###" value="${view.pdPrice }"></fmt:formatNumber><br>
		              	<label class="form-label">
		              	
		              	<input type="hidden" name="pdnum" id="pdnum" value="${view.pdNum }">
		              	구입 수량 : <button type="button" class="plus">+</button>  
		              			 <input type="number" class="numBox" id="cartStock" name="cartStock" min="1" max="${view.pdStock }" value="1" readonly="readonly"/>
		              			 <button type="button" class="minus">-</button>
		              	</label><br>
		              	    
		              <span>
			               <label class="form-label">대여일</label>       
			               <input type="text" id="startDate" name="startDate" class="datetime"> &nbsp;~ 
			               <label class="form-label">반납일</label>
			               <input type="text" id="endDate" name="endDate" class="datetime">
		              </span>
                 </div>
               	<div  class="container-lg py-5">
					<button type="submit" class="btn btn-secondary text-yellow" style="float:right;">예약하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
					
					<button type="button" class="btn btn-secondary text-white" style="float:right; margin-right:10px;" >장바구니</button>
				</div>
				</form>
            </div>
        </div>
    	
    
        <div class="row pt-5">
            <div class="worksingle-content col-lg-8 m-auto text-left justify-content-center">
                <h2 class="worksingle-heading h3 pb-3 light-300 typo-space-line">상품 소개</h2>
                <p class="worksingle-footer py-3 text-muted light-300">
                    ${view.pdDes }
                </p>
            </div>
        </div><!-- End Blog Cover -->

       

        <div class="row">
            <div class="col-md-8 m-auto text-left justify-content-center">
                <p class="pt-5 text-muted light-300">
                    You are permitted to download, modify and use Purple Buzz template for your websites. You are <strong>not permitted</strong> to re-distribute this template ZIP file on any other template websites. It is super easy to simply copy and repost the ZIP file on any <a rel="nofollow" href="https://www.google.com/search?q=free+css" target="_blank">Free CSS</a> template websites.
                </p>
            </div>
        </div><!-- End Paragrph -->


        <div class="row">
            <div class="col-md-8 m-auto text-left justify-content-center">
                <p class="display-6 py-4 ps-4 border border-5 border-top-0 border-end-0 border-bottom-0 border-start">
                    <i>
                          "Vestibulum vestibulum est eu lorem laoreet suscipit. Duis auctor,
                          metus vel sollicitudin hendrerit, elit neque pulvinar magna, non
                          sodales orci turpis blandit quam."
                      </i>
                </p>
                <p class="text-muted light-300">
                    Nam tortor quam, aliquet vel nibh sit amet, faucibus bibendum nisl.
                    Donec vehicula nulla justo, vel sodales massa vestibulum nec. Praesent
                    non orci sed massa fringilla rutrum at et odio. Quisque est orci,
                    elementum sed neque ac, suscipit consectetur leo. Cras fermentum luctus
                    cursus. Ut porta, augue vel tempus congue, augue purus vulputate ex,
                    lacinia lobortis arcu metus sed lectus.
                </p>
            </div>
        </div><!-- End Qute -->


        <div class="row justify-content-center">
            <div class="col-lg-8 pt-4 pb-4">
                <div class="ratio ratio-16x9">
                    <!-- <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/1z--ZRS5x5U" allowfullscreen></iframe> -->
                    <img src="${view.pdImg}"/>
                </div>
            </div>
        </div><!-- End Video -->

        <div class="row justify-content-center">
            <div class="col-lg-8 ml-auto mr-auto pt-3 pb-4">
                <p class="text-muted light-300">
                    Ed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                    Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas
                    accumsan lacus vel facilisis. Lorem ipsum dolor sit amet, consectetur
                    adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
                    magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                    laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor
                    in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla.
                </p>
            </div>
        </div>
        <!-- End Work Sigle -->

     
    </section>
    <!-- End Work Sigle -->

  

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


  <!-- JavaScript Bundle with Popper -->
    <!-- Page Script -->
    <script>
        $(window).on('load',function(){
            // Slide
            $('.templatemo-slide-link').click(function() {
                var this_href = $(this).attr('href');
                $('#templatemo-slide-link-target img').attr('src', this_href);
                return false;
            });
            // End Slide
        });
    </script>

	<script>
		  $(".plus").click(function(){
		   var num = $(".numBox").val();
		   var plusNum = Number(num) + 1;
		   
		   if(plusNum >= ${view.pdStock}) {
		    $(".numBox").val(num);
		   } else {
		    $(".numBox").val(plusNum);          
		   }
		  });
		  
		  $(".minus").click(function(){
		   var num = $(".numBox").val();
		   var minusNum = Number(num) - 1;
		   
		   if(minusNum <= 0) {
		    $(".numBox").val(num);
		   } else {
		    $(".numBox").val(minusNum);          
		   }
		  });
 </script>
 
 <!-- 장바구니 버튼 -->
 <script>
 	$(".btn.btn-secondary.text-white").click(function() {
 		var pdNum = ${view.pdNum};
 		var cartStock = $(".numBox").val();
 		var startDate =  $.datepicker.formatDate("yy-mm-dd",$("#startDate").datepicker("getDate"));
 		
 		var endDate = $.datepicker.formatDate("yy-mm-dd",$("#endDate").datepicker("getDate"));
 		
 		console.log("pdNum = " + pdNum);
 		console.log("cartStock = " + cartStock);
 		console.log("startDate = " + startDate);
 		console.log("endDate = " + endDate);
 		
 		var data = {
 				pdNum : pdNum,
 				cartStock : cartStock,
 				startDate : startDate,
 				endDate : endDate
 		};
 		$.ajax({
 			url : "/shop/productdetail/addCart",
 			type : "post",
 			data : data,
 			success : function(result) {
			if(result == 1){ 				
 				alert("카트 담기 성공");
 				$(".numBox").val("1");
 			} else {
 				alert("로그인해주세요")
 				$(".numBox").val("1");
 			  }
 			},
 			error : function() {
 				alert("담기 실패");
 			}	
 		});
 	});
 </script>

  <!-- 예약하기 버튼 -->
  <script>
 	$(".btn.btn-secondary.text-yellow").click(function() {
 		location.href="/shop/buy"

 		var startDate =  $.datepicker.formatDate("yy-mm-dd",$("#startDate").datepicker("getDate"));		
 		var endDate = $.datepicker.formatDate("yy-mm-dd",$("#endDate").datepicker("getDate"));
 		
 		
 		console.log("startDate = " + startDate);
 		console.log("endDate = " + endDate);
 		console.log("반납일 - 대여일 = " + endDate.add(Calendar.DATE, -startDate));
 		
 		var data = {
 				pdnum : pdNum,
 				cartStock : cartStock,
 				startDate : startDate,
 				endDate : endDate
 		};
 	});
 </script>
 
<script>
	$(function () {
	    $("#startDate").datepicker({
	        dateFormat:"yy-mm-dd",
	        dayNamesMin:["일","월","화","수","목","금","토"],
	        monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]        
	     /*    onSelect:function(d){
	            
	            var arr=d.split("-");
	            var year=arr[0];
	            var month=arr[1];
	            var day=arr[2];
	            
	            $("#year").text(year);
	            $("#month").text(month);
	            $("#day").text(day);
	            
	            console.log(year + "-" + month + "-" + day);
	            
	            var startDate = $(".startDate").datepicker("getDate");
	            
	            console.log(startDate);

	        } */
	    });	  
	});
	
	$(function () {
	    $("#endDate").datepicker({
	        dateFormat:"yy-mm-dd",
	        dayNamesMin:["일","월","화","수","목","금","토"],
	        monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]      
	       /*  onSelect:function(d){
	            
	            var arr=d.split("-");
	            var year=arr[0];
	            var month=arr[1];
	            var day=arr[2];
	            
	            $("#year").text(year);
	            $("#month").text(month);
	            $("#day").text(day);
	            
	            console.log(year + "-" + month + "-" + day);
	            
	            var startDate = $(".startDate").datepicker("getDate");
	            
	            console.log(startDate);
	
	        } */
	    });
	    
	});
	
</script>


</body>

</html>