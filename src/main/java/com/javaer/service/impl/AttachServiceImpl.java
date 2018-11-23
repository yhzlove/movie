package com.javaer.service.impl;

import com.javaer.dao.IAttachDao;
import com.javaer.model.Attach;
import com.javaer.service.IAttachService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Service("attachService")
@Transactional
public class AttachServiceImpl implements IAttachService{
	
	private IAttachDao attachDao;
	
	public IAttachDao getAttachDao() {
		return attachDao;
	}
	@Autowired
	public void setAttachDao(IAttachDao attachDao) {
		this.attachDao = attachDao;
	}

	public void addAttach(Attach attach) {
		attachDao.save(attach);
	}

	public void deleteAttach(int id) throws Exception {
		attachDao.delete(getAttachById(id));
	}

	public Attach getAttachById(int id) {
		return attachDao.findById(id);
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Attach> getAttachList(String status) {
		return attachDao.findByProperty("ms",status);
	}

	public void updateAttach(Attach attach) {
		attachDao.merge(attach);
	}
	@Override
	public List<Attach> findAttachList(HttpServletRequest request, int pageNo,
                                       int pageSize) {
		// TODO Auto-generated method stub
		return attachDao.findAttachList(request,pageNo,pageSize);
	}
	@Override
	public Integer findCountAttachList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return attachDao.findCountAttachList(request);
	}

}
