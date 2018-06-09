package com.kk.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kk.dao.CollectDao;
import com.kk.model.Collect;

@Service
@Transactional
public class CollectServiceImpl implements CollectService{
	@Resource
	CollectDao collectDao;
	@Override
	public List<Map<String,Object>> findCollect(String userName) {
		List<Map<String,Object>> collects = collectDao.findCollect(userName);
		return collects;
	}

	@Override
	public void addCollect(Collect collect) {
		collectDao.addCollect(collect);
	}

	@Override
	public void delCollect(int collectId) {
		collectDao.delCollect(collectId);
	}

	@Override
	public Collect findCollectById(Collect collect) {
		Collect collect2 = collectDao.findCollectById(collect);
		return collect2;
	}
	
	


	
}
