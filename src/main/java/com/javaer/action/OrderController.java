package com.javaer.action;

import com.javaer.model.Member;
import com.javaer.model.Order;
import com.javaer.model.OrderSeat;
import com.javaer.model.ShowFilm;
import com.javaer.service.IOrderSeatService;
import com.javaer.service.IOrderService;
import com.javaer.service.IShowFilmService;
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

@Controller
@RequestMapping("/order")
public class OrderController {
	
	private IOrderService orderService;
	private IOrderSeatService orderSeatService;
	private IShowFilmService showFilmService;
	
	
	@Autowired(required=true)
	public void setOrderService(IOrderService orderService) {
		this.orderService = orderService;
	}
	@Autowired(required=true)
	public void setOrderSeatService(IOrderSeatService orderSeatService) {
		this.orderSeatService = orderSeatService;
	}
	@Autowired(required=true)
	public void setShowFilmService(IShowFilmService showFilmService) {
		this.showFilmService = showFilmService;
	}
	
	@RequestMapping(value="/back/list.do")
	public String list(Model model, HttpServletRequest request) {
		
		try{
			//分页参数
			int pageNo = ServletRequestUtils.getIntParameter(request, "pager.offset", 0);
			int pageSize = ServletRequestUtils.getIntParameter(request, "pager.limit", 10);
			//列表数据
			List<Order> orderList = orderService.findOrderList(request,pageNo,pageSize);
			model.addAttribute("orderList", orderList);
			model.addAttribute("total", orderService.findCountOrderList(request));
			model.addAttribute("memberName",request.getParameter("memberName"));
			model.addAttribute("movieName",request.getParameter("movieName"));
			model.addAttribute("hallName",request.getParameter("hallName"));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "order/list";
	}

	
	/*
	 * 同样的请求路径 order/add 如果是get请求就转到增加页面去，如果是post请求就做add操作
	 */
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String toAdd(Model model) {
		return "order/add";
	}
	/**
	 * 提交订单
	 * 订单分为两部分 1.订单 2.订单附属 座次
	 * 
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String doAdd(Order order, Integer[] seatRow, Integer[] seatCol, Model model) throws Exception {
		try {
			order.setBuyTime(new Date());
			orderService.addOrder(order);
			ShowFilm showFilm = showFilmService.findShowFilmById(order.getShowFilm().getId());
			Integer seatCount = showFilm.getSeatCount();
			for(int i = 0; i < seatRow.length; i++){
		        OrderSeat orderSeat = new OrderSeat();
		        orderSeat.setSeatRow(seatRow[i]);
		        orderSeat.setSeatCol(seatCol[i]);
		        orderSeat.setOrder(order);
		        //保存
		        orderSeatService.addOrderSeat(orderSeat);
		        seatCount--;
		        
		    }
			showFilm.setSeatCount(seatCount);
			showFilmService.updateShowFilm(showFilm);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		//重定向，防止重复提交，当然这样不能完全解决重复提交的问题，只是简单处理一下，若要较好的防止重复提交可以结合token做，
		//以“/”开关，相对于当前项目根路径，不以“/”开关，相对于当前路径
		//return "redirect:/order/list"; 
		return "redirect:member/list.do?memberId="+order.getMember().getId(); //确认订单  相当于购物车结算的那种
	}
	
	/*
	 * Restful模式路径：
	 * 注意这里/update/{id}和@PathVariable("id")中id要一致，这样不管用debug模式还是release模式编译都没问题
	 * 也可以简写成@PathVariable int id，但这样只能以debug模式编译的时候正确，如果用release编译就不正确了，因为如果用release模式编译会把参数的名字改变的
	 * 一般IDE工具都是以debug模式编译的，javac是以release模式编译的
	 * 同样的请求路径 order/update 如果是get请求就转到增加页面去，如果是post请求就做update操作
	 */
	@RequestMapping(value="/update/{id}",method=RequestMethod.GET)
	public String toUpdate(@PathVariable("id") int id, Model model) throws Exception {
		model.addAttribute("order",orderService.findOrderById(id));//大小写注意
		return "order/update";
	}
	@RequestMapping(value="/update/{id}",method=RequestMethod.POST)
	public String doUpdate(@PathVariable("id") int id, Order order, Model model) throws Exception {
		try {
			orderService.updateOrder(order);
			model.addAttribute("resMess", Constants.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("resMess", Constants.RESULT_FAILED);
			throw e;
		}
		return "redirect:/order/list.do"; //大小写注意
	}
	
	@RequestMapping(value="/delete/{id}")
	public String delete(@PathVariable("id") int id, Model model, HttpServletRequest request)throws Exception {
		try {
			orderService.deleteOrder(id);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("resMess", Constants.RESULT_FAILED);
			throw e;
		}
		model.addAttribute("opeMess", Constants.OPERATE_TYPE_DELETE);
		return "redirect:/order/list.do";//重定向
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
			int pageSize = ServletRequestUtils.getIntParameter(request, "pager.limit", 10);
			//列表数据
			List<Order> orderList = orderService.findOrderList(request,pageNo,pageSize);
			model.addAttribute("orderList", orderList);
			model.addAttribute("total", orderService.findCountOrderList(request));
			model.addAttribute("memberid", memberid);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "front_web/member_order";
	}
	/**
	 * 支付订单
	 */
	@RequestMapping(value="/pay",method=RequestMethod.POST)
	public void doPay(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception {
		String msg="";
		try {
			String id = request.getParameter("orderId");
			Order order = orderService.findOrderById(Integer.valueOf(id));
			order.setPay(1);
			order.setPayTime(new Date());
			orderService.updateOrder(order);
			msg ="success";
		} catch (Exception e) {
			e.printStackTrace();
			msg ="支付失败!请重试";
		}
		PrintWriter out;
		out = response.getWriter();
		out.print(msg);
        out.flush();
	}
	
}
