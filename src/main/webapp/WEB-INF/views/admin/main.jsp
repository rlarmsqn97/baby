<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html xmlns:th="http://www.thymeleaf.org" lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>admin_main</title>
    <script src="https://kit.fontawesome.com/e6f78261b2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/admin/adminnav.css">
    <link rel="stylesheet" href="/resources/css/admin/admin_main.css">
    <script src="/resources/admin/js/jquery.js"></script>
</head>
<body>
<%@ include file="nav/admin_nav.jsp" %>
    <nav th:replace="admin/admin_nav :: navFragment"></nav>
    <section>
        <div class="recent-user item">
            <div class="item-caption">
                <div class="item-title">최근 가입 회원</div>
            </div>
            <div class="item-content">
                <table>
                    <thead>
                        <tr>
                            <th>아이디</th>
                            <th>이름</th>
                            <th>번호</th>
                            <th>이메일</th>
                            <th>가입날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${seven}" var="seven">
                       <tr>
                           <td>${seven.userId}</td>
                           <td>${seven.userName}</td>
                           <td>${seven.userPhon}</td>
                           <td>${seven.userMail}</td>
                           <td>${seven.regiDate}</td>
                       </tr> 
                       </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="num-visitors item">
            <div class="item-caption">
                <div class="item-title">판매순위</div>
            </div>
            <div class="item-content">
                           <table>
                    <thead>
                        <tr>
                            <th>순위</th>
                            <th>상품명</th>
                            <th>총액</th>
                           
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${rank}" var="rank" varStatus="status">
                       <tr>
                           <td><c:out value="${status.count }"/></td>
                           <td>${rank.pdName}</td>
                           <td>${rank.amount}</td>
                       </tr> 
                       </c:forEach>
                    </tbody>
                </table>  
            </div>
            
    
        </div>
        <div class="recent-order item">
            <div class="item-caption">
                <div class="item-title">배송준비 중 목록</div>
            </div>
            <div class="item-content">
                <table>
                    <thead>
                        <tr> 
                            <th>주문번호</th>
                            <th>주문자</th>
                            <th>번호</th>
                            <th>렌트카</th>
                            <th>요청사항</th>
                            <th>주문일</th>
                            <th>대여일</th>
                            <th>반납일</th>
                            <th>상태</th>
                        </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${ready }" var="ready">
                      <tr>
                           <td>${ready.orderId}</td>
                           <td>${ready.orderName}</td>
                           <td>${ready.orderPhon}</td>
                           <td>${ready.rentCar}</td>
                           <td>${ready.reQu}</td>
                           <td>${ready.orderDate}</td>
                           <td>${ready.startDate}</td>
                           <td>${ready.endDate}</td>
                           <td>${ready.delivery}</td>
                      </tr>
                      </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="recent-item item">
            <div class="item-caption">
                <div class="item-title">최근 등록 상품</div>
                <div class="more" onclick="location.href='/admin/product/prodcutlist'">more +</div>
            </div>
            <div class="item-content">
                <table>
                    <thead>
                        <tr>
                            <th>상품사진</th>
                            <th>상품명</th>
                            <th>가격</th>
                            <th>재고</th>
                            <th>설명</th>
                            <th>사용연령</th>
                            <th>등록날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${nearpd }" var="pd">
                 		<tr >
                            <td class="goods-img"> <img src="${pd.pdThumbImg }"></td>
 							<td>${pd.pdName }</td>    
 							<td>${pd.pdPrice }</td>
 							<td>${pd.pdStock }</td>
 							<td>${pd.pdDes }</td>
 							<td>${pd.pdAge }</td>
 							<td>${pd.pdDate }</td>                                        
                        </tr> 
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
    <script src="resources/admin/js/admin/admin_nav.js"></script>
</body>
</html>