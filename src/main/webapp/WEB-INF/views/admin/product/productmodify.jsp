<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html xmlns:th="http://www.thymeleaf.org" lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>admin registerGoods</title>
    <script src="https://kit.fontawesome.com/e6f78261b2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/admin/adminnav.css">
    <link rel="stylesheet" href="/resources/css/admin/admin_registerGoods.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.ico">
  
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
   
    <link href="/resources/css/boxicon.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600&display=swap" rel="stylesheet">
  
    <link rel="stylesheet" href="/resources/css/templatemo.css">
   
    <link rel="stylesheet" href="/resources/css/custom.css">
    
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
	
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      
    <script src="https://kit.fontawesome.com/e6f78261b2.js" crossorigin="anonymous"></script>
    <script src="/resources/js/jquery.js"></script>
    <link rel="stylesheet" href="/resources/css/admin/adminnav.css">
    <link rel="stylesheet" href="/resources/css/admin/admin_registerGoods.css">
</head>
<body>
<%@include file="../nav/admin_nav.jsp" %>
<section>
			
<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">
        
<input type="hidden" name="pdNum" value="${pd.pdNum}" />
        <!-- 상품 기본정보 -->
        <div class="basic-info item">
            <div class="item-caption">
                <div class="item-title">상품 기본 정보</div>
            </div>
            <div class="item-content">
                <div class="form-group">
                    <label class="form-label">상품분류</label>
                    <span class="cmode-box">
                        <select class="cmode1">
                            <option value="">1차 분류</option>                     
                        </select>
                        <select name="cateCode" class="cmode2">
                            <option value="">2차 분류</option>
                        </select>
                    </span>
                </div>
                <div class="form-group">
                    <label class="form-label">상품명</label>
                    <span><input type="text" name="pdName" value="${pd.pdName}"></span>
                </div>
                 <div class="form-group">
                    <label class="form-label">상품사용연령</label>
                    <span><input type="text" name="pdAge" value="${pd.pdAge}"></span>
                </div>
                <div class="form-group">
                    <label class="form-label">판매가격</label>
                    <span><input type="text" name="pdPrice" value="${pd.pdPrice }"></span>
                </div>
                  <div class="form-group">
                    <label class="form-label">상품설명</label>
                    <span><input type="text" name="pdDes" value="${pd.pdDes }"></span>
                </div>
                <div class="form-group">
                    <label class="form-label">상품 이미지</label>
                    <span>
                        <div class="imgupload">
                            <label class=imguploadbtn for="pdImg">
                                이미지 찾기
                            </label>
                            <input type="file" id="pdImg" name="file">
                            <div class="select_img"><img src="" /></div>
                            <%=request.getRealPath("/") %>
                        </div>                     
                    </span>
                </div>            
            </div>
        </div>
        <div class="bottom">
            <div class="bottombtn">
           <button type="submit" id="update_Btn" class="btn btn-primary">완료</button>
		    <button type="button" id="back_Btn" class="btn btn-warning">취소</button>	
		    <script>
			 $("#back_Btn").click(function(){
			  //history.back();
			  location.href = "productview?n=" + ${pd.pdNum};
			 });   
			</script>        
            </div>
        </div>
        </form>
		</section>

  
    <script src="/resources/js/admin/admin_nav.js"></script>
    <script src="/resources/js/admin/admin_registerGoods.js"></script>


<script>
/*
 * --------------------
 * register.jsp 주석 참고
 * --------------------
 */
var jsonData = JSON.parse('${category}');
var cate1Arr = new Array();
var cate1Obj = new Object();
for(var i = 0; i < jsonData.length; i++) {
	
	if(jsonData[i].level == "1") {
		cate1Obj = new Object();  //초기화
		cate1Obj.cateCode = jsonData[i].cateCode;
		cate1Obj.cateName = jsonData[i].cateName;
		cate1Arr.push(cate1Obj);
	}
}
var cate1Select = $("select.cmode1")
for(var i = 0; i < cate1Arr.length; i++) {
	cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
						+ cate1Arr[i].cateName + "</option>");	
}
$(document).on("change", "cmode1", function(){
	var cate2Arr = new Array();
	var cate2Obj = new Object();
	
	for(var i = 0; i < jsonData.length; i++) {
		
		if(jsonData[i].level == "2") {
			cate2Obj = new Object();
			cate2Obj.cateCode = jsonData[i].cateCode;
			cate2Obj.cateName = jsonData[i].cateName;
			cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
			
			cate2Arr.push(cate2Obj);
		} 
	}
	
	var cate2Select = $("select.cmode2");
	
	/*
	for(var i = 0; i < cate2Arr.length; i++) {
			cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
								+ cate2Arr[i].cateName + "</option>");
	}
	*/
	
	cate2Select.children().remove();
 
	$("option:selected", this).each(function(){
		
		var selectVal = $(this).val();		
				
		cate2Select.append("<option value='" + selectVal + "'>2차분류</option>");
		
		for(var i = 0; i < cate2Arr.length; i++) {
			if(selectVal == cate2Arr[i].cateCodeRef) {
				cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
									+ cate2Arr[i].cateName + "</option>");
			}
		}		
	});
});
var select_cateCode = '${pd.cateCode}';
var select_cateCodeRef = '${pd.cateCodeRef}';
var select_cateName = '${pd.cateName}';
console.log("select_cateCode = " + select_cateCode);
console.log("select_cateCodeRef = " + select_cateCodeRef);
if(select_cateCodeRef != null && select_cateCodeRef != "") {
	
	console.log("값이 없으면");
	
	$(".cmode1").val(select_cateCodeRef);
	$(".cmode2").val(select_cateCode);
	$(".cmode2").children().remove();
	$(".cmode2").append("<option value='"
							+ select_cateCode + "'>" + select_cateName + "</option>");
	
	
} else {
	
	console.log("값이 있으면");
	
	$(".cmode1").val(select_cateCode);
	//$(".category2").val(select_cateCode);
	$(".cmode2").append("<option value='"
			+ select_cateCode + "' selected='selected'>2차분류</option>");
}
</script>
 <script>
  $("#pdImg").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>
    <script>
 var ckeditor_config = {
   resize_enaleb : false,
   enterMode : CKEDITOR.ENTER_BR,
   shiftEnterMode : CKEDITOR.ENTER_P,
   filebrowserUploadUrl : "/admin/product/ckUpload"
 };
 
 CKEDITOR.replace("pdDes", ckeditor_config);
</script>
</body>
</html>