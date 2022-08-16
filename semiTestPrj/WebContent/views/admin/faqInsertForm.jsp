<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 작성</title>
<style>

    #faq-outer{
        color: black;
        width: 60%;
        height: 70vh;
        margin: auto;
    }

    #faq-outer h1{
        padding-top: 50px;
    }

    #section{
        width: 90%;
        height: 60%;
        margin: auto;
    }

    #section *{
        width: 100%;
    }

    #div-btn-area{
        width: 50%;
        text-align: center;
        margin: auto;
        margin-top: 30px;
    }

</style>
</head>
<body>
	
    <div id="faq-outer">
        <br><br>
        <form action="/views/faq/insert" method="post">
            <input type="hidden" name="writerNo" value="1">
            <div id="section">
                제목 <input type="text" size="120" name="title" required>
                <br>
                내용 
                <br>
                <textarea rows="10" cols="130" style="resize:none;" name="content" required></textarea>
            </div>

            <div id="div-btn-area">
                <input type="submit" value="등록하기">
                <input type="reset" value="초기화">
                <input type="button" value="뒤로가기" onclick="history.go(-1)">
            </div>

        </form>

    </div>

</body>
</html>