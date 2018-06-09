package com.kk.model;

import java.util.Date;

import javax.xml.crypto.Data;

public class User {

	private int userID;
	private int vipID;
	private String userName;
	private String userPwd;
	private String userRealName;//用户真实姓名
	private String userSex;
	private Date userBirthday;
	private String userMobile;
	private String userEmail;
	private int userPoint;//用户积分
	private String vipName;//vip等级名称
	private Date userCreatTime;//用户注册时间
	private int userBlackList;
	
	
	public int getUserBlackList() {
		return userBlackList;
	}
	public void setUserBlackList(int userBlackList) {
		this.userBlackList = userBlackList;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public int getVipID() {
		return vipID;
	}
	public void setVipID(int vipID) {
		this.vipID = vipID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserRealName() {
		return userRealName;
	}
	public void setUserRealName(String userRealName) {
		this.userRealName = userRealName;
	}
	public String getUserSex() {
		return userSex;
	}
	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}
	public Date getUserBirthday() {
		return userBirthday;
	}
	public void setUserBirthday(Date userBirthday) {
		this.userBirthday = userBirthday;
	}
	public String getUserMobile() {
		return userMobile;
	}
	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public int getUserPoint() {
		return userPoint;
	}
	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}
	public String getVipName() {
		return vipName;
	}
	public void setVipName(String vipName) {
		this.vipName = vipName;
	}
	public Date getUserCreatTime() {
		return userCreatTime;
	}
	public void setUserCreatTime(Date userCreatTime) {
		this.userCreatTime = userCreatTime;
	}
}
