<%@page import="java.util.List"%>
<%@page import="com.kh.common.PageVo"%>
<%@page import="com.kh.notice.vo.NoticeVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	List<NoticeVo> voList = (List<NoticeVo>)request.getAttribute("voList");
		PageVo pv = (PageVo)request.getAttribute("pv");
	
		int currentPage = pv.getCurrentPage();
		int startPage = pv.getStartPage();
		int endPage = pv.getEndPage();
		int maxPage = pv.getMaxPage();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
<style>


    html{
        overflow-y: scroll;
    }

    #outer{
        width: 65%;
        margin: 0px auto;
        margin-bottom: 5%;
        margin-top: 5%;
    }

    table{
        border: 1px black;
        width: 100%;
        text-align: center;
        border-spacing: 10px;
        border-collapse: collapse;
        border-top: 1px solid darkgray !important;
        border-bottom: 1px solid darkgray !important;
    }

    #next-page{
        margin-left: 30%;
        margin-top: 5%;
        padding-top: 10px;
        font-family: 'IBM Plex Sans KR', sans-serif;
        font-weight: 400;
    }

    #writeBtn{
        float: right;
        margin-right: 15px;
    }

    h1 {
        padding-top: 3%;
        font-family: 'IBM Plex Sans KR', sans-serif;
        font-weight: 400;
    }
    
    th, td {
        border-bottom: 0.5px dashed darkgray !important;
        padding: 5px;
        font-size: medium;
        font-family: 'IBM Plex Sans KR', sans-serif;
    }
    
    th{
        background-color: whitesmoke;
    }

    .title:hover, .writer:hover {
        text-decoration: underline 0.5px;
        
    }

    #page-outer{
        background-color: whitesmoke;
        width: 100%;
        height: 180px;
    }


    hr{
        height: 0.5px !important;
    }

    span{
        padding: 0px 10px;
        
    }
    
    .category{
        position: relative;
        width: 150px;
        height: 30px;
        border: 2px solid darkgray;
    }

    .search {
        position: relative;
        width: 120px;
        height: 30px;
        border: 2px solid darkgray;
    }

    .category .category-select, .search .search-select  {
        width: inherit;
        height: inherit;
        background: transparent;
        border: 0 none;
        outline: 0 none;
        font-family: 'IBM Plex Sans KR', sans-serif;
        font-weight: 400;
    }
    
    .category .category-select option, .search .search-select option {
        background: whitesmoke;
        padding: 2px 0;
        font-size: 13px;
    }

    .bottom{
        margin-left: 23%;
    }
    
    #search-condition{
        height: 27px;
        border: 1px solid darkgray;
        width:  350px;
    }

    #btn-condition {
        height: 27px;
        border: 1px solid darkgray;
        margin-left: -10px;
    }
    
    a {
        text-decoration: none !important;
        color: black !important;
    }

    tbody tr:hover{
        background-color: whitesmoke;
    }
    


</style>
</head>
<body>

<!-- 공지사항 리스트에서 클릭 시 , 글 번호 참조하여 서블릿으로 요청 보냄  -->

    <%@include file="/views/common/header.jsp" %>
    
    <div id="outer">
        
        <h1>공지사항</h1><br><br>
        
        <form action="/semiTestPrj/notice/deleteAll" method="post">
            <table>
                <thead>
                    <tr>
                        <% if(loginMember != null  && "user04".equals(loginMember.getMemberMid())) {%>
                        <th></th>
                        <%} %>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                    <%for(int i = 0 ; i < voList.size(); i++){%>
                        <tr>
                            <% if(loginMember != null  && "user04".equals(loginMember.getMemberMid())) {%>
                            <td><input type="checkbox" name="postNo" value="<%=voList.get(i).getNo()%>"></td>
                            <%} %>
                            <td class="list"><%=voList.get(i).getNo()%></td>
                            <td class="list"><%=voList.get(i).getTitle()%></td>
                            <td class="list"><%=voList.get(i).getWriter()%></td>
                            <td class="list"><%=voList.get(i).getCnt()%></td>
                            <td class="list"><%=voList.get(i).getEnrollDate()%></td>
                        </tr>
                    <%}%>
                </tbody>
                <br clear="both">
            </table>

            <br>
            
            <!-- 수정 예정 jstl로 -->
            <% if(loginMember != null  && "user04".equals(loginMember.getMemberMid())) {%>
                <button name="writeBtn" type="button" id="writeBtn" class="btn btn-success" onclick="location.href='/semiTestPrj/notice/insert'">✍글쓰기</button>
                <button name="writeBtn" type="submit"  id="writeBtn" class="btn btn-success" onclick="location.href='/semiTestPrj/notice/deleteAll'">❌삭제</button>
            <%} else if (loginMember != null && !"user04".equals(loginMember.getMemberMid())){%> 
                <button name="writeBtn" type="button" id="writeBtn" class="btn btn-success" onclick="location.href='/semiTestPrj/notice/insert'">✍글쓰기</button>
            <%}%>
        </form>
		
        <div id="page-outer">
	            <div id="next-page">
	               <%if(currentPage != 1){ %>
					<a class="btn btn-link" href="/semiTestPrj/notice/list?p=<%=currentPage-1%>"> &lt; </a>
				<%} %>
				
				<% for(int i = startPage; i <= endPage; ++i) {%>
					<%if(i == currentPage){%>
						<a class="btn btn-link"><%=i%></a>
					<%} else {%>
						<a class="btn btn-link" href="/semiTestPrj/notice/list?p=<%=i%>"><%=i%></a>
					<%} %>
				<%} %>
				
				<%if(currentPage != maxPage){ %>
					<a class="btn btn-link" href="/semiTestPrj/notice/list?p=<%=currentPage+1%>"> &gt; </a>
				<%} %>
        		</div>

            <br><hr><br>

            <div class="bottom">
                <span class="search">
                    <select name="search-select" class="search-select">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                        <option value="writer">작성자</option>
                        <option value="comment">댓글내용</option>
                        <option value="comment-writer">댓글작성자</option>
                    </select>
                </span>
                <span>
                    <input type="text" id="search-condition" placeholder=" 검색어를 입력해주세요.">
                    <button id="btn-condition" onclick="location.href=''">검색</button>
                </span>
            </div>
        </div>
        
    </div>
    
    <%@include file="/views/common/footer.jsp" %>
    
   
    <script>
    //공지사항 리스트에서 해당 게시물 클릭시(tr) -> 공지사항 상세보기
        $(function(){
			$('tbody tr').children('.list').click(function(){
				//글 번호 가져오기 (this -> tr태그)
				const num = $(this).parent().children().eq(0).text();
				console.log(num);
				//해당 번호로 요청 보내기
				location.href='/semiTestPrj/notice/detail?num=' + num;
				
			});
		})
    
    </script>

</body>
</html>