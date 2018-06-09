package com.kk.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kk.dao.PictureDao;
import com.kk.dao.MarketCartDao;
import com.kk.model.Picture;
import com.kk.model.MarketCart;

@Service
@Transactional
public class PictureServiceImpl implements PictureService{
	@Resource
	PictureDao pictureDao;
	/*
	 * ÐÞ¸ÄÍ¼Æ¬
	 */
	@Override
	public void updatePicture(Picture picture) {
		System.out.println("***ÐÞ¸Ä***");
		pictureDao.updatePicture(picture);	
	}
	/*
	 * É¾³ýÍ¼Æ¬
	 */
	@Override
	public void delPicture(int PID){
		System.out.println("***É¾³ý***");
		pictureDao.deletePicture(PID);
	}
	
	/*
	 * ²åÈëÍ¼Æ¬
	 */
	@Override
	public void insertPicture(Picture picture){
		pictureDao.insertPicture(picture);
	}
	/*
	 * ²éÑ¯Ö¸¶¨Í¼Æ¬
	 */
	@Override
	public Picture findPicByPID(int PID) {
		Picture picture = pictureDao.findPicByPID(PID);	
		return picture;
	}
	/*
	 * ²éÑ¯ËùÓÐÍ¼Æ¬
	 */
	@Override
	public List<Picture> queryAllPicture() {
		List<Picture> pictures = pictureDao.queryAllPicture();
		return pictures;
	}

	
}
