package com.javaer.action;

import com.javaer.model.Member;
import com.javaer.service.ICommentService;
import com.javaer.service.IMemberService;
import com.javaer.service.IOrderService;
import com.javaer.util.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import sun.misc.BASE64Decoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	private IMemberService memberService;
	private ICommentService commentService;
	private IOrderService orderService;
	
	
	
	@Autowired(required=true)
	public void setOrderService(IOrderService orderService) {
		this.orderService = orderService;
	}
	public ICommentService geCommentService() {
		return commentService;
	}
	@Autowired(required=true)
	public void setCommentService(ICommentService commentService) {
		this.commentService = commentService;
	}
	public IMemberService geMemberService() {
		return memberService;
	}
	@Autowired(required=true)
	public void setMemberService(IMemberService memberService) {
		this.memberService = memberService;
	}
	/**
	 * 前台会员登入
	 */
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public void login(@RequestParam String userName, @RequestParam String password, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		//根据会员登入名查询会员
		String msg="";
		Member member = memberService.findMemberByMemberName(userName);
		if(member == null) {
			msg ="用户不存在!";
		}else if(password == null || !password.equals(member.getPassword()) ){
			msg ="密码不正确!";
		}else {
			request.getSession().setAttribute(Constants.MEMBER_INFO_SESSION, member);
			msg ="success";
		}
		PrintWriter out;
		out = response.getWriter();
		out.print(msg);
        out.flush();
	}
	/**
	 * 前台会员注册
	 */
	@RequestMapping(value="/regist.do",method=RequestMethod.POST)
	public void doRegist(Member member,Model model,HttpServletRequest request,HttpServletResponse response) throws Exception {
		String msg="";
		Member member1 = memberService.findMemberByMemberName(member.getUserName());
		if(member1 == null) {
			try {
				member.setRegistTime(new Date());
				memberService.addMember(member);
				request.getSession().setAttribute(Constants.MEMBER_INFO_SESSION, member);
				msg ="success";
			} catch (Exception e) {
				e.printStackTrace();
				msg ="保存失败!请联系管理员";
				//throw e;
			}
		}else{
			msg ="用户名已存在!";
		}
		PrintWriter out;
		out = response.getWriter();
		out.print(msg);
        out.flush();
	}
	
	
	@RequestMapping({"/back/list.do"})
	public String list(Model model, HttpServletRequest request) {
		
		try{
			//分页参数
			int pageNo = ServletRequestUtils.getIntParameter(request, "pager.offset", 0);
			int pageSize = ServletRequestUtils.getIntParameter(request, "pager.limit", 10);
			//列表数据
			List<Member> MemberList = memberService.findMemberList(request,pageNo,pageSize);
			model.addAttribute("memberList", MemberList);
			model.addAttribute("total", memberService.findCountMemberList(request));
			model.addAttribute("userName",request.getParameter("userName"));
			model.addAttribute("realName",request.getParameter("realName"));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "member/list";
	}

	
	/*
	 * 同样的请求路径 Member/add 如果是get请求就转到增加页面去，如果是post请求就做add操作
	 */
	@RequestMapping(value="/back/add",method=RequestMethod.GET)
	public String toAdd(Model model) {
		return "member/add";
	}
	
	@RequestMapping(value="/back/add",method=RequestMethod.POST)
	public String doAdd(Member member, Model model) throws Exception {
		try {
		
			member.setRegistTime(new Date());
			memberService.addMember(member);
			model.addAttribute("resMess", Constants.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("resMess", Constants.RESULT_FAILED);
			throw e;
		}
		model.addAttribute("opeMess", Constants.OPERATE_TYPE_ADD);
		
		//重定向，防止重复提交，当然这样不能完全解决重复提交的问题，只是简单处理一下，若要较好的防止重复提交可以结合token做，
		//以“/”开关，相对于当前项目根路径，不以“/”开关，相对于当前路径
		//return "redirect:/Member/list"; 
		return "redirect:list.do"; 
	}
	
	/*
	 * Restful模式路径：
	 * 注意这里/update/{id}和@PathVariable("id")中id要一致，这样不管用debug模式还是release模式编译都没问题
	 * 也可以简写成@PathVariable int id，但这样只能以debug模式编译的时候正确，如果用release编译就不正确了，因为如果用release模式编译会把参数的名字改变的
	 * 一般IDE工具都是以debug模式编译的，javac是以release模式编译的
	 * 同样的请求路径 Member/update 如果是get请求就转到增加页面去，如果是post请求就做update操作
	 */
	@RequestMapping(value="/back/update/{id}",method=RequestMethod.GET)
	public String toUpdate(@PathVariable("id") int id, Model model) throws Exception {
		model.addAttribute("member",memberService.findMemberById(id));
		return "member/update";
	}
	@RequestMapping(value="/back/update/{id}",method=RequestMethod.POST)
	public String doUpdate(@PathVariable("id") int id, Member member, Model model) throws Exception {
		try {
			memberService.updateMember(member);
			model.addAttribute("resMess", Constants.RESULT_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("resMess", Constants.RESULT_FAILED);
			throw e;
		}
		return "redirect:/member/back/list.do"; 
	}
	
	@RequestMapping(value="/back/delete/{id}")
	public String delete(@PathVariable("id") int id, Model model, HttpServletRequest request)throws Exception {
		try {
			memberService.deleteMember(id);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("resMess", Constants.RESULT_FAILED);
			throw e;
		}
		model.addAttribute("opeMess", Constants.OPERATE_TYPE_DELETE);
		return "redirect:/member/back/list.do";//重定向
	}
	
	/**
	 * 前台修改会员信息
	 */
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String toUpdateFront(Model model) {
		
		//获取登入用户
		//判断是否为登入用户
		//model.addAttribute("member",memberService.findMemberById(id));
		
		return "front_web/member_home";
	}
	
	/**
	 * 前台修改用户资料
	 */
	@RequestMapping(value="/update/{id}",method=RequestMethod.POST)
	public String doUpdateFront(@PathVariable("id") int id, Member member, Model model, HttpServletRequest request) throws Exception {
		try {
			Member oldMember = memberService.findMemberById(id);
			oldMember.setRealName(member.getRealName());
			oldMember.setPassword(member.getPassword());
			oldMember.setEmail(member.getEmail());
			oldMember.setTel(member.getTel());
			oldMember.setHeadImgUrl(member.getHeadImgUrl());
			memberService.updateMember(oldMember);
			request.getSession().setAttribute(Constants.MEMBER_INFO_SESSION, oldMember);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return "front_web/member_home"; 
	}
	
	
	@RequestMapping(value = "/upload.do",method=RequestMethod.POST,   
            consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)  
    public String upload(Model model, HttpServletRequest request, HttpServletResponse response){
          
        Map<String,Object> result=new HashMap<String,Object>();
        
       // String filePath=pubParamService.getRootPath()+File.separator+"imageCropper"+File.separator;
        String pathDir = "/files/";
	    /**得到图片保存目录的真实路径**/    
		String filePath = request.getSession().getServletContext().getRealPath(pathDir);
		/**根据真实路径创建目录**/    
//		File logoSaveFile = new File(filePath);     
//		if(!logoSaveFile.exists())     
//			logoSaveFile.mkdirs(); 
		
        String fileName=UUID.randomUUID().toString()+".png";
           // 参数序列化  
        String image = request.getParameter("image");   //拿到字符串格式的图片
        String PicName=fileName;
        System.out.println(PicName);
  
        // 只允许image  
        String header ="data:image";
        String[] imageArr=image.split(",");
        if(imageArr[0].contains(header)){//是img的  
      
	      // 去掉头部  
	        image=imageArr[1];  
	        //image = image.substring(header.length());  
	        // 写入磁盘  
	        String success = "ok";
	        BASE64Decoder decoder = new BASE64Decoder();
	        try{  
	                byte[] decodedBytes = decoder.decodeBuffer(image);        //将字符串格式的image转为二进制流（biye[])的decodedBytes  
	                String imgFilePath =filePath+File.separator+PicName;                        //指定图片要存放的位置
	                File targetFile = new File(filePath);
	                if(!targetFile.exists()){    
	                    targetFile.mkdirs();    
	                }    
	                  
	                FileOutputStream out = new FileOutputStream(imgFilePath);        //新建一个文件输出器，并为它指定输出位置imgFilePath
	                out.write(decodedBytes); //利用文件输出器将二进制格式decodedBytes输出  
	                out.close();                        //关闭文件输出器  
//	                success = "上传文件成功！";  
//	                result.put("result", success);
//	                result.put("file", filePath); 
	                System.out.println("上传文件成功！");
	                
	        		try {
	        			PrintWriter out2 = response.getWriter();
	        			out2.print(pathDir+PicName);
	                    out2.flush();
	        		} catch (IOException e) {
	        			e.printStackTrace();
	        		}
	        }catch(Exception e){
	                result.put("err", e.getMessage());  
	        }  
          
        }  
        
        return null; 
    } 
}
