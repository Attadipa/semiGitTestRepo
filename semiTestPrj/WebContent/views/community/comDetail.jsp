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

    
    table {
        margin-top: 50px;
        width: 100%;
        height: 130px;
        border: 1px solid black;
       
    }
    
    td:not(#url) {
        /* border: 1px solid black; */
        padding-left: 40px;
    }

    #commerce {
        border: 1px solid black;
        width: 100%;
        height: 130px;
        padding-left: 40px;
        padding-top: 40px;
    }

    .detail-footer {
        border: 1px solid black;
        padding-top: 40px;
        padding-left: 40px;
        padding-right: 40px;
    }
    
    #call {
        float: right;
    }
    
    #url {
        padding-left: 50px !important;
        float: right;
        margin-top: 30px;
    }
    
    #comment-write {
        border: 1px solid black;
        width: 99%;
        margin: 0px auto;
        padding-top: 10px;
        padding-left: 40px;
        padding-bottom: 15px;
    }

    #comment-write button {
        float: right;
        margin-right: 20px;
    }

   
</style>
</head>
<body>

    <%@ include file="/views/common/header.jsp"%>

    <div id="outer">


       
        <div class="detail-header">
            <table>
                <tr>
                    <td colspan="5" id="title">제목</td>
                </tr>
                <tr>
                    <td id="writer_chat">작성자<button>1:1 채팅</button></td>
                    <td></td>
                    <td id="date">날짜</td>
                    <td id="hit">조회</td>
                    <td id="url"><button>URL 복사 | 공유하기</button></td>
                </tr>
            </table>
        </div>

        <div id="commerce">광고</div>
        
        <div id="content-area">
            <textarea rows="20" cols="130" style="resize:none;" name="content" id="content" required></textarea>
        </div>

        <div class="detail-footer">
            <span id="comment">댓글 10</span>
            <span id="call"> <button>신고</button></span>

            <hr>

            <div class="comment">
                댓글
                <br>
                <br>

                <div id="user-comments"> 
                    <!-- 보완 -->
                    user1234
                    <br>
                    감사합니다. 좋은 거래였습니다.
                    <br>
                    2022/08/08 11:44 
                    <hr>

                    <br>
                    admin
                    <br>
                    안녕하세요. 반갑습니다. 
                    <br>
                    2022/08/08 13:44
                    <hr>

                    <br>
                    noze
                    <br>
                    아나바다
                    <br>
                    2022/08/08 16:44
                    <br>
                    <br>
                    자바
                    <br>
                    2022/08/08 19:44
                    <hr>
                    
                </div>
                
                <div id="comment-write">
                    <div>이아름</div>
                    <br>
                    <div><textarea rows="5" cols="105" style="resize:none;" name="comment" id="comment" required></textarea></div>
                    <br>
                    <span>사진 | 이모지</span>
                    <span><button>등록</button></span>
                </div>

                <br><br><br><br><br><br><br><br><br><br>

            </div>

            <input type="button" value="글목록" onclick="history.go(-1)">
            <a href="">TOP</a>
        </div>

       
    </div>

    <%@include file="/views/common/footer.jsp" %>

</body>
</html>