package com.boo.dto;

import java.util.Date;

public class ProductVO {
	private int pdNum;
	private String pdName;
	private String pdPrice;
	private String cateCode;
	private String pdDes;
	private String pdAge;
	private String pdImg;
	private Date pdDate;
	private int pdStock;
	private String pdThumbImg;
	
	
	
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
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
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
	public String getPdAge() {
		return pdAge;
	}
	public void setPdAge(String pdAge) {
		this.pdAge = pdAge;
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
	
	

}
