package com.boo.dto;

import java.util.Date;

public class OrderListVO {
	
	private String orderId;
	private String userId;
	private String orderPhon;
	private int amount;
	private Date orderDate;
	private String rentCar;
	private String reQu;
	private String orderName;
	private String startDate;
	private String endDate;
	
	private int orderDetailsNum;
	private int pdNum;
	private int cartStock;
	private String pdName;
	private String pdThumbImg;
	private int pdPrice;
	
	private String delivery;
	
	
	
	
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
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getOrderPhon() {
		return orderPhon;
	}
	public void setOrderPhon(String orderPhon) {
		this.orderPhon = orderPhon;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getRentCar() {
		return rentCar;
	}
	public void setRentCar(String rentCar) {
		this.rentCar = rentCar;
	}
	public String getReQu() {
		return reQu;
	}
	public void setReQu(String reQu) {
		this.reQu = reQu;
	}
	public int getOrderDetailsNum() {
		return orderDetailsNum;
	}
	public void setOrderDetailsNum(int orderDetailsNum) {
		this.orderDetailsNum = orderDetailsNum;
	}
	public int getPdNum() {
		return pdNum;
	}
	public void setPdNum(int pdNum) {
		this.pdNum = pdNum;
	}
	public int getCartStock() {
		return cartStock;
	}
	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}
	public String getPdName() {
		return pdName;
	}
	public void setPdName(String pdName) {
		this.pdName = pdName;
	}
	public String getPdThumbImg() {
		return pdThumbImg;
	}
	public void setPdThumbImg(String pdThumbImg) {
		this.pdThumbImg = pdThumbImg;
	}
	public int getPdPrice() {
		return pdPrice;
	}
	public void setPdPrice(int pdPrice) {
		this.pdPrice = pdPrice;
	}
	

	
	
}
