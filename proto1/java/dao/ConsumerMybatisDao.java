package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Consumer1;

@Repository 
public class ConsumerMybatisDao {
	
	@Autowired
	SqlSessionTemplate session;
	
	private static final String ns = "consumer.";
	
	public int insertConsumer(Consumer1 con) {
		int num = session.insert(ns + "insertConsumer", con);
		return num;
	}
	public  Consumer1 selectOne(String id) {
		System.out.println(id + "DAO ok!");
		Consumer1 consumer = session.selectOne(ns + "selectOne", id);
		System.out.println(consumer + "DAO ok!");
		return consumer;
	}
	
	public int updateConsumer(Consumer1 con) {
		int num = session.update(ns + "updateConsumer", con);
		return num;
	}
	
	public int deleteConsumer(String id) {
		int num = session.update(ns + "deleteConsumer", id);
		return num;
	}
	
	public int changePass(String id, String pass) {
		
		Map map = new HashMap();
		map.put("id", id);
		map.put("pass", pass);
		
		int num = session.update(ns + "changePass", map);
		return num;
	}
	
	public List<Consumer1> selectAll() {
		List<Consumer1> list = session.selectList(ns + "ConsumerList");
		return list;
	}
	
	
	public int addUpdateScript(String login) {
		int num = session.update(ns + "addUpdateScript", login);
		return num;
	}
	
	public int deleteUpdateScript(String login) {
		int num = session.update(ns + "deleteUpdateScript", login);
		return num;
	}

	public String submyList(String id) {
		String num = session.selectOne(ns + "submyList", id);
		return num;
	}
	
	public  List<Consumer1> selectOneCon(String cart_serial) {
        List<Consumer1> con = session.selectList(ns + "selectOne", cart_serial);
                return con;
    }
}
