<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>FAQ 상세확인</title>
    <style>
        .cs-detail-outer{
            color: darkgreen;
            width: 90%;
            height: 500px;
            margin: auto;
            padding-top: 50px;
        }
        
        #table-cs-detail{
        	font-size: 20px;
            border: 1px solid green;
            background-image: linear-gradient(to right, rgb(86, 228, 105), white);
        }
    </style>
</head>
<body>
    
    <%@ include file="/views/common/header.jsp" %>

    <div class="cs-detail-outer" align="center">
    <%@ include file="/views/cs/common/csHeader.jsp"%>

        
        <br>

        <table id="table-cs-detail" class="table-bordered">
            <tr>
                <th width="100px">제목</th>
                <td colspan="3" width="1200px">판매 금지 물품은 어떤 것이 있나요?</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>admin</td>
                <th>작성일</th>
                <td>20220809</td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3">
                    <pre style="height: auto;">
가품, 이미테이션
주류
경유 등
                    </pre>
                </td>
            </tr>

        </table>

        <br><br>

        <div>
            <a href="/views/notice/list" class="btn btn-sm btn-success">목록이동</a>

            <!-- 현재 로그인한 사용자가 관리자일 경우 -->
            <a href="" class="btn btn-sm btn-success">수정하기</a>
            <a href="/views/notice/delete?num=3" class="btn btn-sm btn-success">삭제하기</a>
        </div>

        
    </div>


</body>
</html>