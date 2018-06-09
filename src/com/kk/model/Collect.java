package com.kk.model;

import java.util.Date;

public class Collect {
	private int collectId;
	private int productId;
	private String userName;
	private String productAddress;
	private String productDescription;
	private Double productPriceUser;
	private Date collectInTime;
	
	
	public String getProductAddress() {
		return productAddress;
	}
	public void setProductAddress(String productAddress) {
		this.productAddress = productAddress;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	public Double getProductPriceUser() {
		return productPriceUser;
	}
	public void setProductPriceUser(Double productPriceUser) {
		this.productPriceUser = productPriceUser;
	}
	public int getCollectId() {
		return collectId;
	}
	public void setCollectId(int collectId) {
		this.collectId = collectId;
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
	public Date getCollectInTime() {
		return collectInTime;
	}
	public void setCollectInTime(Date collectInTime) {
		this.collectInTime = collectInTime;
	}
	
}
