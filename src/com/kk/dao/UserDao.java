package com.kk.dao;

import java.util.List;
import java.util.Map;

import com.kk.model.User;

public interface UserDao {
	public void insertUser(User user);
	public User findByUserName(String userName);
	public List<Map<String, Object>> findUser();
	public void updateUser(User user);
	public List<User> findUserBlackList();
}
