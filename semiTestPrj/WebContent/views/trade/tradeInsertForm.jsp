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
        margin-left: 90%;
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
        margin-left: 125px
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
        margin-left: 50px;
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

        <h2>기본정보</h2>
        <br>

        <h6>필수항목*</h6>
        <hr><br><br>

        <form action="/semiTestPrj/trade/insert" method="post" enctype="multipart/form-data">
            <!-- 작성자 회원번호  -->
            <input type="hidden" name="writerNo" value="<%=loginMember.getMemberNo()%>">
    
            <!-- 사진게시판 이후 수정 예정 -->
            <!-- 이미지 -->
            <h5 class="image">
                상품이미지<br>
                <input id="imageLengthCkeck" type="file" name="f" placeholder="(0/ 4)"></input>
                <br><br>
            </h5>
            <!-- 수정예정 -->
            <input type="button" id="image" onclick="imagePlus();"></input>
            <br><br><hr><br>
    
            <!-- 제목 -->
            <h5 class="title">제목*</h5>
            <input type="text" placeholder="상품 제목을 입력해주세요." id="product-title" name="title" required>
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
    
            <!-- 지역 -->
            <h5 class="location">거래지역*</h5>
            <div id="location">
                <input type="button" class="btn btn-light" id="my-location" value="내 위치">
                <input type="button" class="btn btn-light" id="search-address" value="주소 검색">
                <input type="button" class="btn btn-light" id ="none" value="지역설정안함">
            </div>
            <div id="where" type="text" name="location" ></div>
            <br><hr><br>
    
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
            <input type="number" placeholder="숫자만 입력해주세요." name="price"> 원
            <br><br><hr><br>
    
            <!-- 설명 -->
            <h5 class="explain">설명*<br>
            <input type="text" placeholder="(0/ 500)" id="textLengthCheck2">
            </h5>
            <!-- <input type="textarea" rows="10" cols="40" placeholder="상품 설명을 입력해주세요." id="product-explain" required></textarea> -->
            <textarea rows="15" cols="85" placeholder="상품 설명을 입력해주세요." id="product-explain" name="explain" required></textarea>
            
            <br><br><hr><br>
    
            <!-- 수량 -->
            <h5 class="count">수량*</h5>
            <input type="number" placeholder="숫자만 입력해주세요." name="count"> 개
            <br><br><hr>

            <input type="submit" class="btn btn-success" value="등록">
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


    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        window.onload = function(){
            document.getElementById("search-address").addEventListener("click", function(){ //주소입력칸을 클릭하면
                //카카오 지도 발생
                new daum.Postcode({
                    oncomplete: function(data) { //선택시 입력값 세팅
                       document.getElementById('where').innerText = data.address; // 주소 넣기
                    }
                }).open();
            });
        }
    </script>

    <!-- <script>
        function printName() {  
            const location = document.getElementById('location').value;  
            document.getElementById("where").innerText = location;
        }
    </script> -->

</script>
   
</body>
</html>