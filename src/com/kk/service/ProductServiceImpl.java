package com.kk.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kk.dao.ProductDao;
import com.kk.model.Product;

@Service
@Transactional
public class ProductServiceImpl implements ProductService{
	@Resource
	ProductDao productDao;
	
	@Override
	public List<Map<String, Object>> findProduct() {
		List<Map<String, Object>> products = productDao.findProduct();
		System.out.println(products);
		return products;
	}
	
//	@Override
//	public List<Product> findProduct() {
//		List<Product> products = productDao.findProduct();
//		return products;
//	}

	@Override
	public void addProduct(Product product) {
		productDao.addProduct(product);
	}

	@Override
	public void delProduct(int productId) {
		productDao.delProduct(productId);
		
	}

	@Override
	public void updateProduct(Map<String,Object> product) {
//		System.out.println("product:" + product.toString());
		productDao.updateProduct(product);
		
	}

	@Override
	public Map<String,Object> findProductById(int productId) {

		Map<String,Object> product = productDao.findProductById(productId);
		return product;
	}

	@Override
	public List<Product> findProductByHot(int categoryId) {
		List<Product> products = productDao.findProductByHot(categoryId);
		return products;
	}

	@Override
	public List<Map<String, Object>> findProductByVouch() {
		List<Map<String, Object>> products = productDao.findProductByVouch();
		return products;
	}


}
