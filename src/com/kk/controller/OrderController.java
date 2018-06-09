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
import com.kk.model.Order;
import com.kk.model.Product;
import com.kk.service.CollectService;
import com.kk.service.MarketCartService;
import com.kk.service.OrderService;
import com.kk.service.ProductService;
import com.kk.utils.CollectConverter;

@Controller
@RequestMapping(value="/order")
public class OrderController {
	private static final Log log = LogFactory.getLog(UserController.class);
	@Autowired
	OrderService orderService;
	@Autowired
	MarketCartService marketCartService;
	String disPatcherUrl = "";
	
	/*
	 * 保存用户提交订单
	 * 2018.1.12
	 */
	@RequestMapping(value="/saveOrder")
	public String saveOrder(Double marketTotalPrice,String userCookId,Order order,HttpSession session) throws ParseException, JsonProcessingException{
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Order orderNew = new Order();
		UserForm userForm = (UserForm) session.getAttribute("USER_SESSION");
		String userName = userForm.getUserName();
		
		orderNew.setUserCookId(userCookId);
		orderNew.setUserName(userName);
		orderNew.setOrderPrice(marketTotalPrice);
		orderNew.setOrderUserAddress(order.getOrderUserAddress());
		orderNew.setOrderUserRealName(order.getOrderUserRealName());
		orderNew.setOrderUserMobil(order.getOrderUserMobil());
		orderNew.setOrderReTime(formatter.parse(formatter.format(new Date())));
		orderService.saveOrder(order);
		disPatcherUrl = "first";
		return disPatcherUrl;
	}
	/*
	 * 用户提交订单
	 * 2018.1.8
	 */
	@RequestMapping(value="/addOrder")
	public String addOrder(int marketCartId,Model model){
		Map<String,Object> marketCart = marketCartService.findMarketCartById(marketCartId);
		String productNum = marketCart.get("marketProductNum").toString();
		String productPrice = marketCart.get("marketProductPrice").toString();
		Double price = Double.valueOf(productNum)*Double.valueOf(productPrice);
		marketCart.put("marketTotalPrice", price);
		model.addAttribute("marketCart", marketCart);
		disPatcherUrl = "order";
		return disPatcherUrl;
		
	}
}
