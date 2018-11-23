package com.javaer.service;

import com.javaer.model.OrderSeat;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


public interface IOrderSeatService {
	void addOrderSeat(OrderSeat orderSeat) throws Exception;
	void updateOrderSeat(OrderSeat orderSeat) throws Exception;
	void deleteOrderSeat(int id) throws Exception;
	OrderSeat findOrderSeatById(int id) throws Exception;
	List<OrderSeat> findOrderSeatList() throws Exception;
	List<OrderSeat> findOrderSeatList(HttpServletRequest request, int pageNo, int pageSize) throws Exception;
	Integer findCountOrderSeatList(HttpServletRequest request) throws Exception;
	OrderSeat findOrderSeatByName(String orderSeatname) throws Exception;
}
