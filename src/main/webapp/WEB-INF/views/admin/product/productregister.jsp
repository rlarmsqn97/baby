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
    <script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
    
    <script src="https://cdn.ckeditor.com/ckeditor5/31.0.0/classic/ckeditor.js"></script>
</head>
<body>
<%@include file="../nav/admin_nav.jsp" %>
<section>
			
   <form role="form" method="post" autocomplete="off" enctype="multipart/form-data">
        <!-- 상품 기본정보 -->
        <div class="basic-info item">
            <div class="item-caption">
                <div class="item-title">상품 기본 정보</div>
            </div>
            
            <div class="item-content">
            
                <div class="form-group">
                    <label class="form-label">상품분류</label>
                    <span class="cmode-box">
                        <select name="cmode1" class="cmode1">
                            <option value="">1차분류</option>                     
                        </select>
                        <select class="cmode2" name="cateCode">
                            <option value="">2차분류</option>
                        </select>
                    </span>
                </div>
                <div class="form-group">
                    <label class="form-label">상품명</label>
                    <span><input type="text" name="pdName"></span>
                </div>
                <div class="form-group">
                    <label class="form-label">판매가격</label>
                    <span><input type="text" name="pdPrice"></span>
                </div>
                  <div class="form-group">
                    <label class="form-label">상품사용연령</label>
                    <span><input type="text" name="pdAge"></span>
                </div>
                   <div class="form-group">
                    <label class="form-label">판매수량</label>
                    <span><input type="text" name="pdStock"></span>
                </div>
                  <div class="form-group">
                    <label class="form-label">상품설명</label>
                    <span><input type="text" name="pdDes"></span>
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
                <input type="submit" value="저장">
                <input type="button" value="목록">   
            </div>
        </div>  
    </form>
	</section>

  
    <script src="/resources/js/admin/admin_nav.js"></script>
    <script src="/resources/js/admin/admin_registerGoods.js"></script>
    
<script>
// 컨트롤러에서 데이터 받기
var jsonData = JSON.parse('${category}');
// 필요한 배열과 오브젝트 변수 생성
var cate1Arr = new Array();
var cate1Obj = new Object();
// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
for(var i = 0; i < jsonData.length; i++) {
	
	if(jsonData[i].level == "1") {  // 레벨이 1인 데이터가 있다면 
		cate1Obj = new Object();  // 초기화
		
		// cate1Obj에 cateCode와 cateName를 저장
		cate1Obj.cateCode = jsonData[i].cateCode; 
		cate1Obj.cateName = jsonData[i].cateName;
		
		// cate1Obj에 저장된 값을 cate1Arr 배열에 저장
		cate1Arr.push(cate1Obj);
	}
}
// 1차 분류 셀렉트 박스에 데이터 삽입
var cate1Select = $("select.cmode1")
for(var i = 0; i < cate1Arr.length; i++) {
	// cate1Arr에 저장된 값을 cate1Select에 추가
	cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
						+ cate1Arr[i].cateName + "</option>");	
}
// 클래스가 category1인 select변수의 값이 바뀌었을 때 실행
$(document).on("change", "select.cmode1", function(){
	
	// 필요한 배열과 오브젝트 변수를 생성
	var cate2Arr = new Array();
	var cate2Obj = new Object();
	
	// 2차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
		
		if(jsonData[i].level == "2") {  // 레빌이 2인 데이터가 있다면
			cate2Obj = new Object();  // 초기화
			
			// cate2Obj에 cateCode, cateName, cateCodeRef를 저장
			cate2Obj.cateCode = jsonData[i].cateCode;
			cate2Obj.cateName = jsonData[i].cateName;
			cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
			
			// cate2Obj에 저장된 값을 cate1Arr 배열에 저장
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
	
	// cate2Select의 값을 제거함(초기화)
	cate2Select.children().remove();
 
	// cate1Select에서 선택한 값을 기준으로 cate2Select의 값을 조정
	$("option:selected", this).each(function(){
		
		var selectVal = $(this).val();  // 현재 선택한 cate1Select의 값을 저장
	
		cate2Select.append("<option value='" + selectVal + "'>2차분류</option>");  // cate2Select의 '전체'에 현재 선택한 cate1Select와 같은 값 부여
		
		// cate2Arr의 데이터를 cate2Select에 추가
		for(var i = 0; i < cate2Arr.length; i++) {
			
			// 현재 선택한 cate1Select의 값과 일치하는 cate2Arr의 데이터를 가져옴
			if(selectVal == cate2Arr[i].cateCodeRef) {
				cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
									+ cate2Arr[i].cateName + "</option>");
			}
		}		
	});
	
});
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