package com.javaer.action;

import com.javaer.model.Hall;
import com.javaer.service.IHallService;
import com.javaer.util.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/hall")
public class HallController {
	
	private IHallService hallService;
	

	public IHallService geHallService() {
		return hallService;
	}
	@Autowired(required=true)
	public void setHallService(IHallService hallService) {
		this.hallService = hallService;
	}

	@RequestMapping(value="/back/list.do")
	public String list(Model model, HttpServletRequest request) {
		
		try{
			//分页参数
			int pageNo = ServletRequestUtils.getIntParameter(request, "pager.offset", 0);
			int pageSize = ServletRequestUtils.getIntParameter(request, "pager.limit", 10);
			//列表数据
			List<Hall> HallList = hallService.findHallList(request,pageNo,pageSize);
			model.addAttribute("hallList", HallList);
			model.addAttribute("total", hallService.findCountHallList(request));
			model.addAttribute("name",request.getParameter("name"));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "hall/list";
	}

	/*
	 * 同样的请求路径 Hall/add 如果是get请求就转到增加页面去，如果是post请求就做add操作
	 */
	@RequestMapping(value="/back/add",method=RequestMethod.GET)
	public String toAdd(Model model) {
		return "hall/add";
	}
	
	@RequestMapping(value="/back/add",method=RequestMethod.POST)
	public String doAdd(Hall hall, Model model) throws Exception {
		try {
		
			hall.setRegistTime(new Date());
			hallService.addHall(hall);
			model.addAttribute("resMess", Constants.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("resMess", Constants.RESULT_FAILED);
			throw e;
		}
		model.addAttribute("opeMess", Constants.OPERATE_TYPE_ADD);
		
		//重定向，防止重复提交，当然这样不能完全解决重复提交的问题，只是简单处理一下，若要较好的防止重复提交可以结合token做，
		//以“/”开关，相对于当前项目根路径，不以“/”开关，相对于当前路径
		//return "redirect:/Hall/list"; 
		return "redirect:list.do"; 
	}
	
	/*
	 * Restful模式路径：
	 * 注意这里/update/{id}和@PathVariable("id")中id要一致，这样不管用debug模式还是release模式编译都没问题
	 * 也可以简写成@PathVariable int id，但这样只能以debug模式编译的时候正确，如果用release编译就不正确了，因为如果用release模式编译会把参数的名字改变的
	 * 一般IDE工具都是以debug模式编译的，javac是以release模式编译的
	 * 同样的请求路径 Hall/update 如果是get请求就转到增加页面去，如果是post请求就做update操作
	 */
	@RequestMapping(value="/back/update/{id}",method=RequestMethod.GET)
	public String toUpdate(@PathVariable("id") int id, Model model) throws Exception {
		model.addAttribute("hall",hallService.findHallById(id));//大小写注意
		return "hall/update";
	}
	@RequestMapping(value="/back/update/{id}",method=RequestMethod.POST)
	public String doUpdate(@PathVariable("id") int id, Hall hall, Model model) throws Exception {
		try {
			
			hallService.updateHall(hall);
			model.addAttribute("resMess", Constants.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("resMess", Constants.RESULT_FAILED);
			throw e;
		}
		return "redirect:/hall/back/list.do"; //大小写注意
	}
	
	
	@RequestMapping(value="/delete/{id}")
	public String delete(@PathVariable("id") int id, Model model, HttpServletRequest request)throws Exception {
		try {
			hallService.deleteHall(id);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("resMess", Constants.RESULT_FAILED);
			throw e;
		}
		model.addAttribute("opeMess", Constants.OPERATE_TYPE_DELETE);
		return "redirect:/hall/back/list.do";//重定向
	}
}
