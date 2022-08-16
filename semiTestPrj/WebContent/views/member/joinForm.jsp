<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<link rel="stylesheet" href="./bootst/css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>

    <form id="sm" action="" name="pej" method="post" onsubmit="return allCheck()">

		<div class="row">
			<div class="col-sm-6">
				<table class="table table-bordered table-dark">

					<tr bgcolor="blanchedalmond">
						<!-- 1. 회원가입 기본 정보 -->
						<td align="center" colspan="2" style="color: black">회원 기본 정보</td>
					</tr>
					
					<tr>
						<!-- 2. 아이디 -->
					    <td>아이디:</td>
					    <td><input type="text" id="" name="id" size=12 
						    maxlength=12> 4~12자의 영문 대소문자와 숫자로만 입력</td>

					</tr>
					
					<tr>
						<!-- 3. 비밀번호 -->
						<td>비밀번호:</td>
						<td><input type="password" id="" name="pwd" size=12
						maxlength=12> 4~12자의 영문 대소문자와 숫자로만 입력</td>
					</tr>
					
					<tr>
						<!-- 4. 비밀번호 확인 -->
						<td>비밀번호 확인:</td>
						<td><input type="password" id="" size=12 maxlength=12></td>
					</tr>
					
					<tr>
						<!-- 5. 이메일 -->
						<td>이메일:</td>
						<td><input type="text" id="" name="email" size=20>
							ex) ID@email.com</td>
					</tr>
					
					<tr>
						<!-- 6. 닉네임 -->
						<td>닉네임:</td>
						<td><input type="text" id="" name="nickName" size=15 maxlength=3></td>
					</tr>
					
					<tr bgcolor="blanchedalmond">
						<!-- 6. 개인 신상 정보 -->
						<td align="center" colspan="2" style="color: black">개인 신상 정보</td>
					</tr>
					
					<tr>
						<!-- 7. 주소 찾기 -->
						<td>주소:</td>
						<!-- zib코드 입력-->
						<td><input type="text" id="tbox1" name="addr"
							placeholder="우편번호" size=8> <input type="button"
							onclick="addrFind()" value="우편번호 찾기"><br> 
							<input type="text" id="tbox2" name="addr" placeholder="주소" size=28><br>
							<input type="text" id="tbox4" name="addr" placeholder="참고항목" size=28>
							<input type="text" id="tbox3" name="addr" placeholder="상세주소"></td>
					</tr>
					
					<tr>
						<!-- 8. 주민등록번호 -->
						<td>주민등록번호:</td>
						<td><input type="text" id="" name="pin" size=15 minlength=13 maxlength=13>
						ex) 1234561234567</td>
					</tr>
					
					<tr>
						<!-- 9. 생일 -->
                        <td>생일:</td>
						<td><input type="text" id="birth" name="year" size=5 maxlength=12>년
							<select id="month" name="month">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select>월
							
						<select id="day" name="day">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">21</option>
								<option value="22">22</option>
								<option value="23">23</option>
								<option value="24">24</option>
								<option value="25">25</option>
								<option value="26">26</option>
								<option value="27">27</option>
								<option value="28">28</option>
								<option value="29">29</option>
								<option value="30">30</option>
								<option value="31">31</option>
						</select>일</td>
					</tr>
					
					<tr>
						<!-- 10. 관심분야 -->
						<td>관심분야:</td>
						<td><input type="checkbox" value="컴퓨터" name="hobby">컴퓨터
							<input type="checkbox" value="인터넷" name="hobby">인터넷 
							<input type="checkbox" value="여행" name="hobby">여행 
							<input type="checkbox" value="영화감상" name="hobby">영화감상 
							<input type="checkbox" value="음악감상" name="hobby">음악감상
					</tr>
					
					<tr>
						<!-- 11. 자기소개 -->
						<td>자기소개:</td>
						<td><textarea id="my_intro" name="intro" rows="5" cols="55" maxlength="700">
						</textarea></td>
					</tr>
					
					<tr>
						<!-- 12. 회원가입 제출 -->
						<td align="center" colspan="2">
						<input type="submit" value="회원가입">
						<input type="reset" value="다시입력">
						</td>
					</tr>
					
				</table>
			</div>
		</div>
	</form>	
	
		<!-- 부트스트랩과 jquery 적용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	
</body>

</html>