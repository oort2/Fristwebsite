<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script> 
/*
 * function win_upload(){
		var op = "width=500, heigth=50, left=50, top=50";
		open("${pageContext.request.contextPath}/consumer/pictureimgForm"," ",op);
	}
 */

</script>
</head>
<body>
<div class="w3-container" style="margin-left:250px" >  
<h2>회원정보수정</h2>

	<form class="w3-container" name="f"  action="${pageContext.request.contextPath}/consumer/consumerUpdatePro"  method="post">
		<table class="w3-table-all">
			<tr>
			
				
				<td>아이디</td>
				<td><input type="text" name="id" value="${consumer.id}"></td>
				<!-- 멤버객체에 toString이 출력이 됨 -->
			</tr>
			<tr>

				<td>비밀번호</td>
				<td><input type="password" name="pass" value="${consumer.pass}"></td>
			</tr>
			<tr>

				<td>이름</td>
				<td><input type="text" name="name" value="${consumer.name}"></td>
			</tr>
			<tr>
			
				<td>주민번호</td>
				<td colspan="2"><input type="text" name="jumin" value="${consumer.jumin}"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td colspan="2"><input type="text" name="address" value="${consumer.address}"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td colspan="2"><input type="text" name="tel" value="${consumer.tel}"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td colspan="2"><input type="text" name="email" value="${consumer.email}"></td>
			</tr>
				<tr>
				<td>구독여부</td>
				<td colspan="2"><input type="text" name="subscript" value="${consumer.subscript}"></td>
			</tr>
			<tr  align="center">
			<td colspan="2">&nbsp;</td>
				<td >
				<input type="submit" value="수정"></td>
			</tr>
		</table>
	</form></div>
</body>
</html>