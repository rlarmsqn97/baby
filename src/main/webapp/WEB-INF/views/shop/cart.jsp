<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
 	<meta charset="utf-8">
    <title>장바구니</title>
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
  
     <link rel="stylesheet" href="/resources/css/cart.css">
         <%@ include file="../include/mainmenu.jsp" %>
         	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
         	
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>     	
     <style>
     	.orderInfo { border:5px solid #eee; padding:20px; display:none;}
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
                <h1 class="banner-heading h2 display-3 pb-5 semi-bold-600 typo-space-line-center">장바구니</h1>
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
                            <h2>Cart<span>.</span></h2>
                        </div>
                    </div>
                    <c:if test="${not empty cartList}">
                        <div class="col-lg-5 offset-lg-1 text-left text-lg-right" style="padding-top: 34px;">
                            <div class="site-btn clear-btn" id="selectDelete_btn">선택된 리스트 삭제</div>
							<script>
							 $("#selectDelete_btn").click(function(){
							  var confirm_val = confirm("정말 삭제하시겠습니까?");
							  
							  if(confirm_val) {
							   var checkArr = new Array();
							   
							   $("input[class='chkBox']:checked").each(function(){
							    checkArr.push($(this).attr("data-cartNum"));
							   });
							    
							   $.ajax({
							    url : "/shop/deleteCart",
							    type : "post",
							    data : { chkbox : checkArr },
							    success : function(result){
							     if(result == 1) {
							     location.href = "/shop/cart";
							     } else {
							    	 alert("삭제 실패");
							     }
							    }
							   });
							  } 
							 });
							</script>
                        </div>
                    </c:if>
                </div>
            </div>
        </section>
        <!-- Cart Page Section Begin -->
	<div class="cart-page">
		<div class="container">
			<div class="cart-table">
				<table>
					<thead>
						<tr>
							<th><input type="checkbox" name="allCheck" id="allCheck"
								checked /></th>
							<!-- 상품 전체선택  -->
							<script>
                                    $("#allCheck").click(function () {
                                        var chk = $("#allCheck").prop("checked");
                                        if (chk) {
                                            $(".chkbox").prop("checked", true);
                                            itemSum();
                                        } else {
                                            $(".chkbox").prop("checked", false);
                                            itemSum();
                                        }
                                    });
                                </script>
							<th class="product-h">상품이미지</th>
							<th>상품명</th>
							<th>대여일</th>
							<th>반납일</th>
							<th>가격</th>
							<th>수량</th>
							<th>합계</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${cartList}" var="cartList">
							<tr>
								<td class="product-close"><input type="checkbox"
									onClick="itemSum()" class="chkbox"
									value="${cartList.pdPrice * cartList.cartStock}"
									data-cartNum="${cartList.cartNum}" /></td>
								<td class="product-col"><img src="${cartList.pdThumbImg}"
									alt="${cartList.pdThumbImg}" style="width: 60px; height: 60px" />
								</td>
								<td><a href="/shop/productdetail?n=${cartList.pdNum}">${cartList.pdName}</a>
								</td>

								<td>
									<span>${cartList.startDate }</span>
								</td>

								<td>
									<span>${cartList.endDate }</span>
								</td>



								<td class="price-col"><fmt:formatNumber
										pattern="###,###,###" value="${cartList.pdPrice}" /> 원</td>
								<td>${cartList.cartStock} 개</td>
								<td class="total"><fmt:formatNumber pattern="###,###,###"
										value="${cartList.pdPrice * cartList.cartStock}" /> 원</td>
								<td class="product-close" id="delete_${cartList.cartNum}_btn"
									data-cartNum="${cartList.cartNum}">x</td>
								<script>
									  $("#delete_${cartList.cartNum}_btn").click(function(){
									   var confirm_val = confirm("정말 삭제하시겠습니까?");
									   
									   if(confirm_val) {
									    var checkArr = new Array();

									    checkArr.push($(this).attr("data-cartNum"));

									    
									    $.ajax({
									     url : "/shop/deleteCart",
									     type : "post",
									     data : { chbox : checkArr },
									     success : function(result){
									      if(result == 1) {     
									       location.href = "/shop/cart";
									      } else {
									       alert("삭제 실패");
									      }
									     }
									    });
									   } 
									  });
								  </script>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- 초기화면 상품 전체선택이지만 하나라도 체크박스 해제할 경우 이벤트  -->
				<script>
                        $(".chkbox").click(function () {
                            $("#allCheck").prop("checked", false);
                        });
                    </script>
				<c:if test="${empty cartList}">
					<c:set var="cart" value="false" />
					<div class="card border-light mb-3 text-center spad">
						<div class="card-header">
							<h3>카트에 상품이 없습니다.</h3>
						</div>
						<div class="card-body">
							<p class="card-text">카트에 물건을 담고 이용해주세요!</p>
						</div>

					</div>
				</c:if>

			</div>
		</div>
		<div class="shopping-method">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="total-info">
							<div class="total-table">
								<table>
									<thead>
										<tr>
											<th class="total-cart">Total Cart</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="total-cart-p" id="total_sum"></td>
											<!-- 금액 총 합계  -->
											<script>		 
											            function itemSum() {
											                var str = "";
											                var sum = 0;
											                var count = $(".chkbox").length;
											                for (var i = 0; i < count; i++) {
											                    if ($(".chkbox")[i].checked == true) {
											                        sum += parseInt($(".chkbox")[i].value);
											                    }
											                }
											                $("#total_sum").html("합계 : " + sum + " 원");
											                $("#amount").val(sum);
											            }
											        </script>
										</tr>
									</tbody>
								</table>
							</div>
							<c:if test="${not empty cartList}">
								<div class="row">
									<div class="col-lg-12 text-right">
										<button type="button" class="primary-btn chechout-btn"
											id="orderModal" data-toggle="modal" data-target="#orderOpne">주문
											정보 입력</button>

										<script>
                                                	$(".primary-btn.chechout-btn").click(function(){
                                                		$(".orderInfo").slideDown();
                                                		$(".primary-btn.chechout-btn").slideUp();
                                                	});
                                                </script>
									</div>
								</div>
							</c:if>
						</div>
						<div class="orderInfo">
							<form role="form" method="post" autocomplete="off">
								<c:forEach items="${cartList}" var="cartList">
								<input type="hidden" name="startDate" id="startDate" value="${cartList.startDate }">
								<input type="hidden" name="endDate" id="endDate" value="${cartList.endDate }">
								</c:forEach>
								<input type="hidden" name="amount" id="amount" />
								
								<div class="inputArea">
									<label for="">예약자이름 :</label> <input type="text"
										name="orderName" id="orderName" value="${user.userName }"
										required="required" />
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
									<label for="userAddr2">요청사항</label> <input type="text"
										name="reQu" id="reQu" required="required" />
								</div>
							
								<div class="inputArea">
									<button type="submit" class="order_btn">주문</button>
									<button type="button" class="cancel_btn">취소</button>
									<script>
								   	$(".cancel_btn").click(function(){
								   		$(".orderInfo").slideUp();
								   		$(".primary-btn.chechout-btn").slideDown();
								   	});
								   </script>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Cart Page Section End -->
 
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
					function goOrder() {
						var chk = $('input[name="opnum"]');
						if (chk.length == 0) {
							alert('장바구니에 담긴 상품이 없습니다');
							return;
						}

					}
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
    <!-- Templatemo -->
    <script src="/resources/js/templatemo.js"></script>
    <!-- Custom -->
    <script src="/resources/js/custom.js"></script>
    <script src="/resources/js/cart.js"></script>  
</body>
</html>