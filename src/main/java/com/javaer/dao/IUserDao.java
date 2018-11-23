package com.javaer.dao;

import com.javaer.model.User;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface IUserDao {

	void save(User transientInstance);

	void delete(User persistentInstance);

	User findById(java.lang.Integer id);

	List findByExample(User instance);

	List findByProperty(String propertyName, Object value);

//	public abstract List findByName(Object name);
//
List findByUserName(Object userName);
//	
//	public abstract List findByAge(Object age);

//	public abstract List findByDeptId(Object deptId);

	List findAll();

	User merge(User detachedInstance);

	void attachDirty(User instance);

	void attachClean(User instance);
	
	List<User> findUserList(HttpServletRequest request, int pageNo, int pageSize) throws Exception;
	Integer findCountUserList(HttpServletRequest request) throws Exception;
}