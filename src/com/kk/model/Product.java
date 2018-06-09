package com.kk.model;

import java.util.Date;

public class Product {
	int productId;
	int productImgId;
	String productName;
	String productKeys;
	String productDescription;
	String picAddress;
	double productPriceUser;
	int productIsVouch;
	int productHits;
	int productReviews;
	int productOrderNum;
	int productBuyNum;
	Date productInTime;
	int categoryId;
	String categoryName;
	Date productReTime;
		
	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productImgId=" + productImgId + ", productName=" + productName
				+ ", productKeys=" + productKeys + ", productDescription=" + productDescription + ", picAddress="
				+ picAddress + ", productPriceUser=" + productPriceUser + ", productIsVouch=" + productIsVouch
				+ ", productHits=" + productHits + ", productReviews=" + productReviews + ", productOrderNum="
				+ productOrderNum + ", productBuyNum=" + productBuyNum + ", productInTime=" + productInTime
				+ ", categoryId=" + categoryId + ", productReTime=" + productReTime + "]";
	}
	public String getPicAddress() {
		return picAddress;
	}
	public void setPicAddress(String picAddress) {
		this.picAddress = picAddress;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductKeys() {
		return productKeys;
	}
	public void setProductKeys(String productKeys) {
		this.productKeys = productKeys;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public int getProductImgId() {
		return productImgId;
	}
	public void setProductImgId(int productImgId) {
		this.productImgId = productImgId;
	}
	public double getProductPriceUser() {
		return productPriceUser;
	}
	public void setProductPriceUser(double productPriceUser) {
		this.productPriceUser = productPriceUser;
	}
//	public double getProductPricePer() {
//		return productPricePer;
//	}
//	public void setProductPricePer(double productPricePer) {
//		this.productPricePer = productPricePer;
//	}
	public int getProductIsVouch() {
		return productIsVouch;
	}
	public void setProductIsVouch(int productIsVouch) {
		this.productIsVouch = productIsVouch;
	}
	public int getProductHits() {
		return productHits;
	}
	public void setProductHits(int productHits) {
		this.productHits = productHits;
	}
	public int getProductReviews() {
		return productReviews;
	}
	public void setProductReviews(int productReviews) {
		this.productReviews = productReviews;
	}
	public int getProductOrderNum() {
		return productOrderNum;
	}
	public void setProductOrderNum(int productOrderNum) {
		this.productOrderNum = productOrderNum;
	}
	public int getProductBuyNum() {
		return productBuyNum;
	}
	public void setProductBuyNum(int productBuyNum) {
		this.productBuyNum = productBuyNum;
	}
	public Date getProductInTime() {
		return productInTime;
	}
	public void setProductInTime(Date productInTime) {
		this.productInTime = productInTime;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public Date getProductReTime() {
		return productReTime;
	}
	public void setProductReTime(Date productReTime) {
		this.productReTime = productReTime;
	}
	
}
