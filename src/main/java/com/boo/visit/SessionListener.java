package com.boo.visit;

import javax.inject.Inject;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.boo.service.VisitCountService;

@WebListener
public class SessionListener implements HttpSessionListener{
	
	@Inject
	VisitCountService service;
	
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
	 
	
		 int todayCount = 0;
	     int totalCount = 0;
	        
	        // 전체 방문자 수 +1
	        try {
	        	 service.visitcount();
	             // 오늘 방문자 수
					/*
					 * todayCount = service.todaycount();
					 * 
					 * // 전체 방문자 수 totalCount = service.totalcount();
					 */
	        } catch (Exception e) {
	               // TODO Auto-generated catch block
	               e.printStackTrace();
	          }


	         
	        HttpSession session = arg0.getSession();
	         
	        // 세션 속성에 담아준다.
	        session.setAttribute("totalCount", totalCount); // 전체 방문자 수
	        session.setAttribute("todayCount", todayCount); // 오늘 방문자 수
	         
	        System.out.println("전체 방문자 수 : " + totalCount);
	        System.out.println("오늘 방문자 수 : " + todayCount);
	    }
	
	@Override
    public void sessionDestroyed(HttpSessionEvent arg0) {
 
    }
}
