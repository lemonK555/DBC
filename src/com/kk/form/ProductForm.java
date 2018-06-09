package com.kk.form;


public class ProductForm {
	String productId;
	String productImgId;
	String productName;
	String productKeys;
	String productDescription;
	String picAddress;
	String productPriceUser;
	String productPricePer;
	String productIsVouch;
	String productHits;
	String productReviews;
	String productOrderNum;
	String productBuyNum;
	String productInTime;
	String categoryId;
	String categoryName;
	String productReTime;
	
	
	@Override
	public String toString() {
		return "ProductForm [productId=" + productId + ", productImgId=" + productImgId + ", productName=" + productName
				+ ", productKeys=" + productKeys + ", productDescription=" + productDescription + ", picAddress="
				+ picAddress + ", productPriceUser=" + productPriceUser + ", productPricePer=" + productPricePer
				+ ", productIsVouch=" + productIsVouch + ", productHits=" + productHits + ", productReviews="
				+ productReviews + ", productOrderNum=" + productOrderNum + ", productBuyNum=" + productBuyNum
				+ ", productInTime=" + productInTime + ", categoryId=" + categoryId + ", productReTime=" + productReTime
				+ "]";
	}
	public String getPicAddress() {
		return picAddress;
	}
	public void setPicAddress(String picAddress) {
		this.picAddress = picAddress;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductImgId() {
		return productImgId;
	}
	public void setProductImgId(String productImgId) {
		this.productImgId = productImgId;
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
	public String getProductPriceUser() {
		return productPriceUser;
	}
	public void setProductPriceUser(String productPriceUser) {
		this.productPriceUser = productPriceUser;
	}
	public String getProductPricePer() {
		return productPricePer;
	}
	public void setProductPricePer(String productPricePer) {
		this.productPricePer = productPricePer;
	}
	public String getProductIsVouch() {
		return productIsVouch;
	}
	public void setProductIsVouch(String productIsVouch) {
		this.productIsVouch = productIsVouch;
	}
	public String getProductHits() {
		return productHits;
	}
	public void setProductHits(String productHits) {
		this.productHits = productHits;
	}
	public String getProductReviews() {
		return productReviews;
	}
	public void setProductReviews(String productReviews) {
		this.productReviews = productReviews;
	}
	public String getProductOrderNum() {
		return productOrderNum;
	}
	public void setProductOrderNum(String productOrderNum) {
		this.productOrderNum = productOrderNum;
	}
	public String getProductBuyNum() {
		return productBuyNum;
	}
	public void setProductBuyNum(String productBuyNum) {
		this.productBuyNum = productBuyNum;
	}
	public String getProductInTime() {
		return productInTime;
	}
	public void setProductInTime(String productInTime) {
		this.productInTime = productInTime;
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getProductReTime() {
		return productReTime;
	}
	public void setProductReTime(String productReTime) {
		this.productReTime = productReTime;
	}
	
}
