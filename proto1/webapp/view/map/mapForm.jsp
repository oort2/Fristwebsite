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


<!-- 슬라이 인트로 값 -->

.mySlides {display:none}
.w3-left, .w3-right, .w3-badge {cursor:pointer}
.w3-badge {height:13px;width:13px;padding:0}


</style>


</head>


<body>

  <div class="w3-main" style="margin-left:600px">
  
  <br>
  <br>
    <h2>우리 술 찾기</h2>
    
  <img src="<%=request.getContextPath()%>/view/map/korea2.png" style="border: 2px solid black; width: 700px; height:700px;"  usemap="#korea2">
  
  <map name="korea2" >
  <area shape="rect" coords="333,2,463,183" alt="korea2" href="<%=request.getContextPath()%>/drink/selectLocation?location=%EA%B0%95%EC%9B%90%EB%8F%84" target="_blank" /> <!-- 강원도 -->
  <area shape="rect" coords="193,1,323,182" alt="korea2" href="<%=request.getContextPath()%>/drink/selectLocation?location=%EC%84%9C%EC%9A%B8%EA%B2%BD%EA%B8%B0" target="_blank" /> <!-- 서울경기 -->
  <area shape="rect" coords="184,211,376,320" alt="korea2" href="<%=request.getContextPath()%>/drink/selectLocation?location=%EC%B6%A9%EC%B2%AD%EB%8F%84" target="_blank" /> <!-- 충청도 -->
  <area shape="rect" coords="186,334,341,526" alt="korea2" href="<%=request.getContextPath()%>/drink/selectLocation?location=%EC%A0%84%EB%9D%BC%EB%8F%84" target="_blank" /> <!-- 전라도 -->
  <area shape="rect" coords="375,223,537,445" alt="korea2" href="<%=request.getContextPath()%>/drink/selectLocation?location=%EA%B2%BD%EC%83%81%EB%8F%84" target="_blank" /> <!-- 경상도 -->
  <area shape="rect" coords="185,641,265,686" alt="korea2" href="<%=request.getContextPath()%>/drink/selectLocation?location=%EC%A0%9C%EC%A3%BC%EB%8F%84" target="_blank" /> <!-- 제주도 -->

</map>
</div>


<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-bar-block w3-white w3-collapse w3-top" style="z-index:3;width:250px" id="mySidebar">
  <div class="w3-container w3-display-container w3-padding-16">
    <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
    <h3 class="w3-wide"><b>K-JU</b></h3>
  </div>
  
  
  <div class="w3-padding-64 w3-large w3-text-grey" style="font-weight:bold">
    <a href="<%=request.getContextPath()%>/subscript/subForm" class="w3-bar-item w3-button">구독서비스</a>
    
    <a href="<%=request.getContextPath()%>/map/mapForm" class="w3-bar-item w3-button">우리술찾기</a> 
    
    <a href="<%=request.getContextPath()%>/drink/drinkList" class="w3-bar-item w3-button">
      마켓 </a>
   <!-- <div id="market2" class="w3-bar-block w3-hide w3-padding-large w3-medium">
      <a href="#" class="w3-bar-item w3-button">전체상품</a>
      <a href="#" class="w3-bar-item w3-button">신상품</a>
      <a href="#" class="w3-bar-item w3-button">베스트</a> 
    </div> -->
    
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
      <a href="#" class="w3-bar-item w3-button">결제내역</a>
      <a href="#" class="w3-bar-item w3-button">구독관리</a>
      <a href="#" class="w3-bar-item w3-button">리뷰</a>
      <a href="<%=request.getContextPath()%>/consumer/consumerDelete" class="w3-bar-item w3-button">회원탈퇴</a></div>
  </div>
</nav>



<!-- Top menu on small screens -->
<header class="w3-bar w3-top w3-hide-large w3-black w3-xlarge">
  <div class="w3-bar-item w3-padding-32 w3-wide">K-JU</div>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding-24 w3-right" onclick="w3_open()"><i class="fa fa-bars"></i></a>
	<!-- javascript:void(0)링크기능 무효화  -->
</header>



<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu<!-- !PAGE CONTENT! -->" id="myOverlay"></div>


<div class="w3-main" style="margin-left:250px"> <!-- 페이지 자간 -->

  <!-- 작은 화면 버전 -->
  <div class="w3-hide-large" style="margin-top:83px"></div>
   

