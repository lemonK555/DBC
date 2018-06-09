package com.kk.dao;

import java.util.List;
import java.util.Map;

import com.kk.model.Collect;

public interface CollectDao {
	public List<Map<String,Object>> findCollect(String userName);
	public void addCollect(Collect collect);
	public void delCollect(int collectId);
	public Collect findCollectById(Collect collect); 
}
