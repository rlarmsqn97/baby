<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
    <title>상품목록</title>
        <script src="https://kit.fontawesome.com/e6f78261b2.js" crossorigin="anonymous"></script>
    <script src="/resources/js/jquery.js"></script>
    <link rel="stylesheet" href="/resources/css/admin/adminnav.css">
    <link rel="stylesheet" href="/resources/css/admin/admin_registerGoods.css">
    
    <link rel="apple-touch-icon" href="/resources/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico">
  
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
   
    <link href="/resources/css/boxicon.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600&display=swap" rel="stylesheet">
  
    <link rel="stylesheet" href="/resources/css/templatemo.css">
   
    <link rel="stylesheet" href="/resources/css/custom.css">
    
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
	
 
    
</head>
<body>
<%@include file="../nav/admin_nav.jsp" %>
    
      <section class="container py-5">
        <!-- <div class="row justify-content-center my-5">
            <div class="filter-btns shadow-md rounded-pill text-center col-auto">
                <a class="filter-btn btn rounded-pill btn-outline-primary border-0 m-md-2 px-md-4 active" data-filter=".project" href="#">All</a>
                <a class="filter-btn btn rounded-pill btn-outline-primary border-0 m-md-2 px-md-4" data-filter=".business" href="#">Business</a>
                <a class="filter-btn btn rounded-pill btn-outline-primary border-0 m-md-2 px-md-4" data-filter=".marketing" href="#">Marketing</a>
                <a class="filter-btn btn rounded-pill btn-outline-primary border-0 m-md-2 px-md-4" data-filter=".social" href="#">Social Media</a>
                <a class="filter-btn btn rounded-pill btn-outline-primary border-0 m-md-2 px-md-4" data-filter=".graphic" href="#">Graphic</a>
            </div>
        </div> -->
 <section class="py-5 mb-5">
        <div class="container">
              <div class="row gy-5 g-lg-5 mb-4">
				<c:forEach items="${list }" var="list">
                <!-- Start Recent Work -->
                <div class="col-md-4 mb-3">
                    <a href="/admin/product/productview?n=${list.pdNum}" class="recent-work card border-0 shadow-lg overflow-hidden">
                        <img class="recent-work-img card-img" src="${list.pdThumbImg }" alt="Card image">
                        <div recent-work-vertical card-img-overlay d-flex align-items-end">
                            <div class="recent-work-content text-start mb-3 ml-3 text-dark">
                            
                                <h3 class="card-title light-300">${list.pdName }</h3>
                                <p class="card-text">${list.pdPrice }</p>                       
                            </div>                      
                        </div>
                    </a>
                    
                </div><!-- End Recent Work -->
                    </c:forEach>
            </div>
      
        <div class="row">
            <div class="btn-toolbar justify-content-center pb-4" role="toolbar" aria-label="Toolbar with button groups">
                <div class="btn-group me-2" role="group" aria-label="First group">
                    <button type="button" class="btn btn-secondary text-white">Previous</button>
                </div>
                <div class="btn-group me-2" role="group" aria-label="Second group">
                    <button type="button" class="btn btn-light">1</button>
                </div>
                <div class="btn-group me-2" role="group" aria-label="Second group">
                    <button type="button" class="btn btn-secondary text-white">2</button>
                </div>
                <div class="btn-group" role="group" aria-label="Third group">
                    <button type="button" class="btn btn-secondary text-white">Next</button>
                </div>
            </div>
        </div>
        </div>
    </section>
    <script src="../resources/js/admin/admin_nav.js"></script>
    <script src="../resources/js/admin/admin_Goodslist.js"></script>
    
     <!-- Templatemo -->
    <script src="../resources/js/templatemo.js"></script>
    <!-- Custom -->
    <script src="../resources/js/custom.js"></script>
    
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</body>
</html>