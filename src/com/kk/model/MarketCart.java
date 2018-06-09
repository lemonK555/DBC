package com.kk.model;

import java.util.Date;

public class MarketCart {
	private int marketCartId;
	private int productId;
	private String userCookId;
	private String userName;
	private String picAddress;
	private String productName;
	private String productDescription;
	private int marketCategoryId;
	private int marketProductNum;
	private double marketProductPrice;
	private double marketTotalPrice;
	private Date marketInTime;
	private Date marketReTime;
	
	
	public double getMarketTotalPrice() {
		return marketTotalPrice;
	}
	public void setMarketTotalPrice(double marketTotalPrice) {
		this.marketTotalPrice = marketTotalPrice;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	public double getMarketProductPrice() {
		return marketProductPrice;
	}
	public void setMarketProductPrice(double marketProductPrice) {
		this.marketProductPrice = marketProductPrice;
	}
	public String getPicAddress() {
		return picAddress;
	}
	public void setPicAddress(String picAddress) {
		this.picAddress = picAddress;
	}
	public String getUserCookId() {
		return userCookId;
	}
	public void setUserCookId(String userCookId) {
		this.userCookId = userCookId;
	}
	public int getMarketCartId() {
		return marketCartId;
	}
	public void setMarketCartId(int marketCartId) {
		this.marketCartId = marketCartId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getMarketCategoryId() {
		return marketCategoryId;
	}
	public void setMarketCategoryId(int marketCategoryId) {
		this.marketCategoryId = marketCategoryId;
	}
	public int getMarketProductNum() {
		return marketProductNum;
	}
	public void setMarketProductNum(int marketProductNum) {
		this.marketProductNum = marketProductNum;
	}
	public Date getMarketInTime() {
		return marketInTime;
	}
	public void setMarketInTime(Date marketInTime) {
		this.marketInTime = marketInTime;
	}
	public Date getMarketReTime() {
		return marketReTime;
	}
	public void setMarketReTime(Date marketReTime) {
		this.marketReTime = marketReTime;
	}
	
	
}
