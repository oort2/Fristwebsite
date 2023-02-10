package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Board;
import model.Cart;
import model.CartInner;
import model.Drink;
import model.Interest;


@Repository
public class CartMybatisDao {
	
	@Autowired
	SqlSessionTemplate session;
	
	private static final String ns = "cart.";
	private Map map = new HashMap();
	
	
	public int insertCart(int nextCart,  String consumer_serial) { 
		map.clear();
		map.put("nextCart", nextCart);
		map.put("consumer_serial", consumer_serial);
		int num1= session.insert(ns + "insertCart", consumer_serial);
		  
		return num1;
	}
	
	public int insertCartInner(String consumer_serial, Drink drink, int cart_qty ) { 
		map.clear();
		map.put("cart_serial", consumer_serial);
		map.put("drink_serial", drink.getSerial());
		map.put("cart_qty", cart_qty);
		map.put("drink_price", drink.getPrice());
		int num2= session.insert(ns + "insertcartInner", map);   
		return num2;
	}
	
	
	public Cart cartOne(String serial) { 
		Cart cart =session.selectOne(ns + "cartOne", serial);
		return cart;
	}
	public int nextCart() { 
		return session.selectOne(ns + "nextCart");
		
	}
	public Cart cartSelectOne(String consumer_serial){
		System.out.println(consumer_serial);
    	Cart cart = session.selectOne(ns + "cartSelectOne", consumer_serial);
		return cart;
	}
	
	public CartInner cartInnerSelectOne(String cart_serial){
		System.out.println(cart_serial);
    	CartInner cartInner = session.selectOne(ns + "cartInnerSelectOne", cart_serial);
		return cartInner;
	} 

	public List <CartInner> cartInnerSelectAll(String cart_serial){ 
		List <CartInner> list = session.selectList(ns + "cartInnerSelectAll", cart_serial);
		return list;
	}
	
	public int deleteCart(String drink_serial) { 
		int num3 =session.insert(ns + "deleteCart", drink_serial);
		return num3;
	}
	
	
}
