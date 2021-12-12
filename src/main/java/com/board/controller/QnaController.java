package com.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.dto.QnaDto;
import com.board.dto.QnaPageDto;
import com.board.dto.QnaReplyDto;
import com.board.service.QnaReplyService;
import com.board.service.QnaService;

@Controller
@RequestMapping("board/qna/*")
public class QnaController {
	
	@Inject
	QnaService service;
	
	@Inject
	private QnaReplyService replyService;
	
	// Qna 작성
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite() throws Exception {
	

	}

	// Qna 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWrite(QnaDto dto) throws Exception {
		
		service.write(dto);
		
		return "redirect:/board/qna/listPageSearch?num=1";
	}
	
	// Qna 조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("bno") int bno, Model model) throws Exception {
		QnaDto dto = service.view(bno);
		model.addAttribute("view",dto);
		
		// 댓글 조회
		List<QnaReplyDto> reply = null;
		reply = replyService.list(bno);
		model.addAttribute("reply",reply);
	}
	
	// Qna 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("bno") int bno, Model model) throws Exception {
		QnaDto dto = service.view(bno);
		model.addAttribute("view",dto);
		
	}
	
	// Qna 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(QnaDto dto) throws Exception {
		service.modify(dto);

		return "redirect:/board/qna/view?bno=" + dto.getBno();
	}
	
	// Qna 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("bno") int bno) throws Exception {
		service.delete(bno);
		
		return "redirect:/board/qna/listPageSearch?num=1";
	}
	
	// Qna 목록 + 페이징 추가 + 검색
	@RequestMapping(value = "/listPageSearch", method = RequestMethod.GET)
	public void getListPage(Model model, @RequestParam("num") int num, @RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception {
		
		QnaPageDto page = new QnaPageDto();
		
		page.setNum(num);
		page.setCount(service.searchCount(searchType, keyword));
		
		// 검색 타입과 검색어
		page.setSearchType(searchType);
		page.setKeyword(keyword);
		
		
		List<QnaDto> list = null; 
		list = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
		
		model.addAttribute("list",list);
		
		model.addAttribute("page", page);
		
		// 현재 페이지
		model.addAttribute("select", num);
				
	}
	
	
	// 댓글 수정
	@RequestMapping(value = "/qnaReplyModify", method = RequestMethod.GET)
	public void getRModify(@RequestParam("bno") int bno, Model model)throws Exception{
		// 질문
		QnaDto dto = service.view(bno);
		model.addAttribute("view",dto);
		System.out.println(bno);
		// 답글
		List<QnaReplyDto> reply = null;
		reply = replyService.list(bno);
		model.addAttribute("reply",reply);
		 
		
	}
	
	// 댓글 수정
	@RequestMapping(value = "/qnaReplyModify", method = RequestMethod.POST)
	public String postRModify(QnaReplyDto dto) throws Exception {
		
		replyService.modify(dto);
		System.out.println(dto.getRno());
		return "redirect:/board/qna/view?bno=" + dto.getBno();
	}
}