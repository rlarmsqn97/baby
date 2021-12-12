package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.QnaReplyDAO;
import com.board.dto.QnaReplyDto;

@Service
public class QnaReplyService {
	
	@Inject 
	private QnaReplyDAO dao;
	
	public List<QnaReplyDto> list(int bno) throws Exception {
		return dao.list(bno);
	}
	
	public void write(QnaReplyDto dto) throws Exception {
		dao.write(dto);
	}
	
	public void modify(QnaReplyDto dto) throws Exception {
		dao.modify(dto);
	}
	
	public void delete(int rno) throws Exception {
		dao.delete(rno);
	}
}
