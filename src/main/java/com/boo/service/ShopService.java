package com.boo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.boo.dao.ShopDAO;
import com.boo.dto.CartListVO;
import com.boo.dto.CartVO;
import com.boo.dto.OrderDetailVO;
import com.boo.dto.OrderListVO;
import com.boo.dto.OrderVO;
import com.boo.dto.ProductViewVO;
@Service
public class ShopService {
	@Inject
	private ShopDAO dao;
	
	public List<ProductViewVO> list(int cateCode,int level)throws Exception{
		int cateCodeRef = 0;  // 카테고리 참조 코드. 없어도 무관
		 
		 if(level == 1) {  // lavel 1 = 1차 분류.
		  
		  cateCodeRef = cateCode;
		  return dao.list(cateCode, cateCodeRef);
		  // 두가지 모두 cateCode로 해도 무관
		  
		 } else {  // lavel 2 = 2차 분류
		  
		  return dao.list(cateCode);
		  
		 }
	}
	
	public ProductViewVO productView(int pdNum) throws Exception{
		return dao.productView(pdNum);
	}
	
	public void addCart(CartVO cart) throws Exception{
		dao.addCart(cart);
	}
	
	public List<CartListVO> cartList(String userId) throws Exception{
		return dao.cartList(userId);
	}
	
	public void deleteCart(CartVO cart) throws Exception {
		dao.deleteCart(cart);
	}
	
	//상품 합계
	public int sumMoney(String userId) throws Exception {
		return dao.sumMoney(userId);
	}
	
	public void orderInfo(OrderVO order) throws Exception {
		dao.orderInfo(order);
	}
	
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		dao.orderInfo_Details(orderDetail);
	}
	
	public void orderInfo_buy(OrderDetailVO orderDetail) throws Exception {
		dao.orderInfo_buy(orderDetail);
	}
	
	public void cartAllDelete(String userId) throws Exception{
		dao.cartAllDelete(userId);
	}
	
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return dao.orderList(order);
	}
	
	public List<OrderListVO> orderView(OrderVO order) throws Exception{
		return dao.orderView(order);
	}
	
	
}