</div>


	
	<!-- 카테고리 체크박스 
	<div class="w3-row">
   <div class="w3-quarter"> 
   	<input id="all" class="w3-check w3-quarter" type="checkbox" checked="checked">
    <label>&nbsp;전체보기&nbsp;</label>
    <input id="racewine" class="w3-check" type="checkbox">
    <label>&nbsp;막걸리&nbsp;</label>
    <input id="wine" class="w3-check" type="checkbox">
    <label>&nbsp;와인&nbsp;</label>
  </div>
  
    지역별 드롭다운 
  <div class="w3-quarter">
  <div class="w3-dropdown-hover">
    <button class="w3-button w3-black">지역</button>
    <div class="w3-dropdown-content w3-bar-block w3-card w3-light-grey" id="myDIV">
      <a class="w3-bar-item w3-button" href="#">지역1</a>
      <a class="w3-bar-item w3-button" href="#">지역2</a>
      <a class="w3-bar-item w3-button" href="#">지역3</a>
    </div></div>
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
  
  <p></p>


   제품목록 
  <div class="w3-row">
  
    <div class="w3-col l3 s6">
    
      <div class="w3-container">
      <div class="w3-display-container">
      <a href="#"><img src="${pageContext.request.contextPath}/icons/aa_1.jpg" style="width:100%"></a>
        <span class="w3-tag w3-display-topleft">Best</span>
        <div class="w3-display-bottomleft w3-display-hover">
          	<button class="w3-button w3-black">♥</button></div></div>
        <p><a href="#">임시주종1</a><br><b>$00.00</b><br><a href="#">리뷰 0</a></p>
      </div>
      
      <div class="w3-container">
      <div class="w3-display-container">
        <a href="#"><img src="${pageContext.request.contextPath}/icons/aa_1.jpg" style="width:100%"></a>
        <div class="w3-display-bottomleft w3-display-hover">
          	<button class="w3-button w3-black">♥</button></div></div>
        <p><a href="#">임시주종2</a><br><b>$00.00</b><br><a href="#">리뷰 0</a></p>
      </div>
      
    </div>

    <div class="w3-col l3 s6">
    
      <div class="w3-container">
        <div class="w3-display-container">
          <a href="#"><img src="${pageContext.request.contextPath}/icons/aa_1.jpg" style="width:100%"></a>
          <span class="w3-tag w3-display-topleft">New</span>
          <div class="w3-display-bottomleft w3-display-hover">
          	<button class="w3-button w3-black">♥</button></div></div>
        <p><a href="#">임시주종3</a><br><b>$00.00</b><br><a href="#">리뷰 0</a></p>
       </div>
       
      <div class="w3-container">
      <div class="w3-display-container">
        <a href="#"><img src="${pageContext.request.contextPath}/icons/aa_1.jpg" style="width:100%"></a>
        <div class="w3-display-bottomleft w3-display-hover">
          	<button class="w3-button w3-black">♥</button></div></div>
        <p><a href="#">임시주종4</a><br><b>$00.00</b><br><a href="#">리뷰 0</a></p>
      </div>
      
    </div>

    <div class="w3-col l3 s6">
    
      <div class="w3-container">
      <div class="w3-display-container">
        <a href="#"><img src="${pageContext.request.contextPath}/icons/aa_1.jpg" style="width:100%"></a>
        <div class="w3-display-bottomleft w3-display-hover">
          	<button class="w3-button w3-black">♥</button></div></div>
        <p><a href="#">임시주종5</a><br><b>$00.00</b><br><a href="#">리뷰 0</a></p>
      </div>
      
      <div class="w3-container">
        <div class="w3-display-container">
          <a href="#"><img src="${pageContext.request.contextPath}/icons/aa_1.jpg" style="width:100%"></a>
          <div class="w3-display-bottomleft w3-display-hover">
          	<button class="w3-button w3-black">♥</button></div></div>
        <p><a href="#">임시주종6</a><br><b>$00.00</b><br><a href="#">리뷰 0</a></p>
      </div>
      </div>

    <div class="w3-col l3 s6">
    
      <div class="w3-container">
      <div class="w3-display-container">
        <a href="#"><img src="${pageContext.request.contextPath}/icons/aa_1.jpg" style="width:100%"></a>
        <div class="w3-display-bottomleft w3-display-hover">
          	<button class="w3-button w3-black">♥</button></div></div>
        <p><a href="#">임시주종7</a><br><b>$00.00</b><br><a href="#">리뷰 0</a></p>
      </div>
      
      <div class="w3-container">
      <div class="w3-display-container">
        <a href="#"><img src="${pageContext.request.contextPath}/icons/aa_1.jpg" style="width:100%"></a>
        <div class="w3-display-bottomleft w3-display-hover">
          	<button class="w3-button w3-black">♥</button></div></div>
        <p><a href="#">임시주종8</a><br><b>$00.00</b><br><a href="#">리뷰 0</a></p>
      </div>
    </div>
    
    
  </div>  -->
 
  <!-- 페이지 넘버링 
  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
      <a href="#" class="w3-bar-item w3-button w3-hover-black">«</a>
      <a href="#" class="w3-bar-item w3-black w3-button">1</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">2</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">3</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">4</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">»</a>
    </div>
  </div>-->
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