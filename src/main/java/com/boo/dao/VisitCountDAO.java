package com.boo.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.boo.dto.VisitVO;

@Repository
public class VisitCountDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.boo.mappers.visitcountMapper";
	
	public void visitcount() throws Exception {
		sql.insert(namespace + ".visitcount");
	}
	
	public void totalcount() throws Exception {
		 sql.selectOne(namespace + ".totalcount");
	}
	
	public void todaycount() throws Exception {
		 sql.selectOne(namespace + ".todaycount");
	}

}
