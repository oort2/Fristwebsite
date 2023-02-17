<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<div class="w3-container"  style="margin-left:250px">
<h2>회원정보</h2>
		<table class="w3-table-all">
			<tr>
				
				
				<td>아이디</td>
				<td>${consumer.id}</td>				
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>${consumer.pass}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${consumer.name}</td>
			</tr>
			<tr>
				<td>주민번호</td>
				<td>${consumer.jumin}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${consumer.address}</td>
			</tr>
			<tr>			
				<td>전화번호</td>
				<td colspan="2">${consumer.tel}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td colspan="2">${consumer.email}</td>
			</tr>
			<tr>
				<td>구독여부</td>
				<td>${consumer.subscript== 1? "구독하지않음":"구독"}</td>
			</tr>
			<a class="w3-button w3-black" href="${pageContext.request.contextPath}/consumer/consumerUpdateForm"> 회원정보 수정</a>
			<a class="w3-button w3-black" href="${pageContext.request.contextPath}/consumer/consumerPassUpdate"> 비밀번호 수정</a>
		</table>
	</div>
</body>
</html>