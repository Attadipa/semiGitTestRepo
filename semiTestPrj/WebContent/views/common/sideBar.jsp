<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <%-- 부트스트랩 --%>
        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        
        <style>
			.sidebar-list>a{text-decoration: none; color: black;}
            #btn-sidebar{
                width: 50px;
                height: 50px;
                /* background-color: black; */
                color: white;
                box-sizing: border-box;
            }
            #sidebar{
                margin-left: -150px;
                width: 150px;
                height: 300px;
                box-sizing: border-box;
                transition: 1s;
                background-color: white;
            }
            .sidebar-list{
                height: 50px;
                box-sizing: border-box;
                width: 150px;
                font-size: 20px;
                text-align: center;
                line-height: 45px;
                font-weight: 900;
            }

            /* 사이드바 버튼에 대한 CSS */
            .container {
            display: inline-block;
            cursor: pointer;
            }

            .bar1, .bar2, .bar3 {
            width: 35px;
            height: 5px;
            background-color: #333;
            margin: 6px 0;
            transition: 0.4s;
            }

            .change .bar1 {
            -webkit-transform: rotate(-45deg) translate(-9px, 6px);
            transform: rotate(-45deg) translate(-9px, 6px);
            }

            .change .bar2 {opacity: 0;}

            .change .bar3 {
            -webkit-transform: rotate(45deg) translate(-8px, -8px);
            transform: rotate(45deg) translate(-8px, -8px);
            }

            .change-sidebar{
                margin-left: 0px !important;
                transition: 0.5s;
            }
            
            .sidebar-list:hover{
                background-color: black;
                color: white !important;
                transition: 0.2s;
                cursor: pointer;
            }
            .sidebar-list:hover>a{color: white !important; transition: 0.2s;}

            /*쇼핑하기 선택시 나올 리스트에 관한 CSS*/
            #shopping-list{
                height: 500px;
                width: 150px;
                list-style: none;
                padding-left: 0;
                margin-left: 150px;
                margin-top: -250px;
            }
            #shopping-list li{
                height: 50px;
                background-color: white;
                color: black;
                font-weight: 900;
                text-align: center;
                line-height: 45px;
            }
            #shopping-list li:hover{
                background-color: black;
                color: white;
                transition: 0.2s;
                cursor: pointer;
            }
            #shopping-list li>a{
                text-decoration: none;
                display: block;
                color: black;
                width: 100%;
                height: 100%;
            }
            #shopping-list li:hover>a{
                color: white !important;
                transition : 0.2s;
            }
            

            /*감추기*/
            #shopping-list{width: 0px; transition: 0.2s;}
            #shopping-list li{font-size: 0px; transition: 0.1s;}
            /*보여주기*/
            .show-list{width: 150px !important; transition: 0.2s;}
            .show-list li{font-size: 18px !important; transition: 0.2s;}


        </style>

    </head>
    <body>
    
        <div id="btn-sidebar" class="container" onclick="myFunction(this)">
            <div class="bar1"></div>
            <div class="bar2"></div>
            <div class="bar3"></div>
        </div>
        <div id="sidebar">
            <div class="sidebar-list" id="shopping">쇼핑하기</div>
            <div class="sidebar-list"><a href="${contextPath}/notice/list?p=1">공지사항</a></div>
            <div class="sidebar-list"><a href="${contextPath}/community/list?p=1">커뮤니티</a></div>
            <div class="sidebar-list"><a href="${contextPath}/ad/main">판매자센터</a></div>
            <div class="sidebar-list"><a href="${contextPath}/event/member">이벤트</a></div>
            <div class="sidebar-list"><a href="${contextPath}/cs/search">고객센터</a></div>
            <ul id="shopping-list">
                <li class="search-category"><a href="${contextPath}/search/category?c=1&p=1">패션</a></li>
                <li class="search-category"><a href="${contextPath}/search/category?c=2&p=1">럭셔리</a></li>
                <li class="search-category"><a href="${contextPath}/search/category?c=3&p=1">신발</a></li>
                <li class="search-category"><a href="${contextPath}/search/category?c=4&p=1">도서/음반</a></li>
                <li class="search-category"><a href="${contextPath}/search/category?c=5&p=1">캠핑</a></li>
                <li class="search-category"><a href="${contextPath}/search/category?c=6&p=1">기타</a></li>
            </ul>
        </div>
        
        
    
        <script>
            const sidebar = document.getElementById('sidebar');
            function myFunction(x) {
                x.classList.toggle("change");
                sidebar.classList.toggle('change-sidebar');
            }

            const shopping = document.getElementById('shopping');
            const shoppingList = document.getElementById('shopping-list');
            shopping.addEventListener('click',function(){
                shoppingList.classList.toggle('show-list');
            })
            shoppingList.addEventListener('mouseleave',function(){
                shoppingList.removeAttribute('class');
            })
            
        </script>
            
    
    </body>
</html>