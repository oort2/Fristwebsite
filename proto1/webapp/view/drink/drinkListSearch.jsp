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
	<div class="container" style="margin-left:300px">

		

				<div class="w3-col l3 s6">
					<div class="w3-container">
						<div class="w3-display-container">
							<a
								href="${pageContext.request.contextPath}/drink/drinkInfo?serial=${drink.serial}"><img
								src="${pageContext.request.contextPath}/view/drink/img/${drink.file1}"
								style="width="400px" height="300px"></a>
							<div class="w3-display-bottomleft w3-display-hover">
								<a class="w3-button w3-black" 
								href="${pageContext.request.contextPath}/interest/interestForm?drinkserial=${drink.serial}">♥</a>
							</div>
						</div>
						<p>
							<a
								href="${pageContext.request.contextPath}/drink/drinkInfo?serial=${drink.serial}">${drink.name}</a><br>
							<b>${drink.price}</b><br>
							<a href="#">리뷰 0</a>
						</p>
					</div>
				</div>


			
		
		</div>
</body>
</html>