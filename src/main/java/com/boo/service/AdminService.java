package com.boo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.boo.dao.AdminDAO;
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

@Service
public class AdminService {
	
	@Inject
	AdminDAO dao;
	
	public void register(ProductVO vo) throws Exception{
		dao.register(vo);
	}
	
	public List<ProductVO> productlist() throws Exception{
		return dao.productlist();
	}
	
	
	public List<CategoryVO> category() throws Exception{
		return dao.category();
	}
	
	public ProductViewVO productView(int pdNum) throws Exception{
		return dao.productView(pdNum);
	}
	
	public void pdModify(ProductVO vo) throws Exception{
		dao.pdModify(vo);
	}
	
	public void pdDelete(int pdNum) throws Exception{
		dao.pdDelete(pdNum);
	}
	
	// 주문 목록
	public List<OrderVO> orderList() throws Exception{
		return dao.orderList();
	}
	
	// 특정 주문 목록
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return dao.orderView(order);
	}
	
	// 배송 상태
	public void delivery(OrderVO order) throws Exception {
		dao.delivery(order);
	}
	
	// 상품 수량 조절
	public void changeStock(ProductVO product) throws Exception {
		dao.changeStock(product);
	}
	
	// 회원 목록
	public List<UserVO> userList(UserVO user) throws Exception {
		return dao.userList(user);
	}
	
	// 회원 주문 상세
	public List<UserVO> userDetail(UserVO user) throws Exception {
		return dao.userDetail(user);
	}
	
	// 회원 상세
	public List<UserVO> userView(UserVO user) throws Exception {
		return dao.userView(user);
	}
	
	// 회원 등록
	public void join(UserVO user) throws Exception {
		dao.join(user);
	}

	// 최근 회원
	public List<UserVO> seven(UserVO user) throws Exception {
		return dao.seven(user);
	}
	
	// 배숭준비만 출력
	public List<OrderVO> ready(OrderVO order) throws Exception {
		return dao.ready(order);
	}
	
	// 최근 등록 상품
	public List<ProductVO> nearpd(ProductVO pd) throws Exception {
		return dao.nearpd(pd);
	}
	
	//  판매 순위
	public List<RankVO> rank(RankVO rank) throws Exception {
		return dao.rank(rank);
	}
	
	// 대여안내 등록
	public void guide(GuideVO vo) throws Exception {
		dao.guide(vo);
	}
	
	// 대여안내 수정
	public void guideModify(GuideVO vo) throws Exception {
		dao.guideModify(vo);
	}
	// 대여안내 삭제
	public void guideDelete(GuideVO vo) throws Exception {
		dao.guideDelete(vo);
	}

	// 회사소개 등록
	public void introWrite(IntroVO vo) throws Exception {
		dao.introWrite(vo);
	}

	// 회사소개 수정
	public void introModify(IntroVO vo) throws Exception {
		dao.introModify(vo);
	}

	// 회사소개 삭제
	public void introDelete(IntroVO vo) throws Exception {
		dao.introDelete(vo);
	}

	// 개인정보취급방침 등록
	public void ruleWrite(RuleVO vo) throws Exception {
		dao.ruleWrite(vo);
	}

	// 개인정보취급방침 수정
	public void ruleModify(RuleVO vo) throws Exception {
		dao.ruleModify(vo);
	}

	// 개인정보취급방침 삭제
	public void ruleDelete(RuleVO vo) throws Exception {
		dao.ruleDelete(vo);
	}

	// 이용약관 등록
	public void termsWrite(TermsVO vo) throws Exception {
		dao.termsWrite(vo);
	}

	// 이용약관 수정
	public void termsModify(TermsVO vo) throws Exception {
		dao.termsModify(vo);
	}

	// 이용약관 삭제
	public void termsDelete(TermsVO vo) throws Exception {
		dao.termsDelete(vo);
	}
	

}