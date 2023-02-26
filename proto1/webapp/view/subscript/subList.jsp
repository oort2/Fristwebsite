<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"> 
function reply_click(serial) {
	location.href="<%=request.getContextPath()%>/subscript/subDeletePro?serial="+serial
}
</script>
</head>
<body>
	<hr>
	<div class="w3-container"   style="margin-left:250px" >
	<button class="w3-button w3-right w3-black"  onclick="location.href='${pageContext.request.contextPath}/drink/drinkList'">추가</button>
		<table
			class="w3-table-all w3-bordered w3-striped w3-border test w3-hoverable"
			style="color: #000">
			<tbody>
				<tr class="w3-grey">
					<th>상품이름</th>
					<th>주종</th>
					<th>회사이름</th>
					<th>지역</th>
					<th>출시일</th>
					<th></th>
				</tr>
			</tbody>
			<tbody>
<c:forEach var="m" items="${list}" >	
			<tr>
					<td>${m.name}</td>
					<td>${m.dtype}</td>
					<td>${m.brand}</td>
					<td>${m.location}</td>
					<td>${m.released}</td>
					<td><button id="${m.serial}" onClick="reply_click('${m.serial}')"class="btn btn-danger pull-right w3-black w3-button">삭제</button></td>
              </tr>
</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>