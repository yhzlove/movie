package com.javaer.action;

import com.javaer.model.Comment;
import com.javaer.model.Member;
import com.javaer.service.ICommentService;
import com.javaer.util.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

/**
 * 
 * 留言评论处理类
 */
@Controller
@RequestMapping("/comment")
public class CommentController {
	
	private ICommentService commentService;
	

	public ICommentService geCommentService() {
		return commentService;
	}
	@Autowired(required=true)
	public void setCommentService(ICommentService commentService) {
		this.commentService = commentService;
	}


	
	@RequestMapping({"/back/list.do"})
	public String list(Model model, HttpServletRequest request) {

		try{
			//分页参数
			int pageNo = ServletRequestUtils.getIntParameter(request, "pager.offset", 0);
			int pageSize = ServletRequestUtils.getIntParameter(request, "pager.limit", 10);
			//列表数据
			List<Comment> commentList = commentService.findCommentList(request,pageNo,pageSize);
			model.addAttribute("commentList", commentList);
			model.addAttribute("total", commentService.findCountCommentList(request));
			model.addAttribute("movieName",request.getParameter("movieName"));
			model.addAttribute("memberName",request.getParameter("memberName"));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "comment/list";
	}

	
	/*
	 * 同样的请求路径 Comment/add 如果是get请求就转到增加页面去，如果是post请求就做add操作
	 */
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String toAdd(Model model) {
		return "comment/add";
	}
	/**
	 * 前台提交评论-刷新当前页面
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public void doAdd(Comment comment,Model model,HttpServletResponse response) throws Exception {
		String msg="";
		try {
			comment.setCreateTime(new Date());
			commentService.addComment(comment);
			msg ="success";
		} catch (Exception e) {
			e.printStackTrace();
			//throw e;
			msg ="保存失败!请重试";
		}
		PrintWriter out;
		out = response.getWriter();
		out.print(msg);
        out.flush();
	}
	
	/*
	 * Restful模式路径：
	 * 注意这里/update/{id}和@PathVariable("id")中id要一致，这样不管用debug模式还是release模式编译都没问题
	 * 也可以简写成@PathVariable int id，但这样只能以debug模式编译的时候正确，如果用release编译就不正确了，因为如果用release模式编译会把参数的名字改变的
	 * 一般IDE工具都是以debug模式编译的，javac是以release模式编译的
	 * 同样的请求路径 Comment/update 如果是get请求就转到增加页面去，如果是post请求就做update操作
	 */
	@RequestMapping(value="/back/update/{id}",method=RequestMethod.GET)
	public String toUpdate(@PathVariable("id") int id, Model model) throws Exception {
		model.addAttribute("comment",commentService.findCommentById(id));//大小写注意
		return "comment/update";
	}
	@RequestMapping(value="/back/update/{id}",method=RequestMethod.POST)
	public String doUpdate(@PathVariable("id") int id, Comment comment, Model model) throws Exception {
		try {
			commentService.updateComment(comment);
			model.addAttribute("resMess", Constants.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("resMess", Constants.RESULT_FAILED);
			throw e;
		}
		return "redirect:/comment/back/list.do"; //大小写注意
	}
	
	@RequestMapping(value="/back/delete/{id}")
	public String delete(@PathVariable("id") int id, Model model, HttpServletRequest request)throws Exception {
		try {
			commentService.deleteComment(id);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("resMess", Constants.RESULT_FAILED);
			throw e;
		}
		model.addAttribute("opeMess", Constants.OPERATE_TYPE_DELETE);
		return "redirect:/comment/back/list.do";//重定向
	}
	
	
	@RequestMapping(value="/member/list.do")
	public String listByMember(Model model, HttpServletRequest request) {
		//判断登入的用户ID是否一致  不一致 跳转到首页
		String memberid = request.getParameter("memberId");
		Member member = (Member)request.getSession().getAttribute(Constants.MEMBER_INFO_SESSION);
		if(memberid==null||member==null||!memberid.equals(String.valueOf(member.getId()))){
			return "redirect:/";
		}
		try{
			//分页参数
			int pageNo = ServletRequestUtils.getIntParameter(request, "pager.offset", 0);
			int pageSize = ServletRequestUtils.getIntParameter(request, "pager.limit", 20);
			//列表数据
			List<Comment> commentList = commentService.findCommentList(request,pageNo,pageSize);
			model.addAttribute("commentList", commentList);
			model.addAttribute("total", commentService.findCountCommentList(request));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "front_web/member_comment";
	}
}
