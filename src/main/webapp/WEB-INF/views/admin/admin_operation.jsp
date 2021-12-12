<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html xmlns:th="http://www.thymeleaf.org" lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>admin operation setting</title>
    <script src="https://kit.fontawesome.com/e6f78261b2.js" crossorigin="anonymous"></script>
    <script src="/js/jquery.js"></script>
    <link rel="stylesheet" href="/css/admin/admin_nav.css">
    <link rel="stylesheet" href="/css/admin/admin_operation.css">
</head>
<body>
    <nav th:replace="admin/admin_nav :: navFragment"></nav>
    <section>
    <form action="#" method="GET">
        <!-- 기본 설정 -->
        <div class="basic-setting item">
            <div class="item-caption">
                <div class="item-title">기본 설정(공통)</div>
            </div>
            <div class="item-content">
                <div class="form-group">
                    <label class="form-label">구매설정</label>
                    <span>
                        <label><input type="radio" name="buy-setting" value="anyone" checked>제한없음</label>
                        <label><input type="radio" name="buy-setting" value="onlymember">회원만</label>
                        구매가능
                    </span>
                </div>
                <div class="form-group">
                    <label class="form-label">상품평 사용여부</label>
                    <span>
                        <label><input type="radio" name="review-setting" value="use" checked>사용함</label>
                        <label><input type="radio" name="review-setting" value="notuse">사용안함</label>
                    </span>
                </div>
                <div class="form-group">
                    <label class="form-label">상품문의 여부</label>
                    <span>
                        <label><input type="radio" name="qanda-setting" value="use" checked>사용함</label>
                        <label><input type="radio" name="qanda-setting" value="notuse">사용안함</label>
                    </span>
                </div>
                <div class="form-group">
                    <label class="form-label">배송비 설정</label>
                    <span>
                        <input type="text" name="min-delivery-free"> 이상 구매시 배송비 무료, 미만 시 배송비 <input type="text" name="delivery-charge"> 원 부과
                    </span>
                </div>
            </div>
        </div>
        
        <!-- 적립금 사용 설정 -->
        <div class="reserve-use-setting item">
            <div class="item-caption">
                <div class="item-title">적립금 사용 설정</div>
            </div>
            <div class="item-content">
                <div class="form-group">
                    <label class="form-label">적립금 사용</label>
                    <span>
                        <label><input type="radio" name="reserve-use-setting" value="use" checked>사용함</label>
                        <label><input type="radio" name="reserve-use-setting" value="notuse">사용안함</label>
                    </span>
                </div>
                <div class="form-group">
                    <label class="form-label">최소 사용 적립금</label>
                    <span>
                        <input type="text" name="min-reserve-use">원 이상부터 사용가능
                    </span>
                </div>
                <div class="form-group">
                    <label class="form-label">최대 사용 적립금</label>
                    <span>
                        <label><input type="radio" name="max-reserve-use" value="unlimited">제한없음</label>
                        <label><input type="radio" name="max-reserve-use" value="limited">최대 <input type="text" name="limit-amount"> 원까지 사용가능</label>
                    </span>
                </div>
            </div>
        </div>

        <!-- 적립금 지급 설정 -->
        <div class="reserve-paments-setting item">
            <div class="item-caption">
                <div class="item-title">적립금 지급 설정</div>
            </div>
            <div class="item-content">
                <div class="form-group">
                    <label class="form-label">회원가입</label>
                    <span>
                        <label><input type="radio" name="signup-reserve-setting" value="notpay">지급안함</label>
                        <label><input type="radio" name="signup-reserve-setting" value="pay">지급함</label>
                        <input type="text" name="signup-reserve-pay-amount">
                    </span>
                </div>
                <div class="form-group">
                    <label class="form-label">지급정책</label>
                    <span>
                        판매가의 <input type="text" name="buy-reserve-pay-amount"> %를 구매 확정시 지급
                    </span>
                </div>
            </div>
        </div>

        <!-- 저장, 목록 돌아가기 버튼-->
        <div class="bottom">
            <div class="bottombtn">
                <input type="submit" value="저장"> 
            </div>
        </div>
    </form>
    </section>
    <script src="/js/admin/admin_nav.js"></script>
</body>
</html>