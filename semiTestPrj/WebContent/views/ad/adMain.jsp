<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
    #ad-request:active{
        background-color: rgb(255, 147, 147);
        color: white;
    }
    #ad-manager:active{
        background-color: rgb(185, 255, 145);
        color: white;
    }
    #ad-guide:active{
        background-color: rgb(255, 238, 52);
        color: white;
    }

</style>
</head>
<body>

    <div id="container">
        <br>
        <h1>판매자센터</h1>
        <hr>
        <br>
        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="/semiTestPrj/views/ad/resources/tesla01.jpg" class="d-block w-100" alt="...">
              </div>
              <div class="carousel-item">
                <img src="/semiTestPrj/views/ad/resources/tesla02.jpg" class="d-block w-100" alt="...">
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
            <button id="ad-request" onclick="location.href='/semiTestPrj/ad/request'">광고신청</button>
            <button id="ad-manager" onclick="location.href='/semiTestPrj/ad/manager'">광고관리</button>
            <button id="ad-guide" onclick="location.href=''">광고가이드</button>
        </div>
        
    </div>

</body>
</html>