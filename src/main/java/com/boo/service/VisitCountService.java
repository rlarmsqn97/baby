package com.boo.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.boo.dao.VisitCountDAO;
import com.boo.dto.VisitVO;

@Service
public class VisitCountService {
	
	@Inject
	private VisitCountDAO dao;
	
	public void visitcount() throws Exception {
		dao.visitcount();
	}
	
	public void totalcount() throws Exception {
		 dao.totalcount();
		
	}
	
	public void todaycount() throws Exception {
		 dao.todaycount();
		
	}
}
