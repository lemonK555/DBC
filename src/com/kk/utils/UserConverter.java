package com.kk.utils;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.kk.form.UserForm;
import com.kk.model.User;

public class UserConverter {
	
	public static UserForm toUserForm(User user){
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd"); 
		
		UserForm userForm = new UserForm();
		Integer userID = user.getUserID();
		Integer vipID = user.getVipID();
		Integer userPoint = user.getUserPoint();
		Integer userBlackList = user.getUserBlackList();
		userForm.setUserID(userID.toString());
		userForm.setVipID(vipID.toString());
		userForm.setUserName(user.getUserName());
		userForm.setUserPwd(user.getUserPwd());
		userForm.setUserRealName(user.getUserRealName());
		userForm.setUserSex(user.getUserSex());	 
		userForm.setUserBirthday(formatter.format(user.getUserBirthday()));
		userForm.setUserEmail(user.getUserEmail());
		userForm.setUserMobile(String.valueOf(user.getUserMobile()));
		userForm.setUserPoint(userPoint.toString());
		userForm.setUserCreatTime(formatter.format(user.getUserCreatTime()));
		userForm.setUserBlackList(userBlackList.toString());
		return userForm;	
	}
	
	public static List<UserForm> toUserForms(List<User> users){
		UserForm userForm = new UserForm();
		List<UserForm> userForms = new ArrayList<UserForm>();
		for(User user:users){
			userForm = toUserForm(user);
			userForms.add(userForm);
		}
		return userForms;
	}
	
	public static User toUser(UserForm userForm) throws ParseException{
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
		
		User user = new User();
		//user.setUserID(Integer.valueOf(userForm.getUserID()));
		//user.setVipID(Integer.valueOf(userForm.getVipID()));
		user.setUserName(userForm.getUserName());
		user.setUserPwd(userForm.getUserPwd());
		user.setUserRealName(userForm.getUserRealName());
		user.setUserSex(userForm.getUserSex());
		
		user.setUserBirthday(formatter.parse(userForm.getUserBirthday()));
		user.setUserMobile(userForm.getUserMobile());
		user.setUserEmail(userForm.getUserEmail());
		user.setUserPoint(Integer.valueOf(userForm.getUserPoint()));
		
		user.setUserCreatTime(formatter.parse(formatter.format(new Date())));
		//user.setUserBlackList(Integer.valueOf(userForm.getUserBlackList()));
		System.out.println(user.getUserBirthday()+"**"+user.getUserCreatTime());
		return user;	
	}
	
	public static List<User> toUsers(List<UserForm> userForms) throws ParseException{
		User user = new User();
		List<User> users = new ArrayList<User>();
		for(UserForm userForm:userForms){
			user = toUser(userForm);
			users.add(user);
		}
		return users;
	}

	
}
