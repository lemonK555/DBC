package com.kk.model;

import java.util.Date;

public class Picture {
	int PID;
	String picId;
	String picName;
	String picFunctionName;
	int picIsChecked;
	String picAddress;
	Date picReTime;
	
	public int getPID() {
		return PID;
	}
	public void setPID(int pID) {
		PID = pID;
	}
	public String getPicFunctionName() {
		return picFunctionName;
	}
	public void setPicFunctionName(String picFunctionName) {
		this.picFunctionName = picFunctionName;
	}
	
	public int getPicIsChecked() {
		return picIsChecked;
	}
	public void setPicIsChecked(int picIsChecked) {
		this.picIsChecked = picIsChecked;
	}
	public Date getPicReTime() {
		return picReTime;
	}
	public void setPicReTime(Date picReTime) {
		this.picReTime = picReTime;
	}
	public String getPicId() {
		return picId;
	}
	public void setPicId(String picId) {
		this.picId = picId;
	}
	public String getPicName() {
		return picName;
	}
	public void setPicName(String picName) {
		this.picName = picName;
	}
	public String getPicAddress() {
		return picAddress;
	}
	public void setPicAddress(String picAddress) {
		this.picAddress = picAddress;
	}
	
}
