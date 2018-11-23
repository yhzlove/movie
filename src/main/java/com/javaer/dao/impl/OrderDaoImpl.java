package com.javaer.dao.impl;

import com.javaer.dao.IOrderDao;
import com.javaer.model.Order;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Repository("orderDao")
public class OrderDaoImpl  implements IOrderDao {
	// Spring 3.x 对 Hibernate 4.x 不提供
    // HibernateDaoSupport，所以在dao的实现层注入SessionFactory
    private SessionFactory sessionFactory;
    
    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getCurrentSession() {
        return sessionFactory.getCurrentSession();// 增删改使用的session
    }

    public Session qryCurrentSesion() {
        return sessionFactory.openSession();// 查询使用的session
    }

	private static final Logger log = LoggerFactory.getLogger(OrderDaoImpl.class);
	protected void initDao() {
	}

	
	public void save(Order transientInstance) {
		log.debug("saving Order instance");
		try {
			this.getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	
	public void delete(Order persistentInstance) {
		log.debug("deleting Order instance");
		try {
			this.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	
	public Order findById(java.lang.Integer id) {
		log.debug("getting Order instance with id: " + id);
		try {
			Order instance = (Order) this.getCurrentSession().get(
					"com.javaer.model.Order", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}


	
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Order instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Order as domain where domain."
					+ propertyName + "= ?";
			  Query qry = this.getCurrentSession().createQuery(queryString);
					  qry.setParameter(0, value);
		        return qry.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all Order instances");
		try {
			String queryString = "from Order";
			   Query qry = this.getCurrentSession().createQuery(queryString);
		        return qry.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Order merge(Order detachedInstance) {
		log.debug("merging Order instance");
		try {
			Order result = (Order) this.getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Order instance) {
		log.debug("attaching dirty Order instance");
		try {
			this.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Order instance) {
		log.debug("attaching clean Order instance");
		try {
			this.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}


	@Override
	public List findByExample(Order instance) {
		return null;
	}

	@Override
	public List findByName(Object name) {
		return findByProperty("name", name);
	}

	@Override
	public List<Order> findOrderList(HttpServletRequest request, int pageNo,
                                     int pageSize) {
		log.debug("findOrderList");
		try {
			String queryString = "from Order u where 1=1 ";
			
			 String memberName = request.getParameter("memberName");
			 String movieName = request.getParameter("movieName");
			 String hallName = request.getParameter("hallName");
			 String memberId = request.getParameter("memberId");
			 if(memberName!=null&&!memberName.equals("")){
				 queryString=queryString+" and u.member.realName like :memberName";
			 }
			 if(movieName!=null&&!movieName.equals("")){
				 queryString=queryString+" and u.movie.movieName like :movieName";
			 }
			 if(hallName!=null&&!hallName.equals("")){
				 queryString=queryString+" and u.showFilm.hall.name like :hallName";
			 }
			 
			 if(memberId!=null&&!memberId.equals("")){
				 queryString=queryString+" and u.member.id = :memberId";
			 }
			 queryString=queryString+" order by u.buyTime desc";
			  
			 Query qry = this.getCurrentSession().createQuery(queryString);
			 if(memberName!=null&&!memberName.equals("")){
				 qry.setParameter("memberName", "%"+memberName+"%");
			 }
			 if(movieName!=null&&!movieName.equals("")){
				 qry.setParameter("movieName", "%"+movieName+"%");
			 }
			 if(hallName!=null&&!hallName.equals("")){
				 qry.setParameter("hallName", "%"+hallName+"%");
			 }
			 if(memberId!=null&&!memberId.equals("")){
				 qry.setParameter("memberId", Integer.valueOf(memberId));
			 }
		        return qry
		    	.setFirstResult(pageNo) 
		 		.setMaxResults(pageSize) 
		 		.list();
		} catch (RuntimeException re) {
			log.error("findOrderList failed", re);
			throw re;
		}
	}
	
	@Override
	public Integer findCountOrderList(HttpServletRequest request) {
		log.debug("findOrderList");
		try {
			String queryString = "select count(u) from Order u where 1=1 ";
			
			 String memberName = request.getParameter("memberName");
			 String movieName = request.getParameter("movieName");
			 String hallName = request.getParameter("hallName");
			 String memberId = request.getParameter("memberId");
			 if(memberName!=null&&!memberName.equals("")){
				 queryString=queryString+" and u.member.realName like :memberName";
			 }
			 if(movieName!=null&&!movieName.equals("")){
				 queryString=queryString+" and u.movie.movieName like :movieName";
			 }
			 if(hallName!=null&&!hallName.equals("")){
				 queryString=queryString+" and u.showFilm.hall.name like :hallName";
			 }
			 
			 if(memberId!=null&&!memberId.equals("")){
				 queryString=queryString+" and u.member.id = :memberId";
			 }
			 queryString=queryString+" order by u.buyTime desc";
			  
			 Query qry = this.getCurrentSession().createQuery(queryString);
			 if(memberName!=null&&!memberName.equals("")){
				 qry.setParameter("memberName", "%"+memberName+"%");
			 }
			 if(movieName!=null&&!movieName.equals("")){
				 qry.setParameter("movieName", "%"+movieName+"%");
			 }
			 if(hallName!=null&&!hallName.equals("")){
				 qry.setParameter("hallName", "%"+hallName+"%");
			 }
			 if(memberId!=null&&!memberId.equals("")){
				 qry.setParameter("memberId", Integer.valueOf(memberId));
			 }
		        		Long l = (Long) qry.uniqueResult();
		        		return l.intValue();
		} catch (RuntimeException re) {
			log.error("findOrderList failed", re);
			throw re;
		}
	}
}