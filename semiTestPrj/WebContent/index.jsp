<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고거래는 아나바다</title>

<style>
	
	main{
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	main div{
		box-sizing: border-box;
		width: 1280px;
	}
	#banner-area{
		padding-top: 30px;
		height: 800px;
	}
	#recommend-area{
		height: 400px;
		padding-top: 30px;
	}
	#today-area{
		height: 1500px;
		padding-top: 35px;
	}

	


</style>
</head>
<body>

	<%@ include file="/views/common/header.jsp" %>
	
	<main>

		<div id="banner-area">
			<%@ include file="/views/common/factor/banner-area.jsp" %>
		</div>
		<div id="recommend-area">
			<%@ include file="/views/common/factor/recommend-area.jsp" %>
		</div>
		<div id="today-area">
			<%@ include file="/views/common/factor/today-area.jsp" %>
		</div>

	</main>
	
	<%@ include file="/views/common/footer.jsp" %>

</body>
</html>