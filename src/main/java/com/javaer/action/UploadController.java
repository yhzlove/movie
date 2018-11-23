package com.javaer.action;

import com.javaer.model.Attach;
import com.javaer.model.Movie;
import com.javaer.service.IAttachService;
import com.javaer.service.IMovieService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

@Controller
@RequestMapping("/upload/back/")
public class UploadController {
	private IAttachService attachService;
	private IMovieService movieService;
	

	public IMovieService geMovieService() {
		return movieService;
	}
	@Autowired(required=true)
	public void setMovieService(IMovieService movieService) {
		this.movieService = movieService;
	}
	public IAttachService getAttachService() {
		return attachService;
	}
	@Autowired(required=true)
	public void setAttachService(IAttachService attachService) {
		this.attachService = attachService;
	}
	
	@RequestMapping(value="upload.do")
	public String upload(Model model, HttpServletRequest request, HttpServletResponse response){
			String imge = request.getParameter("imge");
			String elementId = request.getParameter("elementId");
//			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());

			MultipartHttpServletRequest multipartRequest = resolver.resolveMultipart(request);

			String pathDir = "/files/";
		    /**得到图片保存目录的真实路径**/    
			String logoRealPathDir = request.getSession().getServletContext().getRealPath(pathDir);
			/**根据真实路径创建目录**/    
			File logoSaveFile = new File(logoRealPathDir);
			if(!logoSaveFile.exists())     
				logoSaveFile.mkdirs();           
			/**页面控件的文件流**/    
			MultipartFile multipartFile = multipartRequest.getFile(elementId); 
			/**获取文件的后缀**/    
			System.out.println(multipartFile.getOriginalFilename());
			String suffix = multipartFile.getOriginalFilename().substring
			(multipartFile.getOriginalFilename().lastIndexOf(".")); 
			request.setAttribute("pmfilename", multipartFile.getOriginalFilename());
			 /**拼成完整的文件保存路径加文件**/    
			String name = +  System.currentTimeMillis()+suffix;
			String fileName = logoRealPathDir + File.separator+name;
			File file = new File(fileName);
			
//			String data = file.getPath();
			try {
				multipartFile.transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
				//JsonResult.error("-1");
			} catch (IOException e) {
				e.printStackTrace();
				//JsonResult.error("-1");
			} 
			System.out.println(pathDir+name);
//			try {
//				 response.getWriter().write(1);
//				 } catch (IOException e) {
//				 // TODO Auto-generated catch block
//				 e.printStackTrace();
//				 }
//			return pathDir+name;
		    PrintWriter out;
			try {
				out = response.getWriter();
				out.print(pathDir+name);
	            out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
             return null;
			//return JsonResult.ok(pathDir+name);//直接返回string 也可以
		}
	
	@RequestMapping(value="movie_attach/{id}")
	public void qiye_attach(@PathVariable("id") int id,HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//request
		
		
		//
		Movie movie = movieService.findMovieById(id);
		//String name = qiye.getName();//牵扯到中文名称问题
		//改用企业ID
		String name = String.valueOf(movie.getId());
//		SimpleDateFormat formatter = new SimpleDateFormat("yyyy");
//		String dateString = formatter.format(new Date());
		
		String upload_address = "attchfile\\"+name;
		//文件存放的目录
		File tempDirPath =new File(request.getSession().getServletContext().getRealPath("/")+"\\"+upload_address+"\\");
		if(!tempDirPath.exists()){
			tempDirPath.mkdirs();
		}
		
		//创建磁盘文件工厂
		DiskFileItemFactory fac = new DiskFileItemFactory();    
		//创建servlet文件上传组件
		ServletFileUpload upload = new ServletFileUpload(fac);    
		//文件列表
		List fileList = null;
        //解析request从而得到前台传过来的文件
		try {    
            fileList = upload.parseRequest(request);    
        } catch (FileUploadException ex) {    
            ex.printStackTrace();    
            return;    
        } 
        //保存后的文件名
        String imageName = null;
        //便利从前台得到的文件列表
        Iterator<FileItem> it = fileList.iterator();
        while(it.hasNext()){    
            FileItem item =  it.next();   
            //如果不是普通表单域，当做文件域来处理
            if(!item.isFormField()){
            	//imageName = new Date().getTime()+Math.random()*10000+item.getName();//文件名中可能含有中文
            	String filename = item.getName();
            	filename = filename.substring(filename.lastIndexOf("."));
            	imageName = new Date().getTime()+Math.random()*10000+filename;
            	BufferedInputStream in = new BufferedInputStream(item.getInputStream());
                BufferedOutputStream out = new BufferedOutputStream(
                        new FileOutputStream(new File(tempDirPath+"\\"+imageName)));
                Streams.copy(in, out, true);
                
                //保存文件到附件表
                Attach attach = new Attach();
                attach.setNewName(imageName);
                attach.setOldName(item.getName());
                attach.setCreateTime(new Date());
                attach.setSize(item.getSize());
                attach.setType(item.getContentType());
                attach.setAddress(upload_address+"\\"+imageName);
                attach.setImg(img(imageName));
                attach.setMovie(movie);
                
                attachService.addAttach(attach);
                
            }
        }
        //
        PrintWriter out = null;
		try {
			out = encodehead(request, response);
		} catch (IOException e) {
			e.printStackTrace();
		}
		//这个地方不能少，否则前台得不到上传的结果
		out.write("1");
		out.close(); 
		
	}
	
		private PrintWriter encodehead(HttpServletRequest request, HttpServletResponse response) throws IOException {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			return response.getWriter();
		}
		private int img(String filename){
			String type = filename.substring(filename.lastIndexOf(".") + 1);//得到加载文件的扩展名
	        if ("png".equals(type) ||"jpg".equals(type) ||"bmp".equals(type) ||"gif".equals(type)){
	        	return 1;
	        }
			return 0;
		}
		
		
		@RequestMapping(value="attach_down/{id}")
		public void attach_down(@PathVariable("id") int id,HttpServletRequest request, HttpServletResponse response) throws Exception {
			//得到要下载的文件名
			Attach attach = attachService.getAttachById(id);
			String fileName = attach.getAddress();
//	        fileName = new String(fileName.getBytes("iso8859-1"),"UTF-8");
//	        //上传的文件都是保存在/WEB-INF/upload目录下的子目录当中
	        String fileSaveRootPath=request.getSession().getServletContext().getRealPath("/");
//	        //通过文件名找出文件的所在目录
	        String path = findFileSavePathByFileName(fileName,fileSaveRootPath);
//	        //得到要下载的文件
	        fileName = fileSaveRootPath+fileName;
	        File file = new File(fileName);
	        //如果文件不存在
	        if(!file.exists()){
//	            request.setAttribute("message", "您要下载的资源已被删除！！");
//	            request.getRequestDispatcher("/message.jsp").forward(request, response);
	            return;
	        }
	        //处理文件名
	        String realname = fileName.substring(fileName.indexOf("_")+1);
	        //设置响应头，控制浏览器下载该文件
	        response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(attach.getOldName(), "UTF-8"));
	        //读取要下载的文件，保存到文件输入流
	        FileInputStream in = new FileInputStream(fileName);
	        //创建输出流
	        OutputStream out = response.getOutputStream();
	        //创建缓冲区
	        byte buffer[] = new byte[1024];
	        int len = 0;
	        //循环将输入流中的内容读取到缓冲区当中
	        while((len=in.read(buffer))>0){
	            //输出缓冲区的内容到浏览器，实现文件下载
	            out.write(buffer, 0, len);
	        }
	        //关闭文件输入流
	        in.close();
	        //关闭输出流
	        out.close();
		}
		
		public String findFileSavePathByFileName(String filename, String saveRootPath){
	        int hashcode = filename.hashCode();
	        int dir1 = hashcode&0xf;  //0--15
	        int dir2 = (hashcode&0xf0)>>4;  //0-15
	        String dir = saveRootPath + "\\" + dir1 + "\\" + dir2;  //upload\2\3  upload\3\5
	        File file = new File(dir);
	        if(!file.exists()){
	            //创建目录
	            file.mkdirs();
	        }
	        return dir;
	    }
	}

