package com.javaer.action;

import com.javaer.model.User;
import com.javaer.service.IUserService;
import com.javaer.util.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/user/back")
public class UserController {
	
	private IUserService userService;
	

	public IUserService geUserService() {
		return userService;
	}
	@Autowired(required=true)
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
/**
 * 登入表单
 * @param username用户名
 * @param password密码
 * @param model数据模型
 * @param request请求
 * @return view 界面
 * @throws Exception
 * @author meng
 * @create 2015-9-16
 * 
 */
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public String login(@RequestParam String username, @RequestParam String password, Model model, HttpServletRequest request) throws Exception {
//		User user1 = userService.findUserByName(name);
		User user1 = userService.findUserByUserName(username);
		if(user1 == null) {
			model.addAttribute("message", "用户不存在");
			return "login";
		}else if(password == null || !password.equals(user1.getPassword()) ){
			model.addAttribute("message", "密码错误");
			return "login"; 
		}else {
			request.getSession().setAttribute(Constants.USER_INFO_SESSION, user1);
			return "welcome";
		}
	}

	@RequestMapping(value="/list.do")
	public String list(Model model, HttpServletRequest request) {
		
		
//		List<Info> List = new ArrayList<Info>();
		try{
			//分页参数
			int pageNo = ServletRequestUtils.getIntParameter(request, "pager.offset", 0);
			int pageSize = ServletRequestUtils.getIntParameter(request, "pager.limit", 10);
			//列表数据
			List<User> userList = userService.findUserList(request,pageNo,pageSize);
			model.addAttribute("userList", userList);
			model.addAttribute("total", userService.findCountUserList(request));
			model.addAttribute("userName",request.getParameter("userName"));
			model.addAttribute("realName",request.getParameter("realName"));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "user/list";
	}

	
	/*
	 * 同样的请求路径 user/add 如果是get请求就转到增加页面去，如果是post请求就做add操作
	 */
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String toAdd(Model model) {
		return "user/add";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String doAdd(User user, Model model) throws Exception {
		try {
		
			user.setRegistTime(new Date());
			userService.addUser(user);
			model.addAttribute("resMess", Constants.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("resMess", Constants.RESULT_FAILED);
			throw e;
		}
		model.addAttribute("opeMess", Constants.OPERATE_TYPE_ADD);
		
		//重定向，防止重复提交，当然这样不能完全解决重复提交的问题，只是简单处理一下，若要较好的防止重复提交可以结合token做，
		//以“/”开关，相对于当前项目根路径，不以“/”开关，相对于当前路径
		//return "redirect:/user/list"; 
		return "redirect:list.do"; 
	}
	
	/*
	 * Restful模式路径：
	 * 注意这里/update/{id}和@PathVariable("id")中id要一致，这样不管用debug模式还是release模式编译都没问题
	 * 也可以简写成@PathVariable int id，但这样只能以debug模式编译的时候正确，如果用release编译就不正确了，因为如果用release模式编译会把参数的名字改变的
	 * 一般IDE工具都是以debug模式编译的，javac是以release模式编译的
	 * 同样的请求路径 user/update 如果是get请求就转到增加页面去，如果是post请求就做update操作
	 */
	@RequestMapping(value="/update/{id}",method=RequestMethod.GET)
	public String toUpdate(@PathVariable("id") int id, Model model) throws Exception {
		model.addAttribute("user",userService.findUserById(id));
		return "user/update";
	}
	@RequestMapping(value="/update/{id}",method=RequestMethod.POST)
	public String doUpdate(@PathVariable("id") int id, User user, Model model) throws Exception {
		try {
			userService.updateUser(user);
			model.addAttribute("resMess", Constants.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("resMess", Constants.RESULT_FAILED);
			throw e;
		}
		return "redirect:/user/back/list.do"; 
	}
	
	@RequestMapping(value="/delete/{id}")
	public String delete(@PathVariable("id") int id, Model model, HttpServletRequest request)throws Exception {
		try {
			userService.deleteUser(id);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("resMess", Constants.RESULT_FAILED);
			throw e;
		}
		model.addAttribute("opeMess", Constants.OPERATE_TYPE_DELETE);
		return "redirect:/user/back/list.do";//重定向
	}
}
