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
    <title>전체주문내역</title>
    <script src="https://kit.fontawesome.com/e6f78261b2.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/resources/css/admin/adminnav.css">
    <link rel="stylesheet" href="/resources/css/admin/admin_order.css">

</head>
<body>
<%@ include file="nav/admin_nav.jsp" %>
    <nav th:replace="admin/admin_nav :: navFragment"></nav>
    <section>
        <form class= "search-form" id="search-form" method="get" action="#">
            <div class="form-group">
                <label class="form-label">주문일</label>
                <span>
                    <input type="date" name="firstdate" class="date">&nbsp;~ 
                    <input type="date" name="lastdate" class="date">
                </span>
            </div>
           
            <div class="form-group">
                <label class="form-label">검색어</label>
                <span>
                    <select name="smode">
                        <option value="buyer">주문일</option>
                        <option value="buyer">구매자</option>
                    </select>
                    <input type="text" name="sinput" class="search-input">
                </span>
            </div>
            <div class="search-submit-box">
                <input type="submit" class="search-submit" value="검색">
            </div>
        </form>
       
		<div style="width: 1291px; height:153.98px">
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
			  <c:forEach items="${orderList}" var="orderList">
			  <tbody>
			    <tr>
			      <td style = "cursor:pointer;" onMouseOver = " window.status = 'http://ihouse.so.vc' " onMouseOut = " window.status = '' "
					 onClick="location.href='/admin/orderView?n=${orderList.orderId}'">${orderList.orderId}</td>
			      <td>${orderList.orderName}</td>
			      <td>${orderList.rentCar}</td>
			      <td>${orderList.orderPhon}</td>			  
			      <td>${orderList.startDate}</td>
			      <td>${orderList.endDate}</td>
			          <td><fmt:formatNumber pattern="###,###,###"
									value="${orderList.amount}" /></td>
			      <td>${orderList.delivery}</td>
			    </tr>			
			  </tbody>
			  </c:forEach>
			</table>
		</div>

    </section>
    <script src="/resources/js/admin/admin_nav.js"></script>
    <script src="/resources/js/admin/admin_order.js"></script>
</body>
</html>