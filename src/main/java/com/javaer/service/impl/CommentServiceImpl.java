package com.javaer.service.impl;

import com.javaer.dao.ICommentDao;
import com.javaer.model.Comment;
import com.javaer.service.ICommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Service("CommentService")
@Transactional
public class CommentServiceImpl implements ICommentService {

	
	private ICommentDao commentDao;
	
	public ICommentDao getCommentDao() {
		return commentDao;
	}
	@Autowired 
	public void setCommentDao(ICommentDao commentDao) {
		this.commentDao = commentDao;
	}
	@Transactional
	public void addComment(Comment Comment) {
		commentDao.save(Comment);
	}

	public void deleteComment(int id) throws Exception {
		commentDao.delete(findCommentById(id));
	}
	@Transactional(readOnly = true)
	public Comment findCommentById(int id) {
		return commentDao.findById(id);
	}
//	@Transactional(readOnly = true)
//	public Comment findCommentByName(String name) throws Exception {
//		List list = commentDao.findByName(name);
//		return list==null || list.size() == 0 ? null : (Comment)list.get(0);
//	}
	@Transactional(readOnly = true)
	public List<Comment> findCommentList() {
		return commentDao.findAll();
	}

	public void updateComment(Comment Comment) {
		commentDao.merge(Comment);
	}
	@Override
	public Comment findCommentByName(String name) {
		// TODO Auto-generated method stub
		List list = commentDao.findByName(name);
		return list==null || list.size() == 0 ? null : (Comment)list.get(0);
	}
	@Override
	public List<Comment> findCommentList(HttpServletRequest request, int pageNo,
                                         int pageSize) throws Exception {
		// TODO Auto-generated method stub
		List<Comment> list = commentDao.findCommentList( request, pageNo, pageSize);
		return list;
	}
	@Override
	public Integer findCountCommentList(HttpServletRequest request)
			throws Exception {
		// TODO Auto-generated method stub
		return commentDao.findCountCommentList(request);
	}

}
