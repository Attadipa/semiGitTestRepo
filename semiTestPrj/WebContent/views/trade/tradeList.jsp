<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    #outer{
        margin: 0px auto;
        margin-bottom: 5%;
        margin-top: 5%;
        /* border: 1px solid black; */

    }
    
    #content-area{
            width: 100%;    
            height: 100%;
            display: flex;
            flex-direction: row;
            justify-content: space-around;
            flex-wrap: wrap;
    }
    
    #content-area ul{
            /* border: 1px solid blue; 추후 삭제 */
            width: 300px;
            height: 400px;
            margin-left: 30px;
            margin-right: 30px;
            font-size: 10px;
            border: 3px solid green;
            list-style: none;
            padding: 0;
            margin-bottom: 50px;
    }
       
    #content-area ul li{
            /* border: 1px solid blue; 추후 삭제 */
            box-sizing: border-box;
            height: 8%;
            text-align: center;
            font-weight: 900;
            cursor: pointer;
            align-items: center;
    }
       
    #content-area ul li:first-child{
            height: 75%;
    }
        
    .content-text-area{
            padding-top: 7px;
    }
        
    .page-outer{
        background-color: whitesmoke;
        height: 180px;
        padding-bottom: 50px;
        padding-top: 10px;
        margin-top: 30px;
        font-family: 'IBM Plex Sans KR', sans-serif;
        font-weight: 400;
        text-align: center;
    }

    span{
        padding: 0px 10px;
    }

    .images {
        background-image: url("http://image.dongascience.com/Photo/2022/06/6982fdc1054c503af88bdefeeb7c8fa8.jpg");
   
    }

    .btn-success {
        margin-left: 93.5%;
    }

   
</style>
</head>
<body>
    
    <%@include file="/views/common/header.jsp" %>

    <div id="outer">


        <div id="content-area">
            <ul>
                <li class="images">게시글 사진</li>
                <li class="content-text-area">게시글 제목</li>
                <li class="content-text-area">게시글 작성자</li>
                <li class="content-text-area">게시 날짜</li>
            </ul>
            <ul>
                <li class="images">게시글 사진</li>
                <li class="content-text-area">게시글 제목</li>
                <li class="content-text-area">게시글 작성자</li>
                <li class="content-text-area">게시 날짜</li>
            </ul>
            <ul>
                <li class="images">게시글 사진</li>
                <li class="content-text-area">게시글 제목</li>
                <li class="content-text-area">게시글 작성자</li>
                <li class="content-text-area">게시 날짜</li>
            </ul>
            <ul>
                <li class="images">게시글 사진</li>
                <li class="content-text-area">게시글 제목</li>
                <li class="content-text-area">게시글 작성자</li>
                <li class="content-text-area">게시 날짜</li>
            </ul>
            <ul>
                <li class="images">게시글 사진</li>
                <li class="content-text-area">게시글 제목</li>
                <li class="content-text-area">게시글 작성자</li>
                <li class="content-text-area">게시 날짜</li>
            </ul>
            <ul>
                <li class="images">게시글 사진</li>
                <li class="content-text-area">게시글 제목</li>
                <li class="content-text-area">게시글 작성자</li>
                <li class="content-text-area">게시 날짜</li>
            </ul>
            <ul>
                <li class="images">게시글 사진</li>
                <li class="content-text-area">게시글 제목</li>
                <li class="content-text-area">게시글 작성자</li>
                <li class="content-text-area">게시 날짜</li>
            </ul>
            <ul>
                <li class="images">게시글 사진</li>
                <li class="content-text-area">게시글 제목</li>
                <li class="content-text-area">게시글 작성자</li>
                <li class="content-text-area">게시 날짜</li>
            </ul>
            <ul>
                <li class="images">게시글 사진</li>
                <li class="content-text-area">게시글 제목</li>
                <li class="content-text-area">게시글 작성자</li>
                <li class="content-text-area">게시 날짜</li>
            </ul>
            <ul>
                <li class="images">게시글 사진</li>
                <li class="content-text-area">게시글 제목</li>
                <li class="content-text-area">게시글 작성자</li>
                <li class="content-text-area">게시 날짜</li>
            </ul>
            <ul>
                <li class="images">게시글 사진</li>
                <li class="content-text-area">게시글 제목</li>
                <li class="content-text-area">게시글 작성자</li>
                <li class="content-text-area">게시 날짜</li>
            </ul>
            <ul>
                <li class="images">게시글 사진</li>
                <li class="content-text-area">게시글 제목</li>
                <li class="content-text-area">게시글 작성자</li>
                <li class="content-text-area">게시 날짜</li>
            </ul>
            <ul>
                <li class="images">게시글 사진</li>
                <li class="content-text-area">게시글 제목</li>
                <li class="content-text-area">게시글 작성자</li>
                <li class="content-text-area">게시 날짜</li>
            </ul>
            <ul>
                <li class="images">게시글 사진</li>
                <li class="content-text-area">게시글 제목</li>
                <li class="content-text-area">게시글 작성자</li>
                <li class="content-text-area">게시 날짜</li>
            </ul>
            <ul>
                <li class="images">게시글 사진</li>
                <li class="content-text-area">게시글 제목</li>
                <li class="content-text-area">게시글 작성자</li>
                <li class="content-text-area">게시 날짜</li>
            </ul>
            <ul>
                <li class="images">게시글 사진</li>
                <li class="content-text-area">게시글 제목</li>
                <li class="content-text-area">게시글 작성자</li>
                <li class="content-text-area">게시 날짜</li>
            </ul>
            <ul>
                <li class="images">게시글 사진</li>
                <li class="content-text-area">게시글 제목</li>
                <li class="content-text-area">게시글 작성자</li>
                <li class="content-text-area">게시 날짜</li>
            </ul>
            <ul>
                <li class="images">게시글 사진</li>
                <li class="content-text-area">게시글 제목</li>
                <li class="content-text-area">게시글 작성자</li>
                <li class="content-text-area">게시 날짜</li>
            </ul>
            <ul>
                <li class="images">게시글 사진</li>
                <li class="content-text-area">게시글 제목</li>
                <li class="content-text-area">게시글 작성자</li>
                <li class="content-text-area">게시 날짜</li>
            </ul>
            <ul>
                <li class="images">게시글 사진</li>
                <li class="content-text-area">게시글 제목</li>
                <li class="content-text-area">게시글 작성자</li>
                <li class="content-text-area">게시 날짜</li>
            </ul>
        </div>

        <a href="tradeInsertForm.jsp" class="btn btn-success">등록</a>

        <div class="page-outer">
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
            
            <br><br><hr><br>

        </div>

        
    </div>

    <%@include file="/views/common/footer.jsp" %>

    <script>

    var liArr = document.querySelectorAll("li");
    for (var i = 0; i < liArr.length; i++) {
        var li =liArr[i]

        li.addEventListener('click', function() {
        location.href='tradeDetail.jsp';
    });
    };

    </script>

</body>
</html>