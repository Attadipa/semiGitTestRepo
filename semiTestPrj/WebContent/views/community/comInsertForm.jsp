<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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

    .category{
    position: relative;
    width: 150px;
    height: 40px;
    border: 2px solid darkgray;
    }

    .category .category-select {
    width: inherit;
    height: inherit;
    background: transparent;
    border: 0 none;
    outline: 0 none;
    font-family: 'IBM Plex Sans KR', sans-serif;
    font-weight: 400;
    }
    
    .category .category-select option {
    background: whitesmoke;
    padding: 2px;
    font-size: 13px;
    }

    #list {
        float: right;
    }

    #submit {
        float: right;
        margin-top: -70px;
    }
</style>
<body>
    
    <%@ include file="/views/common/header.jsp"%>

	<div id="outer">


        <h1>글쓰기(커뮤니티 글 작성하기)</h1>
        <input type="submit" id="submit" class="btn btn-success" value="등록">

        <hr>

        <form action="semiTestPrj/notice/insert" method="post">
            <input type="hidden" name="writerNo" value="<%-- <%=loginMember.getNo()%> --%>">
            

            <div id="section">

                <div class="category">
                    <select name="category-select" class="category-select">
                        <option value="free">자유게시판</option>
                        <option value="compliment">칭찬해요</option>
                        <option value="caution">주의해요</option>
                        <option value="chat">수다방</option>
                    </select>
                </div>
                
                <br>
                <input type="text" size="120" name="title" id="title" placeholder=" 제목을 입력해주세요." required>
                <br>
                <br>
                <textarea rows="15" cols="130" style="resize:none;" name="content" id="content" placeholder=" 내용을 입력하세요." required></textarea>
            </div>

        </form>
        
        <input type="button" id="list" class="btn btn-success" value="목록" onclick="history.go(-1)">
            <!--  form 태그 안에 만든 button은 제출 버튼이 된다. (즉, submit 역할이 된다)
            이 문제를 수정해주려면 input type = "button"으로 해주면 된다.
            -->
    </div>

    <%@include file="/views/common/footer.jsp" %>

</body>
</html>