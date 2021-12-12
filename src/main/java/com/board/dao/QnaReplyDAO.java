package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.dto.QnaReplyDto;

@Repository
public class QnaReplyDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.boo.mappers.qnaReplyMapper";
	
	// 댓글 조회
	public List<QnaReplyDto> list(int bno) throws Exception {
		return sql.selectList(namespace + ".qnaReplyList", bno);
	}
	
	// 댓글 작성
	public void write(QnaReplyDto dto) throws Exception {
		sql.insert(namespace + ".qnaReplyWrite", dto);
	}
	
	// 댓글 수정
	public void modify(QnaReplyDto dto) throws Exception {
		sql.update(namespace + ".qnaReplyModify", dto);
	}
	
	// 댓글 삭제
	public void delete(int rno) throws Exception {
		sql.delete(namespace + ".qnaReplyDelete", rno);
	}

}
