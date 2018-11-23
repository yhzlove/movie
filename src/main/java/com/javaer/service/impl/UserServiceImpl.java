package com.javaer.service.impl;

import com.javaer.dao.IUserDao;
import com.javaer.model.User;
import com.javaer.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Service("userService")
@Transactional
public class UserServiceImpl implements IUserService {

	
	private IUserDao userDao;
	
	public IUserDao getUserDao() {
		return userDao;
	}
	@Autowired 
	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}
	@Transactional
	public void addUser(User user) {
		userDao.save(user);
	}

	public void deleteUser(int id) throws Exception {
		userDao.delete(findUserById(id));
	}
	@Transactional(readOnly = true)
	public User findUserById(int id) {
		return userDao.findById(id);
	}
//	@Transactional(readOnly = true)
//	public User findUserByName(String name) throws Exception {
//		List list = userDao.findByName(name);
//		return list==null || list.size() == 0 ? null : (User)list.get(0);
//	}
	@Transactional(readOnly = true)
	public List<User> findUserList() {
		return userDao.findAll();
	}

	public void updateUser(User user) {
		userDao.merge(user);
	}
	@Override
	public User findUserByUserName(String username) {
		// TODO Auto-generated method stub
		List list = userDao.findByUserName(username);
		return list==null || list.size() == 0 ? null : (User)list.get(0);
	}
	@Override
	public List<User> findUserList(HttpServletRequest request, int pageNo,
                                   int pageSize) throws Exception {
		// TODO Auto-generated method stub
		List<User> list = userDao.findUserList( request, pageNo, pageSize);
		return list;
	}
	@Override
	public Integer findCountUserList(HttpServletRequest request)
			throws Exception {
		// TODO Auto-generated method stub
		return userDao.findCountUserList(request);
	}

}
