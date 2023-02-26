<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


</style>
</head>
<body>
	<hr>
	<div class="w3-container"   style="margin-left:500px" >
	<form action="${pageContext.request.contextPath}/subscript/submylistPro" method='get'>
		
		<input type="hidden" name="subscript" value="${subscript}">
		<div class="cotainer" width=50%>
		<table
			class="w3-table-all w3-bordered w3-striped w3-border test w3-hoverable"
			class="center"
			style="width:70%"
			style="color: #000">
			<tbody>
				<tr class="w3-grey">
					<th>아이디</th>
					<th>구독여부</th>
					<th></th>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td>${id}</td>
					<td>${subscript== 1? "구독하지않음":" "}
					    ${subscript== 2? "구독중":" "}
					</td>
					<td><input type="submit" value="구독취소" id="plus" "w3-buttonw3-black" ></input> </td>
				</tr>
			</tbody>
		</table>
		</div>
	</form>

	</div>
	
</body>
</html>