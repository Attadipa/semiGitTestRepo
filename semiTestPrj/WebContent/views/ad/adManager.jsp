<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    #container{
        margin: 0 auto;
        width: 600px;
    }

</style>
</head>
<body>
    <div id="container">
        <h1>광고관리</h1>
        <button id="back-button" onclick="history.back">뒤로가기</button>
        <hr>
        <br>
        <table id="ad-list-container">
            <tr id="tr1">
                <td>광고번호</td>
                <td>글번호</td>
                <td>글제목</td>
                <td>광고기간</td>
                <td>상태</td>
            </tr>
            <tr>
                <td>12</td>
                <td>23</td>
                <td>대형건담 180cm</td>
                <td>22/8/9 ~ 22/9/12</td>
                <td>심사중</td>
            </tr>
            <tr>
                <td>12</td>
                <td>23</td>
                <td>대형건담 180cm</td>
                <td>22/8/9 ~ 22/9/12</td>
                <td>심사중</td>
            </tr>
            <tr>
                <td>12</td>
                <td>23</td>
                <td>대형건담 180cm</td>
                <td>22/8/9 ~ 22/9/12</td>
                <td>심사중</td>
            </tr>
        </table>
    </div>
</body>
</html>