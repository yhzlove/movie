package com.javaer.dao;

import com.javaer.model.Movie;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface IMovieDao {

	void save(Movie transientInstance);

	void delete(Movie persistentInstance);

	Movie findById(java.lang.Integer id);

	List findByExample(Movie instance);

	List findByProperty(String propertyName, Object value);

	List findByName(Object name);

	List findAll();

	Movie merge(Movie detachedInstance);

	void attachDirty(Movie instance);

	void attachClean(Movie instance);
	
	List<Movie> findMovieList(HttpServletRequest request, int pageNo, int pageSize) throws Exception;
	Integer findCountMovieList(HttpServletRequest request) throws Exception;
	
	List<Object> findMovieBoxOffice(HttpServletRequest request, String dateType, String dateStr) throws Exception;

	List<Movie> findMovieOrderList(String order, int pageNo, int pageSize) throws Exception;
}