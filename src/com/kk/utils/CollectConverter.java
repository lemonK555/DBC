package com.kk.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.kk.form.CollectForm;
import com.kk.model.Collect;

public class CollectConverter {
	
	public static CollectForm toCollectForm(Collect collect){
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		
		CollectForm collectForm = new CollectForm();
		Integer productId = collect.getProductId();
		collectForm.setProductId(productId.toString());
		collectForm.setUserName(collect.getUserName());
		collectForm.setProductAddress(collect.getProductAddress());
		collectForm.setProductDescription(collect.getProductDescription());
		collectForm.setProductPriceUser(String.valueOf(collect.getProductPriceUser()));
		collectForm.setCollectInTime(formatter.format(new Date()));
		return collectForm;	
	}
	
	public static List<CollectForm> toCollectForms(List<Collect> collects){
		CollectForm collectForm = new CollectForm();
		List<CollectForm> collectForms = new ArrayList<CollectForm>();
		for(Collect collect:collects){
			collectForm = toCollectForm(collect);
			collectForms.add(collectForm);
		}
		return collectForms;
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
