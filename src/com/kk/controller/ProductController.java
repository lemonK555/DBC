package com.kk.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationConfig;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kk.form.PictureForm;
import com.kk.form.ProductForm;
import com.kk.model.Picture;
import com.kk.model.Product;
import com.kk.service.PictureService;
import com.kk.service.ProductService;
import com.kk.utils.PictureConverter;
import com.kk.utils.ProductConverter;

@Controller
@RequestMapping(value="/product")
public class ProductController {
	private static final Log log = LogFactory.getLog(UserController.class);
	@Autowired
	ProductService productService;
	@Autowired
	PictureService pictureService;
	String disPatcherUrl = "";
	/*
	 * 功能：跳转到指定产品界面
	 * 2018.1.7
	 */
	@RequestMapping(value="/findProductJSP")
	public String findProductJSP(int productId,Model model,RedirectAttributes attr){
		Map<String,Object> product = productService.findProductById(productId);
		Integer productHits = (Integer) product.get("productHits");
		product.put("productHits", productHits+1);
		productService.updateProduct(product);
		
		model.addAttribute("product", product);
		disPatcherUrl = "product";
		return disPatcherUrl;
	}
	
	/*
	 * 功能：查找推荐产品
	 * 2018.1.7
	 */
	@RequestMapping(value="/findProductByVouch")
	public String findProductByVouch(Model model){
		List<Map<String,Object>> products = productService.findProductByVouch();
		model.addAttribute("products", products);
		disPatcherUrl = "vouch";
		return disPatcherUrl;
		
	}
	/*
	 * 功能：跳转首页
	 * 2018.1.9
	 */
	@RequestMapping(value="/findProductFrist")
	public String findProductFrist(Model model){
		List<Map<String,Object>> products = productService.findProduct();
		List<Map<String,Object>> productTop = new ArrayList<Map<String,Object>>(); 
		List<Map<String,Object>> productHot = new ArrayList<Map<String,Object>>(); 	

		for(int i=0;i<products.size();i++){
			if(products.get(i).get("categoryName").equals("欢迎")){
				if(products.get(i).get("picIsChecked").equals(1)){
//					System.out.println("~~~");
					productTop.add(products.get(i));
				}
			}else if(products.get(i).get("categoryName").equals("热门")){
//				System.out.println("***");
				productHot.add(products.get(i));
			}
		}
		
//		System.out.println("top:"+productTop.get(0).get("picAddress"));
//		System.out.println("hoy:"+productHot.get(0).get("picAddress"));
		model.addAttribute("productTop", productTop);
		model.addAttribute("productHot", productHot);
		disPatcherUrl = "first";
		return disPatcherUrl;
	}
	
	/*
	 * 功能：修改产品
	 * 2018.1.4
	 */
	@RequestMapping(value="/editProduct")
	public String editProduct(Map<String,Object> productForm,Model model) throws ParseException{
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		productForm.put("productReTime",formatter.format(new Date()));
		productForm.put("productInTime",productForm.get("ProductInTime"));

		productService.updateProduct(productForm);
		
		findProduct(2,model);
		return disPatcherUrl;
	}
	/*
	 * 功能：查找指定产品
	 * 2018.1.4
	 */
	@RequestMapping(value="findProductById",produces="text/html;charset=utf-8")
	@ResponseBody
	public String findProductById(int productId,Model model) throws ParseException, JsonProcessingException{		
		Map<String,Object> product = productService.findProductById(productId);
		//SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		ObjectMapper mapper = new ObjectMapper();
		//mapper.getSerializationConfig().with(format);
		String json = mapper.writeValueAsString(product);
		log.info("jsonString:" + json);
		return json;
	}
	/*
	 * 功能：删除产品
	 * 2018.1.4
	 */
	@RequestMapping(value="/delProduct")
	public String delProduct(int productId,Model model){
		productService.delProduct(productId);
		findProduct(2,model);
		return disPatcherUrl;
	}
	/*
	 * 功能：新增产品
	 * 2018.1.4
	 */
	@RequestMapping(value="/addProduct")
	public String addProduct(ProductForm productForm,Model model) throws ParseException{
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		productForm.setProductInTime(formatter.format(new Date()));
		productForm.setProductReTime(formatter.format(new Date()));

		
		Product product = ProductConverter.toProduct(productForm);
		productService.addProduct(product);
		findProduct(2,model);
		return disPatcherUrl;
	}

	/*
	 * 功能：查询产品信息
	 * 2018.1.4
	 */
	@RequestMapping(value="/findProduct")
	public String findProduct(int id,Model model){		
		List<Map<String,Object>> products = productService.findProduct();	

		List<Picture> pictures = pictureService.queryAllPicture();
		List<PictureForm> pictureForms = PictureConverter.toPictureForms(pictures);
		for(int i=0;i<products.size();i++){
			System.out.println("**"+products.get(i).get("productImgId"));
			if(products.get(i).get("productImgId").equals(pictures.get(i).getPID())){
				products.get(i).put("picAddress",pictures.get(i).getPicAddress());
			}
			products.get(i).put("productId",products.get(i).get("productId"));
		}
		model.addAttribute("products", products);
		model.addAttribute("pictureForms", pictureForms);
		if(id == 1){
			disPatcherUrl = "allProduct";
		}else if(id == 2){
			disPatcherUrl = "productManage";
		}
		return disPatcherUrl;
		
	}
}