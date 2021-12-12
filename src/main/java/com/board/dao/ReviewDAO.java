package com.board.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.dto.QnaDto;
import com.board.dto.ReviewDto;

@Repository
public class ReviewDAO {
	@Inject 
	private SqlSession sql;
private static String namespace = "com.boo.mappers.reviewMapper";
	
	// 리뷰 작성
	public void write(ReviewDto dto) throws Exception {
		sql.insert(namespace + ".write", dto);
	}
	
	// 리뷰 조회
	public ReviewDto view(int bno) throws Exception {
		return sql.selectOne(namespace + ".view", bno);
	}
	
	// 리뷰 수정
	public void modify(ReviewDto dto) throws Exception {
		sql.update(namespace + ".modify", dto);
	}
	
	// 리뷰 삭제
	public void delete(int bno) throws Exception {
		sql.delete(namespace + ".delete", bno);
	}
	
	// 리뷰 목록 + 페이징 + 검색
	public List<ReviewDto> listPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		
		return sql.selectList(namespace + ".listPage", data);
	}
	
	// 리뷰 총 개수 + 검색
	public int searchCount(String searchType, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		
		return sql.selectOne(namespace + ".searchCount", data);
	}
}
