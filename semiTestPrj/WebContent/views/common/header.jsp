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
    /* .header{
        border: 1px dashed red;
    } */
    /* 참고용 (추 후 삭제 예정) */
    
    
    body{
        padding-top: 150px;
    }
    .header{
        box-sizing: border-box;
        padding: 0;
        margin: 0;
        background-color: white;
    }
    .header-hr{
        box-sizing: border-box;
        padding: 0;
        margin: 0;
    }
    header{
        width: 100%;
        height: 150px;
        position: fixed;
        top: 0;
        left: auto;
    }
    #header-inner1{
        width: 100%;
        height: 32%;
        display: flex;
        align-items: center;
        flex-direction: row-reverse;
        padding-right: 100px;
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
        margin: 0 3px 0 10px;
        margin-top: 6px;
        font-size: 15px;
    }
    #header-inner2-category a{
        text-decoration: none;
        color: black;
        font-size: 25px;
        font-weight: 700;
        height: 50%;
        margin: 0 3px 0 10px;        
    }
    #header-inner2-category{
        padding-right: 100px;
    }
    #search{
        height: 30px;
        width: 500px;
    }
    #logo-anbd{
        padding-left: 100px;
    }
    #logo-anbd img{
        height: 60px;
    }
</style>
</head>
<body>

    <header id="header" class="header">
            <hr class="header-hr">
            <div id="header-inner1" class="header">
                <a href="">고객센터</a>
                <a href="">관심상품</a>
                <a href="">마이페이지</a>
                <a href="">로그인</a> <!-- 로그인시, 로그아웃으로 바뀌는 코드 작성 -->
            </div>
            <hr class="header-hr">
            <div id="header-inner2" class="header">
                <a id="logo-anbd" href="/semiTestPrj">
                    <img src="/semiTestPrj/views/common/resources/anbdpng.png" alt="아나바다로고">
                </a>
                <form id="search" action="" method="get">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" name="keyword" placeholder="포켓몬빵은 어때요?">
                        <button class="btn btn-success" type="submit">검색</button>
                    </div>
                </form>
                <div id="header-inner2-category">
                    <a href="">SALE</a>
                    <a href="">SHOP</a>
                    <a href="">ABOUT</a>
                </div>
            </div>
            <hr class="header-hr">
    </header>

</body>
</html>