package com.kk.dao;

import java.util.List;
import java.util.Map;

import com.kk.model.Product;

public interface ProductDao {
	public List<Map<String,Object>> findProduct();
	public void addProduct(Product product);
	public void delProduct(int productId);
	public void updateProduct(Map<String,Object> product);
	public Map<String,Object> findProductById(int productId);
	public List<Product> findProductByHot(int categoryId);
	public List<Map<String,Object>> findProductByVouch();
}
