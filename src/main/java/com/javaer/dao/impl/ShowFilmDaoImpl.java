package com.javaer.dao.impl;

import com.javaer.dao.IShowFilmDao;
import com.javaer.model.ShowFilm;
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


@Repository("showFilmDao")
public class ShowFilmDaoImpl  implements IShowFilmDao {
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

	private static final Logger log = LoggerFactory.getLogger(ShowFilmDaoImpl.class);
	protected void initDao() {
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IShowFilmDao#save(com.mav.domain.ShowFilm)
	 */
	public void save(ShowFilm transientInstance) {
		log.debug("saving ShowFilm instance");
		try {
			this.getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IShowFilmDao#delete(com.mav.domain.ShowFilm)
	 */
	public void delete(ShowFilm persistentInstance) {
		log.debug("deleting ShowFilm instance");
		try {
			this.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IShowFilmDao#findById(java.lang.Integer)
	 */
	public ShowFilm findById(java.lang.Integer id) {
		log.debug("getting ShowFilm instance with id: " + id);
		try {
			ShowFilm instance = (ShowFilm) this.getCurrentSession().get(
					"com.javaer.model.ShowFilm", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IShowFilmDao#findByExample(com.mav.domain.ShowFilm)
	 */
//	public List findByExample(ShowFilm instance) {
//		log.debug("finding ShowFilm instance by example");
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
	 * @see com.mav.dao.IShowFilmDao#findByProperty(java.lang.String, java.lang.Object)
	 */
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding ShowFilm instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from ShowFilm as domain where domain."
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
	 * @see com.mav.dao.IShowFilmDao#findAll()
	 */
	public List findAll() {
		log.debug("finding all ShowFilm instances");
		try {
			String queryString = "from ShowFilm";
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
	 * @see com.mav.dao.IShowFilmDao#merge(com.mav.domain.ShowFilm)
	 */
	public ShowFilm merge(ShowFilm detachedInstance) {
		log.debug("merging ShowFilm instance");
		try {
			ShowFilm result = (ShowFilm) this.getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IShowFilmDao#attachDirty(com.mav.domain.ShowFilm)
	 */
	public void attachDirty(ShowFilm instance) {
		log.debug("attaching dirty ShowFilm instance");
		try {
			this.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.mav.dao.IShowFilmDao#attachClean(com.mav.domain.ShowFilm)
	 */
	public void attachClean(ShowFilm instance) {
		log.debug("attaching clean ShowFilm instance");
		try {
			this.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

//	public static IShowFilmDao getFromApplicationContext(ApplicationContext ctx) {
//		return (IShowFilmDao) ctx.getBean("ShowFilmDAO");
//	}

	@Override
	public List findByExample(ShowFilm instance) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List findByName(Object name) {
		// TODO Auto-generated method stub
		return findByProperty("name", name);
	}

	@Override
	public List<ShowFilm> findShowFilmList(HttpServletRequest request, int pageNo,
                                           int pageSize) {
		// TODO Auto-generated method stub
		log.debug("findShowFilmList");
		try {
			String queryString = "from ShowFilm u where 1=1 ";
			//this.getCurrentSession().beginTransaction();
			
			 String showFilmName = request.getParameter("showFilmName");
			  if(showFilmName!=null&&!showFilmName.equals("")){
				  queryString=queryString+" and u.showFilmName like :showFilmName";
			  }
			  Query qry = this.getCurrentSession().createQuery(queryString);
			  if(showFilmName!=null&&!showFilmName.equals("")){
				  qry.setParameter("showFilmName", "%"+showFilmName+"%");
			  }
		        return qry
		    	.setFirstResult(pageNo) 
		 		.setMaxResults(pageSize) 
		 		.list();
		} catch (RuntimeException re) {
			log.error("findShowFilmList failed", re);
			throw re;
		}
	}
	
	@Override
	public Integer findCountShowFilmList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		log.debug("findShowFilmList");
		try {
			String queryString = "select count(u) from ShowFilm u where 1=1 ";
			//this.getCurrentSession().beginTransaction();
			
			String showFilmName = request.getParameter("showFilmName");
			  if(showFilmName!=null&&!showFilmName.equals("")){
				  queryString=queryString+" and u.showFilmName like :showFilmName";
			  }
			  Query qry = this.getCurrentSession().createQuery(queryString);
			  if(showFilmName!=null&&!showFilmName.equals("")){
				  qry.setParameter("showFilmName", "%"+showFilmName+"%");
			  }
    		Long l = (Long) qry.uniqueResult();
    		return l.intValue();
		} catch (RuntimeException re) {
			log.error("findShowFilmList failed", re);
			throw re;
		}
	}
}