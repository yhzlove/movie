package com.javaer.model;

import org.hibernate.annotations.BatchSize;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.OrderBy;
import org.hibernate.annotations.Where;

import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * 电影
 */
@Entity
@Table(name = "sys_movie")
public class Movie implements java.io.Serializable {
	
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	private Integer id;
	private String movieName;	// 电影名称
	private String shortName;	// 别名
	private String category;	// 类别
	private Date showTime;		// 上映时间
	private Date creatTime;		// 添加时间
	private String remark;		// 备注
	private Integer flag;		// 状态
	
	//基本信息
	private String storyLine;	//剧情
	private String starRating;	//评分
	private String videoUrl;	//视频地址
	private String imgUrl;		//海报地址
	private String director;	//导演
	private String actor;		//演员
	private String length;		//时长
	
	private String imgHead;		//海报是否首页显示
	
	private List<Attach> attachList;		// 附件
	
	//订单 1-多
	private List<Order> orderList;		//
	//评论 1-多
	private List<Comment> commentList;		//
	//场次 1-多
	private List<ShowFilm> showFilmList;
	

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
	
	@Column(name = "movieName", length = 100)
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	
	@Column(name = "shortName", length = 100)
	public String getShortName() {
		return shortName;
	}
	public void setShortName(String shortName) {
		this.shortName = shortName;
	}
	
	@Column(name = "category", length = 100)
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	@Column(name = "showTime", columnDefinition = "DATE")
	public Date getShowTime() {
		return showTime;
	}
	public void setShowTime(Date showTime) {
		this.showTime = showTime;
	}
	
	@Column(name = "creatTime", columnDefinition = "DATE",updatable=false)
	public Date getCreatTime() {
		return creatTime;
	}
	public void setCreatTime(Date creatTime) {
		this.creatTime = creatTime;
	}
	
	@Column(name = "remark", length = 100)
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Column(name = "flag", columnDefinition = "Integer")
	public Integer getFlag() {
		return flag;
	}
	public void setFlag(Integer flag) {
		this.flag = flag;
	}
	
	@OneToMany(targetEntity=Attach.class,fetch=FetchType.LAZY,mappedBy ="movie")
	public List<Attach> getAttachList() {
		return attachList;
	}
	
	public void setAttachList(List<Attach> attachList) {
		this.attachList = attachList;
	}
	
	@Column(name = "storyLine")
	public String getStoryLine() {
		return storyLine;
	}
	public void setStoryLine(String storyLine) {
		this.storyLine = storyLine;
	}
	
	@Column(name = "starRating")
	public String getStarRating() {
		return starRating;
	}
	public void setStarRating(String starRating) {
		this.starRating = starRating;
	}
	
	@Column(name = "videoUrl")
	public String getVideoUrl() {
		return videoUrl;
	}
	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}
	
	@Column(name = "imgUrl")
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
	@Column(name = "director")
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	
	@Column(name = "actor")
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	
	@OneToMany(targetEntity=Order.class,fetch=FetchType.LAZY,mappedBy ="movie")
	public List<Order> getOrderList() {
		return orderList;
	}
	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}
	@OneToMany(targetEntity=Comment.class,fetch=FetchType.LAZY,mappedBy ="movie")
	@BatchSize(size=10) //缓存数据大小：10条数据
	@OrderBy(clause="createTime asc") //代表按开始时间时间正序排列
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	
	
	@OneToMany(targetEntity=ShowFilm.class,fetch=FetchType.LAZY,mappedBy ="movie")
	@BatchSize(size=10) //缓存数据大小：10条数据
	@Where(clause="startTime>now()") //代表只取大于当前日期的
	@OrderBy(clause="startTime asc") //代表按开始时间时间正序排列
	public List<ShowFilm> getShowFilmList() {
		return showFilmList;
	}
	public void setShowFilmList(List<ShowFilm> showFilmList) {
		this.showFilmList = showFilmList;
	}
	
	@Column(name = "length")
	public String getLength() {
		return length;
	}
	public void setLength(String length) {
		this.length = length;
	}
	
	
	@Column(name = "imgHead")
	public String getImgHead() {
		return imgHead;
	}
	public void setImgHead(String imgHead) {
		this.imgHead = imgHead;
	}
	
	
}