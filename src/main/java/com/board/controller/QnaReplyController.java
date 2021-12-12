package com.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.dto.QnaDto;
import com.board.dto.QnaReplyDto;
import com.board.service.QnaReplyService;
import com.board.service.QnaService;

@Controller
@RequestMapping("reply/*")
public class QnaReplyController {
	
	@Inject
	QnaReplyService service;
		
	// 댓글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWrite(QnaReplyDto dto) throws Exception {
		service.write(dto);
		
		return "redirect:/board/qna/view?bno=" + dto.getBno();
	}
		
	// 댓글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("rno")int rno, @RequestParam("bno")int bno) throws Exception {
		service.delete(rno);
		System.out.println(bno);
		return "redirect:/board/qna/view?bno=" + bno;
	}
	
}
