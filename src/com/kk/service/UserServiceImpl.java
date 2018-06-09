package com.kk.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kk.dao.UserDao;
import com.kk.model.User;
@Service
@Transactional
public class UserServiceImpl implements UserService{
	@Resource
	UserDao userDao;
	public void saveUser(User user){
		this.userDao.insertUser(user);
	}
	@Override
	public User findByUserName(String userName) {
		// TODO Auto-generated method stub
		return this.userDao.findByUserName(userName);
	}
	@Override
	public List<Map<String, Object>> findUser() {
		List<Map<String, Object>> users = userDao.findUser();
		return users;
	}
	@Override
	public void updateUser(User user) {
		this.userDao.updateUser(user);
		
	}
	//查找黑名单用户
	@Override
	public List<User> findUserBlackList() {
		List<User> users = userDao.findUserBlackList();
		return users;
	}
	
}
