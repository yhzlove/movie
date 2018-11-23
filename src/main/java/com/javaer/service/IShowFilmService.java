package com.javaer.service;

import com.javaer.model.ShowFilm;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


public interface IShowFilmService {
	void addShowFilm(ShowFilm showFilm) throws Exception;
	void updateShowFilm(ShowFilm showFilm) throws Exception;
	void deleteShowFilm(int id) throws Exception;
	ShowFilm findShowFilmById(int id) throws Exception;
	List<ShowFilm> findShowFilmList() throws Exception;
	List<ShowFilm> findShowFilmList(HttpServletRequest request, int pageNo, int pageSize) throws Exception;
	Integer findCountShowFilmList(HttpServletRequest request) throws Exception;
	ShowFilm findShowFilmByName(String showFilmname) throws Exception;
}
