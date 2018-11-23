package com.javaer.service;

import com.javaer.model.User;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


public interface IUserService {
	void addUser(User user) throws Exception;
	void updateUser(User user) throws Exception;
	void deleteUser(int id) throws Exception;
	User findUserById(int id) throws Exception;
	List<User> findUserList() throws Exception;
	List<User> findUserList(HttpServletRequest request, int pageNo, int pageSize) throws Exception;
	Integer findCountUserList(HttpServletRequest request) throws Exception;
//	User findUserByName(String name) throws Exception;
	User findUserByUserName(String username) throws Exception;
}
