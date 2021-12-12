package com.boo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.boo.dto.CategoryVO;
import com.boo.dto.ProductVO;
import com.boo.dto.ProductViewVO;
import com.boo.service.AdminService;
import com.boo.utils.UploadFileUtils;

import net.sf.json.JSONArray;

@Controller
@RequestMapping(value = "admin/product/*")
public class ProductController {
	@Inject
	AdminService service;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "/productregister", method = RequestMethod.GET)
	public void getadmin_registerProduct(Model model) throws Exception {
		List<CategoryVO> category = null;
		category = service.category();
		model.addAttribute("category", JSONArray.fromObject(category));
	}
	
	@RequestMapping(value = "/productregister", method = RequestMethod.POST)
	public String postadmin_registerProduct(ProductVO vo, MultipartFile file) throws Exception {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		vo.setPdImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		vo.setPdThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		service.register(vo);
		
		return "redirect:/admin/product/productlist";
	}
	
	@RequestMapping(value = "/productlist", method = RequestMethod.GET)
	public void admin_Productlist(Model model) throws Exception {
		List<ProductVO> list = service.productlist();
		model.addAttribute("list", list);
		System.out.println(list);
		
	}
	
	@RequestMapping(value = "/productview", method = RequestMethod.GET)
	public void productview(@RequestParam("n") int pdNum, Model model) throws Exception {
		ProductViewVO pd = service.productView(pdNum);
		model.addAttribute("pd",pd);
		System.out.println("view페이지의 num값 = "+pd.getPdNum());
		System.out.println("사용연령은 = " + pd.getPdAge());
		System.out.println(pd.getPdThumbImg());
		System.out.println(pd.getPdImg());
		
	}
	
	@RequestMapping(value = "/productmodify", method = RequestMethod.GET)
	public void getProduectModify(@RequestParam("n") int pdNum, Model model) throws Exception {
		ProductViewVO pd = service.productView(pdNum);
		
		model.addAttribute("pd",pd);
		
		List<CategoryVO> category = null;
		category = service.category();
		model.addAttribute("category", JSONArray.fromObject(category));
			
	}
	
	// 상품 수정
	@RequestMapping(value = "/productmodify", method = RequestMethod.POST)
	public String postproductmodify(ProductVO vo,MultipartFile file, HttpServletRequest req) throws Exception {
		// 새로운 파일이 등록되었는지 확인
		 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		  // 기존 파일을 삭제
		  new File(uploadPath + req.getParameter("pdImg")).delete();
		  new File(uploadPath + req.getParameter("pdThumbImg")).delete();
		  
		  // 새로 첨부한 파일을 등록
		  String imgUploadPath = uploadPath + File.separator + "imgUpload";
		  String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		  String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		  
		  vo.setPdImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		  vo.setPdThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		  
		 } else {  // 새로운 파일이 등록되지 않았다면
		  // 기존 이미지를 그대로 사용
		  vo.setPdImg(req.getParameter("gdsImg"));
		  vo.setPdThumbImg(req.getParameter("gdsThumbImg"));
		  
		 }
	service.pdModify(vo);
	System.out.println("수정페이지 num값 " + vo.getPdNum());

	 return "redirect:/admin/product/productlist";
	}
	
	@RequestMapping(value = "/productdelete", method = RequestMethod.POST)
	public String postProductDelte(@RequestParam("n") int pdNum) throws Exception {
		service.pdDelete(pdNum);
		return "redirect:/admin/product/productlist";
	}
	
	// ck 에디터에서 파일 업로드
	@RequestMapping(value = "/ckUpload", method = RequestMethod.POST)
	public void postCKEditorImgUpload(HttpServletRequest req,HttpServletResponse res, @RequestParam MultipartFile upload) throws Exception {

	 
	 // 랜덤 문자 생성
	 UUID uid = UUID.randomUUID();
	 
	 OutputStream out = null;
	 PrintWriter printWriter = null;
	   
	 // 인코딩
	 res.setCharacterEncoding("utf-8");
	 res.setContentType("text/html;charset=utf-8");
	 
	 try {
	  
	  String fileName = upload.getOriginalFilename();  // 파일 이름 가져오기
	  byte[] bytes = upload.getBytes();
	  
	  // 업로드 경로
	  String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;
	  
	  out = new FileOutputStream(new File(ckUploadPath));
	  out.write(bytes);
	  out.flush();  // out에 저장된 데이터를 전송하고 초기화
	  
	  String callback = req.getParameter("CKEditorFuncNum");
	  printWriter = res.getWriter();
	  String fileUrl = "/ckUpload/" + uid + "_" + fileName;  // 작성화면
	  
	  // 업로드시 메시지 출력
	  printWriter.println("<script type='text/javascript'>"
	     + "window.parent.CKEDITOR.tools.callFunction("
	     + callback+",'"+ fileUrl+"','이미지를 업로드하였습니다.')"
	     +"</script>");
	  
	  printWriter.flush();
	  
	 } catch (IOException e) { e.printStackTrace();
	 } finally {
	  try {
	   if(out != null) { out.close(); }
	   if(printWriter != null) { printWriter.close(); }
	  } catch(IOException e) { e.printStackTrace(); }
	 }
	 
	 return; 
	}
	
}


