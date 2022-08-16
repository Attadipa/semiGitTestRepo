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

    
    #table-main {
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
        margin: auto;
        padding-top: 10px;
        padding-left: 40px;
    }

    #comment-write button {
        margin-left: 90%;
        margin-top: -60px;
    }

    .btn-group {
        margin-bottom: 10px;
        padding-left: 75px;
    }

    th, td {
        padding-left: 15px;
    }

    #user-comments button {
        border: 0;
        outline: 0;
    }

    .btn-danger {
        margin-top: -10px;
    }
  
   
</style>
</head>
<body>

    
        <%@ include file="/views/common/header.jsp"%>


    <div id="outer">
       
        <div class="detail-header">

            <table id="table-main">
                <tr>
                    <th>제목</th>
                    <td colspan="3">ddd</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>(작성자)</td>
                    <th></th>
                    <td>
                        <button class="btn btn-dark">1:1 채팅</button>
                        <th></th>
                        <td>
                            <th>작성일</th>
                            <td>(작성날짜)</td>
                            <td colspan="2"></td>
                            <th>조회수</th>
                            <td>(조회수)</td>
                            <!-- <td><button class="btn btn-success">URL 복사 | 공유하기</button></td> -->
                            <td><a href="" class="btn btn-success" onclick="clip(); return false;">URL 복사 | 공유</a><td>
                        </td>
                    </td>
                </tr>
            </table>

        </div>

        <div id="commerce">
            (광고)
            📲 아나바다 앱이 있다는 걸 알고 계시나요? ▶ https://vvd.bz/bmbR <br>
            🚨 아나바다 사기 통합 조회 → https://vvd.bz/PNt <br>
            🎁 카페>앱 실시간 연동했을 뿐인데, 상품권이?! ▶ https://vvd.bz/bsVH <br>
            ---------------------------------- <br>
            필독! 아나바다 신고해 주세요!! <br>
            💬 실시간 사기 제보 → https://vvd.bz/PS2 <br>
            💬 이용제재/불법거래 신고 → https://vvd.bz/WZ9 <br><br>
        </div>
        
        <div id="content-area">
            <textarea rows="20" cols="130" style="resize:none;" name="content" id="content" required>(내용)</textarea>
        </div>

        <div class="detail-footer">
            <span id="comment">댓글 (댓글 개수)</span>
            <span id="call"> <button class="btn btn-danger">신고</button></span>

            <hr>

            <div class="comment">
    
                <div id="user-comments"> 
                   <table>
                    <!-- 댓글 작성하면 자동으로 td추가 -->
                        <td>
                            <tr>(작성자) <br><br></tr>
                            <tr>감사합니다. 좋은 거래였습니다.<br></tr>
                            <tr>2022/08/08 11:44 <br><br>
                            <tr><button onclick="reply()">답글쓰기</button><br><br></tr>
                            <div id="reply-write"></div>
                            <hr>
                        </td>

                        <td>
                            <tr>(작성자) <br><br></tr>
                            <tr>아나바다 안녕하세요<br></tr>
                            <tr>2022/08/08 11:44 <br><br>
                            <tr><button onclick="reply2()">답글쓰기</button><br><br></tr>
                            <div id="reply-write2"></div>
                            <hr>
                        </td>

                       
                   </table>
                </div>

                
                <div id="comment-write">
                    <div>(작성자)</div>
                    <br>
                    <div><textarea rows="5" cols="105" style="resize:none;" name="comment" id="comment" required></textarea></div>
                    <br>
                    <!-- 사진 | 이모지 -->
                    <span><input type="file"> | 이모티콘</span>
                    <button class="btn btn-success">등록</button>
                </div>

                <br>

            </div>

           <div class="btn-group btn-group-sm" style=" margin-left: 80%;">
                <input type="button" class="btn btn-success" value="글목록" onclick="history.go(-1)">
                <!-- <a href="" class="btn btn-success">TOP</a> -->
                <input type="button" class="btn btn-success" value="TOP" onclick="location.href='comDetail.jsp'">
           </div>
        </div>

       
    </div>




    <%@include file="/views/common/footer.jsp" %>

    <script>
        function reply(){
            const reply = document.getElementById('reply-write');
            
            reply.innerHTML
                ='<hr><div style=" border: 1px solid black; width: 95%; margin: 0px auto; padding-top: 10px; padding-left: 40px; padding-bottom: 15px;"><div>(작성자)</div><br><div><textarea rows="5" cols="100" style="resize:none;" name="comment" id="comment" required></textarea></div><br><span>사진 | 이모지</span><button class="btn btn-success" style="margin-left: 80%;">등록</button></div>'
                   
        }

        function reply2(){
            const reply = document.getElementById('reply-write2');
            
            reply.innerHTML
                ='<hr><div style=" border: 1px solid black; width: 95%; margin: 0px auto; padding-top: 10px; padding-left: 40px; padding-bottom: 15px;"><div>(작성자)</div><br><div><textarea rows="5" cols="100" style="resize:none;" name="comment" id="comment" required></textarea></div><br><span>사진 | 이모지</span><button class="btn btn-success" style="margin-left: 80%;">등록</button></div>'
                   
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
       
    </script>

    

</body>
</html>