package com.kk.service;

import java.util.List;
import java.util.Map;

import com.kk.model.MarketCart;

public interface MarketCartService {
	public List<Map<String,Object>> findMarketCartByUserName(String userName);
	public Map<String, Object> findMarketCartById(int marketCartId);
	public void updateMarketCart(MarketCart marketCart);
	public void addMarketCart(MarketCart marketCart);
	public void deleteMarketCartById(int MarketCartId);
}
