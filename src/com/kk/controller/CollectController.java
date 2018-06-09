package com.kk.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kk.form.CollectForm;
import com.kk.form.UserForm;
import com.kk.model.Collect;
import com.kk.model.Product;
import com.kk.service.CollectService;
import com.kk.service.ProductService;
import com.kk.utils.CollectConverter;

@Controller
@RequestMapping(value="/collect")
public class CollectController {
	private static final Log log = LogFactory.getLog(UserController.class);
	@Autowired
	CollectService collectService;
	@Autowired
	ProductService productService;
	String disPatcherUrl = "";
	
	/*
	 * 删除用户指定的收藏夹
	 * 2018.1.8
	 */
	@RequestMapping(value="/delCollectById")
	public String delCollect(int collectId,Model model,HttpServletRequest request){
		collectService.delCollect(collectId);
		findCollect(model, request);
		return disPatcherUrl;
		
	}
	/*
	 * 查看用户自己的收藏夹
	 * 2018.1.8
	 */
	@RequestMapping(value="/findCollect")
	public String findCollect(Model model,HttpServletRequest request){
		List<Product> products = new ArrayList<Product>();
		HttpSession session = request.getSession();
		UserForm userForm = (UserForm) session.getAttribute("USER_SESSION");
		String userName = userForm.getUserName();
		
		List<Map<String,Object>> collects = collectService.findCollect(userName);
		model.addAttribute("collects", collects);
		disPatcherUrl = "collect";
		return disPatcherUrl;
		
	}
	/*
	 * 添加到用户自己的收藏夹
	 * 2018.1.7
	 */
	@RequestMapping(value="/addCollect",produces="text/html;charset=utf-8")
	@ResponseBody
	public String addCollect(int productId, HttpServletRequest request) throws ParseException, JsonProcessingException{
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Collect collect = new Collect();
		String json = "";
		HttpSession session = request.getSession();
		UserForm userForm = (UserForm) session.getAttribute("USER_SESSION");
		String userName = userForm.getUserName();
		collect.setProductId(productId);
		collect.setUserName(userName);
		collect.setCollectInTime(formatter.parse(formatter.format(new Date())));
		Collect collectIn = collectService.findCollectById(collect);
		
		ObjectMapper mapper = new ObjectMapper();
		if(collectIn==null){
			collectService.addCollect(collect);
			json = mapper.writeValueAsString("收藏成功");
		}else{
			json = mapper.writeValueAsString("已收藏");
		}
		return json;
	}
}
