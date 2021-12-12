package com.boo.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.boo.dto.GuideVO;
import com.boo.dto.IntroVO;
import com.boo.dto.RuleVO;
import com.boo.dto.TermsVO;
import com.boo.dto.UserVO;

@Repository
public class UserDAO{
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.boo.mappers.memberMapper";
	
	public void join(UserVO vo) throws Exception {
		sql.insert(namespace + ".join", vo);
	}
	
	public UserVO login(UserVO vo) throws Exception {
		return sql.selectOne(namespace + ".login", vo);
	}
	
	public void modify(UserVO vo) throws Exception {
		sql.update(namespace + ".modify", vo);
	}
	
	// 회원탈퇴
	public void delete(UserVO vo) throws Exception{
		sql.delete(namespace + ".delete", vo);
	}
	
	// 대여안내글
	public GuideVO guideList(GuideVO vo) throws Exception {
		return sql.selectOne(namespace + ".guideList", vo);
	}
	
	// 회사소개
	public IntroVO introList(IntroVO vo) throws Exception {
		return sql.selectOne(namespace + ".introList", vo);
	}

	// 개인정보취급방침
	public RuleVO ruleList(RuleVO vo) throws Exception {
		return sql.selectOne(namespace + ".ruleList", vo);
	}

	// 이용약관
	public TermsVO termsList(TermsVO vo) throws Exception {
		return sql.selectOne(namespace + ".termsList", vo);
	}

}

