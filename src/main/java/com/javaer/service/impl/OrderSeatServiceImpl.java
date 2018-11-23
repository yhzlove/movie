package com.javaer.service.impl;

import com.javaer.dao.IOrderSeatDao;
import com.javaer.model.OrderSeat;
import com.javaer.service.IOrderSeatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Service("OrderSeatService")
@Transactional
public class OrderSeatServiceImpl implements IOrderSeatService {

	
	private IOrderSeatDao orderSeatDao;
	
	public IOrderSeatDao getOrderSeatDao() {
		return orderSeatDao;
	}
	@Autowired 
	public void setOrderSeatDao(IOrderSeatDao orderSeatDao) {
		this.orderSeatDao = orderSeatDao;
	}
	@Transactional
	public void addOrderSeat(OrderSeat OrderSeat) {
		orderSeatDao.save(OrderSeat);
	}

	public void deleteOrderSeat(int id) throws Exception {
		orderSeatDao.delete(findOrderSeatById(id));
	}
	@Transactional(readOnly = true)
	public OrderSeat findOrderSeatById(int id) {
		return orderSeatDao.findById(id);
	}
//	@Transactional(readOnly = true)
//	public OrderSeat findOrderSeatByName(String name) throws Exception {
//		List list = orderSeatDao.findByName(name);
//		return list==null || list.size() == 0 ? null : (OrderSeat)list.get(0);
//	}
	@Transactional(readOnly = true)
	public List<OrderSeat> findOrderSeatList() {
		return orderSeatDao.findAll();
	}

	public void updateOrderSeat(OrderSeat OrderSeat) {
		orderSeatDao.merge(OrderSeat);
	}
	@Override
	public OrderSeat findOrderSeatByName(String name) {
		// TODO Auto-generated method stub
		List list = orderSeatDao.findByName(name);
		return list==null || list.size() == 0 ? null : (OrderSeat)list.get(0);
	}
	@Override
	public List<OrderSeat> findOrderSeatList(HttpServletRequest request, int pageNo,
                                             int pageSize) throws Exception {
		// TODO Auto-generated method stub
		List<OrderSeat> list = orderSeatDao.findOrderSeatList( request, pageNo, pageSize);
		return list;
	}
	@Override
	public Integer findCountOrderSeatList(HttpServletRequest request)
			throws Exception {
		// TODO Auto-generated method stub
		return orderSeatDao.findCountOrderSeatList(request);
	}

}
