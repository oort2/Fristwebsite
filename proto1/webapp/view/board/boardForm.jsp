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
<div class="w3-container w3-card-4" style="margin-left:250px" >                                                                         <!--  회원가입과 달리 여러가지 데이터가 뜨니까 -->
<form  action = "${pageContext.request.contextPath}/board/boardPro" method="post"    enctype="multipart/form-data">
<h3   class="w3-center">게시판 입력</h3>
<br>
<p>      
<label class="w3-text-grey">작성자</label>
<input class="w3-input w3-border" type="text" name="name" >
<!-- 이렇게 name으로 들어가야 request.getParametar로 들어갈 수 있고, 만들어진 섹터객체-클래스와 연동이되어야함 -->
</p><p>      
<label class="w3-text-grey">비밀번호</label>
<input class="w3-input w3-border" type="text" name="pass" >
</p><p>      
<label class="w3-text-grey">제목</label>
<input class="w3-input w3-border" type="text" name="subject" >
</p><p>      
<label class="w3-text-grey">내용</label>
<textarea class="w3-input w3-border" style="resize:none" name="content" ></textarea>
</p>
<p>      
<label class="w3-text-grey">파일 </label>
<input class="w3-input w3-border" type="file" name="file2">
</p>
  <p  class="w3-center"><button type="submit" class="w3-btn w3-padding w3-teal" 
  style="width:120px">저장</button></p>
</form>
</div>
</body>
</html>