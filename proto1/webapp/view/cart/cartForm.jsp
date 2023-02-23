<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
  margin: 0;
}

* {
  box-sizing: border-box;
}

p,
span {
  margin: 0;
}

a {
  color: black;
}

img {
  display: block;
  width: 30px;
  height: 60px;
  margin: auto;
}

.cart {
  width: 80%;
  margin: auto;
  padding: 30px;
}

.cart ul {
  background-color: whitesmoke;
  padding: 30px;
  margin-bottom: 50px;
  border: whitesmoke solid 1px;
  border-radius: 5px;
  font-size: 13px;
  font-weight: 300;
}

.cart ul :first-child {
  color: black;
}

table {
  border-top: solid 1.5px black;
  border-collapse: collapse;
  width: 100%;
  font-size: 14px;
}

thead {
  text-align: center;
  font-weight: bold;
}

tbody {
  font-size: 12px;
}

td {
  padding: 15px 0px;
  border-bottom: 1px solid lightgrey;
}

.cart__list__detail :nth-child(3) {
  vertical-align: top;
}

.cart__list__detail :nth-child(3) a {
  font-size: 12px;
}

.cart__list__detail :nth-child(3) p {
  margin-top: 6px;
  font-weight: bold;
}

.cart__list__smartstore {
  font-size: 12px;
  color: gray;
}

.cart__list__option {
  vertical-align: top;
  padding: 20px;
}

.cart__list__option p {
  margin-bottom: 25px;
  position: relative;
}

.cart__list__option p::after {
  content: "";
  width: 90%;
  height: 1px;
  background-color: lightgrey;
  left: 0px;
  top: 25px;
  position: absolute;
}

.cart__list__optionbtn {
  background-color: white;
  font-size: 10px;
  border: lightgrey solid 1px;
  padding: 7px;
}

.cart__list__detail :nth-child(4),
.cart__list__detail :nth-child(5),
.cart__list__detail :nth-child(6) {
  border-left: 2px solid whitesmoke;
}

.cart__list__detail :nth-child(5),
.cart__list__detail :nth-child(6) {
  text-align: center;
}

.cart__list__detail :nth-child(5) button {
  background-color: black;
  color: white;
  border: none;
  border-radius: 5px;
  padding: 4px 8px;
  font-size: 12px;
  margin-top: 5px;
}

.price {
  font-weight: bold;
}

.cart__mainbtns {
  width: 420px;
  height: 200px;
  padding-top: 40px;
  display: block;
  margin: auto;
}

.cart__bigorderbtn {
  width: 200px;
  height: 50px;
  font-size: 16px;
  margin: auto;
  border-radius: 5px;
}

.cart__bigorderbtn.left {
  background-color: white;
  border: 1px lightgray solid;
}

.cart__bigorderbtn.right {
  background-color: black;
  color: white;
  border: none;
}
</style>

</head>
<body>
<div class="w3-main" style="margin-left:250px">
<section class="cart">
  <form class = "w3-container" 
	action="${pageContext.request.contextPath}/order/orderDetailForm?cart_serial=${cart_serial}" method="post">  
        <div class="cart__information">
            <ul>
                <li>장바구니 상품은 최대 30일간 저장됩니다.</li>
                <li>제주도 및 도서산간의 경우 배송비가 추가될 수 있습니다.</li>
            </ul>
        </div>
        <table class="cart__list">
                <thead>
                    <tr>
                    
                        <td><input type="checkbox"></td>
                        <td colspan="2">상품정보</td>
                        <td>수량</td>
                        <td>상품금액</td>
                        <td>삭제</td>
                    </tr>
                </thead>
                
                <c:if test="${empty list}">
                <input type="hidden" id="drink_serial" name="drink_serial" value ="${drink.serial}" />
                 <tr class="cart__list__detail">
                 		
                        <td><input type="checkbox"></td>
                        
                        <td><img src="${pageContext.request.contextPath}/view/drink/img/${fileName}"></td>
                        <td><a href="${pageContext.request.contextPath}/drink/drinkInfo?serial=${drink.serial}">${drink.name}</a><br><br>
                            <span class="price">${drink.price} 원</span>
                        </td>
                    	<td class="updown w3-center">
                    		<span class="cart_qty">${cart_qty}</span>
                		</td>
                	
                        <td><span class="cart_price">${drink.price * cart_qty}</span><br>
                            <button class="cart__list__orderbtn">주문하기</button>
                        </td>
                        <td><a href=${pageContext.request.contextPath}/cart/deleteCart id="${drink.serial}" onClick="reply_click('${drink.serial}')"class="btn btn-danger pull-right w3-black w3-button">삭제</a></td>
                        
                    </tr>
                
                </c:if>
                <c:if test="${not empty list}">
                
                 <c:forEach var="cartList" items="${list}">
                 <input type="hidden" id="drink_serial" name="drink_serial" value ="${cartList.drink_serial}" />
                   <tr class="cart__list__detail">
                        <td><input type="checkbox"></td>
                        
                        <td><img src="${pageContext.request.contextPath}/view/drink/img/${cartList.file1}"></td>
                        <td><a href="${pageContext.request.contextPath}/drink/drinkInfo?serial=${cartList.drink_serial}">${cartList.name}</a><br><br>
                            <span class="price">${cartList.price} 원 </span>
                        </td>
                    	<td class="updown w3-center">
                    		<span class="cart_qty">${cartList.cart_qty}</span>
                		</td>            	
                        
                        <td><span class="cart_price">${cartList.price * cartList.cart_qty}</span><br>
                            <button class="cart__list__orderbtn">주문하기</button>
                        </td>
                        
                        <td><a href="${pageContext.request.contextPath}/cart/deleteCart?drink_serial=${cartList.drink_serial}&cart_serial=${cartList.cart_serial}" onClick="reply_click('${cartList.drink_serial}')"class="btn btn-danger pull-right w3-black w3-button">삭제</a></td>
                        
                    </tr>
                  </c:forEach>
                </c:if>

           
        </table>
       	 	<div class="cart__mainbtns">
          	  <a href="<%=request.getContextPath()%>/drink/drinkList" class="w3-button w3-center cart__bigorderbtn left">쇼핑 계속하기</a> 
       
           	 <input class="w3-button cart__bigorderbtn right" type="submit" value="주문하기">
       		</div>
       </form>
         
    </section>
</div>
</body>
</html>