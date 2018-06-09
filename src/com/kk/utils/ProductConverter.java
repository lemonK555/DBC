package com.kk.utils;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.kk.form.ProductForm;
import com.kk.form.UserForm;
import com.kk.model.Product;
import com.kk.model.User;

public class ProductConverter {
	

	
	public static ProductForm toProductForm(Product product){
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd DD HH:mm:ss"); 
		ProductForm productForm = new ProductForm();
		//System.out.println("*#*"+product.getProductId());
//		Integer productId = product.getProductId();
		Integer productImgId = product.getProductImgId();
		Integer productIsVouch = product.getProductIsVouch();
		Integer productHits = product.getProductHits();
		Integer productReviews = product.getProductReviews();
		Integer productOrderNum = product.getProductOrderNum();
		Integer productBuyNum = product.getProductOrderNum();
		Integer categoryId = product.getCategoryId();
		
//		productForm.setProductId(productId.toString());
		productForm.setProductImgId(productImgId.toString());
		productForm.setProductName(product.getProductName());
		productForm.setPicAddress(product.getPicAddress());
		productForm.setProductKeys(product.getProductKeys());
		productForm.setProductDescription(product.getProductDescription());
		productForm.setProductPriceUser(String.valueOf(product.getProductPriceUser()));
		if(productIsVouch.equals(1)){
			productForm.setProductIsVouch("Yes");
		}else if(productIsVouch.equals(0)){
			productForm.setProductIsVouch("No");
		}else{
			System.out.println("数据转换错误0001");
		}
		productForm.setProductHits(productHits.toString());
		productForm.setProductReviews(productReviews.toString());
		productForm.setProductOrderNum(productOrderNum.toString());
		productForm.setProductBuyNum(productBuyNum.toString());
		productForm.setProductInTime(formatter.format(product.getProductInTime()));
		productForm.setCategoryId(categoryId.toString());
		productForm.setProductReTime(formatter.format(product.getProductReTime()));
		
		return productForm;	
	}
	
	public static List<ProductForm> toProductForms(List<Product> products){
		ProductForm productForm = new ProductForm();
		List<ProductForm> productForms = new ArrayList<ProductForm>();
		for(Product product:products){
			productForm = toProductForm(product);
			productForms.add(productForm);
		}
		return productForms;
	}
	
	public static Product toProduct(ProductForm productForm) throws ParseException{
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Product product = new Product();
		
		//product.setProductId(productId.toString());
		product.setProductImgId(Integer.valueOf(productForm.getProductImgId()));
		product.setProductName(productForm.getProductName());
		product.setProductKeys(productForm.getProductKeys());
		product.setProductDescription(productForm.getProductDescription());
		product.setProductPriceUser(Double.valueOf(productForm.getProductPriceUser()));
		if(productForm.getProductIsVouch().equals("true")){
			product.setProductIsVouch(1);
		}else if(productForm.getProductIsVouch().equals("false")){
			product.setProductIsVouch(0);
		}else{
			System.out.println("数据录入失败");
		}
		product.setProductHits(Integer.valueOf(productForm.getProductHits()));
		product.setProductReviews(Integer.valueOf(productForm.getProductReviews()));
		product.setProductOrderNum(Integer.valueOf(productForm.getProductOrderNum()));
		product.setProductBuyNum(Integer.valueOf(productForm.getProductBuyNum()));
		product.setProductInTime(formatter.parse(productForm.getProductInTime()));
		product.setCategoryId(Integer.valueOf(productForm.getCategoryId()));
		product.setProductReTime(formatter.parse(productForm.getProductReTime()));
		return product;	
	}
	
	public static List<Product> toProduct(List<ProductForm> productForms) throws ParseException{
		Product product = new Product();
		List<Product> products = new ArrayList<Product>();
		for(ProductForm productForm:productForms){
			product = toProduct(productForm);
			products.add(product);
		}
		return products;
	}

	
}
