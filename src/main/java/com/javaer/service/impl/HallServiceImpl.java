package com.javaer.service.impl;

import com.javaer.dao.IHallDao;
import com.javaer.model.Hall;
import com.javaer.service.IHallService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Service("hallService")
@Transactional
public class HallServiceImpl implements IHallService {

	
	private IHallDao hallDao;
	
	public IHallDao getHallDao() {
		return hallDao;
	}
	@Autowired 
	public void setHallDao(IHallDao hallDao) {
		this.hallDao = hallDao;
	}
	@Transactional
	public void addHall(Hall hall) {
		hallDao.save(hall);
	}

	public void deleteHall(int id) throws Exception {
		hallDao.delete(findHallById(id));
	}
	@Transactional(readOnly = true)
	public Hall findHallById(int id) {
		return hallDao.findById(id);
	}
//	@Transactional(readOnly = true)
//	public Hall findHallByName(String name) throws Exception {
//		List list = hallDao.findByName(name);
//		return list==null || list.size() == 0 ? null : (Hall)list.get(0);
//	}
	@Transactional(readOnly = true)
	public List<Hall> findHallList() {
		return hallDao.findAll();
	}

	public void updateHall(Hall hall) {
		hallDao.merge(hall);
	}
	@Override
	public Hall findHallByName(String name) {
		// TODO Auto-generated method stub
		List list = hallDao.findByName(name);
		return list==null || list.size() == 0 ? null : (Hall)list.get(0);
	}
	@Override
	public List<Hall> findHallList(HttpServletRequest request, int pageNo,
                                   int pageSize) throws Exception {
		// TODO Auto-generated method stub
		List<Hall> list = hallDao.findHallList( request, pageNo, pageSize);
		return list;
	}
	@Override
	public Integer findCountHallList(HttpServletRequest request)
			throws Exception {
		// TODO Auto-generated method stub
		return hallDao.findCountHallList(request);
	}

}
