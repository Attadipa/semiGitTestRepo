<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    .page-outer{
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

    tbody tr:hover{
        background-color: whitesmoke;
    }

</style>
</head>
<body>

    <%@include file="/views/common/header.jsp" %>
    
    <div id="outer">
        
    
        
        <h1>커뮤니티</h1>
        
        
        <form action="semiTestPrj/community/selectBox" method="get">
            <div class="category">
                <select name="category-select" class="category-select">
                    <option value="free">자유게시판</option>
                    <option value="compliment">칭찬해요</option>
                    <option value="caution">주의해요</option>
                    <option value="chat">수다방</option>
                </select>
            </div>
        </form>
        <br><br>

        <table>

            <thead>
                <tr>
                    <th></th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회</th>
                </tr>
            </thead>

            <!-- 예시 -->
            <tbody>
                <tr>
                    <td>필독</td>
                    <td class="title"><a href="comDetail.jsp">아나바다</a></td>
                    <td class="writer"><a href="">남재현</a></td>
                    <td>2022/08/03</td>
                    <td>30</td>
                </tr>
                <tr>
                    <td>공지</td>
                    <td class="title">중고거래 플랫폼 만들었습니다</td>
                    <td class="writer">박한솔</td>
                    <td>2022/07/11</td>
                    <td>20</td>
                </tr>
                <tr>
                    <td>공지</td>
                    <td class="title">ANBD</td>
                    <td class="writer">이아름</td>
                    <td>2022/11/11</td>
                    <td>25</td>
                </tr>
                <tr>
                    <td>2105</td>
                    <td class="title">HI HELLO HOW ARE YOU</td>
                    <td class="writer">서교상</td>
                    <td>2022/08/09</td>
                    <td>65</td>
                </tr>
                <tr>
                    <td>4651</td>
                    <td class="title">KK LOL HOHOHO</td>
                    <td class="writer">박성현</td>
                    <td>2015/08/09</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>공지</td>
                    <td class="title">ANBD</td>
                    <td class="writer">이아름</td>
                    <td>2022/11/11</td>
                    <td>25</td>
                </tr>
                <tr>
                    <td>2105</td>
                    <td class="title">HI HELLO HOW ARE YOU</td>
                    <td class="writer">서교상</td>
                    <td>2022/08/09</td>
                    <td>65</td>
                </tr>
                <tr>
                    <td>4651</td>
                    <td class="title">KK LOL HOHOHO</td>
                    <td class="writer">박성현</td>
                    <td>2015/08/09</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>공지</td>
                    <td class="title">ANBD</td>
                    <td class="writer">이아름</td>
                    <td>2022/11/11</td>
                    <td>25</td>
                </tr>
                <tr>
                    <td>2105</td>
                    <td class="title">HI HELLO HOW ARE YOU</td>
                    <td class="writer">서교상</td>
                    <td>2022/08/09</td>
                    <td>65</td>
                </tr>
                <tr>
                    <td>3453</td>
                    <td class="title">아나바다</td>
                    <td class="writer">남재현</td>
                    <td>2022/08/03</td>
                    <td>30</td>
                </tr>
                <tr>
                    <td>64536</td>
                    <td class="title">중고거래 플랫폼 만들었습니다</td>
                    <td class="writer"> 박한솔</td>
                    <td>2022/07/11</td>
                    <td>20</td>
                </tr>
                <tr>
                    <td>265</td>
                    <td class="title">ANBD</td>
                    <td class="writer">이아름</td>
                    <td>2022/11/11</td>
                    <td>25</td>
                </tr>
                <tr>
                    <td>2105</td>
                    <td class="title">HI HELLO HOW ARE YOU</td>
                    <td class="writer">서교상</td>
                    <td>2022/08/09</td>
                    <td>65</td>
                </tr>
                <tr>
                    <td>4651</td>
                    <td class="title">KK LOL HOHOHO</td>
                    <td class="writer">박성현</td>
                    <td>2015/08/09</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>3453</td>
                    <td class="title">아나바다</td>
                    <td class="writer">남재현</td>
                    <td>2022/08/03</td>
                    <td>30</td>
                </tr>
                <tr>
                    <td>64536</td>
                    <td class="title">중고거래 플랫폼 만들었습니다</td>
                    <td class="writer">박한솔</td>
                    <td>2022/07/11</td>
                    <td>20</td>
                </tr>
                <tr>
                    <td>265</td>
                    <td class="title">ANBD</td>
                    <td class="writer">이아름</td>
                    <td>2022/11/11</td>
                    <td>25</td>
                </tr>
                <tr>
                    <td>2105</td>
                    <td class="title">HI HELLO HOW ARE YOU</td>
                    <td class="writer">서교상</td>
                    <td>2022/08/09</td>
                    <td>65</td>
                </tr>
                <tr>
                    <td>4651</td>
                    <td class="title">KK LOL HOHOHO</td>
                    <td class="writer">박성현</td>
                    <td>2015/08/09</td>
                    <td>5</td>
                </tr>
            </tbody>

            <br clear="both">


        </table>

        <br>

        <button name="writeBtn" id="writeBtn" class="btn btn-success" onclick="location.href='comInsertForm.jsp'">글쓰기</button>
        <!-- <a href="comInsertForm.jsp" id="writeBtn" class="btn btn-success">글쓰기</a> -->

        <div id="page-outer">
            <div id="next-page">
                <span>1</span>
                <span>2</span>
                <span>3</span>
                <span>4</span>
                <span>5</span>
                <span>6</span>
                <span>7</span>
                <span>8</span>
                <span>9</span>
                <span>10</span>
                <span>|</span>
                <span>다음 ></span>
    
                <!-- <button>1</button>
                <button>2</button>
                <button>3</button>
                <button>4</button>
                <button>5</button>
                <button>6</button>
                <button>7</button>
                <button>8</button>
                <button>9</button>
                <button>10</button>
                <button>|</button>
                <button>다음</button> -->
            </div>

            <br><hr><br>

           
            
            <form action="">
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
            </form>
            
        </div>
        

        
    </div>
    
    <%@include file="/views/common/footer.jsp" %>
    
    <!-- 서블릿 만든 후 수정예정 -->
    <!-- <script>
        $(function(){
			$('tbody>tr').click(function(){
				//행 클릭되었을 때, 동작할 내용
				
				//글 번호 가져오기 (this -> tr태그)
				const num = $(this).children().eq(0).text();
				console.log(num);
				//해당 번호로 요청 보내기
				location.href='/semiTestPrj/notice/detail?num=' + num;
				
			});
		})
    </script> -->

</body>
</html>