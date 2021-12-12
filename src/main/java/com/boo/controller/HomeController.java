package com.boo.controller;

import java.util.List;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



import com.boo.dto.ProductViewVO;

import com.boo.service.ShopService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	 @Inject
	 ShopService service;
	    
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) throws Exception{
		int cateCode = 100;
		int level = 1;
		List<ProductViewVO> list = null;
		list = service.list(cateCode,level);

		model.addAttribute("list", list);
		
		return "home";
	}
	
	
	
	
}
