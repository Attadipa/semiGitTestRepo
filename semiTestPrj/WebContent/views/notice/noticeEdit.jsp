<%@page import="com.kh.notice.vo.NoticeVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	NoticeVo vo = (NoticeVo) request.getAttribute("vo");
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

    #outer h1{
        padding-top: 50px;
        padding-bottom: 30px;
    }
    #section{
        width: 100%;
        height: 60%;
        
    }
    #section *{
        width: 100%;
    }
    #div-btn-area{
        width: 25%;
        margin: auto;
        margin-top: 30px;
    }

    hr{
        height: 2px !important;
        background: black !important;
    }
    .category-select, #title {
        height: 35px;
    }

    #list {
        float: right;
        margin-top: 10px;
    }

    #submit {
        float: right;
        margin-top: -9%
    }

    h1 {
        display: inline-block;
        padding-bottom: 0px;
    }

    #textLengthCheck {
        border: none;
        margin: 10px;
    }

    #title {
        border: 2px solid grey;
    }

    #content {
        border: 2px solid grey;
        width: 100%;
        height: 400px;

    }

</style>
</head>
<body>
	
    <%@ include file="/views/common/header.jsp"%>
    
    <div id="outer">



        <h1>글쓰기</h1>

        <form action="/semiTestPrj/notice/edit" method="post">
	       		 <input type="submit" id="submit" class="btn btn-success" value="등록"><hr>
            
            <div id="section">
            	<!-- 수정예정*********************************************  -->
            	
            	
            	<input type="hidden" name="num" value="<%=vo.getNo()%>">
	            <%-- <input type="hidden" name="writerNo" value="<%=loginMember.getMember_serial()%>"> --%>
	            <input type="hidden" name="writerNo" value="1">
                <input type="text" size="120" name="title" id="title" placeholder=" 제목을 입력해주세요." value="<%=vo.getTitle()%>" required onkeyup="title_check();">
                <br>
                <br>
                <textarea rows="15" cols="130" style="resize:none;" name="content" id="content" placeholder=" 내용을 입력하세요." onkeyup="content_check();" required><%=vo.getContent()%></textarea>
            </div>
            
        </form>
                <input type="text" placeholder="(0/ 1000)" id="textLengthCheck">
        		<input type="button" id="list" class="btn btn-success" value="목록" onclick="history.go(-1)">

    </div>

    <%@include file="/views/common/footer.jsp" %>

    <script>
        function title_check() {
        var desc = $("#title").val();

        if( desc.length > 30 ) {
            alert("제목은 30자를 초과할 수 없습니다.");
            $("#title").val(desc.substring(0, 30));
        }
    }
    </script>

    <script>
        $("#content").keyup(function(e) {
            var content = $(this).val();
            $("#textLengthCheck").val("(" + content.length + "/ 500)"); //실시간 글자수 카운팅
            if (content.length > 500) {
                alert("최대 500자까지 입력 가능합니다.");
                $(this).val(content.substring(0, 500));
                $('#textLengthCheck').html("(500 / 최대 500자)");
            }
        });
</script>

</body>
</html>