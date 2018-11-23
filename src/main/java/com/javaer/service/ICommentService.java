package com.javaer.service;

import com.javaer.model.Comment;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


public interface ICommentService {
	void addComment(Comment comment) throws Exception;
	void updateComment(Comment comment) throws Exception;
	void deleteComment(int id) throws Exception;
	Comment findCommentById(int id) throws Exception;
	List<Comment> findCommentList() throws Exception;
	List<Comment> findCommentList(HttpServletRequest request, int pageNo, int pageSize) throws Exception;
	Integer findCountCommentList(HttpServletRequest request) throws Exception;
	Comment findCommentByName(String commentname) throws Exception;
}
