<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<title>팔도 강산의 술을 한자리에, K-JU</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style>
<!-- 기본 설정값 -->

.w3-sidebar a {font-family: "Roboto", sans-serif}
body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
a {color:#333;text-decoration:none}


<!-- 슬라이드 인트로 값 -->

.mySlides {display:none}
.w3-left, .w3-right, .w3-badge {cursor:pointer}
.w3-badge {height:13px;width:13px;padding:0}

</style>
</head>
<body>


<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-bar-block w3-white w3-collapse w3-top" style="z-index:3;width:250px" id="mySidebar">
  <div class="w3-container w3-display-container w3-padding-16">
    <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
    <h3 class="w3-wide"><b><a href="${pageContext.request.contextPath}/common/head1.jsp">K-JU</a></b></h3>
  </div>
  
  
  <div class="w3-padding-64 w3-large w3-text-grey" style="font-weight:bold">
    <a href="<%=request.getContextPath()%>/subscript/subForm" class="w3-bar-item w3-button">구독서비스</a> 
    
    <a href="<%=request.getContextPath()%>/map/mapForm" class="w3-bar-item w3-button">우리술찾기</a>
    
  <a href="<%=request.getContextPath()%>/drink/drinkList" class="w3-bar-item w3-button">
      마켓 </a>
    
    <a onclick="myAccFunc('com2')" href="javascript:void(0)" class="w3-button w3-block w3-white w3-left-align" id="com">
      고객마당 <i class="fa fa-caret-down"></i></a>
      <div id="com2" class="w3-bar-block w3-hide w3-padding-large w3-medium">
      <a href="${pageContext.request.contextPath}/board/boardList?boardid=1" class="w3-bar-item w3-button">배송문의</a>
      <a href="${pageContext.request.contextPath}/board/boardList?boardid=2" class="w3-bar-item w3-button">고객의소리</a>
      <a href="${pageContext.request.contextPath}/board/boardList?boardid=3" class="w3-bar-item w3-button">입점문의</a></div>
    
    <a onclick="myAccFunc('Mypage2')" href="javascript:void(0)" class="w3-button w3-block w3-white w3-left-align" id="Mypage">
      마이페이지 <i class="fa fa-caret-down"></i></a>
      <div id="Mypage2" class="w3-bar-block w3-hide w3-padding-large w3-medium">
      <a href="<%=request.getContextPath()%>/consumer/consumerInfo" class="w3-bar-item w3-button">회원정보수정</a>
       <c:if test="${sessionScope.id!=null}" >
   
      <a href="<%=request.getContextPath()%>/subscript/submylist"
               class="w3-bar-item w3-button">구독관리</a>
      <a href="${pageContext.request.contextPath}/cart/cartForm?cart_serial=${sessionScope.id}" class="w3-bar-item w3-button">장바구니</a>
    </c:if>
      <a href="<%=request.getContextPath()%>/consumer/consumerDelete" class="w3-bar-item w3-button">회원탈퇴</a></div>
     
  </div>
</nav>



<!-- Top menu on small screens -->
<header class="w3-bar w3-top w3-hide-large w3-black w3-xlarge">
  <div class="w3-bar-item w3-padding-24 w3-wide">K-JU</div>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding-24 w3-right" onclick="w3_open()"><i class="fa fa-bars"></i></a>
	<!-- javascript:void(0)링크기능 무효화  -->
</header>



<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu<!-- !PAGE CONTENT! -->" id="myOverlay"></div>


<div class="w3-main" style="margin-left:250px"> <!-- 페이지 자간 -->

  <!-- 작은 화면 버전 -->
  <div class="w3-hide-large" style="margin-top:83px"></div>
   
  <!-- Top header -->
  <header class="w3-container w3-large">
    <p class="w3-left w3-wide"><a href="${pageContext.request.contextPath}/common/head1.jsp">팔도강산의술을한자리에</a></p>
    <p class="w3-right">
    <!-- https://fontawesome.com/icons 원하는 아이콘 -->
   <a href="${pageContext.request.contextPath}/cart/cartForm?cart_serial=${sessionScope.id}" class="fa fa-shopping-cart w3-margin-right w3-button"></a>
     <a href= "${pageContext.request.contextPath}/drink/drinkSearch/">
                <i class="fa fa-search w3-button"></i>
			    </a>
      
      <c:if test="${sessionScope.id==null}" >
    
      <a href="${pageContext.request.contextPath}/consumer/joinForm" class="w3-button w3-right"><SMALL>회원가입</SMALL></a>
      <a href="${pageContext.request.contextPath}/consumer/loginForm" class="w3-button w3-right"><SMALL>로그인</SMALL></a>
      </c:if> 
    
     
 <c:if test="${sessionScope.id!=null}" >
 <!--로그인하면 -->
   <a href="${pageContext.request.contextPath}/consumer/consumerInfo" class="w3-button w3-right"> <SMALL>회원정보확인(<%=session.getAttribute("id") %>)</SMALL></a>
   <a href="${pageContext.request.contextPath}/consumer/logout" class="w3-button w3-right"><SMALL>로그아웃</SMALL></a>
    <a href="${pageContext.request.contextPath}/interest/interestList" class="w3-button w3-right"><SMALL>찜목록</SMALL></a></c:if>

    
<c:if test="${sessionScope.id eq 'admin' }" >
   <!-- 아이디가 어드민이면 회원가입 리스트를 볼 수 있게 할 예정 -->
    <a href="<%=request.getContextPath()%>/consumer/consumerList"  class="w3-button w3-right"><SMALL>회원리스트</SMALL></a>
     <a href="<%=request.getContextPath()%>/drink/drinkList" class="w3-button w3-right"><SMALL>술목록</SMALL></a>
 </c:if>
     
      
       
  </header>
</div>

<div    class="w3-main" style="margin-left:250px">
	<!-- 슬라이드 배너 -->
 	<div class="w3-content w3-display-container" style="max-width:800px">
 	<a href="#s">
 	 <img class="mySlides" src="${pageContext.request.contextPath}/icons/acol_header2.jpg" style="width:800px; height:300px">
 	 <img class="mySlides" src="${pageContext.request.contextPath}/icons/acol_header1.jpg" style="width:800px; height:300px">
 	 <img class="mySlides" src="${pageContext.request.contextPath}/icons/acol_header3.jpg" style="width:800px; height:300px">
  	</a>
   	<div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle" style="width:100%">
   	 <div class="w3-left w3-hover-text-khaki" onclick="plusDivs(-1)">&#10094;</div>
   	 <div class="w3-right w3-hover-text-khaki" onclick="plusDivs(1)">&#10095;</div>
   	 <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(1)"></span>
   	 <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(2)"></span>
   	 <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onclick="currentDiv(3)"></span>
 	 </div>
	</div>
	
<p></p>
</div>
</body> 

<script>
w3_close()

// ---------- 카테고리 시작 ----------

function myAccFunc(market) {
  var x = document.getElementById(market);
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else {
    x.className = x.className.replace(" w3-show", "");
  }
}

//document.getElementById("market").click();

function w3_open() { //.style.display = "block" 내부요소 열기
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
}
function w3_close() { //.style.display = "none" 내부요소 접기
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}
// ---------- 카테고리 끝 ----------


// ---------- 슬라이드 인트로 시작 ----------
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" w3-white", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-white";
}
// ---------- 슬라이드 인트로 끝 ----------

// ---------- 지역 필터 시작 ----------
function myFunction() {
  var input, filter, ul, li, a, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  div = document.getElementById("myDIV");
  a = div.getElementsByTagName("a");
  for (i = 0; i < a.length; i++) {
    txtValue = a[i].textContent || a[i].innerText;
    if (txtValue.toUpperCase().indexOf(filter) > -1) {
      a[i].style.display = "";
    } else {
      a[i].style.display = "none";
    }
  }
}
//---------- 지역 필터 시작 ----------
</script>

</html>
