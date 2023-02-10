package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.CartInner;
import model.Consumer1;
import model.Order1;

 

@Repository 
public class OrderMybatisDao {
	
	Map map = new HashMap();	
	
	@Autowired
	SqlSessionTemplate session;
	
	private static final String ns = "order.";
	 
	public Order1 selectOne(String cart_serial){ 
		Order1  order = session.selectOne(ns + "selectOne", cart_serial);
		return  order;
	}

}