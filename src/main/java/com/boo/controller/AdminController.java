package com.boo.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.boo.dto.GuideVO;
import com.boo.dto.IntroVO;
import com.boo.dto.OrderListVO;
import com.boo.dto.OrderVO;
import com.boo.dto.ProductVO;
import com.boo.dto.RankVO;
import com.boo.dto.RuleVO;
import com.boo.dto.TermsVO;
import com.boo.dto.UserVO;
import com.boo.service.AdminService;
import com.boo.service.UserService;

@Controller
@RequestMapping(value = "admin/*")
public class AdminController {
	
	@Inject
	AdminService service;
	@Inject
	UserService uservice;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void getMain(UserVO user,Model model,ProductVO pd,RankVO rank, OrderVO order) throws Exception {
		List<UserVO> seven = service.seven(user);
		List<ProductVO> nearpd = service.nearpd(pd);
		List<OrderVO> ready = service.ready(order);
		List<RankVO> ranking = service.rank(rank);
		
		model.addAttribute("rank",ranking);
		model.addAttribute("ready",ready);
		model.addAttribute("nearpd",nearpd);
		model.addAttribute("seven",seven);
		
	}
		
	// 주문 목록
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public void getOrderList(Model model) throws Exception {
		List<OrderVO> orderList = service.orderList();
		model.addAttribute("orderList",orderList);
	}
	
	// 주문 상세 목록 
	@RequestMapping(value = "/orderView", method = RequestMethod.GET)
	public void getOrderList(@RequestParam("n") String orderId,OrderVO order, Model model) throws Exception {
		order.setOrderId(orderId);
		List<OrderListVO> orderView = service.orderView(order);
		
		model.addAttribute("orderView",orderView);
		System.out.println(order.getOrderId());
	}
	
	// 주문 상세 목록 - 상태 변경
	@RequestMapping(value = "/orderView", method = RequestMethod.POST)
	public String delivery(OrderVO order) throws Exception {
		
		service.delivery(order);
		
		List<OrderListVO> orderView = service.orderView(order);
		ProductVO product = new ProductVO();
		
		for(OrderListVO i : orderView) {
			product.setPdNum(i.getPdNum());
			product.setPdStock(i.getCartStock());
			service.changeStock(product);
		}
		
		
		return "redirect:/admin/orderList";
	}
	
	// 회원목록
	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public void getUserList(Model model,UserVO user) throws Exception {
		List<UserVO> userList = service.userList(user);
		model.addAttribute("userList",userList);

	}
	
	// 회원상세
	@RequestMapping(value = "/userDetail", method = RequestMethod.GET)
	public void getUserDetail(@RequestParam("n") String userId,Model model,UserVO user) throws Exception {
		
		user.setUserId(userId);
		List<UserVO> userDetail = service.userDetail(user);
		List<UserVO> userView = service.userView(user);
		
		model.addAttribute("userView",userView);
		model.addAttribute("userDetail",userDetail);
		System.out.println(userId);
	}
	// 주문내역이있으면 요거 없으면 요거 해서 뷰로 넘김 주문내역이있는지 없는지 판단할수있는것은
	
	// 회원등록
	@RequestMapping(value = "/userRegister", method = RequestMethod.GET)
	public void getUserRegister() {
		
	}
	
	// 회원등록
	@RequestMapping(value = "/userRegister", method = RequestMethod.POST)
	public String postUserRegister(UserVO user) throws Exception{
		service.join(user);
		
		return "redirect:/admin/userList";
	}
	
	// 대여안내
	@RequestMapping(value = "/guide", method = RequestMethod.GET)
	public void getGuide() throws Exception {
		
	}

	// 대여안내
	@RequestMapping(value = "/guide", method = RequestMethod.POST)
	public String postGuide(GuideVO vo) throws Exception {
		service.guide(vo);
		return "redirect:/user/guide";
	}
	
	// 대여안내 수정
	@RequestMapping(value = "/guidemodify", method = RequestMethod.GET)
	public void getGuideModify(GuideVO vo,Model model) throws Exception {
		GuideVO guide = uservice.guideList(vo);
		model.addAttribute("guide", guide);
	}

