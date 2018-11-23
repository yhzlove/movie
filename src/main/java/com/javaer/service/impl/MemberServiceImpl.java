package com.javaer.service.impl;

import com.javaer.dao.IMemberDao;
import com.javaer.model.Member;
import com.javaer.service.IMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Service("memberService")
@Transactional
public class MemberServiceImpl implements IMemberService {

	
	private IMemberDao memberDao;
	
	public IMemberDao getMemberDao() {
		return memberDao;
	}
	@Autowired 
	public void setMemberDao(IMemberDao memberDao) {
		this.memberDao = memberDao;
	}
	@Transactional
	public void addMember(Member member) {
		memberDao.save(member);
	}

	public void deleteMember(int id) throws Exception {
		memberDao.delete(findMemberById(id));
	}
	@Transactional(readOnly = true)
	public Member findMemberById(int id) {
		return memberDao.findById(id);
	}
//	@Transactional(readOnly = true)
//	public Member findMemberByName(String name) throws Exception {
//		List list = MemberDao.findByName(name);
//		return list==null || list.size() == 0 ? null : (Member)list.get(0);
//	}
	@Transactional(readOnly = true)
	public List<Member> findMemberList() {
		return memberDao.findAll();
	}

	public void updateMember(Member member) {
		memberDao.merge(member);
	}
	@Override
	public Member findMemberByMemberName(String membername) {
		// TODO Auto-generated method stub
		List list = memberDao.findByMemberName(membername);
		return list==null || list.size() == 0 ? null : (Member)list.get(0);
	}
	@Override
	public List<Member> findMemberList(HttpServletRequest request, int pageNo,
                                       int pageSize) throws Exception {
		// TODO Auto-generated method stub
		List<Member> list = memberDao.findMemberList( request, pageNo, pageSize);
		return list;
	}
	@Override
	public Integer findCountMemberList(HttpServletRequest request)
			throws Exception {
		// TODO Auto-generated method stub
		return memberDao.findCountMemberList(request);
	}

}
