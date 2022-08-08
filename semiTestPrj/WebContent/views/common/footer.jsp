<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        footer{
            width: 100%;
            height: 400px;
        }
        footer hr{
            margin: 0;
            padding: 0;
        }
        .footer-inner{
            width: 100%;
            /* border: 1px solid blue; 추후 삭제 */
        }
        .footer-inner>div{
            box-sizing: border-box;
            /* border: 1px solid blue; 추후 삭제 */
        }
        #footer-inner1{
            height: 30%;
            display: flex;
        }
        #footer-inner2{
            height: 40%;
            display: flex;
            flex-direction: row;
            justify-content: space-around;
        }
        #footer-inner3{
            height: 30%;
            display: flex;
        }

        #footer-inner1 div{
            width: 50%;
            height: 100%;
            display: flex;
        }
        #footer-inner2>div{
            height: 100%;
            display: flex;
        }
        .footer-menu-area{
            padding-left: 20px;
            padding-top: 20px;
            display: flex;
            flex-direction: column;
            width: 20%;
        }
        #footer-inner2 ul{
            list-style: none;
            padding: 0;
            padding-top: 5px;
            text-decoration: none;
            color: darkgrey;
        }
        #footer-inner2 ul>li>a{
            text-decoration: none;
            color: darkgrey;
        }
        

    </style>
</head>
<body>

	<footer>
        <hr>
        <div class="footer-inner" id="footer-inner1">
            <div id="footer-img-area1"></div>
            <div id="footer-img-area2"></div>
        </div>
        <hr>
        <div class="footer-inner" id="footer-inner2">
            <div class="footer-menu-area">
                <strong>이용안내</strong>
                <ul>
                    <li><a href="">이용정책</a></li>
                    <li><a href="">패널티 정책</a></li>
                    <li><a href="">커뮤니티 가이드라인</a></li>
                </ul>
            </div>
            <div class="footer-menu-area">
                <strong>고객지원</strong>
                <ul>
                    <li><a href="">공지사항</a></li>
                    <li><a href="">서비스 소개</a></li>
                    <li><a href="">사업자 정보</a></li>
                    <li><a href="">판매자 접수</a></li>
                </ul>
            </div>
            <div class="footer-menu-area">
                <strong>고객센터 1234-1234</strong>
                <ul>
                    <li>운영시간 9시-18시(주말/공휴일 휴무,점심시간 12-13시)</li>
                    <li>Ⓒ anbdcoperation. Inc All rights reserved.</li>
                </ul>
            </div>
        </div>
        <hr>
        <div class="footer-inner" id="footer-inner3">
            <div id="footer-inner3-area1">
            </div>
            <div id="footer-inner3-area2"></div>
        </div>
    </footer>

</body>
</html>