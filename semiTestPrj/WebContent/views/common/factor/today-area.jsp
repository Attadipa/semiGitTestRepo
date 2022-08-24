<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        #today-content-area{
            width: 100%;    
            height: 100%;
            display: flex;
            flex-direction: row;
            justify-content: space-around;
            flex-wrap: wrap;
        }
        #today-content-area ul{
            /* border: 1px solid blue; 추후 삭제 */
            width: 300px;
            height: 400px;
            margin-left: 60px;
            margin-right: 60px;
            font-size: 16px;
            border: 3px solid green;
            list-style: none;
            padding: 0;
            margin-bottom: 0;
        }
        #today-content-area ul li{
            /* border: 1px solid blue; 추후 삭제 */
            box-sizing: border-box;
            height: 8%;
            text-align: center;
            font-weight: 900;
            cursor: pointer;
            align-items: center;
        }
        #today-content-area ul li:first-child{
            height: 76%;
        }
        .today-content-text-area{
            padding-top: 7px;
        }
  		#today-content-area ul:hover{
        	border: 10px solid black;
        	transition: 0.3s;
        }
        
        #today-content-area ul>li:last-child{display:none;}
		#today-content-area ul>li:first-child>img{width: 250px; height: 250px; padding-top: 15px;} 
       
    </style>
    
    </head>
    <body>
        
        <div id="today-content-area">
            <ul>
                <li>게시글 사진</li>
                <li class="today-content-text-area">게시글 제목</li>
                <li class="today-content-text-area">게시글 작성자</li>
                <li class="today-content-text-area">게시 날짜</li>
                <li class="today-content-text-area">tradeNo</li>
            </ul>
            <ul>
                <li>게시글 사진</li>
                <li class="today-content-text-area">게시글 제목</li>
                <li class="today-content-text-area">게시글 작성자</li>
                <li class="today-content-text-area">게시 날짜</li>
                <li class="today-content-text-area">tradeNo</li>
            </ul>
            <ul>
                <li>게시글 사진</li>
                <li class="today-content-text-area">게시글 제목</li>
                <li class="today-content-text-area">게시글 작성자</li>
                <li class="today-content-text-area">게시 날짜</li>
                <li class="today-content-text-area">tradeNo</li>
            </ul>
            <ul>
                <li>게시글 사진</li>
                <li class="today-content-text-area">게시글 제목</li>
                <li class="today-content-text-area">게시글 작성자</li>
                <li class="today-content-text-area">게시 날짜</li>
                <li class="today-content-text-area">tradeNo</li>
            </ul>
            <ul>
                <li>게시글 사진</li>
                <li class="today-content-text-area">게시글 제목</li>
                <li class="today-content-text-area">게시글 작성자</li>
                <li class="today-content-text-area">게시 날짜</li>
                <li class="today-content-text-area">tradeNo</li>
            </ul>
            <ul>
                <li>게시글 사진</li>
                <li class="today-content-text-area">게시글 제목</li>
                <li class="today-content-text-area">게시글 작성자</li>
                <li class="today-content-text-area">게시 날짜</li>
                <li class="today-content-text-area">tradeNo</li>
            </ul>
            <ul>
                <li>게시글 사진</li>
                <li class="today-content-text-area">게시글 제목</li>
                <li class="today-content-text-area">게시글 작성자</li>
                <li class="today-content-text-area">게시 날짜</li>
                <li class="today-content-text-area">tradeNo</li>
            </ul>
            <ul>
                <li>게시글 사진</li>
                <li class="today-content-text-area">게시글 제목</li>
                <li class="today-content-text-area">게시글 작성자</li>
                <li class="today-content-text-area">게시 날짜</li>
                <li class="today-content-text-area">tradeNo</li>
            </ul>
            <ul>
                <li>게시글 사진</li>
                <li class="today-content-text-area">게시글 제목</li>
                <li class="today-content-text-area">게시글 작성자</li>
                <li class="today-content-text-area">게시 날짜</li>
                <li class="today-content-text-area">tradeNo</li>
            </ul>
       </div>
        
        <script type="text/javascript">
        	/* 메인 페이지에 띄워줄 조회수가 큰 항목대로 거래글 데이터를 가져와주는 ajax */
        	$(function(){
        		$.ajax({
        			url : "/semiTestPrj/trade/today/tvo"
        			, method : "GET"
        			, success : function(y){
        				const result = JSON.parse(y);        				
        				
        				for(let i=0;i<9;i++){
        					$('#today-content-area').children().eq(i).children().eq(1).text(result[i].title);
        					$('#today-content-area').children().eq(i).children().eq(2).text(result[i].writer);
        					$('#today-content-area').children().eq(i).children().eq(3).text(result[i].enrollDate);
        					$('#today-content-area').children().eq(i).children().eq(4).text(result[i].tradeNo);
        				}

        			}
        			, error : function(e){
        				console.log("통신실패");
        				console.log(e);
        			}
        		});
        		$.ajax({
        			url : "/semiTestPrj/trade/today/avo"
        			, method : "GET"
        			, success : function(y){
        				const result2 = JSON.parse(y);
        				
        				for(let i=0;i<9;i++){
        					$('#today-content-area').children().eq(i).children().eq(0).html('<img src="'+result2[i].filePath+'">');
        				}
        			}
        			, error : function(e){
        				console.log("통신실패");
        				console.log(e);
        			}
        		});
        	})
        	
        	$(function(){
				$('#today-content-area>ul').click(function(){
					//행 클릭 되었을 때, 동작 할 내용
					
					//글 번호 가져오기
					const num = $(this).children().eq(4).text();
					//해당 번호 이용해서 요청 보내기
					location.href= "${contextPath}/trade/detail?num=" + num;
				});
			})
        </script>
    </body>
    </html>
    <style>#product-img{background-image: url("${avo.getFilePath()}");}</style>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    