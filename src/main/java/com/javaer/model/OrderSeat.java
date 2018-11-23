package com.javaer.model;


import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;


/**
 * 订单附属表
 */
@Entity
@Table(name = "sys_order_seat")
public class OrderSeat implements java.io.Serializable {
	
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	private Integer id;
	private Integer seatRow;		//排
	private Integer seatCol;		//位
	
	
	private Order order;		//订单

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
	
	@Column(name = "seatRow", columnDefinition = "Integer")
	public Integer getSeatRow() {
		return seatRow;
	}
	public void setSeatRow(Integer seatRow) {
		this.seatRow = seatRow;
	}
	
	@Column(name = "seatCol", columnDefinition = "Integer")
	public Integer getSeatCol() {
		return seatCol;
	}
	public void setSeatCol(Integer seatCol) {
		this.seatCol = seatCol;
	}
	
	@ManyToOne(targetEntity=Order.class,fetch=FetchType.EAGER)
	@JoinColumn(name="order_id")//加入一列作为外键
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	
	
	
	
	
	
	
	
}