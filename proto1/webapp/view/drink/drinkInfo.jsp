<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function addCartBtn(){
		if (confirm("쇼핑카트에 담으시겠습니까?")){ //확인
			document.getElementById("cartForm").submit();
		} else { //취소
			return;
		}
	}
</script>
</head><body>
<div class="w3-main" style="margin-left:250px" >
<form id="cartForm" class = "w3-container w3-card-4" 
action = "${pageContext.request.contextPath}/cart/cartAdd?cart_serial=${sessionScope.id}" method="post">
	<table class="w3-table-all">	
		<tr>
			<th>상품이름</th>
			<td>
			<input type="hidden" id="serial" name="serial" value ="${drink.serial}" />
			<input type="text" id="name" name="name" value="${drink.name}" readonly="readonly" />
			</td> 
			<th>용량</th>
			<td>
			<input type="text" id="capacity" name="capacity" value="${drink.capacity}" readonly="readonly" />
			</td>
		</tr>	<tr>
			<th>도수</th>
			<td>
			<input type="text" id="alcohol" name="alcohol" value="${drink.alcohol}" readonly="readonly" />
			</td>
			<th>상품 브랜드</th>
			<td>
			<input type="text" id="brand" name="brand" value="${drink.brand}" readonly="readonly" />
			</td>
		</tr>	<tr>
			<th>출시일</th>
			<td>
			<input type="text" id="released" name="released" value="${drink.released}" readonly="readonly" />
			</td>
			<th>가격</th>			
			<td>
			<input type="text" id="price" name="price" value="${drink.price}" readonly="readonly" />
			</td>
		</tr>		<tr>
			<th>지역</th>
			<td>
			<input type="text" id="location" name="location" value="${drink.location}" readonly="readonly" />
			</td>
			<th>판매량</th>
			<td>
			<input type="text" id="saled" name="saled" value="${drink.saled}" readonly="readonly" />
			</td>
		</tr>		<tr>
			<th>수량</th>
			<td>
			<input type="text" id="qty" name="qty" value="${drink.qty}" readonly="readonly" />
			</td>
			<th>주종</th>
			<td>
			<input type="text" id="dtype" name="dtype" value="${drink.dtype}" readonly="readonly" />
			</td>
		</tr>			<tr>
			<th>사진</th>
			<td colspan="3">
			<input type="hidden" id="file1" name="file1" value ="${drink.file1}" />
			<img src="${pageContext.request.contextPath}/view/drink/img/${drink.file1}">
			</td>
		</tr>		
		
			
		<tr  align="center">
		<td colspan="4"  class="w3-center">
			<c:if test="${sessionScope.id eq 'admin' }" >
   			<!-- 아이디가 어드민이면 주류 정보 수정,삭제 가능 -->      
				<a class="w3-button w3-black" href="${pageContext.request.contextPath}/drink/drinkUpdateForm?serial=${drink.serial}"> 정보 수정</a>
				<a class="w3-button w3-black" href="${pageContext.request.contextPath}/drink/drinkDelete?serial=${drink.serial}"> 삭제</a>
				<a class="w3-button w3-black" href="${pageContext.request.contextPath}/subscript/subInsertPro?serial=${drink.serial}"> 구독술추가</a>
			</c:if>
			
			<a class="w3-button w3-black" href="${pageContext.request.contextPath}/drink/drinkList"> 목록</a>
			<a class="w3-button w3-black" href="${pageContext.request.contextPath}/interest/interestDelete?drinkserial=${drink.serial}"> 찜 해제</a>
			<a class="w3-button w3-black" onclick="addCartBtn()">장바구니 담기</a>
			</td>
		

			
	</tr>		
		
	</table> 	
	</form>
	</div>
</body>
</html>