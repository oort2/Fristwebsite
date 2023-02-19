<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head><body>
<div class="w3-main" style="margin-left:250px" >
	<table class="w3-table-all">	
		<tr>
			<td>글번호</td>
			<td>${board.num}</td> 
			<td>조회수</td>
			<td>${board.readcnt}</td>
		</tr>	<tr>
			<td>작성자</td>
			<td>${board.name}</td>
			
			<td>작성일</td>			
			<td>${board.regdate}</td>
		</tr>		<tr>
			<td>img </td>
			<td colspan="3"><img src="${pageContext.request.contextPath}/view/board/img/${board.file1}">
			</td>
		</tr>	<tr>
			<td>글제목</td>
			<td colspan="3">${board.subject}</td>
		</tr>		<tr>
			<td>글내용</td>
			<td colspan="3">${board.content}</td>
		</tr>		
		
			
		<tr>
			<td colspan="4"  class="w3-center">
			<input type="button" value="답글" 	
onclick="document.location.href='<%=request.getContextPath()%>/board/replyForm?num=${board.num}&ref=${board.ref}&refstep=${board.refstep}&reflevel=${board.reflevel}&pageNum=${pageNum }'"/>
			<input type="button" value="글수정" 	
onclick="document.location.href='<%=request.getContextPath()%>/board/boardUpdateForm?num=${board.num}'"/>
			<input type="button" value="글삭제" 	
onclick="document.location.href='<%=request.getContextPath()%>/board/boardDeleteForm?num=${board.num}'"/>
		<input type="button" value="목록" 	
onclick="document.location.href='<%=request.getContextPath()%>/board/boardList'"/>
		
			</td>
			
	</tr>		
		
	</table></div>
</body>
</html>