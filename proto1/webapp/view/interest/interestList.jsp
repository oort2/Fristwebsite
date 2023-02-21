<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function movedelete(serial) {
	alert(serial)
	location='${pageContext.request.contextPath}/interest/interestDeletePro11?drinkserial='+serial
}


</script>
</head>
<body>
	<hr>
	<form class="w3-container" style="margin-left: 250px">

		<table
			class="w3-table-all w3-bordered w3-striped w3-border test w3-hoverable"
			style="color: #000">
			<tbody>
				<tr class="w3-grey">
					<th>serial</th>
					<th>이름</th>
					<th>가격</th>
					<th>주종</th>
				</tr>
			</tbody>
			<tbody>

				<c:forEach var="m" items="${dlist}">
					<tr>
						<td><a
							href="${pageContext.request.contextPath}/drink/drinkInfo?serial=${m.serial}">
								${m.serial}</a></td>
						<td><a
							href="${pageContext.request.contextPath}/drink/drinkInfo?serial=${m.serial}">
								${m.name}</a></td>
						<td><a
							href="${pageContext.request.contextPath}/drink/drinkInfo?serial=${m.serial}">
								${m.price}</a></td>
						<td><a
							href="${pageContext.request.contextPath}/drink/drinkInfo?serial=${m.serial}">
								${m.dtype}</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>

</body>
</html>