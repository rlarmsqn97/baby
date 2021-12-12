package com.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.dto.QnaDto;
import com.board.dto.ReviewDto;
import com.board.dto.ReviewPageDto;
import com.board.service.ReviewService;

@Controller
@RequestMapping("board/review")
public class ReviewController {
	@Inject
	ReviewService service;
	
	// 이용후기 작성
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite() throws Exception {
	

	}

	// 이용후기 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWrite(ReviewDto dto) throws Exception {
		
		service.write(dto);
		
		return "redirect:/board/review/listPageSearch?num=1";
	}
	
	// 이용후기 조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("bno") int bno, Model model) throws Exception {
		ReviewDto dto = service.view(bno);
		model.addAttribute("view",dto);
	}
	
	// 이용후기 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("bno") int bno, Model model) throws Exception {
		ReviewDto dto = service.view(bno);
		
		model.addAttribute("view",dto);
		
	}
	
	// 이용후기 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(ReviewDto dto) throws Exception {
		service.modify(dto);

		return "redirect:/board/review/view?bno=" + dto.getBno();
	}
	
	// 이용후기 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("bno") int bno) throws Exception {
		service.delete(bno);
		
		return "redirect:/board/review/listPageSearch?num=1";
	}
	
	// 이용후기 목록 + 페이징 추가 + 검색
	@RequestMapping(value = "/listPageSearch", method = RequestMethod.GET)
	public void getListPage(Model model, @RequestParam("num") int num, @RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception {
		
		ReviewPageDto page = new ReviewPageDto();
		
		page.setNum(num);
		page.setCount(service.searchCount(searchType, keyword));
		
		// 검색 타입과 검색어
		page.setSearchType(searchType);
		page.setKeyword(keyword);
		
		
		List<ReviewDto> list = null; 
		list = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
		
		model.addAttribute("list",list);
		
		model.addAttribute("page", page);
		
		// 현재 페이지
		model.addAttribute("select", num);
		

		
	}

}
