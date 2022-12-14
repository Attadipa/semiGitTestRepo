<%@page import="java.util.List"%>
<%@page import="com.kh.common.PageVo"%>
<%@page import="com.kh.community.vo.CommunityVo"%>
<%@page import="com.kh.community.vo.TypeVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%
    	List<CommunityVo> voList = (List<CommunityVo>)request.getAttribute("voList");
     	List<TypeVo> list = (List<TypeVo>)request.getAttribute("list");
		PageVo pv = (PageVo)request.getAttribute("pv");
     	String type = (String)request.getAttribute("type");
     	
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
        margin-left: 26%;
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
    
    #search-condition {
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

    tbody tr:hover {
        background-color: whitesmoke;
        cursor: pointer;
    }

</style>
</head>
<body>

    <%@include file="/views/common/header.jsp" %>


    
    <div id="outer">
        
    
        
        <h1>????????????</h1>
        
        <div class="category">
            <select name="type" class="category-select" >
                <% for(TypeVo v : list){ %>
                <option value="<%=v.getTypeNo()%>" <%if(v.getTypeNo().equals(type)){out.print("selected");} %>><%=v.getTypeName()%></option>
                <%} %> 
            </select>
        </div>
        <br><br>
        
        <form action="/semiTestPrj/community/deleteAll" method="post">
        <table>
            <thead>
                <tr>
                    <% if(loginMember != null  && "user04".equals(loginMember.getMemberMid())) {%>
                    <th></th>
                    <%} %>
                    <th>?????????</th>
                    <th>??????</th>
                    <th>?????????</th>
                    <th>?????????</th>
                    <th>?????????</th>
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



        <script>

        </script>
    	



        <br>
		<% if(loginMember != null  && "user04".equals(loginMember.getMemberMid())) {%>
            <button name="writeBtn" type="button" id="writeBtn" class="btn btn-outline-success btn-sm" onclick="location.href='/semiTestPrj/community/insert'">????????????</button>
            <button name="writeBtn" type="submit"  id="writeBtn" class="btn btn-outline-success btn-sm" onclick="location.href='/semiTestPrj/community/deleteAll'">?????????</button>
        <%} else if (loginMember != null && !"user04".equals(loginMember.getMemberMid())){%> 
            <button name="writeBtn" type="button" id="writeBtn" class="btn btn-outline-success btn-sm" onclick="location.href='/semiTestPrj/community/insert'">????????????</button>
        <%}%>
		</form>
		
		<% if (type == null) {%>
		 <div id="page-outer">
            <div id="next-page">
	               <%if(currentPage != 1){ %>
					<a class="btn btn-link" href="/semiTestPrj/community/list?p=<%=currentPage-1%>"> &lt; </a>
				<%} %>
				
				<% for(int i = startPage; i <= endPage; ++i) {%>
					<%if(i == currentPage){%>
						<a class="btn btn-link"><%=i%></a>
					<%} else {%>
						<a class="btn btn-link" href="/semiTestPrj/community/list?p=<%=i%>"><%=i%></a>
					<%} %>
				<%} %>
				
				<%if(currentPage != maxPage){ %>
					<a class="btn btn-link" href="/semiTestPrj/community/list?p=<%=currentPage+1%>"> &gt; </a>
				<%} %>
        	</div>
       
		<%} else {%>
		
		 <div id="page-outer">
            <div id="next-page">
	               <%if(currentPage != 1){ %>
					<a class="btn btn-link" href="/semiTestPrj/community/list?p=<%=currentPage-1%>&type=<%=type%>"> &lt; </a>
				<%} %>
				
				<% for(int i = startPage; i <= endPage; ++i) {%>
					<%if(i == currentPage){%>
						<a class="btn btn-link"><%=i%></a>
					<%} else {%>
						<a class="btn btn-link" href="/semiTestPrj/community/list?p=<%=i%>&type=<%=type%>"><%=i%></a>
					<%} %>
				<%} %>
				
				<%if(currentPage != maxPage){ %>
					<a class="btn btn-link" href="/semiTestPrj/community/list?p=<%=currentPage+1%>&type=<%=type%>"> &gt; </a>
				<%} %>
        	</div>
		<%} %>
            <br><hr><br>

           
            
            <form action="">
                <div class="bottom">
                    <span class="search">
                        <select name="search-select" class="search-select">
                            <option value="title">??????</option>
                            <option value="content">??????</option>
                            <option value="writer">?????????</option>
                            <option value="comment">????????????</option>
                            <option value="comment-writer">???????????????</option>
                        </select>
                    </span>
                    <span>
                        <input type="text" id="search-condition" placeholder=" ???????????? ??????????????????.">
                        <button id="btn-condition" onclick="location.href=''">??????</button>
                    </span>
                </div>
            </form>
            
        </div>
        

        
    </div>
    
    <%@include file="/views/common/footer.jsp" %>
    

    <script>

    if(${not empty loginMember.memberNo && loginMember.memberNo eq '4'}){
    	
    	$(function(){
 			$('tbody tr').children('.list').click(function(){
 				//??? ?????? ???????????? (this -> tr??????)
 				let num = $(this).parent().children().eq(1).text();
 				console.log(num);
 				//?????? ????????? ?????? ?????????
 				location.href='/semiTestPrj/community/detail?num=' + num;
 				
 			});
 		})
    
    } else {
    	$(function(){
			$('tbody tr').children('.list').click(function(){
				//??? ?????? ???????????? (this -> tr??????)
				let num = $(this).parent().children().eq(0).text();
				console.log(num);
				//?????? ????????? ?????? ?????????
				location.href='/semiTestPrj/community/detail?num=' + num;
				
			});
		})
    }
	    
    </script>
    
    <script>
        $(".category-select").change(function(){
        	
        	const typeNum = $(this).val();
            console.log(typeNum);

            location.href="/semiTestPrj/community/list?p=" + <%=currentPage%>+ "&type=" + typeNum;

            if(typeNum == 0){
                location.href='/semiTestPrj/community/list?p=1';
            }
        
        })
    </script> 
   


</body>
</html>