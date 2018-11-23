package com.javaer.util;

import com.javaer.model.Member;
import com.javaer.model.User;

import javax.servlet.http.HttpServletRequest;


public class Constants {
	public final static String OPERATE_TYPE_ADD = "0";
	public final static String OPERATE_TYPE_UPDATE = "1";
	public final static String OPERATE_TYPE_DELETE = "2";
	public final static String RESULT_FAILED = "0";
	public final static String RESULT_SUCCESS = "1";
	
	public final static String USER_INFO_SESSION = "loginUser";//登入的管理员(后台管理)
	public final static String MEMBER_INFO_SESSION = "loginMember";//登入的会员(前台)
	
	
	public  static User getLoginUser(HttpServletRequest request){
		return (User) request.getSession().getAttribute(Constants.USER_INFO_SESSION);
	}
	
	public  static Member getLoginMember(HttpServletRequest request){
		return (Member) request.getSession().getAttribute(Constants.MEMBER_INFO_SESSION);
	}
}
