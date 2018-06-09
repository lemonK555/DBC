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
	 * �޸�ͼƬ
	 */
	@Override
	public void updatePicture(Picture picture) {
		System.out.println("***�޸�***");
		pictureDao.updatePicture(picture);	
	}
	/*
	 * ɾ��ͼƬ
	 */
	@Override
	public void delPicture(int PID){
		System.out.println("***ɾ��***");
		pictureDao.deletePicture(PID);
	}
	
	/*
	 * ����ͼƬ
	 */
	@Override
	public void insertPicture(Picture picture){
		pictureDao.insertPicture(picture);
	}
	/*
	 * ��ѯָ��ͼƬ
	 */
	@Override
	public Picture findPicByPID(int PID) {
		Picture picture = pictureDao.findPicByPID(PID);	
		return picture;
	}
	/*
	 * ��ѯ����ͼƬ
	 */
	@Override
	public List<Picture> queryAllPicture() {
		List<Picture> pictures = pictureDao.queryAllPicture();
		return pictures;
	}

	
}
