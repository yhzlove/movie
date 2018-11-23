package com.javaer.service;

import com.javaer.model.Movie;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


public interface IMovieService {
	void addMovie(Movie movie) throws Exception;
	void updateMovie(Movie movie) throws Exception;
	void deleteMovie(int id) throws Exception;
	Movie findMovieById(int id) throws Exception;
	List<Movie> findMovieList() throws Exception;
	List<Movie> findMovieList(HttpServletRequest request, int pageNo, int pageSize) throws Exception;
	Integer findCountMovieList(HttpServletRequest request) throws Exception;
	Movie findMovieByName(String moviename) throws Exception;
	List<Movie> findMovieByImgHeadList() throws Exception;
	
	List<Object> findMovieBoxOffice(HttpServletRequest request, String dateType, String dateStr) throws Exception;
	
	
	List<Movie> findMovieNewList() throws Exception;
	
	List<Movie> findMovieTopList() throws Exception;
}
