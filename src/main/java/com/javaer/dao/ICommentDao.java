package com.javaer.dao;

import com.javaer.model.Comment;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface ICommentDao {

	void save(Comment transientInstance);

	void delete(Comment persistentInstance);

	Comment findById(java.lang.Integer id);

	List findByExample(Comment instance);

	List findByProperty(String propertyName, Object value);

	List findByName(Object name);

	List findAll();

	Comment merge(Comment detachedInstance);

	void attachDirty(Comment instance);

	void attachClean(Comment instance);
	
	List<Comment> findCommentList(HttpServletRequest request, int pageNo, int pageSize) throws Exception;
	Integer findCountCommentList(HttpServletRequest request) throws Exception;
}