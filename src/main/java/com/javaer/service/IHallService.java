package com.javaer.service;

import com.javaer.model.Hall;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


public interface IHallService {
	void addHall(Hall hall) throws Exception;
	void updateHall(Hall hall) throws Exception;
	void deleteHall(int id) throws Exception;
	Hall findHallById(int id) throws Exception;
	List<Hall> findHallList() throws Exception;
	List<Hall> findHallList(HttpServletRequest request, int pageNo, int pageSize) throws Exception;
	Integer findCountHallList(HttpServletRequest request) throws Exception;
	Hall findHallByName(String hallname) throws Exception;
}
