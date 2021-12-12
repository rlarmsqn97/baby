package com.boo.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.boo.dao.UserDAO;
import com.boo.dto.GuideVO;
import com.boo.dto.IntroVO;
import com.boo.dto.RuleVO;
import com.boo.dto.TermsVO;
import com.boo.dto.UserVO;

@Service
public class UserService {
	
	@Inject
	private UserDAO dao;
	
	public void join(UserVO vo) throws Exception {
		dao.join(vo);
	}
	
	public UserVO login(UserVO vo) throws Exception {
		return dao.login(vo);
	}
	
	public void logout(HttpSession session) throws Exception {
		session.invalidate();
	}
	
	public void modify(UserVO vo) throws Exception {
		dao.modify(vo);
	}
	
	// 회원탈퇴
	public void delete(UserVO vo) throws Exception {
		dao.delete(vo);
	}
	
	// 대여안내글
	public GuideVO guideList(GuideVO vo) throws Exception {
		return dao.guideList(vo);
	}
	
	// 회사소개
	public IntroVO introList(IntroVO vo) throws Exception {
		return dao.introList(vo);
	}

	// 개인정보취급방침
	public RuleVO ruleList(RuleVO vo) throws Exception {
		return dao.ruleList(vo);
	}

	// 이용약관
	public TermsVO termsList(TermsVO vo) throws Exception {
		return dao.termsList(vo);
	}
}

