package com.javaer.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * 
 */
@Entity
@Table(name = "sys_hall")
public class Hall implements java.io.Serializable {
	
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	private Integer id;
	private String name;		// 影厅名称
	private Integer seatCount;	// 座位数
	private String seats;		// 座位安排
	private String addr;		// 影厅位置
	private String classify;	// 影厅类型
	private String remark;		// 备注
	
	private Integer seatRows;		//排
	private Integer seatCols;		//位
	
	private Date registTime;	//注册时间
	
	private Integer flag;		//是否删除
	
	//场次 1-多
	private List<ShowFilm> showFilm;		//

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
	
	@Column(name = "name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "seatCount", columnDefinition = "Integer")
	public Integer getSeatCount() {
		return seatCount;
	}
	public void setSeatCount(Integer seatCount) {
		this.seatCount = seatCount;
	}
	
	@Column(name = "seats")
	public String getSeats() {
		return seats;
	}
	public void setSeats(String seats) {
		this.seats = seats;
	}
	
	@Column(name = "addr")
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	@Column(name = "classify")
	public String getClassify() {
		return classify;
	}
	public void setClassify(String classify) {
		this.classify = classify;
	}
	
	@Column(name = "remark")
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
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
	
	@Column(name = "seatRows", columnDefinition = "Integer")
	public Integer getSeatRows() {
		return seatRows;
	}
	public void setSeatRows(Integer seatRows) {
		this.seatRows = seatRows;
	}
	
	@Column(name = "seatCols", columnDefinition = "Integer")
	public Integer getSeatCols() {
		return seatCols;
	}
	public void setSeatCols(Integer seatCols) {
		this.seatCols = seatCols;
	}
	
	@OneToMany(targetEntity=ShowFilm.class,fetch=FetchType.LAZY,mappedBy ="hall")
	public List<ShowFilm> getShowFilm() {
		return showFilm;
	}
	public void setShowFilm(List<ShowFilm> showFilm) {
		this.showFilm = showFilm;
	}
	
	
	
}