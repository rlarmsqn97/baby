<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <html xmlns:th="http://www.thymeleaf.org" lang="en">
<nav th:fragment="navFragment">
    <div class="side-title"><a href="#">관리자 모드</a></div>
    <ul class="side-menu">
        <li><a href="/admin/main">HOME</a></li>
        <li class="menu-dropdown">
            <span>회원관리 <i class="fas fa-chevron-down"></i></span>
            <ul class="dropdown">
                <li><a href="/admin/userList">회원목록</a></li>
                <li><a href="/admin/userRegister">회원등록</a></li>
                <li><a href="admin_sms">sms발송</a></li>
            </ul>
        </li>
        <li class="menu-dropdown">
            <span>상품관리 <i class="fas fa-chevron-down"></i></span>
            <ul class="dropdown">
                <li><a href="/admin/product/productregister">상품 등록</a></li>
                <li><a href="/admin/product/productlist">상품 목록</a></li>
            </ul>
        </li>
          <li class="menu-dropdown">
            <span>주문관리 <i class="fas fa-chevron-down"></i></span>
            <ul class="dropdown">
                <li><a href="/admin/orderList">전체주문내역</a></li>       
            </ul>
        </li>
          <li class="menu-dropdown">
            <span>텍스트,이미지수정 <i class="fas fa-chevron-down"></i></span>
            <ul class="dropdown">
                <li><a href="#">대여안내</a></li>
                <li><a href="#">회사소개</a></li>
                <li><a href="#">개인정보취급방침</a></li>
                <li><a href="#">이용약관</a></li>
                <li><a href="#">메인페이지이미지설정</a></li>
            </ul>
        </li>
        <li><a href='/'>일반화면</a></li>
        <li><a href='#'>LOGOUT</a></li>
    </ul>
</nav>
</html>