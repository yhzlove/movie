package com.javaer.service.impl;

import com.javaer.dao.IShowFilmDao;
import com.javaer.model.ShowFilm;
import com.javaer.service.IShowFilmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Service("ShowFilmService")
@Transactional
public class ShowFilmServiceImpl implements IShowFilmService {

	
	private IShowFilmDao showFilmDao;
	
	public IShowFilmDao getShowFilmDao() {
		return showFilmDao;
	}
	@Autowired 
	public void setShowFilmDao(IShowFilmDao showFilmDao) {
		this.showFilmDao = showFilmDao;
	}
	@Transactional
	public void addShowFilm(ShowFilm ShowFilm) {
		showFilmDao.save(ShowFilm);
	}

	public void deleteShowFilm(int id) throws Exception {
		showFilmDao.delete(findShowFilmById(id));
	}
	@Transactional(readOnly = true)
	public ShowFilm findShowFilmById(int id) {
		return showFilmDao.findById(id);
	}
//	@Transactional(readOnly = true)
//	public ShowFilm findShowFilmByName(String name) throws Exception {
//		List list = showFilmDao.findByName(name);
//		return list==null || list.size() == 0 ? null : (ShowFilm)list.get(0);
//	}
	@Transactional(readOnly = true)
	public List<ShowFilm> findShowFilmList() {
		return showFilmDao.findAll();
	}

	public void updateShowFilm(ShowFilm ShowFilm) {
		showFilmDao.merge(ShowFilm);
	}
	@Override
	public ShowFilm findShowFilmByName(String name) {
		// TODO Auto-generated method stub
		List list = showFilmDao.findByName(name);
		return list==null || list.size() == 0 ? null : (ShowFilm)list.get(0);
	}
	@Override
	public List<ShowFilm> findShowFilmList(HttpServletRequest request, int pageNo,
                                           int pageSize) throws Exception {
		// TODO Auto-generated method stub
		List<ShowFilm> list = showFilmDao.findShowFilmList( request, pageNo, pageSize);
		return list;
	}
	@Override
	public Integer findCountShowFilmList(HttpServletRequest request)
			throws Exception {
		// TODO Auto-generated method stub
		return showFilmDao.findCountShowFilmList(request);
	}

}
