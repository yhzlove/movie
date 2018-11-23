package com.javaer.service.impl;

import com.javaer.dao.IOrderDao;
import com.javaer.model.Order;
import com.javaer.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Service("OrderService")
@Transactional
public class OrderServiceImpl implements IOrderService {

	
	private IOrderDao orderDao;
	
	public IOrderDao getOrderDao() {
		return orderDao;
	}
	@Autowired 
	public void setOrderDao(IOrderDao orderDao) {
		this.orderDao = orderDao;
	}
	@Transactional
	public void addOrder(Order Order) {
		orderDao.save(Order);
	}

	public void deleteOrder(int id) throws Exception {
		orderDao.delete(findOrderById(id));
	}
	@Transactional(readOnly = true)
	public Order findOrderById(int id) {
		return orderDao.findById(id);
	}
	@Transactional(readOnly = true)
	public List<Order> findOrderList() {
		return orderDao.findAll();
	}

	public void updateOrder(Order Order) {
		orderDao.merge(Order);
	}
	@Override
	public Order findOrderByName(String name) {
		List list = orderDao.findByName(name);
		return list==null || list.size() == 0 ? null : (Order)list.get(0);
	}
	@Override
	public List<Order> findOrderList(HttpServletRequest request, int pageNo,
                                     int pageSize) throws Exception {
		List<Order> list = orderDao.findOrderList( request, pageNo, pageSize);
		return list;
	}
	@Override
	public Integer findCountOrderList(HttpServletRequest request)
			throws Exception {
		return orderDao.findCountOrderList(request);
	}

}
