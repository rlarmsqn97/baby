package com.board.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.dto.QnaDto;

@Repository
public class QnaDAO {
	@Inject 
	private SqlSession sql;
	
	private static String namespace = "com.boo.mappers.qnaMapper";
	
	// qna 작성
	public void write(QnaDto dto) throws Exception {
		sql.insert(namespace + ".write", dto);
	}
	
	// qna 조회
	public QnaDto view(int bno) throws Exception {
		return sql.selectOne(namespace + ".view", bno);
	}
	
	// qna 수정
	public void modify(QnaDto dto) throws Exception {
		sql.update(namespace + ".modify", dto);
	}
	
	// qna 삭제
	public void delete(int bno) throws Exception {
		sql.delete(namespace + ".delete", bno);
	}
	
	// qna 목록 + 페이징 + 검색
	public List<QnaDto> listPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		
		return sql.selectList(namespace + ".listPage", data);
	}
	
	// qna 총 개수 + 검색
	public int searchCount(String searchType, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		
		return sql.selectOne(namespace + ".searchCount", data);
	}
}

