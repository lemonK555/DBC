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
import com.kk.model.MarketCart;
import com.kk.model.Product;
import com.kk.service.CollectService;
import com.kk.service.MarketCartService;
import com.kk.service.ProductService;
import com.kk.utils.CollectConverter;

@Controller
@RequestMapping(value="/marketCart")
public class MarketCartController {
	private static final Log log = LogFactory.getLog(UserController.class);
	@Autowired
	MarketCartService marketCartService;
	String disPatcherUrl = "";
	/*
	 * 删除指定购物车产品
	 * 2018.1.11
	 */
	@RequestMapping(value="/delMarketCartById")
	public String delMarketCartById(int marketCartId,Model model,HttpServletRequest request){
		marketCartService.deleteMarketCartById(marketCartId);
		findMarketCartByUserName(model,request);
		disPatcherUrl = "marketCart";
		return disPatcherUrl;
	}
	/*
	 * 修改自己的购物车
	 * 2018.1.8
	 */
	@RequestMapping(value="/editMarketCart")
	public String editMarketCart(int marketCartId,int productNum) throws ParseException{
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		MarketCart marketCart = new MarketCart();
		marketCart.setMarketCartId(marketCartId);
		marketCart.setMarketProductNum(productNum);
		marketCart.setMarketReTime(formatter.parse(formatter.format(new Date())));
		marketCartService.updateMarketCart(marketCart);
		disPatcherUrl = "marketCart";
		return disPatcherUrl;
	}
	/*
	 * 查看用户自己的收藏夹
	 * 2018.1.8
	 */
	@RequestMapping(value="/findMarketCart")
	public String findMarketCartByUserName(Model model,HttpServletRequest request){
		HttpSession session = request.getSession();
		UserForm userForm = (UserForm) session.getAttribute("USER_SESSION");
		String userName = userForm.getUserName();
		List<Map<String,Object>> marketCarts = marketCartService.findMarketCartByUserName(userName);
		model.addAttribute("marketCarts", marketCarts);
		disPatcherUrl = "marketCart";
		return disPatcherUrl;
		
	}
	/*
	 * 添加到用户自己的收藏夹
	 * 2018.1.7
	 */
	@RequestMapping(value="/addMarketCart",produces="text/html;charset=utf-8")
	@ResponseBody
	public String addCollect(int productId,int productNum,String productPriceUser, HttpServletRequest request) throws ParseException, JsonProcessingException{
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		MarketCart marketCart = new MarketCart();
		String json = "";
		HttpSession session = request.getSession();
		UserForm userForm = (UserForm) session.getAttribute("USER_SESSION");
		String userName = userForm.getUserName();
		marketCart.setProductId(productId);
		marketCart.setUserName(userName);
		marketCart.setUserCookId(productId+userName);
		marketCart.setMarketProductNum(productNum);
		
		marketCart.setMarketProductPrice(Double.valueOf(productPriceUser));
		marketCart.setMarketInTime(formatter.parse(formatter.format(new Date())));
		marketCart.setMarketReTime(formatter.parse(formatter.format(new Date())));
		
		ObjectMapper mapper = new ObjectMapper();
		
		marketCartService.addMarketCart(marketCart);
		json = mapper.writeValueAsString("成功加入购物车");
		return json;
	}
}