	// 대여안내 수정
	@RequestMapping(value = "/guidemodify", method = RequestMethod.POST)
	public String postGuideModify(GuideVO vo) throws Exception {
		service.guideModify(vo);
		return "redirect:/user/guide";
	}
	
	// 대여안내
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String postGuideDelete(GuideVO vo) throws Exception {
		service.guideDelete(vo);
		return "redirect:/user/guide";
	}
	
	// 회사소개
	@RequestMapping(value = "/introduce", method = RequestMethod.GET)
	public void getintroduce() throws Exception {

	}

	// 회사소개
	@RequestMapping(value = "/introduce", method = RequestMethod.POST)
	public String postintroduce(IntroVO vo) throws Exception {
		service.introWrite(vo);
		return "redirect:/user/introduce";
	}

	// 회사소개
	@RequestMapping(value = "/introducemodify", method = RequestMethod.GET)
	public void getintroduceModify(IntroVO vo, Model model) throws Exception {
		IntroVO introduce = uservice.introList(vo);
		model.addAttribute("introduce", introduce);
	}

	// 회사소개
	@RequestMapping(value = "/introducemodify", method = RequestMethod.POST)
	public String postintroduceModify(IntroVO vo) throws Exception {
		service.introModify(vo);
		return "redirect:/user/introduce";
	}

	// 회사소개
	@RequestMapping(value = "/introducedelete", method = RequestMethod.GET)
	public String postintroduceDelete(IntroVO vo) throws Exception {
		service.introDelete(vo);
		return "redirect:/user/introduce";
	}
	
	// 개인정보취급방침
	@RequestMapping(value = "/rulewrite", method = RequestMethod.GET)
	public void getRule() throws Exception {

	}

	// 개인정보취급방침
	@RequestMapping(value = "/rulewrite", method = RequestMethod.POST)
	public String postRule(RuleVO vo) throws Exception {
		service.ruleWrite(vo);
		return "redirect:/user/rule";
	}

	// 개인정보취급방침
	@RequestMapping(value = "/rulemodify", method = RequestMethod.GET)
	public void getruleModify(RuleVO vo, Model model) throws Exception {
		RuleVO rule = uservice.ruleList(vo);
		model.addAttribute("rule", rule);
	}

	// 개인정보취급방침
	@RequestMapping(value = "/rulemodify", method = RequestMethod.POST)
	public String postruleModify(RuleVO vo) throws Exception {
		service.ruleModify(vo);
		return "redirect:/user/rule";
	}

	// 개인정보취급방침
	@RequestMapping(value = "/ruledelete", method = RequestMethod.GET)
	public String postruleDelete(RuleVO vo) throws Exception {
		service.ruleDelete(vo);
		return "redirect:/user/rule";
	}

	// 이용약관
	@RequestMapping(value = "/termswrite", method = RequestMethod.GET)
	public void getterms() throws Exception {

	}

	// 이용약관
	@RequestMapping(value = "/termswrite", method = RequestMethod.POST)
	public String postterms(TermsVO vo) throws Exception {
		service.termsWrite(vo);
		return "redirect:/user/terms";
	}

	// 이용약관
	@RequestMapping(value = "/termsmodify", method = RequestMethod.GET)
	public void gettermsModify(TermsVO vo, Model model) throws Exception {
		TermsVO terms = uservice.termsList(vo);
		model.addAttribute("terms", terms);
	}

	// 이용약관
	@RequestMapping(value = "/termsmodify", method = RequestMethod.POST)
	public String posttermsModify(TermsVO vo) throws Exception {
		service.termsModify(vo);
		return "redirect:/user/terms";
	}

	// 이용약관
	@RequestMapping(value = "/termsdelete", method = RequestMethod.GET)
	public String posttermsDelete(TermsVO vo) throws Exception {
		service.termsDelete(vo);
		return "redirect:/user/terms";
	}
}
