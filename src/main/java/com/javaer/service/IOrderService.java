package com.javaer.service;

import com.javaer.model.Order;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


public interface IOrderService {
	void addOrder(Order order) throws Exception;
	void updateOrder(Order order) throws Exception;
	void deleteOrder(int id) throws Exception;
	Order findOrderById(int id) throws Exception;
	List<Order> findOrderList() throws Exception;
	List<Order> findOrderList(HttpServletRequest request, int pageNo, int pageSize) throws Exception;
	Integer findCountOrderList(HttpServletRequest request) throws Exception;
	Order findOrderByName(String ordername) throws Exception;
}
