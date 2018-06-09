package com.kk.dao;

import java.util.List;
import java.util.Map;

import com.kk.model.Picture;

public interface PictureDao {
	public void insertPicture(Picture picture);
	public List<Picture> queryAllPicture();
	public void deletePicture(int PID);
	public void updatePicture(Picture picture);
	public Picture findPicByPID(int PID);
}
