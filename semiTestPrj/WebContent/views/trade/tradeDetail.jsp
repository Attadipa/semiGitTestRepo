<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

   #detail-outer{
        width: 1000px !important;
        height: 1000px;
        margin: 0px auto;
        padding-top: 100px;
        /* border: 1px solid red; */
        box-sizing: border-box;
    }
    #detail-header{
        width: 100%;
        height: 300px;
        display: flex;
    }
    #detail-header>div{
        border: 1px solid darkgreen;
    }
    #detail-footer{
        height: 500px;
    }
    #product-img{
        width: 30%;
    }
    #product-info{
        width: 700px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        padding: 5px;
        border-left: none !important;
    }
    #product-info div{
        width: 100%;
    }
    #explain{
        border: 1px solid darkgreen;
        margin: 5px 0 5px 0;
        padding: 5px 0 0 5px;
        height: 400px;
    }



    #detail-outer div{
        /* border: 1px solid red; */
        box-sizing: border-box;
    }
    #title>strong{
        font-size: 30px;
    }

   
   	
    
    .btns input{
        width: 100px !important;
    }
    .btns{width: 100% ; display: flex; justify-content: center;}
    .btns input{margin: 0 5px 0 5px;}


</style>
</head>
<body>

    <%@ include file="/views/common/header.jsp"%>
    
    <style>
	    	#product-img{
		        background-image: url("${avo.getFilePath()}"); 
		        /* background-image: url("/semiTestPrj/resources/upload/KH_1661167687454_460a064f.JPG"); */
		        width: 300px;
		        height: 300px;
		        background-size: 300px 300px;
	    	}
    </style>
    
    

    <div id="detail-outer">
            <hr>
            <form action="/semiTestPrj/pay/insert" method="get">
                <!-- 글번호, 카테고리번호 -->
                <input type="hidden" name="category-no">

                <div id="detail-header">
                    <!-- 상품사진 -->
                    <div id="product-img"></div>
                    <div id="product-info">
                        <div id="etc"> 
                            조회수 : ${tvo.getCnt()}
                            |
                            작성일 : ${tvo.getEnrollDate()}
                        </div>
                        <div id="title">
                            <Strong>${tvo.getTitle()}</Strong>
                            <br> <br>
                            <strong>가격 : ${tvo.getPrice()} 원</strong>
                        </div>
                        <div id="price">
                            판매자 : ${tvo.getWriter()} 
                        </div>
                        <div id="condition">
                            상품상태 : ${tvo.getCondition()}
                            <br>
                            교환여부 : ${tvo.getExchange()}
                            <br>
                            배송비 : ${tvo.getShip()}
                        </div>
                        <div id="etc-btns">
                            <button type="button" class="btn btn-outline-success btn-sm" onclick="clip(); return false;">URL 복사</button>
                            <input class="btn btn-outline-danger btn-sm" type="button" value="신고하기">
                        </div>
                    </div>
                </div>
                <div id="detail-footer">
                    <div id="explain">
                        <strong>상품정보</strong>
                        <hr>
                        ${tvo.getExplain()}
                    </div>
                    <div class="btns">
                    	<c:if test="${loginMember.getMemberMid() ne tvo.getWriter()}">
	                        <input type="button" class="btn btn-secondary wish" value="찜하기">
	                        <input type="button" class="btn btn-warning chat" value="채팅"> 
	                        <input type="submit" class="btn btn-danger" value="구매하기">
                    	</c:if>
                    	<c:if test="${loginMember.getMemberMid() eq tvo.getWriter()}">
                    		<input type="button" class="btn btn-secondary reqAd" value="광고신청">
	                        <input type="button" class="btn btn-warning fix" value="수정하기"> 
	                        <input type="button" class="btn btn-danger del" value="삭제하기">
                    	</c:if>
                    </div>
                </div>
            </form>
    </div>

    

    <script>
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
        $('.reqAd').click(function(){
        	location.href="/semiTestPrj/ad/insert?num="+${tvo.getTradeNo()};
        })
        
        $('.wish').click(function(){

        	$.ajax({
    			url : "/semiTestPrj/wishlist/insert"
    			, method : "GET"
    			, data : {
    					postNo : ${tvo.getTradeNo()}
        				, memberNo : ${loginMember.getMemberNo()}
        				, title : $('.product-info').children().eq(0).text()
    				} 
    			, success : function(x){
    				console.log("통신성공");
    	        	alert(x);
    	        	$('.wish').prop("disabled", true);
    			}
    			, error : function(e){
    				console.log("통신실패");
    				console.log(e);
    			}
    		});
        });

    </script>

    <%@include file="/views/common/footer.jsp" %>

  

</body>
</html>