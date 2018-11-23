package com.javaer.dao;

import com.javaer.model.ShowFilm;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface IShowFilmDao {

	void save(ShowFilm transientInstance);

	void delete(ShowFilm persistentInstance);

	ShowFilm findById(java.lang.Integer id);

	List findByExample(ShowFilm instance);

	List findByProperty(String propertyName, Object value);

	List findByName(Object name);

	List findAll();

	ShowFilm merge(ShowFilm detachedInstance);

	void attachDirty(ShowFilm instance);

	void attachClean(ShowFilm instance);
	
	List<ShowFilm> findShowFilmList(HttpServletRequest request, int pageNo, int pageSize) throws Exception;
	Integer findCountShowFilmList(HttpServletRequest request) throws Exception;
}