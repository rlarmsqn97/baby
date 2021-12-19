package com.boo.controller;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.expression.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boo.dto.CartListVO;
import com.boo.dto.CartVO;
import com.boo.dto.OrderDetailVO;
import com.boo.dto.OrderListVO;
import com.boo.dto.OrderVO;
import com.boo.dto.ProductViewVO;
import com.boo.dto.UserVO;
import com.boo.service.ShopService;

@Controller
@RequestMapping(value = "shop/*")
public class ShopController {

 private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
 
 @Inject
 ShopService service;
    
	// 카테고리별 상품 리스트
	@RequestMapping(value = "/products", method = RequestMethod.GET)
	public void getproducts(@RequestParam("c") int cateCode, @RequestParam("l") int level, Model model) throws Exception {
		logger.info("get llist");

		List<ProductViewVO> list = null;
		list = service.list(cateCode,level);

		model.addAttribute("list", list);
		
	}

	@RequestMapping(value = "/productdetail", method = RequestMethod.GET)
	public void getproductDetail(@RequestParam("n") int pdNum, Model model) throws Exception{
		ProductViewVO view = service.productView(pdNum);
		
		model.addAttribute("view",view);
	
	}
	
	@ResponseBody
	@RequestMapping(value = "/productdetail/addCart", method = RequestMethod.POST)
	public int addCart(CartVO cart, HttpSession session) throws Exception {
		int result = 0;
		UserVO user = (UserVO)session.getAttribute("user");
		if(user != null) {
			cart.setUserId(user.getUserId());
			service.addCart(cart);
			result = 1;
		}
		System.out.println(cart.getPdNum());
		return result;		
	}
	
	@RequestMapping(value="/cart", method = RequestMethod.GET)
	public Model getCartList(HttpSession session, Model model) throws Exception{
		logger.info("get cart list");
		UserVO user = (UserVO)session.getAttribute("user");
		String userId = user.getUserId();
		Map<String,Object> map = new HashMap<String,Object>();
		int sumMoney = service.sumMoney(userId); //전체금액
		
		List<CartListVO> cartList = service.cartList(userId);
		
		model.addAttribute("cartList",cartList);
		map.put("sumMoney", sumMoney);	
		System.out.println(sumMoney);
		
		return model;	
	}
	
	// 카트 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int deleteCart(HttpSession session,  @RequestParam(value = "chbox[]") List<String> chArr, CartVO cart) throws Exception {
		 
		 UserVO user = (UserVO)session.getAttribute("user");
		 String userId = user.getUserId();
		 
		 int result = 0;
		 int cartNum = 0;
		 
		 
		 if(user != null) {
		  cart.setUserId(userId);
		  
		  for(String i : chArr) {   
		   cartNum = Integer.parseInt(i);
		   cart.setCartNum(cartNum);
		   service.deleteCart(cart);
		  }   
		  result = 1;
		 }  
		 return result;  
		}
	
	
	// 장바구니 주문
	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	public String order(HttpSession session, OrderVO order, OrderDetailVO orderDetail,Model model) throws Exception {
		UserVO user = (UserVO)session.getAttribute("user");
		String userId = user.getUserId();
		model.addAttribute("user",user);
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		
		for(int i = 1; i <= 6; i++) {
			subNum += (int)(Math.random() * 10);
		}
		
		String orderId = ymd + "_" + subNum;
		order.setOrderId(orderId);
		order.setUserId(userId);
		
		service.orderInfo(order);
		
		orderDetail.setOrderId(orderId);
		service.orderInfo_Details(orderDetail);
		
		service.cartAllDelete(userId);
		
		return "redirect:/shop/orderList";

	}
	
	//주문 목록
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, OrderVO order, Model model) throws Exception {
		UserVO user = (UserVO)session.getAttribute("user");
		String userId = user.getUserId();
		
		order.setUserId(userId);
		
		List<OrderVO> orderList = service.orderList(order);
		
		model.addAttribute("orderList",orderList);
	}
	
	
	// 주문 상세 목록
	@RequestMapping(value = "/orderView", method = RequestMethod.GET)
	public void getOrderList(HttpSession session,@RequestParam("n") String orderId,OrderVO order,Model model) throws Exception {
		UserVO user = (UserVO)session.getAttribute("user");
		String userId = user.getUserId();
		
		order.setUserId(userId);
		order.setOrderId(orderId);
		
		List<OrderListVO> orderView = service.orderView(order);
		
		model.addAttribute("orderView",orderView);
	}
	
	// 단일 상품 주문
	@RequestMapping(value = "/buy", method = RequestMethod.GET)
	public void getBuy(Model model,String startDate,String endDate,String pdnum,String cartStock) throws Exception{
		
		long calDateDays = 0;
		
		 try{ // String Type을 Date Type으로 캐스팅하면서 생기는 예외로 인해 여기서 예외처리 해주지 않으면 컴파일러에서 에러가 발생해서 컴파일을 할 수 없다.
		        SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
		        // date1, date2 두 날짜를 parse()를 통해 Date형으로 변환.
		        Date FirstDate = format.parse(startDate);
		        Date SecondDate = format.parse(endDate);
		        
		        // Date로 변환된 두 날짜를 계산한 뒤 그 리턴값으로 long type 변수를 초기화 하고 있다.
		        // 연산결과 -950400000. long type 으로 return 된다.
		        long calDate = FirstDate.getTime() - SecondDate.getTime(); 
		        
		        // Date.getTime() 은 해당날짜를 기준으로1970년 00:00:00 부터 몇 초가 흘렀는지를 반환해준다. 
		        // 이제 24*60*60*1000(각 시간값에 따른 차이점) 을 나눠주면 일수가 나온다.
		        calDateDays = calDate / ( 24*60*60*1000); 
		 
		        calDateDays = Math.abs(calDateDays);
		        
		        System.out.println("두 날짜의 날짜 차이: "+calDateDays);
		        
		        }
		        catch(ParseException e)
		        {
		            // 예외 처리
		        }

		int pdNum = Integer.parseInt(pdnum); 
		/*
		 * String cartStock = (String) param.get("cartStock"); String startDate =
		 * (String) param.get("startDate"); String endDate = (String)
		 * param.get("endDate");
		 */
	
		
		ProductViewVO view = service.productView(pdNum);
		
		model.addAttribute("view",view);		
		model.addAttribute("s",startDate);
		model.addAttribute("e",endDate);
		model.addAttribute("c",cartStock);
		model.addAttribute("d",calDateDays);
		
		/*
		 * System.out.println("pdNum : " + pdNum); System.out.println(cartStock);
		 * System.out.println(startDate); System.out.println(endDate);
		 */
	}
	
	// 단일 상품 주문
	@RequestMapping(value = "/buy", method = RequestMethod.POST)
	public String postBuy(HttpSession session, OrderVO order, OrderDetailVO orderDetail,Model model) throws Exception {
		
		UserVO user = (UserVO)session.getAttribute("user");
		String userId = user.getUserId();
		model.addAttribute("user",user);
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		
		for(int i = 1; i <= 6; i++) {
			subNum += (int)(Math.random() * 10);
		}
		
		String orderId = ymd + "_" + subNum;
		order.setOrderId(orderId);
		order.setUserId(userId);
		
		service.orderInfo(order);
		
		orderDetail.setOrderId(orderId);
		service.orderInfo_buy(orderDetail);
		
		
		return "redirect:/shop/orderList";
	}
	
}