package com.javaer.dao;

import com.javaer.model.Member;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface IMemberDao {

	void save(Member transientInstance);

	void delete(Member persistentInstance);

	Member findById(java.lang.Integer id);

	List findByExample(Member instance);

	List findByProperty(String propertyName, Object value);

//	public abstract List findByName(Object name);
//
List findByMemberName(Object MemberName);
//	
//	public abstract List findByAge(Object age);

//	public abstract List findByDeptId(Object deptId);

	List findAll();

	Member merge(Member detachedInstance);

	void attachDirty(Member instance);

	void attachClean(Member instance);
	
	List<Member> findMemberList(HttpServletRequest request, int pageNo, int pageSize) throws Exception;
	Integer findCountMemberList(HttpServletRequest request) throws Exception;
}