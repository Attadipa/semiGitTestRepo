<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #outer{
        width: 65%;
        margin: 0px auto;
        margin-bottom: 5%;
        margin-top: 5%;
    }

    #outer h1{
        padding-top: 50px;
        padding-bottom: 30px;
    }
    #section{
        width: 100%;
        height: 60%;
        
    }
    #section *{
        width: 100%;
    }
    #div-btn-area{
        width: 25%;
        margin: auto;
        margin-top: 30px;
    }

    hr{
        height: 2px !important;
        background: black !important;
    }
    .category-select, #title {
        height: 35px;
    }

    #list {
        float: right;
    }

    #submit {
        float: right;
        margin-top: 60px;
    }

    h1 {
        display: inline-block;
        padding-bottom: 0px;
    }

</style>
</head>
<body>
	
    <%@ include file="/views/common/header.jsp"%>
    
    <div id="outer">


        <h1>글쓰기(공지사항 작성하기)</h1>
        <input type="submit" id="submit" class="btn btn-success" value="등록"> <!--<button value="등록하기"></button>-->
        
        <hr>

        <form action="semiTestPrj/notice/insert" method="post">
            <input type="hidden" name="writerNo" value="<%-- <%=loginMember.getNo()%> --%>">
            
            
            <div id="section">
                <input type="text" size="120" name="title" id="title" placeholder=" 제목을 입력해주세요." required>
                <br>
                <br>
                <textarea rows="15" cols="130" style="resize:none;" name="content" id="content" placeholder=" 내용을 입력하세요." required></textarea>
            </div>
            
        </form>
        
        <input type="button" id="list" class="btn btn-success" value="목록" onclick="history.go(-1)">

    </div>

    <%@include file="/views/common/footer.jsp" %>

</body>
</html>