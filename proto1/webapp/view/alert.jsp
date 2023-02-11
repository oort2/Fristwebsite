<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
alert("${msg}")
 <!-- EL로 메세지를 띄움 -->
location="${pageContext.request.contextPath}${url}"
	              <!-- 프로젝트 명-->
</script>

</body>
</html>
