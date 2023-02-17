<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<hr>
	<div class="w3-container"   style="margin-left:250px" >
		<table
			class="w3-table-all w3-bordered w3-striped w3-border test w3-hoverable"
			style="color: #000">
			<tbody>
				<tr class="w3-grey">
					<th>id</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>주민등록번호</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>주소</th>
					 
				</tr>
			</tbody>
			<tbody>
<c:forEach var="m" items="${list}" >	
             <!-- 얘가 멤버 리스트를 가져옴 -->
			<tr >
					<td>${m.id}</td>
					<td>${m.pass}</td>
					<td>${m.name}</td>
					<td>${m.jumin}</td>
					<td>${m.tel}</td>
					<td>${m.email}</td>
					<td>${m.address}</td>
					 
              </tr>
</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>