package com.kk.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kk.dao.CollectDao;
import com.kk.model.Collect;
import com.kk.model.Order;

@Service
@Transactional
public class OrderServiceImpl implements OrderService{
	@Resource
	OrderService orderService;

	@Override
	public void saveOrder(Order order) {
		orderService.saveOrder(order);
		
	}
	
	
}
