<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원상세</title>
    <script src="/resources/js/jquery.min.js"></script>
    <link rel="stylesheet" href="/resources/css/admin/admin_userlist.css">
    <link rel="stylesheet" href="/resources/css/admin/adminnav.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<nav th:replace="admin/admin_nav :: navFragment"></nav>
<%@include file = "nav/admin_nav.jsp" %>
<section>
    <form class= "search-form" id="search-form" method="GET" th:action="@{/admin/userList}">
        <select name="searchCondition" class="search-mode search-item" form="search-form">         
            <option value="userName">이름</option>
            <option value="userPhon">번호</option>
<!--            <option value="phone">휴대전화</option>-->
<!--            <option value="visit">방문횟수</option>-->
<!--            <option value="order">주문횟수</option>-->
        </select>
        <input type="text" name="searchKeyword" class="search-input search-item">
        <input type="submit" class="search-submit search-item" value="검색">
    </form>
    <div class="user-box">
        <table class="user-table">
            <thead>
            <tr>
                <th>이름</th>
                <th>전화번호</th>
                <th>Email</th>
                <th>가입 날짜</th>
            </tr>
            </thead>
            
            <c:forEach items="${userView }" var="userView"> 
            <tbody>            
            <tr>               
                <td>${userView.userName}</td>
                <td>${userView.userPhon}</td>
                <td>${userView.userMail}</td>
                <td>${userView.regiDate}</td>                            
            </tr>  
            </tbody>
            </c:forEach>         

        </table>
        <div>
        	<h4>총 구매금액</h4>
        	<c:set var = "total" value = "0"/>
        	<c:forEach items="${userDetail }" var="userDetail" varStatus="status">
        		<h5 style="display:none">${userDetail.amount}</h5>        	
        	<c:set var="total" value="${total + userDetail.amount }"/>
        	</c:forEach>
        	<c:out value="${total }"/>
        </div>
        <div style="height: 100px">

        </div>
        <span>주문내역</span>
        <table class="user-table">
            <thead>
            <tr>
                <th scope="rowgroup">상품이미지</th>
                <th scope="rowgroup">상품명</th>
                <th scope="rowgroup">주문날짜</th>
                <th scope="rowgroup">대여일</th>
                <th scope="rowgroup">반납일</th>            
                <th scope="rowgroup">개당가격</th>
                <th scope="rowgroup">구입수량</th>
                <th scope="rowgroup">최총가격</th>
                <th scope="rowgroup">상태</th>
                
            </tr>
            </thead>
            
            <c:forEach items="${userDetail }" var="userDetail"> 
            <tbody>            
            <tr>
                <td scope="row"><img src="${userDetail.pdThumbImg}"/></td>
                <td scope="row">${userDetail.pdName}</td>
                <td scope="row"><fmt:formatDate pattern="yyyy-MM-dd"
											value="${userDetail.orderDate}"/></td>
                <td scope="row">${userDetail.startDate}</td>
                <td scope="row">${userDetail.endDate}</td>
                <td scope="row">${userDetail.pdPrice}</td>
                <td scope="row">${userDetail.cartStock}</td>
                <td scope="row">${userDetail.pdPrice * userDetail.cartStock}</td>
                <td scope="row">${userDetail.delivery}</td>           
            </tr>  
            </tbody>
            </c:forEach>         
        </table>  
    </div>
</section>
<script src="/resources/js/admin/admin_nav.js"></script>
<script src="/resources/js/admin/admin_userlist.js"></script>

</body>
</html>