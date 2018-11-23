package com.javaer.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * 订单
 */
@Entity
@Table(name = "sys_order")
public class Order implements java.io.Serializable {
	
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	private Integer id;
//	private Integer seatRow;		//排
//	private Integer seatCol;		//位
	private String price;			//价格
	
	private Integer pay;			//支付状态
	private Date buyTime;			//购买时间
	private Date payTime;			//支付时间
	
	private String remark;			//备注
	private Integer flag;			//状态

	private Member member;		//会员
	private Movie movie;		//电影
	private ShowFilm showFilm;		//场次
	
	//场次 1-多
	private List<OrderSeat> orderSeat;

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
	
//	@Column(name = "seatRow", columnDefinition = "Integer")
//	public Integer getSeatRow() {
//		return seatRow;
//	}
//	public void setSeatRow(Integer seatRow) {
//		this.seatRow = seatRow;
//	}
//	
//	@Column(name = "seatCol", columnDefinition = "Integer")
//	public Integer getSeatCol() {
//		return seatCol;
//	}
//	public void setSeatCol(Integer seatCol) {
//		this.seatCol = seatCol;
//	}
	
	@Column(name = "price", length = 100)
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	@Column(name = "pay", columnDefinition = "Integer")
	public Integer getPay() {
		return pay;
	}
	public void setPay(Integer pay) {
		this.pay = pay;
	}
	
	@Column(name = "buyTime", columnDefinition = "DATE",updatable=false)
	public Date getBuyTime() {
		return buyTime;
	}
	public void setBuyTime(Date buyTime) {
		this.buyTime = buyTime;
	}
	
	@Column(name = "payTime", columnDefinition = "DATE")
	public Date getPayTime() {
		return payTime;
	}
	public void setPayTime(Date payTime) {
		this.payTime = payTime;
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
	
	
	@ManyToOne(targetEntity=Member.class,fetch=FetchType.EAGER)
	@JoinColumn(name="member_id")//加入一列作为外键
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	
	@ManyToOne(targetEntity=Movie.class,fetch=FetchType.EAGER)
	@JoinColumn(name="movie_id")//加入一列作为外键
	public Movie getMovie() {
		return movie;
	}
	public void setMovie(Movie movie) {
		this.movie = movie;
	}
	
	@ManyToOne(targetEntity=ShowFilm.class,fetch=FetchType.EAGER)
	@JoinColumn(name="showFilm_id")//加入一列作为外键
	public ShowFilm getShowFilm() {
		return showFilm;
	}
	public void setShowFilm(ShowFilm showFilm) {
		this.showFilm = showFilm;
	}
	
	@OneToMany(targetEntity=OrderSeat.class,fetch=FetchType.LAZY,mappedBy ="order")
	public List<OrderSeat> getOrderSeat() {
		return orderSeat;
	}
	public void setOrderSeat(List<OrderSeat> orderSeat) {
		this.orderSeat = orderSeat;
	}
	
	
}