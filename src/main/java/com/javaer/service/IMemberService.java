package com.javaer.service;

import com.javaer.model.Member;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


public interface IMemberService {
	void addMember(Member member) throws Exception;
	void updateMember(Member member) throws Exception;
	void deleteMember(int id) throws Exception;
	Member findMemberById(int id) throws Exception;
	List<Member> findMemberList() throws Exception;
	List<Member> findMemberList(HttpServletRequest request, int pageNo, int pageSize) throws Exception;
	Integer findCountMemberList(HttpServletRequest request) throws Exception;
//	Member findMemberByName(String name) throws Exception;
	Member findMemberByMemberName(String membername) throws Exception;
}
