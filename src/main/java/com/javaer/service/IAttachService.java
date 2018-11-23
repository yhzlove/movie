package com.javaer.service;

import com.javaer.model.Attach;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


public interface IAttachService {
	void addAttach(Attach attach) throws Exception;
	void updateAttach(Attach attach) throws Exception;
	void deleteAttach(int id) throws Exception;
	Attach getAttachById(int id) throws Exception;
	List<Attach> getAttachList(String status) throws Exception;
	List<Attach> findAttachList(HttpServletRequest request, int pageNo,
                                int pageSize)throws Exception;
	Integer findCountAttachList(HttpServletRequest request)throws Exception;
}
