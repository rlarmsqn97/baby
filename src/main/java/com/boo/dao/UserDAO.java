package com.boo.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.boo.dto.ProductVO;
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
}

