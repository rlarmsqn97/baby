package com.boo.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.boo.dto.CategoryVO;
import com.boo.dto.OrderListVO;
import com.boo.dto.OrderVO;
import com.boo.dto.ProductVO;
import com.boo.dto.ProductViewVO;
import com.boo.dto.RankVO;
import com.boo.dto.UserVO;

@Repository
public class AdminDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.boo.mappers.adminMapper";
	
	public void register(ProductVO vo) throws Exception{
		sql.insert(namespace + ".register", vo);
	}
	
	public List<ProductVO> productlist() throws Exception {
		return sql.selectList(namespace + ".productlist");
	}
	
	public List<CategoryVO> category() throws Exception {
		return sql.selectList(namespace + ".category");
	}
	public ProductViewVO productView(int pdNum) throws Exception{
		return sql.selectOne(namespace + ".productView",pdNum);
	}
	
	public void pdModify(ProductVO vo) throws Exception{
		sql.update(namespace+".pdModify", vo);
	}
	
	public void pdDelete(int pdNum) throws Exception{
		sql.delete(namespace+".pdDelete", pdNum);
	}
	
	//주문 목록
	public List<OrderVO> orderList() throws Exception {
		return sql.selectList(namespace + ".orderList");
	}
	
	// 특정 주문 목록
	public List<OrderListVO> orderView(OrderVO order) throws Exception{
		return sql.selectList(namespace + ".orderView",order);
	}
	
	// 배송 상태
	public void delivery(OrderVO order) throws Exception {
		sql.update(namespace + ".delivery", order);
	}
	
	// 상품 수량 조절
	public void changeStock(ProductVO product) throws Exception{
		sql.update(namespace + ".changeStock", product);
	}
	
	// 회원 목록
	public List<UserVO> userList(UserVO user) throws Exception {
		return sql.selectList(namespace + ".userList", user);
	}
	
	// 회원 주문 상세
	public List<UserVO> userDetail(UserVO user) throws Exception {
		return sql.selectList(namespace + ".userDetail", user);
	}
	
	// 회원 상세
	public List<UserVO> userView (UserVO user) throws Exception {
		return sql.selectList(namespace + ".userView", user);
	}
	
	// 회원 등록
	public void join(UserVO user) throws Exception {
		sql.insert(namespace + ".join", user);
	}
	
	// 츠근 가입 회원
	public List<UserVO> seven(UserVO user) throws Exception {
		return sql.selectList(namespace + ".seven",user);
	}
	
	// 배숭준비만 출력
	public List<OrderVO> ready(OrderVO order) throws Exception {
		return sql.selectList(namespace + ".ready", order);
	}
	
	// 최근 등록 상품
	public List<ProductVO> nearpd(ProductVO pd) throws Exception {
		return sql.selectList(namespace + ".nearpd", pd);
	}
	
	//  판매 순위
	public List<RankVO> rank(RankVO rank) throws Exception {
		return sql.selectList(namespace + ".rank", rank);
	}
}



