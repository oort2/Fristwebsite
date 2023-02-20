<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<hr>
	<div class="w3-container" style="margin-left:250px" >
		
		<!-- 카테고리 체크박스  -->
	<div class="w3-row">
   <div class="w3-quarter"> 
   	<input id="all" class="w3-check w3-quarter"  type="checkbox" checked="checked">
    <label>&nbsp;전체보기&nbsp;</label>
    <input id="racewine" class="w3-check" href="#" type="checkbox">
    <label>&nbsp;막걸리&nbsp;</label>
    <input id="soju" class="w3-check" href="#" type="checkbox">
    <label>&nbsp;소주&nbsp;</label>
  </div>
  <div class="w3-quarter w3-right">
		<div id="product_order_list">
			<p>
			<a href="#">최신순</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			<a href="#">판매량</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			<a href="#">높은가격</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			<a href="#">낮은가격</a></p>
		</div>
		</div>
	</div> 
  <!--  지역별 드롭다운  -->
  <div class="w3-quarter">
  <div class="w3-dropdown-hover">
    <button class="w3-button w3-black">지역</button>
    <div class="w3-dropdown-content w3-bar-block w3-card w3-light-grey" id="myDIV">
      <a class="w3-bar-item w3-button" href="#">서울경기</a>
      <a class="w3-bar-item w3-button" href="#">경상도</a>
      <a class="w3-bar-item w3-button" href="#">전라도</a>
      <a class="w3-bar-item w3-button" href="#">충청도</a>
      <a class="w3-bar-item w3-button" href="#">강원도</a>
      <a class="w3-bar-item w3-button" href="#">제주도</a>
    </div></div>
	</div>  
		
		<table
			class="w3-table-all w3-bordered w3-striped w3-border test w3-hoverable"
			style="color: #000">
			<tbody>
				<tr class="w3-grey">
					
					<th>상품이름</th>
					<th>용량</th>
					<th>도수</th>
					<th>상품 브랜드</th>
					<th>출시일</th>
					<th>가격</th>
			    	<th>지역</th>
					<th>판매량</th>
					<th>사진</th>
					<th>수량</th>
					<th>주종</th>
				
					
				
					
				</tr>
			</tbody>
			<tbody>
<c:forEach  var="m"  items="${list}">
              <tr>       
					<td><a href="${pageContext.request.contextPath}/drink/drinkInfo">${m.name}</a></td>
					<td>${m.capacity}</td>
					<td>${m.alcohol}</td>
					<td>${m.brand}</td>
					<td>${m.released}</td>
					<td>${m.price}</td>
					<td>${m.location}</td>
					<td>${m.saled}</td>
					<td>${m.file1}</td>
					<td>${m.qty}</td>
					<td>${m.dtype}</td>
					
				
					
              </tr>
</c:forEach>


			</tbody>
		</table>
	</div>
</body>
</html>