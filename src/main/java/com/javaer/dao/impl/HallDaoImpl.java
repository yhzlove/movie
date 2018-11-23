package com.javaer.dao.impl;

import com.javaer.dao.IHallDao;
import com.javaer.model.Hall;
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


@Repository("hallDao")
public class HallDaoImpl  implements IHallDao {
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

	private static final Logger log = LoggerFactory.getLogger(HallDaoImpl.class);
	protected void initDao() {
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IHallDao#save(com.mav.domain.Hall)
	 */
	public void save(Hall transientInstance) {
		log.debug("saving Hall instance");
		try {
			this.getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IHallDao#delete(com.mav.domain.Hall)
	 */
	public void delete(Hall persistentInstance) {
		log.debug("deleting Hall instance");
		try {
			this.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IHallDao#findById(java.lang.Integer)
	 */
	public Hall findById(java.lang.Integer id) {
		log.debug("getting Hall instance with id: " + id);
		try {
			Hall instance = (Hall) this.getCurrentSession().get(
					"com.javaer.model.Hall", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IHallDao#findByExample(com.mav.domain.Hall)
	 */
//	public List findByExample(Hall instance) {
//		log.debug("finding Hall instance by example");
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
	 * @see com.mav.dao.IHallDao#findByProperty(java.lang.String, java.lang.Object)
	 */
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Hall instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Hall as domain where domain."
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
	 * @see com.mav.dao.IHallDao#findAll()
	 */
	public List findAll() {
		log.debug("finding all Hall instances");
		try {
			String queryString = "from Hall";
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
	 * @see com.mav.dao.IHallDao#merge(com.mav.domain.Hall)
	 */
	public Hall merge(Hall detachedInstance) {
		log.debug("merging Hall instance");
		try {
			Hall result = (Hall) this.getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IHallDao#attachDirty(com.mav.domain.Hall)
	 */
	public void attachDirty(Hall instance) {
		log.debug("attaching dirty Hall instance");
		try {
			this.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IHallDao#attachClean(com.mav.domain.Hall)
	 */
	public void attachClean(Hall instance) {
		log.debug("attaching clean Hall instance");
		try {
			this.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

//	public static IHallDao getFromApplicationContext(ApplicationContext ctx) {
//		return (IHallDao) ctx.getBean("HallDAO");
//	}

	@Override
	public List findByExample(Hall instance) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List findByName(Object name) {
		// TODO Auto-generated method stub
		return findByProperty("name", name);
	}

	@Override
	public List<Hall> findHallList(HttpServletRequest request, int pageNo,
                                   int pageSize) {
		// TODO Auto-generated method stub
		log.debug("findHallList");
		try {
			String queryString = "from Hall u where 1=1 ";
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
			log.error("findHallList failed", re);
			throw re;
		}
	}
	
	@Override
	public Integer findCountHallList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		log.debug("findHallList");
		try {
			String queryString = "select count(u) from Hall u where 1=1 ";
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
			log.error("findHallList failed", re);
			throw re;
		}
	}
}