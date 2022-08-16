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
            height: 40%;
        }
        #footer-inner2{
            height: 60%;
            display: flex;
            flex-direction: row;
            padding-left: 30px;
        }

        #footer-inner1{
            padding-left: 30px;
            padding-top: 10px;
        }
        #footer-inner1 p{
            color: darkgrey;
            font-size: 15px;
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
            <strong>COPYRIGHT (C) ANBD ALL RIGHTS RESERVED.</strong>
            <br>
            <br>
            <p>
                아나바다닷컴 내 커뮤니티, 공지사항, 거래게시판 등 아나바다 자체 생성 콘텐츠는 아나바다닷컴 및 아나바다 계약업체에 저작권이 있습니다.
                <br>
                이러한 콘텐츠는 출처를 밝히고 (아나바다닷컴 표기 및 www.anbd.com 링크 포함 필수) 비상업적인 용도에서만 활용하실 수 있습니다.
                <br>
                <br>
                커뮤니티 및 중고장터, 댓글 등 아나바다 회원이 올린 이미지가 저작권에 위배될 경우 <strong>신고</strong> 하시면 검토 후 삭제하겠습니다.
            </p>
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
                    <li>운영시간 9시-18시</li>
                    <li>(주말/공휴일 휴무,점심시간 12-13시)</li>
                </ul>
            </div>
        </div>
        <hr>
    </footer>

</body>
</html>