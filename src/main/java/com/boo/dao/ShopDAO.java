package com.boo.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.boo.dto.CartListVO;
import com.boo.dto.CartVO;
import com.boo.dto.OrderDetailVO;
import com.boo.dto.OrderListVO;
import com.boo.dto.OrderVO;
import com.boo.dto.ProductViewVO;

@Repository
public class ShopDAO {
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.boo.mappers.shopMapper";
	
	public List<ProductViewVO> list(int cateCode,int cateCodeRef) throws Exception{
		 HashMap<String, Object> map = new HashMap<String, Object>();
		 
		 map.put("cateCode", cateCode);
		 map.put("cateCodeRef", cateCodeRef);
		 
		 return sql.selectList(namespace + ".list_1", map);
	}
	
	public List<ProductViewVO> list(int cateCode) throws Exception{
		return sql.selectList(namespace + ".list_2", cateCode);
	}
	
	public ProductViewVO productView(int pdNum) throws Exception{
		return sql.selectOne(namespace + ".productView",pdNum);
	}
	
	public void addCart(CartVO cart) throws Exception{
		sql.insert(namespace + ".addCart", cart);
	}
	
	public List<CartListVO> cartList(String userId) throws Exception{
		return sql.selectList(namespace + ".cartList", userId);
	}
	
	public void deleteCart(CartVO cart) throws Exception {
		sql.delete(namespace + ".deleteCart", cart);
	}
	
	//장바구니 금액 합계
	public int sumMoney(String userId) throws Exception {
		sql.selectOne(namespace + ".sumMoney",userId);
		return sql.selectOne(namespace + ".sumMoney",userId);
	}
	
	public void orderInfo(OrderVO order) throws Exception {
		sql.insert(namespace + ".orderInfo", order);
	}
	
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		sql.insert(namespace + ".orderInfo_Details", orderDetail);
	}
	
	public void orderInfo_buy(OrderDetailVO orderDetail) throws Exception {
		sql.insert(namespace + ".orderInfo_buy",orderDetail);
	}
	public void cartAllDelete(String userId) throws Exception {
		sql.delete(namespace+ ".cartAllDelete", userId);
	}
	
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return sql.selectList(namespace + ".orderList", order);
	}
	
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return sql.selectList(namespace + ".orderView", order);
	}
	
}
