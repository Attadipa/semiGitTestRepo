<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #container{
        width: 550px;
        margin: auto;
    }
    #carouselExampleControls{
        width: 100%;
    }
    .carousel-item img{
        border-radius: 20px;
    }
    #ad-button-container{
        width: 100%;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        font-size: 20px;

    }
    #ad-button-container *{
        border: none;
        height: 100px;
        border-radius: 10px;
        box-shadow: 0 0 5px grey;
        margin: 20px 0 0 0;
        background-color: white;
    }
    #ad-request, #ad-manager{
        width: 48%;
    }
    #ad-guide{
        width: 100%;
    }
    #ad-request:active,#ad-request:hover{
        background-color: rgb(126, 126, 126);
        transition: 0.3s;
        color: white;
    }
    #ad-manager:active,#ad-manager:hover{
        background-color: rgb(126, 126, 126);
        transition: 0.3s;
        color: white;
    }
    #ad-guide:active,#ad-guide:hover{
        transition: 0.3s;
        background-color: rgb(126, 126, 126);
        color: white;
    }

</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
    <div id="container">
        <br>
        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="/semiTestPrj/views/ad/resources/ad_notice_01.PNG" class="d-block w-100" alt="...">
              </div>
              <div class="carousel-item">
                <img src="/semiTestPrj/views/ad/resources/ad_notice_02.PNG" class="d-block w-100" alt="...">
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
        </div>
        <div id="ad-button-container">
            <button id="ad-request" onclick="location.href='/semiTestPrj/ad/request?p=1'">광고신청</button>
            <button id="ad-manager" onclick="location.href='/semiTestPrj/ad/manager?p=1'">광고관리</button>
        </div>
        
    </div>

</body>
</html>