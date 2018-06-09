package com.kk.service;

import java.util.List;
import java.util.Map;

import com.kk.model.Picture;
import com.kk.model.MarketCart;

public interface PictureService{
	public void insertPicture(Picture picture);
	public List<Picture> queryAllPicture();
	public void delPicture(int PID);
	public void updatePicture(Picture picture);
	public Picture findPicByPID(int PID);
}
