package com.javaer.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;

/**
 * 留言
 */
@Entity
@Table(name = "sys_comment")
public class Comment implements java.io.Serializable {
	
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	private Integer id;
	private String content;		// 内容
	private String score;		// 分数
	
	private Date createTime;	// 添加/评论时间
	
	private Integer flag;		// 状态
	
	private Member member;		//会员
	private Movie movie;		//电影


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

	@Column(name = "content", length = 100)
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Column(name = "score", length = 100)
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
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
	
	
}