package com.javaer.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * 
 */
@Entity
@Table(name = "sys_member")
public class Member implements java.io.Serializable {
	
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	private Integer id;
	private String userName;	// 用户名
	private String realName;	// 用户昵称
	private String password;	// 用户密码
	private Integer roleid;		// 用户角色id
	private String email;		// 邮箱
	private String tel;			// 联系电话
	
	private Date registTime;	//注册时间
	
	private Integer flag;		//是否删除
	
	private String headImgUrl;	//头像
	
	//订单 1-多
	private List<Order> orderList;		//
	//评论 1-多
	private List<Comment> commentList;		//

	@Id
	@GenericGenerator(name="generator",strategy="increment")
	@GeneratedValue(generator="generator")
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "password", nullable = false, length = 100)
	public String getPassword() {
		return this.password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Column(name = "userName", length = 100)
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Column(name = "realName", length = 100)
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	
	@Column(name = "roleid", columnDefinition = "Integer")
	public Integer getRoleid() {
		return roleid;
	}
	public void setRoleid(Integer roleid) {
		this.roleid = roleid;
	}
	
	@Column(name = "email", length = 100)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Column(name = "tel", length = 100)
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	@Column(name = "registTime", columnDefinition = "DATE",updatable=false)
	public Date getRegistTime() {
		return registTime;
	}
	public void setRegistTime(Date registTime) {
		this.registTime = registTime;
	}
	
	@Column(name = "flag", columnDefinition = "Integer")
	public Integer getFlag() {
		return flag;
	}
	public void setFlag(Integer flag) {
		this.flag = flag;
	}
	
	@Column(name = "headImgUrl")
	public String getHeadImgUrl() {
		return headImgUrl;
	}
	public void setHeadImgUrl(String headImgUrl) {
		this.headImgUrl = headImgUrl;
	}
	
	@OneToMany(targetEntity=Order.class,fetch=FetchType.LAZY,mappedBy ="member")
	public List<Order> getOrderList() {
		return orderList;
	}
	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}
	@OneToMany(targetEntity=Comment.class,fetch=FetchType.LAZY,mappedBy ="member")
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	
	
}