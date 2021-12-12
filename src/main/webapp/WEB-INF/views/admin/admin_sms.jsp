<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
	<%@include file="nav/admin_nav.jsp"%>
	    <section>
	    
        <div class="recent-user item">
            <div class="item-caption">
                <div class="item-title">반납 하루전 목록</div>             
            </div>
            <div class="item-content">
                <textarea name="textarea" rows="10" cols="50"></textarea>
            </div>
        </div>
        
        <div class="num-visitors item">
            <div class="item-caption">
                <div class="item-title">발송할 번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;발송 텍스트 입력</div>
            </div>           
              <div class="item-content" style="float: left;">
                <textarea name="textarea" rows="10" cols="50"></textarea>
            </div>
             <div class="item-content" >
                <textarea name="textarea" rows="10" cols="50"></textarea>
            </div>
             <div class="row">
  				 <button class="search-submit search-item" style="float :right;margin:100px;">발송</button>
  			 </div>
        </div>
    </section>
	<script src="/resources/js/admin/admin_nav.js"></script>
</body>
</html>