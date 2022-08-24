<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        margin: 20%;
        margin-top: 5%;
    }

    h6 {
        margin-right: 90%;
    }

    #image {
        border: 1px solid grey;
        background-color: whitesmoke;
        background-image: url("");
        width: 300px;
        height: 300px;
    }
    
    #product-title {
        margin-left: 18%;
        width: 500px;
    }

    .title, .category, .condition, .exchange, .price, .count, .ship {
        display: inline-block;
    }

    #textLengthCheck ,#textLengthCheck2, #imageLengthCkeck  {
        border: none;
    }

    #category {
        margin-left: 150px
    }

    .condition+input, .exchange+input, .price+input, .count+input,  .ship+input {
        margin-left: 18%;
    }

    .explain+textarea{
        margin-left: 24%;
    }

    .btn-success {
        margin-left: 92%;
    }

    #location input {
        border: 1px solid black;
        width: 120px;
        height: 60px;
        float: left;
        margin-left: 30px;
        text-align: center;
    }
    
    #location input:first-child {
        margin-left: 25%;
    }
    
    #where {
        border: 1px solid black;
        margin-top: 12%;
        margin-left: 25%;
        width: 460px;
        height: 30px;
    }

</style>
</head>
<body>

    <%@include file="/views/common/header.jsp" %>

    <div class="outer">
        
        <h1>상품등록</h1>
        <br><br>

        <h6>필수항목*</h6>
        <hr><br><br>

        <form action="/semiTestPrj/trade/edit" method="post">
            <!-- 작성자 회원번호  -->
            <input type="hidden" name="writerNo" value="<%=loginMember.getMemberNo()%>">
            <!-- 게시글 번호 -->
    		<input type="hidden" name="tradeNo" value="<%=(String)request.getParameter("num")%>">
            <!-- 제목 -->
            <h5 class="title">제목*</h5>
            <input type="text" placeholder="글제목을 입력해주세요." id="product-title" name="title" value="${tvo.getTitle()}" required>
            <input type="text" placeholder="(0/ 20)" id="textLengthCheck">
            <br><br><hr><br>
    
            <!-- 카테고리 -->
            <h5 class="category">카테고리*</h5>
            <select name="category" id="category" required name="category">
                <option value="1">패션</option>
                <option value="2">럭셔리</option>
                <option value="3">신발</option>
                <option value="4">도서/음반</option>
                <option value="5">캠핑</option>
                <option value="6">기타</option>
            </select>
            <br><br><hr><br>

            <!-- 상태 -->
            <h5 class="condition">상태*</h5>
            <input type="radio" name="condition" value="중고상품">중고상품  &nbsp; &nbsp; &nbsp;
            <input type="radio" name="condition" value="새상품">새상품
            <br><br><hr><br>
    
            <!-- 교환여부 -->
            <h5 class="exchange">교환*</h5>
            <input type="radio" name="exchange" value="교환불가">교환불가  &nbsp; &nbsp; &nbsp;
            <input type="radio" name="exchange" value="교환가능">교환가능
            <br><br><hr><br>

            <!-- 배송여부 -->
            <h5 class="ship">배송*</h5>
            <input type="radio" name="ship" value="배송비 포함">배송비 포함  &nbsp; &nbsp; &nbsp;
            <input type="radio" name="ship" value="배송비 제외">배송비 제외
            <br><br><hr><br>
    
            <!-- 가격 -->
            <h5 class="price">가격*</h5>
            <input type="number" placeholder="숫자만 입력해주세요." name="price" value="${tvo.getPrice()}"> 원
            <br><br><hr><br>
    
            <!-- 설명 -->
            <h5 class="explain">설명*<br>
            <input type="text" placeholder="(0/ 500)" id="textLengthCheck2">
            </h5>
            <textarea rows="15" cols="85" placeholder="상품 설명을 입력해주세요." id="product-explain" name="explain" required>${tvo.getExplain()}</textarea>
            
            <br><br><hr><br>
    
            <input type="submit" class="btn btn-success" value="수정">
        </form>

    </div>

    <%@include file="/views/common/footer.jsp" %>

    <script>
        $("#product-title").keyup(function(e) {
        var content = $(this).val();
        $("#textLengthCheck").val("(" + content.length + "/ 20)"); //실시간 글자수 카운팅
        if (content.length > 20) {
            alert("최대 20자까지 입력 가능합니다.");
            $(this).val(content.substring(0, 20));
            $('#textLengthCheck').html("(20 / 최대 20자)");
        }
    });
    </script>

    <script>
        $("#product-explain").keyup(function(e) {
            var content = $(this).val();
            $("#textLengthCheck2").val("(" + content.length + "/ 500)"); //실시간 글자수 카운팅
            if (content.length > 500) {
                alert("최대 500자까지 입력 가능합니다.");
                $(this).val(content.substring(0, 500));
                $('#textLengthCheck').html("(500 / 최대 500자)");
            }
        });
    </script>

</script>
   
</body>
</html>