<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
<div class="w3-main w3-pale-green" style="margin-left:250px" >
<form class = "w3-container w3-card-4" enctype = "multipart/form-data"
		action = "${pageContext.request.contextPath}/drink/drinkPro" method="post">
<h3 class="w3-center w3-teal" style="w3-color">상품 입력</h3>
<br>
<p>      
<label class="w3-text-grey" style="color:white;">상품이름</label>
<input class="w3-input w3-border" type="text" name = "name">
</p><p>      
<label class="w3-text-grey">가격</label>
<input class="w3-input w3-border" type="text" name = "price">
</p><p>      
<label class="w3-text-grey">도수</label>
<input class="w3-input w3-border" type="text" name = "alcohol" >
</p>    
</p><p>      
<label class="w3-text-grey">용량</label>
<input class="w3-input w3-border" type="text" name = "capacity" >
</p>    
</p><p>      
<label class="w3-text-grey">주종</label>
<input class="w3-input w3-border" type="text" name = "dtype" >
</p>    
</p><p>      
<label class="w3-text-grey">상품 브랜드</label>
<input class="w3-input w3-border" type="text" name = "brand" >
</p>
</p><p>      
<label class="w3-text-grey">지역</label>
<input class="w3-input w3-border" type="text" name = "location" >
</p>
</p><p>      
<label class="w3-text-grey">출시일</label>
<input class="w3-input w3-border" type="text" name = "released" >
</p><p>      
<label class="w3-text-grey">상품 사진 </label>
<input class="w3-input w3-border" type = "file" name = "file2" >
</p>
  <p  class="w3-center"><button type="submit" class="w3-btn w3-padding w3-teal" 
  style="width:120px">저장</button></p>
</form>
</div>
</body>
</html>