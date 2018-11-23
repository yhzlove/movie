package com.javaer.service.impl;

import com.javaer.dao.IMovieDao;
import com.javaer.model.Movie;
import com.javaer.service.IMovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Service("MovieService")
@Transactional
public class MovieServiceImpl implements IMovieService {

	
	private IMovieDao movieDao;
	
	public IMovieDao getMovieDao() {
		return movieDao;
	}
	@Autowired 
	public void setMovieDao(IMovieDao movieDao) {
		this.movieDao = movieDao;
	}
	@Transactional
	public void addMovie(Movie Movie) {
		movieDao.save(Movie);
	}

	public void deleteMovie(int id) throws Exception {
		movieDao.delete(findMovieById(id));
	}
	@Transactional(readOnly = true)
	public Movie findMovieById(int id) {
		return movieDao.findById(id);
	}
	@Transactional(readOnly = true)
	public List<Movie> findMovieList() {
		return movieDao.findAll();
	}

	public void updateMovie(Movie Movie) {
		movieDao.merge(Movie);
	}
	@Override
	public Movie findMovieByName(String name) {
		List list = movieDao.findByName(name);
		return list==null || list.size() == 0 ? null : (Movie)list.get(0);
	}
	@Override
	public List<Movie> findMovieList(HttpServletRequest request, int pageNo,
                                     int pageSize) throws Exception {
		List<Movie> list = movieDao.findMovieList( request, pageNo, pageSize);
		return list;
	}
	@Override
	public Integer findCountMovieList(HttpServletRequest request)
			throws Exception {
		return movieDao.findCountMovieList(request);
	}
	
	
	public List<Object> findMovieBoxOffice(HttpServletRequest request, String dateType, String dateStr)
			throws Exception {
		
		return movieDao.findMovieBoxOffice(request,dateType,dateStr);
	}
	
	@Override
	public List<Movie> findMovieByImgHeadList() {
		List list = movieDao.findByProperty("imgHead", "1");
		
		return list;
	}
	@Override
	public List<Movie> findMovieNewList() throws Exception {
		
		List<Movie> list = movieDao.findMovieOrderList("showTime", 0, 9);
		return list;
	}
	@Override
	public List<Movie> findMovieTopList() throws Exception {
		List<Movie> list = movieDao.findMovieOrderList("starRating", 0, 9);
		
		return list;
	}
}
