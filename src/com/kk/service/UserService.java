package com.kk.service;

import java.util.List;
import java.util.Map;

import com.kk.model.User;

public interface UserService {

	public void saveUser(User user);
	public User findByUserName(String userName);
	public List<Map<String, Object>> findUser();
	public void updateUser(User user);
	public List<User> findUserBlackList();
}
