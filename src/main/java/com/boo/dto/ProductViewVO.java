package com.boo.dto;

import java.util.Date;

public class ProductViewVO {
	
	private int pdNum;
	private String pdName;
	private String pdPrice;
	private String cateCode;
	private String pdDes;
	private String pdImg;
	private String pdAge;
	private Date pdDate;
	private int pdStock;
	private String pdThumbImg;
	private String cateCodeRef;
	private String cateName;
	private String startDate;
	private String endDate;
	
	
	
	
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getPdStock() {
		return pdStock;
	}
	public void setPdStock(int pdStock) {
		this.pdStock = pdStock;
	}
	public String getPdThumbImg() {
		return pdThumbImg;
	}
	public void setPdThumbImg(String pdThumbImg) {
		this.pdThumbImg = pdThumbImg;
	}
	public String getPdAge() {
		return pdAge;
	}
	public void setPdAge(String pdAge) {
		this.pdAge = pdAge;
	}
	public int getPdNum() {
		return pdNum;
	}
	public void setPdNum(int pdNum) {
		this.pdNum = pdNum;
	}
	public String getPdName() {
		return pdName;
	}
	public void setPdName(String pdName) {
		this.pdName = pdName;
	}
	public String getPdPrice() {
		return pdPrice;
	}
	public void setPdPrice(String pdPrice) {
		this.pdPrice = pdPrice;
	}
	public String getPdDes() {
		return pdDes;
	}
	public void setPdDes(String pdDes) {
		this.pdDes = pdDes;
	}
	public String getPdImg() {
		return pdImg;
	}
	public void setPdImg(String pdImg) {
		this.pdImg = pdImg;
	}
	public Date getPdDate() {
		return pdDate;
	}
	public void setPdDate(Date pdDate) {
		this.pdDate = pdDate;
	}
	public String getCateCodeRef() {
		return cateCodeRef;
	}
	public void setCateCodeRef(String cateCodeRef) {
		this.cateCodeRef = cateCodeRef;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	
	
}
