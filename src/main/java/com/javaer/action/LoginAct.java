package com.javaer.action;

import com.javaer.model.User;
import com.javaer.service.IUserService;
import com.javaer.util.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

/* 
 * 不需要实现任何接口，也不需要继承任何的类 
 */
@Controller
@RequestMapping("/back")
public class LoginAct {
	private IUserService userService;

	@Autowired(required = true)
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	/**
	 * 方法都可以接受的参数(参数数量和顺序没有限制)：
	 * HttpServletRequest,HttpServletResponse,HttpSession(session必须是可用的)
	 * ,PrintWriter,Map,Model,@PathVariable(任意多个)， @RequestParam（任意多个）， @CookieValue
	 * （任意多个），@RequestHeader，Object（pojo对象） ,BindingResult等等
	 * 
	 * 返回值可以是：String(视图名)，void（用于直接response），ModelAndView，Map
	 * ，Model，任意其它任意类型的对象（默认放入model中，名称即类型的首字母改成小写），视图名默认是请求路径
	 */


//	/**
//	 * 主界面
//	 * 
//	 * @param model
//	 * @param request
//	 * @return
//	 */
	@RequestMapping("")
	public String index(Model model, HttpServletRequest request) {
		// 验证是否登入
		return "login";
	}

	/**
	 * 菜单窗口
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/menu.do")
	public String menu(Model model, HttpServletRequest request) {
		return "frame_menu";
	}

	/**
	 * 头部窗口
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/top.do")
	public String top(Model model, HttpServletRequest request) {
		return "frame_top";
	}

	/**
	 * 内容窗口
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/main.do")
	public String frame_main(Model model, HttpServletRequest request) {
		return "frame_main";
	}

	/**
	 * 登入表单
	 * 
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
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(@RequestParam String username,
                        @RequestParam String password, Model model,
                        HttpServletRequest request) throws Exception {
		User user = userService.findUserByUserName(username);
		if (user == null) {
			model.addAttribute("message", "用户不存在");
			return "login";
		} else if (password == null || !password.equals(user.getPassword())) {
			model.addAttribute("message", "密码错误");
			return "login";
		} else {
			request.getSession()
					.setAttribute(Constants.USER_INFO_SESSION, user);
			return "redirect:index.do"; 
		}

	}

	/**
	 * 注销
	 */
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(Model model, HttpServletRequest request) {
		// 使用权限管理工具进行用户的退出，跳出登录，给出提示信息
		request.getSession().removeAttribute(Constants.USER_INFO_SESSION);
		model.addAttribute("message", "您已安全退出");
		return "redirect:login.do";
	}

	/**
	 * 登入界面
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/login.do")
	public String login(Model model, HttpServletRequest request) {
		return "login";
	}

	@RequestMapping("/index.do")
	public String index() {
		return "index";
	}

	@RequestMapping("/403")
	public String unauthorizedRole() {
		return "/403";
	}
}
