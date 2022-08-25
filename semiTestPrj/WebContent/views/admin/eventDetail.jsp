<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 상세보기</title>
<style>
	.event-detail{
		margin: 0 auto;
		width: 70%;
	}
	
	.event-img{
		width: 500px;
		height: 300px;
	}
	
	.el-center *{
		margin: 0 auto;
	}
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	
	<div class="event-detail">
		<div class="row">
			<form action="${contextPath}/event/edit" method="post">
				<input type="hidden" name="eventNo" value="${evo.no}">
				<table class="table table-striped el-center" style="text-align: center; border: 1px solid #dddddd">
					<tbody>
						<tr>
							<td colspan="5" >
							<c:if test="${not empty avo}">
								<img class="event-img" src="${avo.filePath}">
							</c:if>
							<input type="text" class="form-control" placeholder="이벤트명" name="title" maxlength="50" value="${evo.title}" style="width: 100%" required <c:if test="${loginMember.memberGrade ne 'A'}">disabled</c:if>>
							</td>
						</tr>
						<tr>
							<td colspan="5"><textarea placeholder="이벤트 내용" name="content" maxlength="2048" style="height:400px; width: 600px;" required <c:if test="${loginMember.memberGrade ne 'A'}">disabled</c:if>>${evo.content}</textarea></td>
						</tr>
						<tr></tr>
					</tbody>
				</table>
				<c:if test="${loginMember.memberGrade eq 'A'}">
					<input type="hidden" name="memberNo" value="${loginMember.memberNo}">	
					<input type="submit" class="btn btn-success" value="수정하기">
					<input type="button" class="btn btn-success" value="삭제하기" onclick="location.href='/semiTestPrj/event/delete?num='+${evo.no}">
				</c:if>
			</form>
		</div>
	</div>
	
	
	
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<%@include file="/views/common/footer.jsp" %>
	

</body>
</html>