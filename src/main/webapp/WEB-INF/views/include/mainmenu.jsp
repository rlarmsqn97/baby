<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 	 <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="/resources/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico">
  
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
     <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link href="/resources/css/boxicon.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/resources/css/templatemo.css">
   
    <link rel="stylesheet" href="/resources/css/custom.css">
    
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
	
 
</head>
<body>
	 <!-- Header -->
    <nav id="main_nav" class="navbar navbar-expand-lg navbar-light bg-white shadow">
        <div class="container d-flex justify-content-between align-items-center">
            <a class="navbar-brand h1" href="/">
                <i class='bx bx-buildings bx-sm text-dark'></i>
                <span class="text-dark h4">강동구 카시트</span>
            </a>
            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-toggler-success" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="navbar-toggler-success">
                <div class="flex-fill mx-xl-5 mb-2">
                    <ul class="nav navbar-nav d-flex justify-content-between mx-xl-5 text-center text-dark">
                        <li class="nav-item">
                            <a class="nav-link btn-outline-primary rounded-pill px-3" href="/shop/products?c=100&l=1">대여상품</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn-outline-primary rounded-pill px-3" href="/user/guide">대여안내</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn-outline-primary rounded-pill px-3" href="/board/qna/listPageSearch?num=1">문의하기</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn-outline-primary rounded-pill px-3" href="/board/review/listPageSearch?num=1">이용후기</a>
                        </li>                
                    </ul>
                </div>
                <div class="navbar align-self-center d-flex">
                <c:if test="${user == null }">
                   <a class="nav-link btn-outline-primary rounded-pill px-3" href="/user/login">로그인</a>
                   <a class="nav-link btn-outline-primary rounded-pill px-3" href="/user/join">회원가입</a>
                </c:if>
                <c:if test="${user != null }">
                	<span class="text-dark px-3">${user.userName }님</span>
                   <a class="nav-link btn-outline-primary rounded-pill px-3" href="/user/mypage">마이페이지</a>
                   <a class="nav-link btn-outline-primary rounded-pill px-3" href="/shop/orderList">주문내역</a>
                   <a class="nav-link btn-outline-primary rounded-pill px-3" href="/shop/cart">장바구니</a>               
                   <a class="nav-link btn-outline-primary rounded-pill px-3" href="/user/logout">로그아웃</a> 
                    <c:if test="${user.verify == 7 }">
                	     <a class="nav-link btn-outline-primary rounded-pill px-3" href="/admin/main">관리자</a>
                	</c:if>            
                </c:if>
                
                </div>
            </div>
        </div>
    </nav>
    <!-- Close Header -->

	

  <!-- Templatemo -->
    <script src="/resources/js/templatemo.js"></script>
    <!-- Custom -->
    <script src="/resources/js/custom.js"></script>
    
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</body>
</html>