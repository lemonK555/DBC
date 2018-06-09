package com.kk.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kk.dao.MarketCartDao;
import com.kk.model.MarketCart;
@Service
@Transactional
public class MarketCartServiceImpl implements MarketCartService{
	@Resource
	MarketCartDao marketCartDao;
	@Override
	public List<Map<String,Object>> findMarketCartByUserName(String userName){
		List<Map<String,Object>> marketCarts = marketCartDao.findMarketCartByUserName(userName);
		return marketCarts;
	}

	@Override
	public void updateMarketCart(MarketCart marketCart) {
		marketCartDao.updateMarketCart(marketCart);
		
	}

	@Override
	public void addMarketCart(MarketCart marketCart) {
		marketCartDao.addMarketCart(marketCart);
	}

	@Override
	public Map<String, Object> findMarketCartById(int marketCartId) {
		Map<String,Object> markectCart = marketCartDao.findMarketCartById(marketCartId);
		return markectCart;
	}

	@Override
	public void deleteMarketCartById(int MarketCartId) {
		marketCartDao.deleteMarketCartById(MarketCartId);	
	}

}
