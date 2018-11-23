package com.javaer.util;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyHandlerInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		//就简单判断了一下，如果要详细控制可以用spring security
		String url = request.getRequestURI();
		if(url.indexOf("/back")>-1){//后台访问必须包含/back
			if(url.endsWith("back/login.do"))
				return true;
			if(request.getSession() != null && request.getSession().getAttribute(Constants.USER_INFO_SESSION) != null) 
				return true;
			response.sendRedirect(request.getContextPath() + "/back/login.do");	
			return false;
		}
		return true;//前台页面不控制
	}
	
	public static void main(String[] args) {
		String url = "123";
		System.out.println(url.indexOf("/back")>-1);
	}
}
