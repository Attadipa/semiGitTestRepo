<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%-- 제이쿼리 --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js""></script>
<%-- 부트스트랩 --%>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
    .header{
        border: 1px dashed red;
    }
    /* 참고용 (추 후 삭제 예정) */
    
    
    
    .header{
        box-sizing: border-box;
        padding: 0;
        margin: 0;
    }
    .header-hr{
        box-sizing: border-box;
        padding: 0;
        margin: 0;
    }
    #header{
        width: 100%;
        height: 100px;
    }
    #header-inner1{
        width: 100%;
        height: 32%;
        display: flex;
        align-items: center;
        flex-direction: row-reverse;
    }
    #header-inner2{
        width: 100%;
        height: 68%;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    #header-inner1 a{
        text-decoration: none;
        color: black;
        font-size: 20%;
        height: 50%;
        margin: 0 3px 0 3px;
    }
    #header-inner2 a{
        text-decoration: none;
        color: black;
        font-size: 100%;
        height: 50%;
        margin: 0 3px 0 3px;
    }
</style>
</head>
<body>

    <div id="header" class="header">

        <hr class="header-hr">
        <div id="header-inner1" class="header">
            <a href="">고객센터</a>
            <a href="">관심상품</a>
            <a href="">마이페이지</a>
            <a href="">로그인</a> <!-- 로그인시, 로그아웃으로 바뀌는 코드 작성 -->
        </div>
        <hr class="header-hr">
        <div id="header-inner2" class="header">
            <img src="" alt="">
            <div class="input-group input-group-sm mb-3">
                <span class="input-group-text" id="inputGroup-sizing-sm">Small</span>
                <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
            </div>
            <div>
                <a href="">SALE</a>
                <a href="">SHOP</a>
                <a href="">ABOUT</a>
            </div>
        </div>
        <hr class="header-hr">

    </div>

</body>
</html>