package com.kk.model;

import java.util.Date;

public class Order {
	private int orderId;
	private int userId;
	private String userName;
	private String userCookId;
	private double orderPrice;
	private String orderUserRealName;
	private String orderUserAddress;
	private int orderUserMobil;
	private Date orderReTime;
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public double getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(double orderPrice) {
		this.orderPrice = orderPrice;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public String getUserCookId() {
		return userCookId;
	}
	public void setUserCookId(String userCookId) {
		this.userCookId = userCookId;
	}
	public String getOrderUserRealName() {
		return orderUserRealName;
	}
	public void setOrderUserRealName(String orderUserRealName) {
		this.orderUserRealName = orderUserRealName;
	}
	public String getOrderUserAddress() {
		return orderUserAddress;
	}
	public void setOrderUserAddress(String orderUserAddress) {
		this.orderUserAddress = orderUserAddress;
	}
	public int getOrderUserMobil() {
		return orderUserMobil;
	}
	public void setOrderUserMobil(int orderUserMobil) {
		this.orderUserMobil = orderUserMobil;
	}
	public Date getOrderReTime() {
		return orderReTime;
	}
	public void setOrderReTime(Date orderReTime) {
		this.orderReTime = orderReTime;
	}
	
}
