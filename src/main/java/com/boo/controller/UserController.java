package com.boo.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boo.dto.UserVO;
import com.boo.service.UserService;


@Controller
@RequestMapping("user/*")
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Inject 
	UserService service;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void getjoin() throws Exception{
		
	}
	
	// 회원 가입 post
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String postjoin(UserVO vo) throws Exception {
	  
	 String inputPass = vo.getUserPw();
	 String pass = passEncoder.encode(inputPass);
	 vo.setUserPw(pass);

	 service.join(vo);

	 return "redirect:/";
	}
	
	// 로그인  get
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void getlogin() throws Exception {
	 logger.info("get login");
	}

	// 로그인 post
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String postlogin(UserVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
	 logger.info("post signin");
	   
	 UserVO login = service.login(vo);  
	 HttpSession session = req.getSession();
	 
	 boolean passMatch = passEncoder.matches(vo.getUserPw(), login.getUserPw());
	 
	 if(login != null && passMatch) {
	  session.setAttribute("user", login);
	 } else {
	  session.setAttribute("user", null);
	  rttr.addFlashAttribute("msg", false);
	  return "redirect:/user/login";
	 }  
	 
	 return "redirect:/";
	}
	  
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String signout(HttpSession session) throws Exception {
	 logger.info("get logout");
	 
	 service.logout(session);
	   
	 return "redirect:/";
	}
	
	// 정보수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify() {
		
	}
	
	// 정보수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(UserVO vo,HttpSession session) throws Exception{
	
		service.modify(vo);
		
		session.invalidate();
		
		return "redirect:/user/login";
				
	}
	
	// 회원탈퇴
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void getDelete() {
		
	}
	
	// 회원탈퇴
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String postDelete(UserVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		logger.info("회원탈퇴!");
		UserVO user = (UserVO) session.getAttribute("user");
		String sessionPw = user.getUserPw();
		String voPw = vo.getUserPw();
		
		System.out.println(sessionPw);
		System.out.println(voPw);
		System.out.println(vo.getUserId());
		boolean passMatch = passEncoder.matches(voPw, sessionPw);
		System.out.println(passMatch);
		
		if(passMatch != true) {
			rttr.addFlashAttribute("msg",false);
			return "redirect:/user/mypage";
		}	else {	
		service.delete(vo);
		session.invalidate();
		return "redirect:/";
		}
		
	}
	
	// 마이페이지
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public void mypage() throws Exception {
		
	}
	
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String a() {
		return "about";
	}
	
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String c() {
		return "contact";
	}
	
	@RequestMapping(value = "/pricing", method = RequestMethod.GET)
	public String p() {
		return "pricing";
	}
	
	@RequestMapping(value = "/work", method = RequestMethod.GET)
	public String w() {
		return "work";
	}
	
	@RequestMapping(value = "/work-single", method = RequestMethod.GET)
	public String ws() {
		return "work-single";
	}
	
	
	@RequestMapping(value = "/guide", method = RequestMethod.GET)
	public void guide() {
	
	}
	
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public void qna() {
		
	}
	
	

	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public void review() {
		
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void write() {
		
	}
	
	@RequestMapping(value = "/writedetail", method = RequestMethod.GET)
	public String writedetail() {
		return "writedetail";
	}
	
	@RequestMapping(value = "/productdetail", method = RequestMethod.GET)
	public void productdetail() {
		
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public void cart() {
		
	}
	
	@RequestMapping(value = "/user1", method = RequestMethod.GET)
	public void user1() {
		
	}
}
