package com.javaer.dao;

import com.javaer.model.Attach;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


public interface IAttachDao {

	String NAME = "oldName";

	void save(Attach transientInstance);

	void delete(Attach persistentInstance);

	Attach findById(java.lang.Integer id);

	List findByExample(Attach instance);

	List findByProperty(String propertyName, Object value);

	List findByName(Object name);

	List findAll();

	Attach merge(Attach detachedInstance);

	void attachDirty(Attach instance);

	void attachClean(Attach instance);

	List<Attach> findByXq();

	List<Attach> findAttachList(HttpServletRequest request,
                                int pageNo, int pageSize);

	Integer findCountAttachList(HttpServletRequest request);

}