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

</style>
</head>
<body>
	
    
    <div id="outer">

        <%@ include file="/views/common/header.jsp"%>

        <h1>글쓰기(공지사항 작성하기)</h1>

        <hr>

        <form action="semiTestPrj/notice/insert" method="post">
            <input type="hidden" name="writerNo" value="<%-- <%=loginMember.getNo()%> --%>">
            
            
            <div id="section">
                <input type="text" size="120" name="title" id="title" placeholder="제목을 입력해주세요." required>
                <br>
                <br>
                <textarea rows="15" cols="130" style="resize:none;" name="content" id="content" placeholder="내용을 입력하세요." required></textarea>
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