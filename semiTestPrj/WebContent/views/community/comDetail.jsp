<%@page import="com.kh.community.vo.AttachmentComVo"%>
<%@page import="com.kh.community.vo.CommunityVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	CommunityVo vo = (CommunityVo) request.getAttribute("vo");
    	/* AttachmentComVo att = (AttachmentComVo) request.getAttribute("att"); */
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
        /* max-height: 500px; */
        padding: 30px;
        padding-bottom: 100px;

    }

    #comment-write button {
        margin-left: 90%;
        margin-top: -60px;
        border: none;
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
  		height: fit-content;
  	}

    #image {
        background-size: fit-content;
    }
   
</style>
</head>
<body>

    
        <%@ include file="/views/common/header.jsp"%>


    <div id="outer">
       
        <div class="detail-header">

            	<%if(loginMember != null && vo.getWriter().equals(loginMember.getMemberName())){ %>
                <div>
                    <button class="btn btn-outline-dark btn-sm" onclick="location.href='/semiTestPrj/community/edit?num=<%=vo.getNo()%>'">수정</button>
                    <button class="btn btn-outline-primary btn-sm" onclick="location.href='/semiTestPrj/community/delete?num=<%=vo.getNo()%>'">삭제</button>
                    <button class="btn btn-outline-success btn-sm" onclick="location.href='/semiTestPrj/community/list?p=1'">글목록</button>
                </div>
                <%} else {%>
                <div>
                    <button class="btn btn-outline-success btn-sm" onclick="history.go(-1)">글목록</button>
                </div>
                <%} %> 


            <table id="table-main">
                <tr>
                    <th>제목</th>
                    <td colspan="3"><%=vo.getTitle() %></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td><%=vo.getWriter() %></td>
                    <th>작성일</th>
                    <td><%=vo.getEnrollDate()%></td>
                    <th>조회수</th>
                    <td><%=vo.getCnt()%></td>
                    <td>
                    <button class="btn btn-outline-success btn-sm" onclick="clip(); return false;">URL 복사 | 공유</button>
                    <input data-bs-toggle="modal" data-bs-target="#banModal" class="btn btn-outline-danger btn-sm" type="button" value="신고하기">
                    </td>
                    
                </tr>
            </table>
        </div>


        <div id="commerce">
            
            📲 아나바다 앱이 있다는 걸 알고 계시나요? ▶ https://vvd.bz/bmbR <br>
            🚨 아나바다 사기 통합 조회 → https://vvd.bz/PNt <br>
            🎁 카페>앱 실시간 연동했을 뿐인데, 상품권이?! ▶ https://vvd.bz/bsVH <br>
            ---------------------------------- <br>
            필독! 아나바다 신고해 주세요!! <br>
            💬 실시간 사기 제보 → https://vvd.bz/PS2 <br>
            💬 이용제재/불법거래 신고 → https://vvd.bz/WZ9 <br><br>
        </div>
        
	

        <div name="content" id="content">
            <div id="image"><img src="${att.getFilePath()}" style="width: 65%"></div>
            <%=vo.getContent()%>
        </div>


        <div class="detail-footer">
            <span id="comment" style="font-size: 20px;">댓글</span><hr>


            <div class="comment">
                <div id="user-comments"> 
                   <table>
                        <td>
                            <tr>서플미<br><br></tr>
                            <tr>감사합니다. 좋은 거래였습니다.<br></tr>
                            <tr>2022/08/08 11:44 <br><br>
                            <tr><button onclick="reply()" class="btn btn-outline-dark btn-sm">답글쓰기</button><br><br></tr>
                            <div id="reply-write"></div>
                            <hr>
                        </td>

                        <td>
                            <tr>이관리<br><br></tr>
                            <tr>아나바다 안녕하세요<br></tr>
                            <tr>2022/08/08 11:44 <br><br>
                            <tr><button onclick="reply2()" class="btn btn-outline-dark btn-sm">답글쓰기</button><br><br></tr>
                            <div id="reply-write2"></div>
                            <hr>
                        </td>
                   </table>
                </div>

                
                <div id="comment-write">
                    <div><%=loginMember.getMemberName() %></div><br>
                    <div><textarea rows="5" cols="105" style="resize:none;" name="comment" id="comment" required></textarea></div><br>
                    <!-- 사진 | 이모지 -->
                    <span><input type="file"></span>
                    <button class="btn btn-outline-success btn-sm">등록</button>
                </div><br>
            </div>

        </div>
        
        <div class="list-top" style=" margin-left: 80%;">
             <input type="button" class="btn btn-outline-success btn-sm" value="글목록" onclick="location.href='/semiTestPrj/community/list?p=1'">
             <input type="button" class="btn btn-outline-success btn-sm" value="TOP" onclick="window.scrollTo(0,0);">
        </div>
       
    </div>




    <%@include file="/views/common/footer.jsp" %>

     <!-- 신고하기 모달 -->
	<div class="modal" id="banModal">
        <div class="modal-dialog">
          <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">신고하기</h4>
              <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
      
            <!-- Modal body -->
            <div class="modal-body">
              해당 판매자를 신고하시겠습니까?
              <select>
                  <option value="사기">사기</option>
                  <option value="도용">도용</option>
                  <option value="거짓 판매">거짓 판매</option>
                  <option value="비매너">비매너</option>
              </select>
            </div>
      
            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="button" id="banClick" class="btn btn-danger" data-bs-dismiss="modal">신고</button>
            </div>
      
          </div>
        </div>
      </div>
    <script type="text/javascript">
        $('#banClick').click(function(){
            alert("신고 접수가 완료되었습니다.");
        });
    </script>

    <script>
        function reply(){
            const reply = document.getElementById('reply-write');
            
            reply.innerHTML
                ='<hr><div style=" border: 1px solid black; width: 95%; margin: 0px auto; padding-top: 10px;  margin-bottom: 10px; padding-left: 40px; padding-bottom: 15px;"><div><%=loginMember.getMemberName() %></div><br><div><textarea rows="5" cols="100" style="resize:none;" name="comment" id="comment" required></textarea></div><br><button class="btn btn-outline-success btn-sm" style="margin-left: 90%;">등록</button></div>'
                   
        }

        function reply2(){
            const reply = document.getElementById('reply-write2');
            
            reply.innerHTML
                ='<hr><div style=" border: 1px solid black; width: 95%; margin: 0px auto; padding-top: 10px;  margin-bottom: 10px; padding-left: 40px; padding-bottom: 15px;"><div><%=loginMember.getMemberName() %></div><br><div><textarea rows="5" cols="100" style="resize:none;" name="comment" id="comment" required></textarea></div><br><button class="btn btn-outline-success btn-sm" style="margin-left: 90%;">등록</button></div>'
                   
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