package com.javaer.dao;

import com.javaer.model.Hall;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface IHallDao {

	void save(Hall transientInstance);

	void delete(Hall persistentInstance);

	Hall findById(java.lang.Integer id);

	List findByExample(Hall instance);

	List findByProperty(String propertyName, Object value);

	List findByName(Object name);

	List findAll();

	Hall merge(Hall detachedInstance);

	void attachDirty(Hall instance);

	void attachClean(Hall instance);
	
	List<Hall> findHallList(HttpServletRequest request, int pageNo, int pageSize) throws Exception;
	Integer findCountHallList(HttpServletRequest request) throws Exception;
}