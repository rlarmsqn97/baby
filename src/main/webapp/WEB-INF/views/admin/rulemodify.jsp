<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<meta charset="utf-8">
<title>개인정보처리방침 수정/삭제</title>
<head>
<!--
    
TemplateMo 561 Purple Buzz

https://templatemo.com/tm-561-purple-buzz

-->   <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
     <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link href="/resources/css/boxicon.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/resources/css/admin/adminnav.css">
    <link rel="stylesheet" href="/resources/css/admin/admin_main.css">
    <script src="/resources/admin/js/jquery.js"></script>
        <link rel="stylesheet" href="/resources/css/templatemo.css">
   
    <link rel="stylesheet" href="/resources/css/custom.css">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
</head>
<body>
<%@ include file="nav/admin_nav.jsp" %>

    <!-- Start Contact -->
    <section class="container py-5">

        <h1 class="col-12 col-xl-8 h2 text-left text-primary pt-3">개인정보처리방침 수정/삭제</h1>
        <h2 class="col-12 col-xl-8 h4 text-left regular-400"></h2>    
        <p class="col-12 col-xl-8 text-left text-muted pb-5 light-300"/>
         <form method="post"> 
        
         <textarea rows="15" cols="100" name="content">${rule.content}</textarea>
      
           <button type="submit">수정</button>
           <button type="button" onclick="location.href='/admin/ruledelete'">삭제</button>
       
         </form>
         	
      
      

    </section>
    <!-- End Contact -->
    <!-- Bootstrap -->
    <script src="resources/js/bootstrap.bundle.min.js"></script>
    <!-- Templatemo -->
    <script src="resources/js/templatemo.js"></script>
    <!-- Custom -->
    <script src="resources/js/custom.js"></script>

</body>

</html>