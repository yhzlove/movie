package com.javaer.dao.impl;

import com.javaer.dao.IOrderSeatDao;
import com.javaer.model.OrderSeat;
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


@Repository("orderSeatDao")
public class OrderSeatDaoImpl  implements IOrderSeatDao {
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

	private static final Logger log = LoggerFactory.getLogger(OrderSeatDaoImpl.class);
	protected void initDao() {
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IOrderSeatDao#save(com.mav.domain.OrderSeat)
	 */
	public void save(OrderSeat transientInstance) {
		log.debug("saving OrderSeat instance");
		try {
			this.getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IOrderSeatDao#delete(com.mav.domain.OrderSeat)
	 */
	public void delete(OrderSeat persistentInstance) {
		log.debug("deleting OrderSeat instance");
		try {
			this.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IOrderSeatDao#findById(java.lang.Integer)
	 */
	public OrderSeat findById(java.lang.Integer id) {
		log.debug("getting OrderSeat instance with id: " + id);
		try {
			OrderSeat instance = (OrderSeat) this.getCurrentSession().get(
					"com.javaer.model.OrderSeat", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IOrderSeatDao#findByExample(com.mav.domain.OrderSeat)
	 */
//	public List findByExample(OrderSeat instance) {
//		log.debug("finding OrderSeat instance by example");
//		try {
//			List results = getHibernateTemplate().findByExample(instance);
//			log.debug("find by example successful, result size: "
//					+ results.size());
//			return results;
//		} catch (RuntimeException re) {
//			log.error("find by example failed", re);
//			throw re;
//		}
//	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IOrderSeatDao#findByProperty(java.lang.String, java.lang.Object)
	 */
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding OrderSeat instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from OrderSeat as domain where domain."
					+ propertyName + "= ?";
//			return getHibernateTemplate().find(queryString, value);
			  Query qry = this.getCurrentSession().createQuery(queryString);
					  qry.setParameter(0, value);
		        return qry.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}


	/* (non-Javadoc)
	 * @see com.mav.dao.IOrderSeatDao#findAll()
	 */
	public List findAll() {
		log.debug("finding all OrderSeat instances");
		try {
			String queryString = "from OrderSeat";
			//this.getCurrentSession().beginTransaction();
			   Query qry = this.getCurrentSession().createQuery(queryString);
//			  qry.setParameter(0, value);
		        return qry.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IOrderSeatDao#merge(com.mav.domain.OrderSeat)
	 */
	public OrderSeat merge(OrderSeat detachedInstance) {
		log.debug("merging OrderSeat instance");
		try {
			OrderSeat result = (OrderSeat) this.getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IOrderSeatDao#attachDirty(com.mav.domain.OrderSeat)
	 */
	public void attachDirty(OrderSeat instance) {
		log.debug("attaching dirty OrderSeat instance");
		try {
			this.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IOrderSeatDao#attachClean(com.mav.domain.OrderSeat)
	 */
	public void attachClean(OrderSeat instance) {
		log.debug("attaching clean OrderSeat instance");
		try {
			this.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

//	public static IOrderSeatDao getFromApplicationContext(ApplicationContext ctx) {
//		return (IOrderSeatDao) ctx.getBean("OrderSeatDAO");
//	}

	@Override
	public List findByExample(OrderSeat instance) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List findByName(Object name) {
		// TODO Auto-generated method stub
		return findByProperty("name", name);
	}

	@Override
	public List<OrderSeat> findOrderSeatList(HttpServletRequest request, int pageNo,
                                             int pageSize) {
		// TODO Auto-generated method stub
		log.debug("findOrderSeatList");
		try {
			String queryString = "from OrderSeat u where 1=1 ";
			//this.getCurrentSession().beginTransaction();
			
			 String name = request.getParameter("name");
			  if(name!=null&&!name.equals("")){
				  queryString=queryString+" and u.name like :name";
			  }
			  Query qry = this.getCurrentSession().createQuery(queryString);
			  if(name!=null&&!name.equals("")){
				  qry.setParameter("name", "%"+name+"%");
			  }
		        return qry
		    	.setFirstResult(pageNo) 
		 		.setMaxResults(pageSize) 
		 		.list();
		} catch (RuntimeException re) {
			log.error("findOrderSeatList failed", re);
			throw re;
		}
	}
	
	@Override
	public Integer findCountOrderSeatList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		log.debug("findOrderSeatList");
		try {
			String queryString = "select count(u) from OrderSeat u where 1=1 ";
			//this.getCurrentSession().beginTransaction();
			
			  String name = request.getParameter("name");
			  if(name!=null&&!name.equals("")){
				  queryString=queryString+" and u.name like :name";
			  }
			  Query qry = this.getCurrentSession().createQuery(queryString);
			  if(name!=null&&!name.equals("")){
				  qry.setParameter("name", "%"+name+"%");
			  }
		        		Long l = (Long) qry.uniqueResult();
		        		return l.intValue();
		} catch (RuntimeException re) {
			log.error("findOrderSeatList failed", re);
			throw re;
		}
	}
}