package com.javaer.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;

/**
 * TDept entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "sys_attach")
public class Attach implements java.io.Serializable {

	private Integer id;			//附件ID
	private String newName;		//系统生成的名称
	private String oldName;		//原文件名称
	private String type;		//类型
	private long size;			//大小
	private int  status;		//状态
	private int  img;			//图片
	private String remark;		//备注
	private String address;		//保存地址
	private Date createTime;	//操作时间
	private Movie movie;		//电影
	
	@Id
	@GenericGenerator(name="generator",strategy="increment")
	@GeneratedValue(generator="generator")
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(name = "type", nullable = true, length = 200)
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Column(name="attach_size",precision=18) 
	public long getSize() {
		return size;
	}
	public void setSize(long size) {
		this.size = size;
	}
	@Column(name = "status", nullable = true)
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Column(name = "img", nullable = true)
	public int getImg() {
		return img;
	}
	public void setImg(int img) {
		this.img = img;
	}
	@Column(name = "remark", nullable = true, length = 200)
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	@Column(name = "newName")
	public String getNewName() {
		return newName;
	}
	public void setNewName(String newName) {
		this.newName = newName;
	}
	
	@Column(name = "oldName")
	public String getOldName() {
		return oldName;
	}
	public void setOldName(String oldName) {
		this.oldName = oldName;
	}
	
	@Column(name = "createTime", columnDefinition = "DATE",updatable=false)
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@ManyToOne(targetEntity=Movie.class,fetch=FetchType.EAGER)
	@JoinColumn(name="movie_id")//加入一列作为外键
	public Movie getMovie() {
		return movie;
	}
	public void setMovie(Movie movie) {
		this.movie = movie;
	}
	@Column(name = "address", nullable = true, length = 200)
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}