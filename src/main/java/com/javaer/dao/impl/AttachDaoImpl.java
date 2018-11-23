package com.javaer.dao.impl;

import com.javaer.dao.IAttachDao;
import com.javaer.model.Attach;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Repository("attachDao")
public class AttachDaoImpl implements IAttachDao {
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
	private static final Logger log = LoggerFactory.getLogger(AttachDaoImpl.class);

	protected void initDao() {
	}

	public void save(Attach transientInstance) {
		log.debug("saving Attach instance");
		try {
			this.getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Attach persistentInstance) {
		log.debug("deleting Attach instance");
		try {
			this.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Attach findById(java.lang.Integer id) {
		log.debug("getting Attach instance with id: " + id);
		try {
			Attach instance = (Attach) this.getCurrentSession().get(
					"com.mav.domain.Attach", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Attach instance) {
		log.debug("finding Attach instance by example");
		try {
			List results = null;
//					getHibernateTemplate().findByExample(instance);
//			log.debug("find by example successful, result size: "
//					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Attach instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Attach as domain where domain."
					+ propertyName + "= ?";
			 return this.getCurrentSession().createQuery(queryString).setParameter(0, value).list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findAll() {
		log.debug("finding all Attach instances");
		try {
			String queryString = "from Attach";
			return this.getCurrentSession().createQuery(queryString).list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Attach merge(Attach detachedInstance) {
		log.debug("merging Attach instance");
		try {
			Attach result = (Attach) this.getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Attach instance) {
		log.debug("attaching dirty Attach instance");
		try {
			this.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Attach instance) {
		log.debug("attaching clean Attach instance");
		try {
			this.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
	
	public List<Attach> findByXq() {
		log.debug("finding all Attach instances");
		try {
			String queryString = "from Attach as domain where domain.ms = 'xuqian' and domain.status=1";
			List<Attach> list =  this.getCurrentSession().createQuery(queryString).list();
			return list;
			
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public static IAttachDao getFromApplicationContext(ApplicationContext ctx) {
		return (IAttachDao) ctx.getBean("AttachDAO");
	}

	@Override
	public List<Attach> findAttachList(HttpServletRequest request, int pageNo,
                                       int pageSize) {
		// TODO Auto-generated method stub
		log.debug("findAttachList");
		try {
			String queryString = "from Attach u where 1=1 ";
				//this.getCurrentSession().beginTransaction();
			  String ms = request.getParameter("ms");
			  String year = request.getParameter("year");
			  String name = request.getParameter("name");
			  
			  if(ms!=null&&!ms.equals("")){
				  queryString=queryString+" and u.ms = :ms";
			  }
			  if(name!=null&&!name.equals("")){
				  queryString=queryString+" and u.name_old like :name";
			  }
			  if(year!=null&&!year.equals("")){
				  queryString=queryString+" and to_char(u.operateTime,'yyyy') = :year";
			  }
			  queryString=queryString+" order by u.operateTime desc";
			  Query qry = this.getCurrentSession().createQuery(queryString);
			  if(ms!=null&&!ms.equals("")){
				  qry.setParameter("ms", ms);
			  }
			  if(name!=null&&!name.equals("")){
				  qry.setParameter("name", "%"+name+"%");
			  }
			  if(year!=null&&!year.equals("")){
				  qry.setParameter("year", year);
			  }
			  
			  return qry.setFirstResult(pageNo) 
				 		.setMaxResults(pageSize) 
				 		.list();
		} catch (RuntimeException re) {
			log.error("findAttachList failed", re);
			throw re;
		}
	}

	@Override
	public Integer findCountAttachList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		log.debug("findCountAttachList");
		try {
			String queryString = "select count(u) from Attach u where 1=1 ";
				//this.getCurrentSession().beginTransaction();
			String ms = request.getParameter("ms");
			  String year = request.getParameter("year");
			  String name = request.getParameter("name");
			  
			  if(ms!=null&&!ms.equals("")){
				  queryString=queryString+" and u.ms = :ms";
			  }
			  if(name!=null&&!name.equals("")){
				  queryString=queryString+" and u.name_old like :name";
			  }
			  if(year!=null&&!year.equals("")){
				  queryString=queryString+" and to_char(u.operateTime,'yyyy') = :year";
			  }
			  
			  Query qry = this.getCurrentSession().createQuery(queryString);
			  if(ms!=null&&!ms.equals("")){
				  qry.setParameter("ms", ms);
			  }
			  if(name!=null&&!name.equals("")){
				  qry.setParameter("name", "%"+name+"%");
			  }
			  if(year!=null&&!year.equals("")){
				  qry.setParameter("year", year);
			  }
			  
			  Long l = (Long) qry.uniqueResult();
	      		return l.intValue();
		} catch (RuntimeException re) {
			log.error("findCountAttachList failed", re);
			throw re;
		}
	}
}