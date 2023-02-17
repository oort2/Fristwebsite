<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  <%-- 쓴이유 => 여러번 돌리기 위해서 --%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<hr>
	<div class="w3-container">
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
					<th>구독</th>
				</tr>
			</tbody>
			<tbody>
<c:forEach  var="m"  items="${list}">
              <tr>
                    <td>${m.id}</td>
					<td>${m.pass}</td>
					<td>${m.name}</td>
					<td>${m.jumin}</td>
					<td>${m.tel}</td>
					<td>${m.email}</td>
					<td>${m.subscript}</td>
              </tr>
</c:forEach>


			</tbody>
		</table>
	</div>
</body>
</html>
