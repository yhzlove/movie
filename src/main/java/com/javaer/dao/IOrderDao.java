package com.javaer.dao;

import com.javaer.model.Order;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface IOrderDao {

	void save(Order transientInstance);

	void delete(Order persistentInstance);

	Order findById(java.lang.Integer id);

	List findByExample(Order instance);

	List findByProperty(String propertyName, Object value);

	List findByName(Object name);

	List findAll();

	Order merge(Order detachedInstance);

	void attachDirty(Order instance);

	void attachClean(Order instance);
	
	List<Order> findOrderList(HttpServletRequest request, int pageNo, int pageSize) throws Exception;
	Integer findCountOrderList(HttpServletRequest request) throws Exception;
}