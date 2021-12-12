<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html xmlns:th="http://www.thymeleaf.org" lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="_csrf" th:content="${_csrf.token}"/>
    <meta name="_csrf_header" th:content="${_csrf.headerName}"/>
    <title>주문상세내역</title>
    <script src="https://kit.fontawesome.com/e6f78261b2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/admin/adminnav.css">
    <link rel="stylesheet" href="/resources/css/admin/admin_order.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <style>
  .orderInfo { border:5px solid #eee; padding:10px 20px; margin:20px 0;}
 .orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
 
 .orderView li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
 .orderView li::after { content:""; display:block; clear:both; }
 
 .thumb { float:left; width:200px; }
 .thumb img { width:200px; height:200px; }
 .gdsInfo { float:right; width:calc(100% - 220px); line-height:2; }
 .gdsInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
 
 div#container_box ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
 div#container_box .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
 .deliveryChange { text-align:right; }
.delivery1_btn,
.delivery2_btn { font-size:16px; background:#fff; border:1px solid #999; margin-left:10px; }

.button {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  
  background: var(--button-bg-color);
  color: var(--button-color);
  
  margin: 0;
  padding: 0.5rem 1rem;
  
  font-family: 'Noto Sans KR', sans-serif;
  font-size: 1rem;
  font-weight: 400;
  text-align: center;
  text-decoration: none;
  
  border: none;
  border-radius: 4px;
  
  display: inline-block;
  width: auto;
  
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  
  cursor: pointer;
  
  transition: 0.5s;
}
.button.delivery1_btn {
  --button-bg-color: #28a745;
  --button-hover-bg-color: #218838;
}
    </style>
   
</head>
<body>
<%@ include file="nav/admin_nav.jsp" %>
    <nav th:replace="admin/admin_nav :: navFragment"></nav>
	<section>
		<div id="container_box">
			<div style="width: 1291px; height: 153.98px">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">주문번호</th>
							<th scope="col">예약자</th>
							<th scope="col">렌터카회사명</th>
							<th scope="col">번호</th>
							<th scope="col">대여일</th>
							<th scope="col">반납일</th>
							<th scope="col">결제금액</th>
							<th scope="col">상태</th>
						</tr>
					</thead>

					<c:forEach items="${orderView}" var="orderView" varStatus="status">
						<c:if test="${status.first}">
							<tbody>
								<tr>
									<td>${orderView.orderId}</td>
									<td>${orderView.orderName}</td>
									<td>${orderView.rentCar}</td>
									<td>${orderView.orderPhon}</td>
									<td>${orderView.startDate}</td>
									<td>${orderView.endDate}</td>
									<td><fmt:formatNumber pattern="###,###,###"
											value="${orderView.amount}" /></td>
									<td>${orderView.delivery}</td>
								</tr>
							</tbody>
							<div class="deliveryChange">
								<form role="form" method="post" class="deliveryForm">
									<input type="hidden" name="orderId"
										value="${orderView.orderId }" /> <input type="hidden"
										name="delivery" class="delivery" value="" />
									<button type="button" class="delivery1_btn">배송 중</button>
									<button type="button" class="delivery2_btn">배송 완료</button>
								</form>
							</div>
						</c:if>
					</c:forEach>
				</table>
			</div>
		</div>



			<div style="width: 1291px; height: 153.98px">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">상품이미지</th>
							<th scope="col">상품명</th>
							<th scope="col">개당가격</th>
							<th scope="col">구입수량</th>
							<th scope="col">최종가격</th>
						</tr>
					</thead>

					<c:forEach items="${orderView}" var="orderView">				
							<tbody>
								<tr>
									<td><img src="${orderView.pdThumbImg}" /></td>
									<td>${orderView.pdName}</td>
									<td><fmt:formatNumber pattern="###,###,###"
										value="${orderView.pdPrice}" /></td>
									<td>${orderView.cartStock} 개</td>
									<td><fmt:formatNumber pattern="###,###,###"
										value="${orderView.pdPrice * orderView.cartStock}" /></td>
								
								</tr>
							</tbody>
					</c:forEach>
				</table>
			</div>
	</section>

	<script>
		$(".delivery1_btn").click(function() {
			$(".delivery").val("배송 중");
			run();
		});

		$(".delivery2_btn").click(function() {
			$(".delivery").val("배송 완료");
			run();
		});

		function run() {
			$(".deliveryForm").submit();
		}
	</script>
	<script src="/resources/js/admin/admin_nav.js"></script>
    <script src="/resources/js/admin/admin_order.js"></script>
</body>
</html>