package com.kk.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
import com.kk.form.UserForm;
import com.kk.model.User;
import com.kk.service.ProductService;
import com.kk.service.UserService;
import com.kk.utils.UserConverter;


@Controller
@RequestMapping(value="/user")
public class UserController {
	private static final Log log = LogFactory.getLog(UserController.class);
	@Autowired
	UserService userService;
	@Autowired
	ProductService productService;
	String disPatcherUrl = "";
	/*
	 * 功能：查找黑名单用户
	 * 2018.1.4
	 */
	@RequestMapping(value="/findUserByBlackList")
	public String findUserBlackList(Model model){
		List<User>users = userService.findUserBlackList();
		List<UserForm> userForms = UserConverter.toUserForms(users);
		model.addAttribute("userForms", userForms);
		disPatcherUrl = "userBlackList";
		return disPatcherUrl;
	}
	/*
	 * 功能：移出黑名单
	 * 2018.1.3
	 */
	@RequestMapping(value="/delUserInBlackList")
	public String delUserBlackList(String userName,Model model){
		User user = userService.findByUserName(userName);
		user.setUserBlackList(0);
		userService.updateUser(user);
		findUserBlackList(model);
		return disPatcherUrl;
	}
	/*
	 * 功能：加入黑名单
	 * 2018.1.3
	 */
	@RequestMapping(value="/addUserInBlackList")
	public String userBlackList(String userName,Model model){
		User user = userService.findByUserName(userName);
		user.setUserBlackList(1);
		userService.updateUser(user);
		findUser(model);
		disPatcherUrl = "userManage";
		return disPatcherUrl;
	}
	/*
	 * 功能：查询所有用户信息
	 * 2017.11.22
	 */
	@RequestMapping(value="/findUser")
	public String findUser(Model model){
		List<Map<String, Object>> users = userService.findUser();
		model.addAttribute("users", users);
		disPatcherUrl = "userManage";
		return disPatcherUrl;
	}
	/*
	 * 功能：导航到注册页面
	 * 2017.11.22
	 */
	@RequestMapping(value="/input-user")
	public String inputUser(){
		disPatcherUrl = "register";
		return disPatcherUrl;
	}
	/*
	 * 功能：实现用户注册
	 * 2017.11.22
	 */
	@RequestMapping(value="/save-user")
	public String saveUser(UserForm userForm1,Model model) throws ParseException{
		User user = new User();
		user = UserConverter.toUser(userForm1);
		user.setVipID(1000);
		user.setUserPoint(0);
		user.setUserBlackList(0);
		userService.saveUser(user);
		
		UserForm userForm = new UserForm();
		userForm = UserConverter.toUserForm(user);
		model.addAttribute("userForm", userForm);
		disPatcherUrl = "first";
		return disPatcherUrl;
		
	}
	/*
	 * 功能：用户的登录
	 * 查询已有用户，判断登录的账号密码是否符合，符合登录成功，不符合登录失败
	 */
	@RequestMapping(value="/user-login")
	public String userLogin(UserForm userForm,HttpSession session){
		User user = new User();
		user.setUserName(userForm.getUserName());
		user.setUserPwd(userForm.getUserPwd());
		
		User userIn = userService.findByUserName(user.getUserName());
		if(userIn != null){
			if(userIn.getUserName().equals(user.getUserName())){
				log.info("用户名输入正确");
				if(userIn.getUserPwd().equals(user.getUserPwd())){
					log.info("登录成功");
					if(user.getUserName().contains("dbcM_")){
						log.info("这是管理员登录");
						session.setAttribute("USER_SESSION", userForm);
						disPatcherUrl = "firstManage";
					}else{
						log.info("这是用户登录");
						session.setAttribute("USER_SESSION", userForm);
						disPatcherUrl = "../index";
					}	
				}else{
					log.info("密码输入错误");
					disPatcherUrl = "login";
				}			
			}else{
				log.info("查询到的"+userIn.getUserName()+"用户名输入错误"+user.getUserName());
				disPatcherUrl = "login";
			}
		}else{
			log.info("未查询到相关用户");
			disPatcherUrl = "login";
		}
		return disPatcherUrl;
	}
	/*
	 * 功能：切换用户
	 * 2017.12.06
	 */
	@RequestMapping(value="/changeUser")
	public String changeUser(HttpSession session){
		session.invalidate();
		disPatcherUrl = "login";
		return disPatcherUrl;
	}
	/*
	 * 功能：注销用户
	 * 2017.12.06
	 */
	@RequestMapping(value="/logout")
	public String userLogout(HttpSession session){
		session.invalidate();
		disPatcherUrl = "first";
		return disPatcherUrl;
	}
	
	/*
	 * 查询指定用户
	 * 2018.1.10
	 */
	@RequestMapping(value="/findUserByName")
	public String findUserByName(String userName,Model model){
		User user = userService.findByUserName(userName);
		UserForm userForm = UserConverter.toUserForm(user);
		model.addAttribute("userForm", userForm);
		return "userManageFindOne";
	}
	
	/*
	 * 查询用户是否重名
	 * 2017.12.14
	 */
	@RequestMapping(value="/findUserByUserName",produces="text/html;charset=utf-8")
	@ResponseBody
	public String findUser(String userName) throws JsonProcessingException{
		log.info("userMame:"+userName);
		String json;
		User userFind = userService.findByUserName(userName);
		ObjectMapper mapper = new ObjectMapper();
		if(userFind == null){
			json = mapper.writeValueAsString("* 用户名合法");
			
		}else{
			json = mapper.writeValueAsString("* 用户名已存在");
		}
		return json;
	}
}
