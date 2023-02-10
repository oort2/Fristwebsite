package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Interest;
import model.Board;
import model.Drink;

@Repository
public class DrinkMybatisDao {

	@Autowired
	SqlSessionTemplate session;

	private static final String ns = "drink.";
	Map map = new HashMap();

	public int insertDrink(Drink drink) { 
		int num = session.insert(ns + "insertDrink", drink);
		return num;
	}

	public Drink selectOne(String serial) { 
		Drink drink = session.selectOne(ns + "selectOne", serial);
		return drink;
	}

	public int updateDrink(Drink drink) { 
		int num = session.update(ns + "updateDrink", drink);
		return num;
	}

	public int deleteDrink(String serial) { 
		int num = session.update(ns + "deleteDrink", serial);
		return num;
	}

	public List<Drink> selectAll() { 
		List<Drink> list = session.selectList(ns + "drinkList");
		return list;
	}

	public List<Drink> selectInterest(String drinkserial, String consumerid) { 
		map.clear();
		map.put("consumerid", consumerid);
		System.out.println(map);
		List<Drink> inter = session.selectList(ns + "selectInterest", map);
		return inter;
	}

	public List<Drink> selectAllsaled() { 
		List<Drink> list = session.selectList(ns + "drinkListsaled");
		return list;
	}

	public List<Drink> selectAllhigh() { 
		List<Drink> list = session.selectList(ns + "drinkListhigh");
		return list;
	}

	public List<Drink> selectAlllow() { 
		List<Drink> list = session.selectList(ns + "drinkListlow");
		return list;
	}

	public List<Drink> selectAllricewine() { 
		List<Drink> list = session.selectList(ns + "drinkListricewine");
		return list;
	}

	public List<Drink> selectAllsoju() { 
		List<Drink> list = session.selectList(ns + "drinkListsoju");
		return list;
	}

	public List<Drink> selectLocation(String location) { 
		System.out.println("dao1" + location);
		List<Drink> list = session.selectList(ns + "selectLocation", location);
		System.out.println("dao2" + list);
		return list;

	}
	
	
	public List <Drink> selectOrderOne(String cart_serial) { 
		List <Drink> list = session.selectList(ns + "selectOrderOne", cart_serial);
		return list;
	}
	
	public List <Drink> selectOrderList(String cart_serial) { 
		List <Drink> list = session.selectList(ns + "selectOrderList", cart_serial);
		return list;
	}
	
	public Drink selectsearch(String name) { // 상품정보 선택
		Drink drink = session.selectOne(ns + "selectsearch", name);
		return drink;
	}
}


