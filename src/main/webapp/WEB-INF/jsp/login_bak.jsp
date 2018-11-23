<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>login</title>

<style>
a, abbr, acronym, address, applet, article, aside, audio, b, blockquote, big, body, center, canvas, caption, cite, code, command, datalist, dd, del, details, dfn, dl, dt, em, embed, fieldset, figcaption, figure, font, footer, form, h1, h2, h3, h4, h5, h6, header, hgroup, i, iframe, img, ins, kbd, keygen, label, legend, li, meter, nav, object, ol, output, p, pre, progress, q, s, samp, section, small, span, source, strike, strong, sub, sup, table, tbody, tfoot, thead, video, tt, u, ul, var{
	background: transparent;
	border: 0 none;
	font-size: 100%;
	font-family:"微软雅黑", "黑体", "宋体";
	margin:0;
	padding: 0;
	border: 0;
	outline: 0;
	vertical-align: top;}
p,li{ font-size:12px;}
tr,th,td{ font-size:12px; 
          text-align:center;
		  border: 0 none;
	      margin: 0;
	      padding: 0;
	      border: 0;
		  outline: 0;
		  vertical-align:middle;}
th{ color:#666666;}
td{ color:#464648;}
li{ list-style-type:none;}
img {
	border: 0;
	vertical-align: top;
	text-align: left;}
a { text-decoration:none; color:#000;}
a:hover { color:#F30;}
	
body{ min-width:913px;}	
.login{
	background:url(images/login.png) no-repeat ;
	height:291px;
	width: 366px;
    MARGIN-RIGHT: auto; MARGIN-LEFT: auto;
	vertical-align:middle;
	position:relative; top:20%; *top:0; left:180px;
}
.biaodan{ position:relative; top:20%; width:260px; margin:0 0 0 65px;}
.shurk{ }
#member{ width:215px; height:37px; border-radius:5px 5px 5px 5px;  border:solid 1px #c9c9c9;  padding-left:45px; background:url(images/namea.jpg) no-repeat; background-color:#FFF; font-size:14px;}
#password{ width:215px; height:37px; border-radius:5px 5px 5px 5px; border:solid 1px #c9c9c9; padding-left:45px;  background:url(images/passworda.jpg) no-repeat; background-color:#FFF; font-size:14px; margin-top:5px;}
#yanzheng{width:140px; height:37px; border-radius:5px 5px 5px 5px;  border:solid 1px #c9c9c9;  padding-left:5px;  background-color:#FFF; font-size:14px; margin-top:5px;}
#yzm{ margin-top:6px; width:106px; height:39px;}
.jizhuwo{ margin-top:17px; font-size:14px; color:#626262;}
.jizhuwo p{ font-size:14px; float:right; text-decoration:underline;}
.anniu{margin-top:15px;}
#btn_login{ background:url(images/battona.jpg) no-repeat; width:130px; height:42px; border:none; float:left;}
#btn_reg{ background:url(images/bottonb.jpg) no-repeat; width:130px; height:42px; border:none; float:right; }
.tune{ background:url(images/tune.png) no-repeat; z-index:999; width:233px; height:170px; position:relative;top:20%; left:70%;}
.loginfooter{  min-height:40px; width:100%; margin-top:50px; text-align:center; }
.loginfooter p{ margin-top:15px;}
</style>
</head>

<body style="background:url(images/bg.jpg) no-repeat #eee; width:100%; height:auto; background-position:center top;   min-width:200px;">

<div style="margin-top:200px;;">
     
    <div class="login">
        <div class="biaodan">  
          <form  action="<%=request.getContextPath()%>/login.do"  target="_parent" method="post">
            <div class="shurk">
               
                     <div>
                     <input id="member" type="text" name="username" size="22" placeholder="用户名"/>
                     </div>
                     <div>
                     <input name="password" type="password" id="password"  size="22" placeholder="密码"/>
                     </div>
               <font color='red'>${message}</font>
            </div>
            <div class="anniu">
                    <input id="btn_login"  name="" type="submit" value="" onmouseover="this.style.backgroundPosition='left -42px'" onmouseout="this.style.backgroundPosition='left top'" style="cursor:pointer;" />
                    <input id="btn_reg" name="btn_reg" type="reset" value=""  onmouseover="this.style.backgroundPosition='left -42px'" onmouseout="this.style.backgroundPosition='left top'" style="cursor:pointer;" />
            </div>
               </form>
        </div> 
       
    </div> 
</div>


<div class="loginfooter">
  <p>技术支持：</p>
</div>
</body>
</html>
