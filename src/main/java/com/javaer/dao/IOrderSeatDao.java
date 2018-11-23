package com.javaer.dao;

import com.javaer.model.OrderSeat;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface IOrderSeatDao {

	void save(OrderSeat transientInstance);

	void delete(OrderSeat persistentInstance);

	OrderSeat findById(java.lang.Integer id);

	List findByExample(OrderSeat instance);

	List findByProperty(String propertyName, Object value);

	List findByName(Object name);

	List findAll();

	OrderSeat merge(OrderSeat detachedInstance);

	void attachDirty(OrderSeat instance);

	void attachClean(OrderSeat instance);
	
	List<OrderSeat> findOrderSeatList(HttpServletRequest request, int pageNo, int pageSize) throws Exception;
	Integer findCountOrderSeatList(HttpServletRequest request) throws Exception;
}