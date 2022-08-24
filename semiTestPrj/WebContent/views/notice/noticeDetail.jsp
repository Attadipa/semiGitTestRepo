<%@page import="com.kh.notice.vo.NoticeVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	NoticeVo vo = (NoticeVo) request.getAttribute("vo");
    %>
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

    
    #table-main {
        margin-top: 30px;
        width: 100%;
        height: 130px;
        border: 1px solid grey;
       
    }
    
    td:not(#url) {
        padding-left: 40px;
    }

    #commerce {
        border: 2px solid grey;
        width: 100%;
        height: max-content;
        padding-left: 35px;
        padding-top: 40px;
    }

    .detail-footer {
        border: 2px solid grey;
        padding-top: 40px;
        padding-left: 40px;
        padding-right: 40px;
        margin-top: 10px;
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
        border: 1px solid grey;
        width: 99%;
        margin: auto;
        padding-top: 10px;
        padding-left: 40px;
        margin-bottom: 10px;
    }
    
    #content {
        border: 2px solid grey;
        width: 100%;
        height: fit-content;
        min-height: 500px;
        padding: 35px;
        padding-bottom: 100px;
        margin-top: -25px;

    }

    #comment-write button {
        margin-left: 92%;
        margin-top: -30px;
    }

    .list-top {
        margin-bottom: 10px;
        margin-top: 10px;
        padding-left: 60px;
    }

    th, td {
        padding-left: 35px;
        padding-top: 10px;
    }

    #user-comments button {
        border: 0;
        outline: 0;
    }

    #call .btn-light {
        margin-top: -5px;
    }

    pre {
        height: max-content;
    }

  

  
   
</style>
</head>
<body>

    
        <%@ include file="/views/common/header.jsp"%>


    <div id="outer">
       
        <div class="detail-header">

            	<%if(loginMember != null && vo.getWriter().equals(loginMember.getMemberName())){ %>
                <div>
                    <button class="btn btn-light" onclick="location.href='/semiTestPrj/notice/edit?num=<%=vo.getNo()%>'">수정</button>
                    <button class="btn btn-light" onclick="location.href='/semiTestPrj/notice/delete?num=<%=vo.getNo()%>'">삭제</button>
                    <button class="btn btn-light" onclick="location.href='/semiTestPrj/notice/list?p=1'">글목록</button>
                </div>
                <%} else {%>
                <div>
                    <button class="btn btn-light" onclick="history.go(-1)">글목록</button>
                </div>
                <%} %> 


            <table id="table-main">
                <tr>
                    <th>제목</th>
                    <td colspan="3"><%=vo.getTitle() %></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td><%=vo.getWriter() %> <button class="btn btn-light">1:1 채팅</button></td>
                    <th>작성일</th>
                    <td><%=vo.getEnrollDate()%></td>
                    <th>조회수</th>
                    <td><%=vo.getCnt()%></td>
                    <td><button class="btn btn-light" onclick="clip(); return false;">URL 복사 | 공유</button><td>
                </tr>
            </table>
        </div>


        <div id="commerce">
            (광고)<br>
            📲 아나바다 앱이 있다는 걸 알고 계시나요? ▶ https://vvd.bz/bmbR <br>
            🚨 아나바다 사기 통합 조회 → https://vvd.bz/PNt <br>
            🎁 카페>앱 실시간 연동했을 뿐인데, 상품권이?! ▶ https://vvd.bz/bsVH <br>
            ---------------------------------- <br>
            필독! 아나바다 신고해 주세요!! <br>
            💬 실시간 사기 제보 → https://vvd.bz/PS2 <br>
            💬 이용제재/불법거래 신고 → https://vvd.bz/WZ9 <br><br>
        </div>
        

        <div id="content-area">
        	<img alt="" src="">
            <div name="content" id="content"><pre><%=vo.getContent()%></pre></div>
        </div>


        <div class="detail-footer">
            <span id="comment" style="font-size: 20px;">댓글</span>
            <span id="call"> <button class="btn btn-light">신고</button></span><hr>


            <!-- 댓글 작성시 반복문 -->
            <div class="comment">
                <div id="user-comments"> 
                
                   <table>
                        <td>
                            <tr>${cvo.getTitle()}<br><br></tr>
                            <tr>감사합니다. 좋은 거래였습니다.<br></tr>
                            <tr>2022/08/08 11:44 <br><br>
                            <tr><button onclick="reply()">답글쓰기</button><br><br></tr>
                            <div id="reply-write"></div>
                            <hr>
                        </td>
                   </table> 
                </div>

                <div id="comment-write">
                    <div>(작성자)</div><br>
                    <div><textarea rows="5" cols="105" style="resize:none;" name="comment" id="comment" required></textarea></div><br>
                    <button class="btn btn-success" id="addComment" onclick="location.href='/semiTestPrj/comment/insert'">등록</button><br>
                </div>
            </div>



        </div>
        
        <div class="list-top" style=" margin-left: 80%;">
            <input type="button" class="btn btn-light" value="글목록" onclick="location.href='/semiTestPrj/notice/list?p=1'">
            <input type="button" class="btn btn-light" value="TOP" onclick="window.scrollTo(0,0);">
        </div>
       
    </div>




    <%@include file="/views/common/footer.jsp" %>

    <script>
        function reply(){
            const reply = document.getElementById('reply-write');
            
            reply.innerHTML
                ='<hr><div style=" border: 1px solid black; width: 95%; margin: 0px auto; padding-top: 10px;  margin-bottom: 10px; padding-left: 40px; padding-bottom: 15px;"><div>(작성자)</div><br><div><textarea rows="5" cols="100" style="resize:none;" name="comment" id="comment" required></textarea></div><br><button class="btn btn-success" style="margin-left: 80%;">등록</button></div>'
                   
        }

        function reply2(){
            const reply = document.getElementById('reply-write2');
            
            reply.innerHTML
                ='<hr><div style=" border: 1px solid black; width: 95%; margin: 0px auto; padding-top: 10px;  margin-bottom: 10px; padding-left: 40px; padding-bottom: 15px;"><div>(작성자)</div><br><div><textarea rows="5" cols="100" style="resize:none;" name="comment" id="comment" required></textarea></div><br><button class="btn btn-success" style="margin-left: 80%;">등록</button></div>'
                   
        }

       
        function clip(){
            var url = '';   
            var textarea = document.createElement("textarea");  
        
            document.body.appendChild(textarea);
            url = window.document.location.href;  
            textarea.value = url;
            textarea.select(); 
            document.execCommand("copy");  
            document.body.removeChild(textarea);

            alert("URL이 복사되었습니다.");
        }
       

       <%--  $('#addComment').click(function(){
            $.ajax({
                url : "/semiTestPrj/comment/insert"
                , method : "GET"
                , data : {
                	   , postNo :<%=vo.getNo()%>
                	   , memberNo :<%=loginMember.getMemberNo()%>
                	   , content :<%=vo.getContent()%>
                    } 
                , success : function(x){
                    console.log("통신성공");
                    alert(x);
                }
                , error : function(e){
                    console.log("통신실패");
                    console.log(e);
                }
            });
        });  --%>
    </script>

    

</body>
</html>