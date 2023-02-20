<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>게시판 수정 화면</title>
<script>
	function file_delete() {
		file_desc = document.getElementById("file_desc")
		document.f.file1.value = "";
		file_desc.style.display = "none";
	}
</script>
</head>
<body>
<div class="w3-container w3-card-4" style="margin-left:250px" >   
	<form class="w3-container w3-card-4"   
	action="${pageContext.request.contextPath}/drink/drinkUpdatePro" method="post" enctype="multipart/form-data"
		name="f">
		<input type="hidden" name="serial" value="${drink.serial}">
		<input type="hidden" name="file1"  	value="${drink.file1}">
		<table  class="w3-table-all">
			<caption>${drink.name} 수정</caption>
			
				<tr>
				<td>첨부파일</td>
				<td style="text-align: left">
				<c:if test="${drink.file1 != null && drink.file1 ne ''}">
					<div id="file_desc">${drink.file1}
						<a href="javascript:file_delete()">[첨부파일 삭제]</a>
					</div> 
					
					</c:if>
				<input type="file" name="f">
				</td>
			</tr>
			
			<tr>
				
			<td>상품이름</td>
				<td><input type="text" name="name" value="${drink.name}"></td>
			</tr>
			<tr>
				<td>용량</td>
				<td><input type="text" name="capacity" value="${drink.capacity}"></td>
			</tr>
			<tr>
				<td>도수</td>
				<td><input type="text" name="alcohol" value="${drink.alcohol}"></td>
			</tr>
			<tr>
				<td>브랜드</td>
				<td><input type="text" name="brand" value="${drink.brand}"></td>
			</tr>
			<tr>
				<td>출시일</td>
				<td><input type="text" name="released" value="${drink.released}"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price" value="${drink.price}"></td>
			</tr>
			<tr>
				<td>지역</td>
				<td><input type="text" name="location" value="${drink.location}"></td>
			</tr>
			<tr>
				<td>판매량</td>
				<td><input type="text" name="saled" value="${drink.saled}"></td>
			</tr>
			<tr>
				<td>수량</td>
				<td><input type="text" name="qty" value="${drink.qty}"></td>
			</tr>
			<tr>
				<td>주종</td>
				<td><input type="text" name="dtype" value="${drink.dtype}"></td>
			</tr>
			
		
		
			<tr>
				<td colspan="2"><a href="javascript:document.f.submit()">[게시물수정]</a>
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>