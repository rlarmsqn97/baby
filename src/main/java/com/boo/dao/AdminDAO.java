package com.boo.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.boo.dto.CategoryVO;
import com.boo.dto.GuideVO;
import com.boo.dto.IntroVO;
import com.boo.dto.OrderListVO;
import com.boo.dto.OrderVO;
import com.boo.dto.ProductVO;
import com.boo.dto.ProductViewVO;
import com.boo.dto.RankVO;
import com.boo.dto.RuleVO;
import com.boo.dto.TermsVO;
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
	
	// 대여안내 등록
	public void guide(GuideVO vo) throws Exception{
		sql.insert(namespace + ".guide", vo);
	}
	
	// 대여안내 수정
	public void guideModify(GuideVO vo) throws Exception {
		sql.update(namespace + ".guideModify", vo);
	}
	// 대여안내 삭제
	public void guideDelete(GuideVO vo) throws Exception {
		sql.delete(namespace + ".guideDelete", vo);
	}
	
	// 회사소개 등록
	public void introWrite(IntroVO vo) throws Exception{
		sql.insert(namespace + ".introWrite", vo);
	}
	
	// 회사소개 수정
	public void introModify(IntroVO vo) throws Exception {
		sql.update(namespace + ".introModify", vo);
	}
	// 회사소개 삭제
	public void introDelete(IntroVO vo) throws Exception {
		sql.delete(namespace + ".introDelete", vo);
	}	
	
	// 개인정보취급방침 등록
	public void ruleWrite(RuleVO vo) throws Exception{
		sql.insert(namespace + ".ruleWrite", vo);
	}
	
	// 개인정보취급방침 수정
	public void ruleModify(RuleVO vo) throws Exception {
		sql.update(namespace + ".ruleModify", vo);
	}
	// 개인정보취급방침 삭제
	public void ruleDelete(RuleVO vo) throws Exception {
		sql.delete(namespace + ".ruleDelete", vo);
	}	
	
	// 이용약관 등록
	public void termsWrite(TermsVO vo) throws Exception{
		sql.insert(namespace + ".termsWrite", vo);
	}
	
	// 이용약관 수정
	public void termsModify(TermsVO vo) throws Exception {
		sql.update(namespace + ".termsModify", vo);
	}
	// 이용약관 삭제
	public void termsDelete(TermsVO vo) throws Exception {
		sql.delete(namespace + ".termsDelete", vo);
	}	
	
} 



