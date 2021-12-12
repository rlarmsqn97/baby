<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원목록</title>
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
                <th><input type="checkbox" class="checkbox-selectall"></th>
                <th>이름</th>
                <th>전화번호</th>
                <th>Email</th>
                <th>가입 날짜</th>
                <th>삭제</th>
            </tr>
            </thead>
            
            <c:forEach items="${userList }" var="userList"> 
            <tbody>            
            <tr>
                <td><input type="checkbox" class="checkbox-select"></td>
                <td style = "cursor:pointer;" onMouseOver = " window.status = 'http://ihouse.so.vc'" onMouseOut = "window.status = ''"
                    onClick="location.href='/admin/userDetail?n=${userList.userId}'">${userList.userName}</td>
                <td >${userList.userPhon}</td>
                <td >${userList.userMail}</td>
                <td >${userList.regiDate }</td>
                <td><input type="button" value="삭제" class="deletebtn table-btn" th:onclick="|deleteUser('${userList.userId}')|"></td>              
            </tr>  
            </tbody>
            </c:forEach>         
        </table>

        <div class="bottombtn-box">
            <input type="button" value="전체선택" class="selectallbtn bottombtn" th:onclick="|checkall()|">
            <input type="button" value="선택삭제" class="bottom-deletebtn bottombtn" th:onclick="|deleteCheckedUsers()|">

        </div>
     
    </div>
</section>
<script src="/resources/js/admin/admin_nav.js"></script>
<script src="/resources/js/admin/admin_userlist.js"></script>

</body>
</html>