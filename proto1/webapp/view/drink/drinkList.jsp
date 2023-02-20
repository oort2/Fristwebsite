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
	<div class="w3-container" style="margin-left: 250px">
		<!--  관리자용 drinkList --admin에서 확인가능 -->
		<c:if test="${sessionScope.id eq 'admin' }">
			<a class="w3-button w3-right w3-grey"
				href="${pageContext.request.contextPath}/drink/drinkForm">상품입력</a>
		</c:if>

		<!-- 카테고리 체크박스  -->
		<div class="w3-row">
			<div class="w3-quarter">
			<form>
				<input id="all" class="w3-check w3-quarter" type="checkbox"
					checked="checked" onClick="location.href='${pageContext.request.contextPath}/drink/drinkList'">
					<label>전체보기</label>
				<input id="racewine" class="w3-check" onClick="location.href='${pageContext.request.contextPath}/drink/drinkListricewine'" 
				type="checkbox"> <label>막걸리</label>
				<input id="soju" class="w3-check" onClick="location.href='${pageContext.request.contextPath}/drink/drinkListsoju'"   type="checkbox"><label>소주</label> </form>
				
			</div>
			<div class="w3-quarter w3-right">
				<div id="product_order_list">
					<p>
						<a onClick="location.href='${pageContext.request.contextPath}/drink/drinkList'">최신순</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <a
						  onClick="location.href='${pageContext.request.contextPath}/drink/drinkListsaled'"> 판매량</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <a 
							 onClick="location.href='${pageContext.request.contextPath}/drink/drinkListhigh'">높은가격</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
						<a onClick="location.href='${pageContext.request.contextPath}/drink/drinkListlow'">낮은가격</a>
					</p>
				</div>
			</div>
		</div>
		<!--  지역별 드롭다운  -->
		<div class="w3-quarter">
			<div class="w3-dropdown-hover">
				<button class="w3-button w3-black">지역</button>
				<div class="w3-dropdown-content w3-bar-block w3-card w3-light-grey"
					id="myDIV">
					<a  class="w3-bar-item w3-button" href="${pageContext.request.contextPath}/drink/drinkList">전체보기</a> <a
					    class="w3-bar-item w3-button" href="${pageContext.request.contextPath}/drink/selectLocation?location=서울경기">서울경기</a> <a
						class="w3-bar-item w3-button" href="${pageContext.request.contextPath}/drink/selectLocation?location=경상도">경상도</a> <a
						class="w3-bar-item w3-button" href="${pageContext.request.contextPath}/drink/selectLocation?location=전라도">전라도</a> <a
						class="w3-bar-item w3-button" href="${pageContext.request.contextPath}/drink/selectLocation?location=충청도">충청도</a> <a
						class="w3-bar-item w3-button" href="${pageContext.request.contextPath}/drink/selectLocation?location=강원도">강원도</a> <a
						class="w3-bar-item w3-button" href="${pageContext.request.contextPath}/drink/selectLocation?location=제주도">제주도</a>
				</div>
			</div>
		</div>

		<form class="w3-container"
			action="${pageContext.request.contextPath}/drink/drinkInfo"
			method="post">

			<c:forEach var="m" items="${list}">

				<div class="w3-col l3 s6">
					<div class="w3-container">
						<div class="w3-display-container">
							<a
								href="${pageContext.request.contextPath}/drink/drinkInfo?serial=${m.serial}"><img
								src="${pageContext.request.contextPath}/view/drink/img/${m.file1}"
								style="width="400px" height="300px"></a>
							<div class="w3-display-bottomleft w3-display-hover">
								<a class="w3-button w3-black" 
								href="${pageContext.request.contextPath}/interest/interestForm?drinkserial=${m.serial}">♥</a>
							</div>
						</div>
						<p>
							<a
								href="${pageContext.request.contextPath}/drink/drinkInfo?serial=${m.serial}">${m.name}</a><br>
							<b>${m.price}</b><br>
							<a href="#">리뷰 0</a>
						</p>
					</div>
				</div>


			</c:forEach>
			<input type="hidden" type="submit" value="cart_value">
		</form>
	</div>
</body>
</html>