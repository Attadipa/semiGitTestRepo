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
                    <button class="btn btn-outline-dark btn-sm" onclick="location.href='/semiTestPrj/community/edit?num=<%=vo.getNo()%>'">??????</button>
                    <button class="btn btn-outline-primary btn-sm" onclick="location.href='/semiTestPrj/community/delete?num=<%=vo.getNo()%>'">??????</button>
                    <button class="btn btn-outline-success btn-sm" onclick="location.href='/semiTestPrj/community/list?p=1'">?????????</button>
                </div>
                <%} else {%>
                <div>
                    <button class="btn btn-outline-success btn-sm" onclick="history.go(-1)">?????????</button>
                </div>
                <%} %> 


            <table id="table-main">
                <tr>
                    <th>??????</th>
                    <td colspan="3"><%=vo.getTitle() %></td>
                </tr>
                <tr>
                    <th>?????????</th>
                    <td><%=vo.getWriter() %></td>
                    <th>?????????</th>
                    <td><%=vo.getEnrollDate()%></td>
                    <th>?????????</th>
                    <td><%=vo.getCnt()%></td>
                    <td>
                    <button class="btn btn-outline-success btn-sm" onclick="clip(); return false;">URL ?????? | ??????</button>
                    <input data-bs-toggle="modal" data-bs-target="#banModal" class="btn btn-outline-danger btn-sm" type="button" value="????????????">
                    </td>
                    
                </tr>
            </table>
        </div>


        <div id="commerce">
            
            ???? ???????????? ?????? ????????? ??? ?????? ????????????? ??? https://vvd.bz/bmbR <br>
            ???? ???????????? ?????? ?????? ?????? ??? https://vvd.bz/PNt <br>
            ???? ??????>??? ????????? ???????????? ?????????, ?????????????! ??? https://vvd.bz/bsVH <br>
            ---------------------------------- <br>
            ??????! ???????????? ????????? ?????????!! <br>
            ???? ????????? ?????? ?????? ??? https://vvd.bz/PS2 <br>
            ???? ????????????/???????????? ?????? ??? https://vvd.bz/WZ9 <br><br>
        </div>
        
	

        <div name="content" id="content">
            <div id="image"><img src="${att.getFilePath()}" style="width: 65%"></div>
            <%=vo.getContent()%>
        </div>


        <div class="detail-footer">
            <span id="comment" style="font-size: 20px;">??????</span><hr>


            <div class="comment">
                <div id="user-comments"> 
                   <table>
                        <td>
                            <tr>?????????<br><br></tr>
                            <tr>???????????????. ?????? ??????????????????.<br></tr>
                            <tr>2022/08/08 11:44 <br><br>
                            <tr><button onclick="reply()" class="btn btn-outline-dark btn-sm">????????????</button><br><br></tr>
                            <div id="reply-write"></div>
                            <hr>
                        </td>

                        <td>
                            <tr>?????????<br><br></tr>
                            <tr>???????????? ???????????????<br></tr>
                            <tr>2022/08/08 11:44 <br><br>
                            <tr><button onclick="reply2()" class="btn btn-outline-dark btn-sm">????????????</button><br><br></tr>
                            <div id="reply-write2"></div>
                            <hr>
                        </td>
                   </table>
                </div>

                
                <div id="comment-write">
                    <div><%=loginMember.getMemberName() %></div><br>
                    <div><textarea rows="5" cols="105" style="resize:none;" name="comment" id="comment" required></textarea></div><br>
                    <!-- ?????? | ????????? -->
                    <span><input type="file"></span>
                    <button class="btn btn-outline-success btn-sm">??????</button>
                </div><br>
            </div>

        </div>
        
        <div class="list-top" style=" margin-left: 80%;">
             <input type="button" class="btn btn-outline-success btn-sm" value="?????????" onclick="location.href='/semiTestPrj/community/list?p=1'">
             <input type="button" class="btn btn-outline-success btn-sm" value="TOP" onclick="window.scrollTo(0,0);">
        </div>
       
    </div>




    <%@include file="/views/common/footer.jsp" %>

     <!-- ???????????? ?????? -->
	<div class="modal" id="banModal">
        <div class="modal-dialog">
          <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">????????????</h4>
              <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
      
            <!-- Modal body -->
            <div class="modal-body">
              ?????? ???????????? ?????????????????????????
              <select>
                  <option value="??????">??????</option>
                  <option value="??????">??????</option>
                  <option value="?????? ??????">?????? ??????</option>
                  <option value="?????????">?????????</option>
              </select>
            </div>
      
            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="button" id="banClick" class="btn btn-danger" data-bs-dismiss="modal">??????</button>
            </div>
      
          </div>
        </div>
      </div>
    <script type="text/javascript">
        $('#banClick').click(function(){
            alert("?????? ????????? ?????????????????????.");
        });
    </script>

    <script>
        function reply(){
            const reply = document.getElementById('reply-write');
            
            reply.innerHTML
                ='<hr><div style=" border: 1px solid black; width: 95%; margin: 0px auto; padding-top: 10px;  margin-bottom: 10px; padding-left: 40px; padding-bottom: 15px;"><div><%=loginMember.getMemberName() %></div><br><div><textarea rows="5" cols="100" style="resize:none;" name="comment" id="comment" required></textarea></div><br><button class="btn btn-outline-success btn-sm" style="margin-left: 90%;">??????</button></div>'
                   
        }

        function reply2(){
            const reply = document.getElementById('reply-write2');
            
            reply.innerHTML
                ='<hr><div style=" border: 1px solid black; width: 95%; margin: 0px auto; padding-top: 10px;  margin-bottom: 10px; padding-left: 40px; padding-bottom: 15px;"><div><%=loginMember.getMemberName() %></div><br><div><textarea rows="5" cols="100" style="resize:none;" name="comment" id="comment" required></textarea></div><br><button class="btn btn-outline-success btn-sm" style="margin-left: 90%;">??????</button></div>'
                   
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

            alert("URL??? ?????????????????????.");
        }
       
    </script>

    

</body>
</html>