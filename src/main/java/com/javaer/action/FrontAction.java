package com.javaer.action;

import com.javaer.model.Movie;
import com.javaer.service.IMovieService;
import com.javaer.util.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 前端访问
 * 
 * <P>TODO</P>
 */
@Controller
//@RequestMapping("/front")
public class FrontAction {
	private IMovieService movieService;

	public IMovieService geMovieService() {
		return movieService;
	}
	@Autowired(required=true)
	public void setMovieService(IMovieService movieService) {
		this.movieService = movieService;
	}
	
	/**
	 * 前台主界面
	 * http://blog.csdn.net/caiwenfeng_for_23/article/details/45486233(学习这里)
	 */
	@RequestMapping("/")
	public String index(Model model, HttpServletRequest request) {
		// 显示X个最新电影的宣传海报
		// 查询电影列表查询前9条数据(最新/评分最高)
		try {
			List<Movie> movieList_New = movieService.findMovieNewList();
			model.addAttribute("movieList_New", movieList_New);
			
			List<Movie> movieList_Top = movieService.findMovieTopList();
			model.addAttribute("movieList_Top", movieList_Top);
			
			List<Movie> imgHeadList = movieService.findMovieByImgHeadList();
			model.addAttribute("imgHeadList", imgHeadList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "front_web/index";
	}
	
	
	/**
	 * 注销
	 */
	@RequestMapping(value = "/member/logout.do", method = RequestMethod.GET)
	public String logout(Model model, HttpServletRequest request) {
		request.getSession().removeAttribute(Constants.MEMBER_INFO_SESSION);
		model.addAttribute("message", "您已安全退出");
		
		return "redirect:/";
	}
}
