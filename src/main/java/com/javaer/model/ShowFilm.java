package com.javaer.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * 场次
 */
@Entity
@Table(name = "sys_showfilm")
public class ShowFilm implements java.io.Serializable {
	
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	private Integer id;
	private String showFilmName;	//场次名称
	private Date startTime;			//开始时间
	private Date endTime;			//结束时间
	private String price;			//价格
	private String remark;			//备注
	private Integer seatCount;		// 座位数
	
	private Date createTime;		//添加时间
	
	private Integer flag;			//状态
	
	private Hall hall;		//影厅
	private Movie movie;	//电影
	//订单 1-多
	private List<Order> orderList;		//

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

	@Column(name = "showFilmName", length = 100)
	public String getShowFilmName() {
		return showFilmName;
	}
	public void setShowFilmName(String showFilmName) {
		this.showFilmName = showFilmName;
	}
	
	@Column(name = "startTime", columnDefinition = "DATE")
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	
	@Column(name = "endTime", columnDefinition = "DATE")
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	
	@Column(name = "price", length = 100)
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	@Column(name = "remark", length = 100)
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	@Column(name = "createTime", columnDefinition = "DATE",updatable=false)
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@Column(name = "flag", columnDefinition = "Integer")
	public Integer getFlag() {
		return flag;
	}
	public void setFlag(Integer flag) {
		this.flag = flag;
	}
	
	@ManyToOne(targetEntity=Hall.class,fetch=FetchType.EAGER)
	@JoinColumn(name="hall_id")//加入一列作为外键
	public Hall getHall() {
		return hall;
	}
	public void setHall(Hall hall) {
		this.hall = hall;
	}
	
	@ManyToOne(targetEntity=Movie.class,fetch=FetchType.EAGER)
	@JoinColumn(name="movie_id")//加入一列作为外键
	public Movie getMovie() {
		return movie;
	}
	public void setMovie(Movie movie) {
		this.movie = movie;
	}
	
	@OneToMany(targetEntity=Order.class,fetch=FetchType.LAZY,mappedBy ="showFilm")
	public List<Order> getOrderList() {
		return orderList;
	}
	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}
	
	@Column(name = "seatCount", columnDefinition = "Integer")
	public Integer getSeatCount() {
		return seatCount;
	}
	public void setSeatCount(Integer seatCount) {
		this.seatCount = seatCount;
	}
}