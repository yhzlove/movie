package com.javaer.action;

import com.javaer.model.Movie;
import com.javaer.service.IHallService;
import com.javaer.service.IMovieService;
import com.javaer.util.Constants;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/movie")
public class MovieController {
	
	private IMovieService movieService;
	private IHallService hallService;
	
	public IHallService geHallService() {
		return hallService;
	}
	@Autowired(required=true)
	public void setHallService(IHallService hallService) {
		this.hallService = hallService;
	}
	public IMovieService geMovieService() {
		return movieService;
	}
	@Autowired(required=true)
	public void setMovieService(IMovieService movieService) {
		this.movieService = movieService;
	}
	
	
	/**
	 * 后台列表查询
	 */
	@RequestMapping(value="/back/list.do")
	public String list(Model model, HttpServletRequest request) {
		
		try{
			//分页参数
			int pageNo = ServletRequestUtils.getIntParameter(request, "pager.offset", 0);
			int pageSize = ServletRequestUtils.getIntParameter(request, "pager.limit", 10);
			//列表数据
			List<Movie> movieList = movieService.findMovieList(request,pageNo,pageSize);
			model.addAttribute("movieList", movieList);
			model.addAttribute("total", movieService.findCountMovieList(request));
			model.addAttribute("movieName",request.getParameter("movieName"));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "movie/list";
	}

	
	
	/*
	 * 同样的请求路径 Movie/add 如果是get请求就转到增加页面去，如果是post请求就做add操作
	 */
	@RequestMapping(value="/back/add",method=RequestMethod.GET)
	public String toAdd(Model model) {
		return "movie/add";
	}
	
	@RequestMapping(value="/back/add",method=RequestMethod.POST)
	public String doAdd(Movie movie, Model model) throws Exception {
		try {
		
			movie.setCreatTime(new Date());
			movieService.addMovie(movie);
			model.addAttribute("resMess", Constants.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("resMess", Constants.RESULT_FAILED);
			throw e;
		}
		model.addAttribute("opeMess", Constants.OPERATE_TYPE_ADD);
		
		//重定向，防止重复提交，当然这样不能完全解决重复提交的问题，只是简单处理一下，若要较好的防止重复提交可以结合token做，
		//以“/”开关，相对于当前项目根路径，不以“/”开关，相对于当前路径
		//return "redirect:/Movie/list"; 
		return "redirect:list.do"; 
	}
	
	
	@RequestMapping(value="/back/update/{id}",method=RequestMethod.GET)
	public String toUpdate(@PathVariable("id") int id, Model model) throws Exception {
		model.addAttribute("movie",movieService.findMovieById(id));//大小写注意
		return "movie/update";
	}
	@RequestMapping(value="/back/update/{id}",method=RequestMethod.POST)
	public String doUpdate(@PathVariable("id") int id, Movie movie, Model model) throws Exception {
		try {
			movieService.updateMovie(movie);
			model.addAttribute("resMess", Constants.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("resMess", Constants.RESULT_FAILED);
			throw e;
		}
		return "redirect:/movie/back/list.do"; //大小写注意
	}
	
	@RequestMapping(value="/back/delete/{id}")
	public String delete(@PathVariable("id") int id, Model model, HttpServletRequest request)throws Exception {
		try {
			movieService.deleteMovie(id);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("resMess", Constants.RESULT_FAILED);
			throw e;
		}
		model.addAttribute("opeMess", Constants.OPERATE_TYPE_DELETE);
		return "redirect:/movie/back/list.do";//重定向
	}
	
	@RequestMapping(value="/back/attach_list/{id}")
	public String attachList(@PathVariable("id") int id, Model model, HttpServletRequest request)throws Exception {
		model.addAttribute("movie",movieService.findMovieById(id));//大小写注意
		return "movie/movie_attach";
	}
	@RequestMapping(value="/back/attach_add/{id}")
	public String attachAdd(@PathVariable("id") int id, Model model, HttpServletRequest request)throws Exception {
		model.addAttribute("movie",movieService.findMovieById(id));//大小写注意
		return "movie/attach_add";
	}
	
	@RequestMapping(value="/back/attach_video/{id}")
	public String attachVideo(@PathVariable("id") int id, Model model, HttpServletRequest request)throws Exception {
		model.addAttribute("movie",movieService.findMovieById(id));//大小写注意
		return "movie/video";
	}
	
	/**
	 * 
	 * 电影安排场次
	 */
	@RequestMapping(value="/back/addshowFilm/{id}")
	public String addshowFilm(@PathVariable("id") int id, Model model, HttpServletRequest request)throws Exception {
		model.addAttribute("movie",movieService.findMovieById(id));
		
		model.addAttribute("hallList",hallService.findHallList());
		return "showFilm/add";
	}
	
	/**
	 * 
	 * 电影票房-每日
	 * dateType  day/mouth/year  日/月/年
	 * 
	 */
	@RequestMapping(value="/back/boxOffice/{dateType}")
	public String boxOfficeDay(@PathVariable("dateType") String dateType, Model model, HttpServletRequest request) {
		try{
			//列表数据
			String dateStr = request.getParameter("dateStr");
			if(!"all".equals(dateType)&&StringUtils.isEmpty(dateStr)){//如果为空  则去当前时间
				Date date = new Date();
				SimpleDateFormat datetimeFormat;
				if("day".equals(dateType)){
					datetimeFormat = new SimpleDateFormat("yyyy-MM-dd");
				}else if("mouth".equals(dateType)){
					datetimeFormat = new SimpleDateFormat("yyyy-MM");
				}else{
					datetimeFormat = new SimpleDateFormat("yyyy");
				}
				
				dateStr = datetimeFormat.format(date);
			}
			
			List<Object> movieList = movieService.findMovieBoxOffice(request,dateType,dateStr);
			model.addAttribute("movieList", movieList);
//			model.addAttribute("total", movieService.findCountMovieList(request));
			model.addAttribute("dateStr",dateStr);
			model.addAttribute("dateType",dateType);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "movie/boxOffice";
	}
	
	/**
	 * 
	 * 电影详情页(前台)
	 */
	@RequestMapping(value="/single/{id}",method=RequestMethod.GET)
	public String Single(@PathVariable("id") int id, Model model) throws Exception {
		Movie movie = movieService.findMovieById(id);
		//电影
		model.addAttribute("movie",movie);//大小写注意
		//电影场次(只查询当日之后的   排序asc)
		model.addAttribute("showFileList",movie.getShowFilmList());
		//电影评论(只查询当日之后的   排序asc)
		model.addAttribute("commentList",movie.getCommentList());
		
		
		return "front_web/single";
	}
	/**
	 * 前台列表查询
	 */
	@RequestMapping(value="/list.do")
	public String listByFront(Model model, HttpServletRequest request) {
		
		try{
			//分页参数
			int pageNo = ServletRequestUtils.getIntParameter(request, "pager.offset", 0);
			int pageSize = ServletRequestUtils.getIntParameter(request, "pager.limit", 10);
			//列表数据
			List<Movie> movieList = movieService.findMovieList(request,pageNo,pageSize);
			model.addAttribute("movieList", movieList);
			model.addAttribute("total", movieService.findCountMovieList(request));
			model.addAttribute("movieName",request.getParameter("movieName"));
			model.addAttribute("category",request.getParameter("category"));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "front_web/movielist";
	}
}
