package com.kk.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.kk.form.CollectForm;
import com.kk.form.PictureForm;
import com.kk.model.Collect;
import com.kk.model.Picture;

public class PictureConverter {
	
	public static PictureForm toPictureForm(Picture picture){
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		PictureForm pictureForm = new PictureForm();
		Integer PID = picture.getPID();
		pictureForm.setPID(PID.toString());
		pictureForm.setPicName(picture.getPicName());
		if(picture.getPicFunctionName().equals("lunbo")){
			pictureForm.setPicFunctionName("轮播");
		}else if(picture.getPicFunctionName().equals("hot")){
			pictureForm.setPicFunctionName("热门");
		}else if(picture.getPicFunctionName().equals("show")){
			pictureForm.setPicFunctionName("普通");
		}else if(picture.getPicFunctionName().equals("other")){
			pictureForm.setPicFunctionName("其他");
		}else if(picture.getPicFunctionName().equals("welcome")){
			pictureForm.setPicFunctionName("欢迎");
		}
		pictureForm.setPicAddress(picture.getPicAddress());
		if(picture.getPicIsChecked()==1){
			pictureForm.setPicIsChecked("true");
		}else if(picture.getPicIsChecked()==0){
			pictureForm.setPicIsChecked("false");
		}else{
			System.out.println("数据录入失败");
		}
		pictureForm.setPicReTime(formatter.format(new Date()));
		return pictureForm;	
	}
	
	public static List<PictureForm> toPictureForms(List<Picture> pictures){
		PictureForm pictureForm = new PictureForm();
		List<PictureForm> pictureForms = new ArrayList<PictureForm>();
		for(Picture picture:pictures){
			pictureForm = toPictureForm(picture);
			pictureForms.add(pictureForm);
		}
		return pictureForms;
	}
	
	public static Collect toCollect(CollectForm collectForm) throws ParseException{
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Collect collect = new Collect();
		collect.setProductId(Integer.valueOf(collectForm.getProductId()));
		collect.setUserName(collectForm.getUserName());
		collect.setProductAddress(collectForm.getProductAddress());
		collect.setProductDescription(collectForm.getProductDescription());
		collect.setProductPriceUser(Double.valueOf(collectForm.getProductPriceUser()));
		collect.setCollectInTime(formatter.parse(formatter.format(new Date())));
		
		return collect;	
	}
	
	public static List<Collect> toCollects(List<CollectForm> collectForms) throws ParseException{
		Collect collect = new Collect();
		List<Collect> collects = new ArrayList<Collect>();
		for(CollectForm collectForm:collectForms){
			collect = toCollect(collectForm);
			collects.add(collect);
		}
		return collects;
	}

	
}
