<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    h1{
        display: inline;
    }
    #back-button{
        float: right;
        width: 100px;
        height: 30px;
        font-size: 17px;
        margin-top: 10px;
    }
    table{
        width: 100%;
        text-align: center;
    }
    table, tr, td{
        border: 1px solid black;
        border-collapse: collapse;
    }
    #tr1{
        font-size: 17px;
        font-weight: bold;
    }

</style>
</head>
<body>
    <div id="container">
        <h1>광고신청</h1>
        <button id="back-button" onclick="history.back">뒤로가기</button>
        <hr>
        <br>
        <table id="ad-list-container">
            <tr id="tr1">
                <td><img src="" alt="썸네일"></td>
                <td>글번호</td>
                <td>글제목</td>
                <td></td>
            </tr>
            <tr>
                <td><img src="" alt="썸네일"></td>
                <td>23</td>
                <td>대형건담 180cm</td>
                <td><button>광고신청</button></td>
            </tr>
            <tr>
                <td><img src="" alt="썸네일"></td>
                <td>23</td>
                <td>대형건담 180cm</td>
                <td><button>광고신청</button></td>
            </tr>
            <tr>
                <td><img src="" alt="썸네일"></td>
                <td>23</td>
                <td>대형건담 180cm</td>
                <td><button>광고신청</button></td>
            </tr>
        </table>
    </div>
</body>
</html>