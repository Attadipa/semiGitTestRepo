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
        padding: 10px;
        padding-left: 20px;
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

    .btns input, button{
        width: 100px !important;
    }
    .btns{width: 100% ; display: flex; justify-content: center;}
    .btns input{margin: 0 5px 0 5px;}
    .btns button{margin: 0 5px 0 5px;}
    
   	#product-img{
        width: 300px;
        height: 300px;
        background-size: 300px 300px;
   	}
   	
   	.buy-modal-footer{display:flex;flex-direction: row !important;justify-content: center;}
   	.buy-modal-footer{margin:3px;}
   	.buy-modal-footer button{margin:3px;}
   	

</style>
</head>
<body>

    <%@ include file="/views/common/header.jsp"%>
    
    
    <c:if test="${not empty avo}">
    	<style>#product-img{background-image: url("${avo.getFilePath()}");}</style>
    </c:if>
    

    <div id="detail-outer">
            <hr>
                <!-- 글번호, 카테고리번호 -->
				<input type="hidden" name="tradeNo" value="${tvo.getTradeNo()}">
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
                            <input data-bs-toggle="modal" data-bs-target="#banModal" class="btn btn-outline-danger btn-sm" type="button" value="신고하기">
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
                    	<c:if test="${not empty loginMember}">
                    		<c:if test="${loginMember.getMemberMid() ne tvo.getWriter()}">
	                        <input type="button" class="btn btn-secondary wish" id="insert-wish" value="찜하기">
	                        <input type="button" class="btn btn-warning chat" value="채팅"> 
	                        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#myModal">
							  구매하기
							</button>
						      <style>
									.buy-title{text-align: center;}
									.buy-body{text-align: center;}						      	
						      </style>
								
								<!-- The Modal -->
									<div class="modal" id="myModal">
									  <div class="modal-dialog">
									    <div class="modal-content">
									
									      <!-- Modal Header -->
									      <div class="modal-header buy-title">
									        <h4 class="modal-title buy-title">구매하기</h4>
									        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
									      </div>
									
									      <!-- Modal body -->
									      <div class="modal-body buy-body">
									        구매하실 방법을 선택해 주세요 :)
									      </div>
									      
									      <!-- 결제 영역 모달창 부분 -->
										      <div class="buy-modal-footer">
											      <form action="/semiTestPrj/pay/form" method="post">
												        <input type="hidden" name="payCategory" value="1">
												        <input type="hidden" name="tradeNo" value="${tvo.getTradeNo()}">
												        <input type="hidden" name="writer" value="${tvo.getWriter()}">
												        <input type="hidden" name="title" value="${tvo.getTitle()}">
												        <input type="hidden" name="price" value="${tvo.getPrice()}">
												        <button type="submit" class="btn btn-danger" data-bs-dismiss="modal">직거래</button>
		    									  </form>								
												  <form action="/semiTestPrj/pay/form" method="post">
												        <input type="hidden" name="payCategory" value="2">
												        <input type="hidden" name="tradeNo" value="${tvo.getTradeNo()}">
												        <input type="hidden" name="writer" value="${tvo.getWriter()}">
												        <input type="hidden" name="title" value="${tvo.getTitle()}">
												        <input type="hidden" name="price" value="${tvo.getPrice()}">
												        <button type="submit" class="btn btn-danger" data-bs-dismiss="modal">배송</button>
												  </form>								
										      </div>
									    </div>
									  </div>
									</div>
	                    	</c:if>
	                    	<c:if test="${loginMember.getMemberMid() eq tvo.getWriter()}">
	                    		<input type="button" class="btn btn-secondary reqAd" value="광고신청">
		                        <input type="button" class="btn btn-warning edit-trade" value="수정하기"> 
		                        <input type="button" class="btn btn-danger del-trade" value="삭제하기">
	                    	</c:if>
                    	</c:if>
                    	<c:if test="${empty loginMember}">
                    		<input style="width: 300px !important;" type="button" class="btn btn-outline-success trade-login" value="로그인하고 아나바다 이용하기" >
                    	</c:if>
                    </div>
                </div>
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
        
        $('.del-trade').click(function(){
        	location.href="/semiTestPrj/trade/delete?num=${tvo.getTradeNo()}";	
        })
        	
        $('.reqAd').click(function(){
        	location.href="/semiTestPrj/ad/insert?num=${tvo.getTradeNo()}";
        })
        
        $('.edit-trade').click(function(){
        	location.href="/semiTestPrj/trade/edit?num=${tvo.getTradeNo()}";
        })
        
        $('.trade-login').click(function(){
        	location.href="/semiTestPrj/member/login";
        })
        
        //위시리스트에 이미 추가되어있는지 체크해주는 ajax
        $(function(){
        		$.ajax({
        			url : "/semiTestPrj/wish/check"
        			, method : "GET"
        			, data: {postNo : '${tvo.getTradeNo()}', memberNo : '${loginMember.getMemberNo()}'}
        			, success : function(x){
        				const result = JSON.parse(x);        				
        				
        				console.log(result);
        				if(result == 1){
        					$('.wish').prop("disabled", true);
        				} else{
        					$('.wish').prop("disabled", false);
        				}

        			}
        			, error : function(e){
        				console.log("통신실패");
        				console.log(e);
        			}
        		});
        	})
        
        //찜하기를 누르면 버튼을 비활성화 시켜주는 ajax
        $('#insert-wish').click(function(){
        	$.ajax({
    			url : "/semiTestPrj/wishlist/insert"
    			, method : "GET"
    			, data : {
    					postNo : '${tvo.getTradeNo()}'
        				, memberNo : '${loginMember.getMemberNo()}'
        				, title : '${tvo.getTitle()}'
    				} 
    			, success : function(x){
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
  

</body>
</html>