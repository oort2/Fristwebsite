package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Drink;
import model.Subscript;

@Repository
public class SubscriptMybatisDao {

	@Autowired
	SqlSessionTemplate session;
	
	private static final String ns = "subscript.";
	
	public int updateInsertDrink(String serial) {
		int dnum = session.update(ns + "updateInsertDrink", serial);
		return dnum;
	}
	
	public int updateDeleteDrink(String serial) {
		int dnum = session.update(ns + "updateDeleteDrink",  serial);
		return dnum;
	}
	
	public Subscript selectOne(String serial) {
		Subscript sub = session.selectOne(ns + "selectOne", serial);
		return sub;
	}
	
	public List<Drink> selectAll() {
		List<Drink> list = session.selectList(ns + "drinkList");
		return list;
	}
	
	public int insertSubscript(String serial) {
		int num = session.insert(ns + "insertSubscript", serial);
		return num;
	}
	
	public int deleteSubscript(String serial) {
		int num = session.insert(ns + "deleteSubscript", serial);
		return num;
	}
}
