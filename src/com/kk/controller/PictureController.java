package com.kk.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kk.form.PictureForm;
import com.kk.model.Picture;
import com.kk.model.MarketCart;
import com.kk.service.PictureService;
import com.kk.utils.PictureConverter;

@Controller
@RequestMapping(value="/picture")
public class PictureController {
	private static final Log log = LogFactory.getLog(UserController.class);
	@Autowired
	PictureService pictureService;
	String disPatcherUrl = "";


	/*
	 * 功能：新增图片
	 * 2017.12.30
	 */
	@RequestMapping(value="addPic")
	public String addPicture(PictureForm pictureForm,Model model) throws ParseException{
		Picture picture = new Picture();
		picture.setPicId(pictureForm.getPicId());
		picture.setPicName(pictureForm.getPicName());
		picture.setPicFunctionName(pictureForm.getPicFunctionName());
		picture.setPicAddress(pictureForm.getPicAddress());
		if(pictureForm.getPicIsChecked().equals("true")){
			picture.setPicIsChecked(1);
		}else if(pictureForm.getPicIsChecked().equals("false")){
			picture.setPicIsChecked(0);
		}else{
			log.info("数据录入失败");
		}
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		picture.setPicReTime(formatter.parse(formatter.format(new Date())));
		pictureService.insertPicture(picture);
		
		queryPicture(model);
		disPatcherUrl = "pictureManage";
		return disPatcherUrl;
	}
	/*
	 * 功能：修改图片
	 * 2017.12.30
	 */
	@RequestMapping(value="editPic")
	public String editPicture(String picIsChecked,PictureForm pictureForm,Model model) throws ParseException{
		log.info("修改图片："+pictureForm.getPID());
		Picture picture = new Picture();
		picture.setPID(Integer.valueOf(pictureForm.getPID()));
		picture.setPicId(pictureForm.getPicId());
		picture.setPicName(pictureForm.getPicName());
		picture.setPicFunctionName(pictureForm.getPicFunctionName());
		picture.setPicAddress(pictureForm.getPicAddress());
		if(pictureForm.getPicIsChecked().equals("true")){
			picture.setPicIsChecked(1);
		}else if(pictureForm.getPicIsChecked().equals("false")){
			picture.setPicIsChecked(0);
		}else{
			log.info("数据录入失败");
		}
		//log.info("选中："+pictureForm.getPicIsChecked()+picture.getPicIsChecked());
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		picture.setPicReTime(formatter.parse(formatter.format(new Date())));
		//pictureService.updatePicture(picture);
		pictureService.updatePicture(picture);
		
		queryPicture(model);	
		disPatcherUrl = "pictureManage";
		return disPatcherUrl;
		
	}
	/*
	 * 功能：删除图片
	 * 2017.12.30
	 */
	@RequestMapping(value="delPic")
	public String delPicture(PictureForm pictureForm,Model model){
		log.info("删除"+pictureForm.getPID());
		pictureService.delPicture(Integer.valueOf(pictureForm.getPID()));
		List<Picture> pictures = pictureService.queryAllPicture();
		List<PictureForm> pictureForms = PictureConverter.toPictureForms(pictures);
		model.addAttribute("pictureForms", pictureForms);
		disPatcherUrl = "pictureManage";
		return disPatcherUrl;
		
	}
	/*
	 * 功能：查询指定图片
	 * 2017.12.30
	 */
	@RequestMapping(value="findPicByPID",produces="text/html;charset=utf-8")
	@ResponseBody
	public String findPicByPID(int PID) throws JsonProcessingException{	
		log.info("修改指定行"+PID);
		Picture picture = pictureService.findPicByPID(PID);	
		System.out.println(picture.getPID());
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(picture);
		log.info("jsonString:" + json);
		return json;
		
	}
	/*
	 * 功能：查询图片
	 * 2017.12.30
	 */
	@RequestMapping(value="queryPic")
	public String queryPicture(Model model){
		
		List<Picture> pictures = pictureService.queryAllPicture();
		List<PictureForm> pictureForms = PictureConverter.toPictureForms(pictures);
		
		model.addAttribute("pictureForms", pictureForms);
		disPatcherUrl = "pictureManage";
		return disPatcherUrl;
		
	}
}

